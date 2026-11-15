module origen_019255 (
    input wire clk,
    input wire reset,
    input wire enable,
    output wire cn1,
    output wire cn2
);

reg [24:0] reg0, reg1;

[MASKED]

assign cn1 = reg0[0] ^ reg1[0];
assign cn2 = reg0[0] ^ reg0[1] ^ reg1[0] ^ reg1[1];

endmodule

module scrambler (
    input wire clk,
    input wire reset,
    input wire enable,
    output wire [1:0] out,
    output wire valid
);

wire cn1, cn2;
reg w1, l_cn2;

scrambler_pn pn_gen (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .cn1(cn1),
    .cn2(cn2)
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        w1 <= 1'b0;
        l_cn2 <= 1'b0;
    end else if (enable) begin
        w1 <= ~w1;
        l_cn2 <= cn2;
    end
end

assign valid = ~enable;
assign out[0] = cn1 ^ (w1 & l_cn2);
assign out[1] = cn2 ^ (~w1 & l_cn2);

endmodule