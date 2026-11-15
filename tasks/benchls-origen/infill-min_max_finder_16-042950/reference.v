module origen_042950(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] data,
    output reg [15:0] o_min,
    output reg [15:0] o_max
);

    reg [15:0] dt_table [0:15];
    reg [3:0] cnt;
    reg state;
    reg [15:0] min, max;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 1'b0;
            cnt <= 4'b0000;
            min <= 16'hFFFF;
            max <= 16'h0000;
            o_min <= 16'hFFFF;
            o_max <= 16'h0000;
        end
        else begin
            case (state)
                1'b0: begin // Data Collection Phase
                    dt_table[cnt] <= data;
                    cnt <= cnt + 1'b1;
                    if (cnt == 4'b1111) begin
                        state <= 1'b1;
                        cnt <= 4'b0000;
                        min <= 16'hFFFF;
                        max <= 16'h0000;
                    end
                end
                1'b1: begin // Data Processing Phase
                    if (dt_table[cnt] < min) min <= dt_table[cnt];
                    if (dt_table[cnt] > max) max <= dt_table[cnt];
                    cnt <= cnt + 1'b1;
                    if (cnt == 4'b1111) begin
                        state <= 1'b0;
                        cnt <= 4'b0000;
                        o_min <= min;
                        o_max <= max;
                    end
                end
            endcase
        end
    end

endmodule