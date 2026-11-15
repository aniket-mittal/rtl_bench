module origen_104651 #(
    parameter COUNTER_SIZE = 8
)(
    input wire clk,
    input wire en,
    input wire rst,
    input wire cnt_mode,
    input wire free,
    input wire init_cnt,
    input wire [COUNTER_SIZE-1:0] min,
    input wire [COUNTER_SIZE-1:0] max,
    input wire [COUNTER_SIZE-1:0] init,
    output reg [COUNTER_SIZE-1:0] value,
    output reg overflow_set
);

    always @(posedge clk) begin
        if (rst) begin
            value <= {COUNTER_SIZE{1'b0}};
            overflow_set <= 1'b0;
        end
        else if (init_cnt) begin
            value <= init;
            overflow_set <= 1'b0;
        end
        else if (en) begin
            if (cnt_mode) begin // Up counting
                if (free || value < max) begin
                    value <= value + 1'b1;
                end
                else begin
                    value <= min;
                end
                overflow_set <= (value == {COUNTER_SIZE{1'b1}});
            end
            else begin // Down counting
                if (free || value > min) begin
                    value <= value - 1'b1;
                end
                else begin
                    value <= max;
                end
                overflow_set <= (value == {COUNTER_SIZE{1'b0}});
            end
        end
        else begin
            overflow_set <= 1'b0;
        end
    end

endmodule