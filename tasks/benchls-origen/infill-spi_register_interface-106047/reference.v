module origen_106047 (
    input wire clk,
    input wire rst_n,
    
    // CPU Interface
    input wire [31:0] cpu_if_address,
    input wire [31:0] cpu_if_write_data,
    input wire cpu_if_read,
    input wire cpu_if_write,
    output reg [31:0] cpu_if_read_data,
    output reg cpu_if_access_complete,
    
    // SPI Controller Interface
    output reg [7:0] command,
    output reg read_not_write,
    output reg [31:0] address,
    output reg [1:0] address_bytes,
    output reg address_valid,
    output reg [2:0] dummy_cycles,
    output reg dummy_valid,
    output reg [7:0] data_bytes,
    output reg data_valid,
    output reg access_request,
    input wire access_complete
);

    // Register declarations
    reg [31:0] reg_0, reg_1, reg_2, reg_3, reg_4;
    reg transaction_in_progress;

    // Write operation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_0 <= 32'h0;
            reg_1 <= 32'h0;
            reg_2 <= 32'h0;
            reg_3 <= 32'h0;
            reg_4 <= 32'h0;
            access_request <= 1'b0;
            transaction_in_progress <= 1'b0;
        end else begin
            if (cpu_if_write) begin
                case (cpu_if_address[4:2])
                    3'b000: begin
                        reg_0 <= cpu_if_write_data;
                        access_request <= 1'b1;
                    end
                    3'b001: reg_1 <= cpu_if_write_data;
                    3'b010: reg_2 <= cpu_if_write_data;
                    3'b011: reg_3 <= cpu_if_write_data;
                    3'b100: reg_4 <= cpu_if_write_data;
                endcase
            end else begin
                access_request <= 1'b0;
            end

            if (access_request)
                transaction_in_progress <= 1'b1;
            else if (access_complete)
                transaction_in_progress <= 1'b0;
        end
    end

    // Read operation
    always @(posedge clk) begin
        if (cpu_if_read) begin
            case (cpu_if_address[4:2])
                3'b000: cpu_if_read_data <= reg_0;
                3'b001: cpu_if_read_data <= reg_1;
                3'b010: cpu_if_read_data <= reg_2;
                3'b011: cpu_if_read_data <= reg_3;
                3'b100: cpu_if_read_data <= reg_4;
                default: cpu_if_read_data <= 32'h0;
            endcase
        end
    end

    // CPU interface access complete
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cpu_if_access_complete <= 1'b0;
        else
            cpu_if_access_complete <= cpu_if_read | cpu_if_write;
    end

    // SPI Controller Interface signals
    always @(*) begin
        command = reg_0[7:0];
        read_not_write = reg_0[8];
        address = reg_1;
        address_bytes = reg_2[1:0];
        address_valid = reg_2[2];
        dummy_cycles = reg_3[2:0];
        dummy_valid = reg_3[3];
        data_bytes = reg_4[7:0];
        data_valid = reg_4[8];
    end

endmodule