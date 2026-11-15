module origen_143879 (
    input wire clk,
    input wire rst,
    input wire [6:0] mpu_address,
    input wire [7:0] mpu_wr_data,
    input wire mpu_rd_wr_sel,
    input wire start,
    input wire SPI_DI_a,
    output reg busy,
    output reg SPI_SS_a,
    output reg SPI_CK_a,
    output reg SPI_DO_a,
    output reg [7:0] mpu_rd_data
);

    // Parameters
    localparam IDLE = 3'd0;
    localparam START = 3'd1;
    localparam SEND_ADDR = 3'd2;
    localparam SEND_DATA = 3'd3;
    localparam READ_DATA = 3'd4;
    localparam END = 3'd5;

    // Internal signals
    reg [2:0] state, next_state;
    reg [7:0] shift_reg;
    reg [3:0] bit_counter;
    reg [5:0] clk_divider;

    // 1 MHz SPI clock generation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_divider <= 6'd0;
            SPI_CK_a <= 1'b0;
        end else if (clk_divider == 6'd49) begin
            clk_divider <= 6'd0;
            SPI_CK_a <= ~SPI_CK_a;
        end else begin
            clk_divider <= clk_divider + 1'b1;
        end
    end

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = start ? START : IDLE;
            START: next_state = SEND_ADDR;
            SEND_ADDR: next_state = (bit_counter == 4'd7) ? (mpu_rd_wr_sel ? READ_DATA : SEND_DATA) : SEND_ADDR;
            SEND_DATA: next_state = (bit_counter == 4'd7) ? END : SEND_DATA;
            READ_DATA: next_state = (bit_counter == 4'd7) ? END : READ_DATA;
            END: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            busy <= 1'b0;
            SPI_SS_a <= 1'b1;
            SPI_DO_a <= 1'b0;
            mpu_rd_data <= 8'd0;
            shift_reg <= 8'd0;
            bit_counter <= 4'd0;
        end else begin
            case (state)
                IDLE: begin
                    busy <= 1'b0;
                    SPI_SS_a <= 1'b1;
                    SPI_DO_a <= 1'b0;
                end
                START: begin
                    busy <= 1'b1;
                    SPI_SS_a <= 1'b0;
                    shift_reg <= {mpu_rd_wr_sel, mpu_address};
                    bit_counter <= 4'd0;
                end
                SEND_ADDR: begin
                    SPI_DO_a <= shift_reg[7];
                    shift_reg <= {shift_reg[6:0], 1'b0};
                    bit_counter <= bit_counter + 1'b1;
                end
                SEND_DATA: begin
                    if (bit_counter == 4'd0) begin
                        shift_reg <= mpu_wr_data;
                    end
                    SPI_DO_a <= shift_reg[7];
                    shift_reg <= {shift_reg[6:0], 1'b0};
                    bit_counter <= bit_counter + 1'b1;
                end
                READ_DATA: begin
                    shift_reg <= {shift_reg[6:0], SPI_DI_a};
                    bit_counter <= bit_counter + 1'b1;
                    if (bit_counter == 4'd7) begin
                        mpu_rd_data <= {shift_reg[6:0], SPI_DI_a};
                    end
                end
                END: begin
                    SPI_SS_a <= 1'b1;
                end
            endcase
        end
    end

endmodule