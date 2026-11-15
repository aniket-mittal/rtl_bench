module origen_168975(
    input clk,
    input clr,
    input [15:0] x,
    output [3:0] en,
    output [6:0] a_to_g
);

reg [3:0] digit;
reg [3:0] in_channel;
reg [9:0] clk_div;

always @(posedge clk or posedge clr) begin
    if (clr) begin
        clk_div <= 0;
        in_channel <= 0;
    end
    else begin
        clk_div <= clk_div + 1;
        if (clk_div == 10'd499) begin
            clk_div <= 0;
            in_channel <= in_channel + 1;
        end
    end
end

always @(*) begin
    case (in_channel)
        4'd0: digit = x[3:0];
        4'd1: digit = x[7:4];
        4'd2: digit = x[11:8];
        4'd3: digit = x[15:12];
    endcase
end

reg [6:0] a_to_g_reg;
always @(*) begin
    case (digit)
        4'd0: a_to_g_reg = 7'b1000000;
        4'd1: a_to_g_reg = 7'b1111001;
        4'd2: a_to_g_reg = 7'b0100100;
        4'd3: a_to_g_reg = 7'b0110000;
        4'd4: a_to_g_reg = 7'b0011001;
        4'd5: a_to_g_reg = 7'b0010010;
        4'd6: a_to_g_reg = 7'b0000010;
        4'd7: a_to_g_reg = 7'b1111000;
        4'd8: a_to_g_reg = 7'b0000000;
        4'd9: a_to_g_reg = 7'b0010000;
        default: a_to_g_reg = 7'b1000000;
    endcase
end

assign a_to_g = a_to_g_reg;
assign en = 4'b1 << in_channel;

endmodule