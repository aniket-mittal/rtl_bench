module origen_007818(
    input [1:0] sel,
    input [1:0] a,
    input [1:0] b,
    output reg [1:0] res
);

always @(*) begin
    case(sel)
        2'b00: res = a & b;
        2'b01: res = a | b;
        2'b10: res = a ^ b;
        2'b11: res = ~a;
    endcase
end

endmodule

module tg(
    input [1:0] res,
    output reg [1:0] sel,
    output reg [1:0] a,
    output reg [1:0] b
);

initial begin
    a = 2'b11;
    b = 2'b01;
    sel = 2'b01;
    #10 sel = 2'b01;
    #10 sel = 2'b10;
    #10 sel = 2'b11;
    #10 ;
end

initial begin
    $monitor("Time=%0t sel=%b a=%b b=%b res=%b", $time, sel, a, b, res);
end

endmodule

