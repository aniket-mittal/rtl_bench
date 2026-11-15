module origen_127702 #(
    parameter DATA_WIDTH = 8,
    parameter NUM_SLAVES = 4
)(
    input wire clk,
    input wire rst,
    input wire mode,
    input wire [NUM_SLAVES-1:0] ssel,
    input wire mosi,
    input wire miso,
    input wire [1:0] clk_pol_phase,
    output reg done,
    output reg [DATA_WIDTH-1:0] data
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam SETUP = 2'b01;
    localparam TRANSFER = 2'b10;
    localparam COMPLETE = 2'b11;

    reg [1:0] state, next_state;
    reg [DATA_WIDTH-1:0] shift_reg;
    reg [$clog2(DATA_WIDTH)-1:0] bit_count;
    reg sclk, sclk_prev;
    wire sclk_rising, sclk_falling;

    // Clock polarity and phase control
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sclk <= clk_pol_phase[1];
            sclk_prev <= clk_pol_phase[1];
        end else begin
            sclk_prev <= sclk;
            sclk <= ~sclk;
        end
    end

    assign sclk_rising = ~sclk_prev & sclk;
    assign sclk_falling = sclk_prev & ~sclk;

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
            IDLE: next_state = (mode | |ssel) ? SETUP : IDLE;
            SETUP: next_state = TRANSFER;
            TRANSFER: next_state = (bit_count == DATA_WIDTH-1) ? COMPLETE : TRANSFER;
            COMPLETE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output and internal signal logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= 0;
            data <= 0;
            shift_reg <= 0;
            bit_count <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    bit_count <= 0;
                end
                SETUP: begin
                    shift_reg <= mode ? data : 0;
                end
                TRANSFER: begin
                    if (mode) begin // Master mode
                        if (sclk_falling ^ clk_pol_phase[0]) begin
                            shift_reg <= {shift_reg[DATA_WIDTH-2:0], miso};
                        end
                        if (sclk_rising ^ clk_pol_phase[0]) begin
                            bit_count <= bit_count + 1;
                        end
                    end else begin // Slave mode
                        if (sclk_rising ^ clk_pol_phase[0]) begin
                            shift_reg <= {shift_reg[DATA_WIDTH-2:0], mosi};
                            bit_count <= bit_count + 1;
                        end
                    end
                end
                COMPLETE: begin
                    done <= 1;
                    data <= shift_reg;
                end
            endcase
        end
    end

    // MOSI output (for master mode)
    assign mosi = mode ? shift_reg[DATA_WIDTH-1] : 1'bz;

    // MISO output (for slave mode)
    assign miso = !mode ? shift_reg[DATA_WIDTH-1] : 1'bz;

endmodule