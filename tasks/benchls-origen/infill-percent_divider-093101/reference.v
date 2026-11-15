module origen_093101 (
    input wire clk,
    input wire reset,
    input wire [18:0] numerator,
    input wire [18:0] denominator,
    input wire enable,
    output reg done,
    output reg [7:0] percent
);

    reg [7:0] final_per;
    reg [1:0] state;
    reg [23:0] sum;

    localparam START = 2'b00;
    localparam CALCULATING = 2'b01;
    localparam FINISH = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            final_per <= 8'd0;
            state <= START;
            sum <= 24'd0;
            done <= 1'b0;
            percent <= 8'd0;
        end else begin
            case (state)
                START: begin
                    if (enable && denominator != 19'd0) begin
                        sum <= numerator * 100 + (denominator >> 1);
                        final_per <= 8'd0;
                        state <= CALCULATING;
                        done <= 1'b0;
                    end
                end

                CALCULATING: begin
                    if (sum >= denominator) begin
                        sum <= sum - denominator;
                        final_per <= final_per + 1'b1;
                    end else begin
                        state <= FINISH;
                    end
                end

                FINISH: begin
                    percent <= final_per;
                    done <= 1'b1;
                    state <= START;
                end

                default: state <= START;
            endcase
        end
    end

endmodule