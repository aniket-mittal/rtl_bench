module rtlpp_01356(
    input SET,
    input RST,
    input CK,
    input D,
    output reg Q
);

    always @(posedge CK or posedge RST or posedge SET) begin
        if (RST)
            Q <= 1'b0;
        else if (SET)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule