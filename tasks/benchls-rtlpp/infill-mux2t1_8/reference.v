module MUX2T1_8(
    input [7:0] I0, 
    input [7:0] I1, 
    input s, 
    output [7:0] o
);
    assign o = s ? I1 : I0;
endmodule