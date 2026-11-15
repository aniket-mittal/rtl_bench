module rtlpp_01355(SET, RST, CK, D, Q);
    input [0:0] SET;
    input [0:0] RST;
    input [0:0] CK;
    input [0:0] D;
    output [0:0] Q;
    reg [0:0] Q;

    always @(posedge CK or posedge SET or posedge RST) begin
        if (RST)
            Q <= 1'b0;
        else if (SET)
            Q <= 1'b1;
        else
            Q <= D;
    end
endmodule