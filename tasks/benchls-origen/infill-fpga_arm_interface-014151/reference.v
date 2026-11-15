module origen_014151 (
    input wire clk,
    input wire resetn,
    input wire [31:0] arm_to_fpga_cmd,
    input wire arm_to_fpga_cmd_valid,
    output reg arm_to_fpga_done,
    input wire arm_to_fpga_done_read,
    input wire [1023:0] arm_to_fpga_data,
    input wire arm_to_fpga_data_valid,
    output reg arm_to_fpga_data_ready,
    output reg [1023:0] fpga_to_arm_data,
    output reg fpga_to_arm_data_valid,
    input wire fpga_to_arm_data_ready,
    output reg [3:0] leds
);

    // State encoding
    localparam WAIT_FOR_CMD = 3'd0;
    localparam READ_DATA    = 3'd1;
    localparam COMPUTE      = 3'd2;
    localparam WRITE_DATA   = 3'd3;
    localparam ASSERT_DONE  = 3'd4;

    // Command encoding
    localparam CMD_READ    = 32'h1;
    localparam CMD_COMPUTE = 32'h2;
    localparam CMD_WRITE   = 32'h3;

    reg [2:0] state, next_state;
    reg [1023:0] core_data;

    // State transition logic
    always @(*) begin
        next_state = state;
        case (state)
            WAIT_FOR_CMD:
                if (arm_to_fpga_cmd_valid)
                    case (arm_to_fpga_cmd)
                        CMD_READ:    next_state = READ_DATA;
                        CMD_COMPUTE: next_state = COMPUTE;
                        CMD_WRITE:   next_state = WRITE_DATA;
                        default:     next_state = WAIT_FOR_CMD;
                    endcase
            READ_DATA:
                if (arm_to_fpga_data_valid)
                    next_state = ASSERT_DONE;
            COMPUTE:
                next_state = ASSERT_DONE;
            WRITE_DATA:
                if (fpga_to_arm_data_ready)
                    next_state = ASSERT_DONE;
            ASSERT_DONE:
                if (arm_to_fpga_done_read)
                    next_state = WAIT_FOR_CMD;
        endcase
    end

    // State register
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            state <= WAIT_FOR_CMD;
        else
            state <= next_state;
    end

    // Data processing logic
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            core_data <= 1024'd0;
        end else begin
            case (state)
                READ_DATA:
                    if (arm_to_fpga_data_valid)
                        core_data <= arm_to_fpga_data;
                COMPUTE:
                    core_data[1023:992] <= core_data[1023:992] ^ 32'hDEADBEEF;
            endcase
        end
    end

    // Output logic
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            arm_to_fpga_done <= 1'b0;
            arm_to_fpga_data_ready <= 1'b0;
            fpga_to_arm_data <= 1024'd0;
            fpga_to_arm_data_valid <= 1'b0;
            leds <= 4'b0000;
        end else begin
            arm_to_fpga_done <= (state == ASSERT_DONE);
            arm_to_fpga_data_ready <= (state == READ_DATA);
            fpga_to_arm_data <= core_data;
            fpga_to_arm_data_valid <= (state == WRITE_DATA);
            leds <= {1'b0, state};
        end
    end

endmodule