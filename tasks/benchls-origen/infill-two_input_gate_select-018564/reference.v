module origen_018564(
    input a, b, c1, c2,
    output s
);

    wire [3:0] temp;
    
    assign temp[0] = a | b;
    assign temp[1] = ~(a | b);
    assign temp[2] = a ^ b;
    assign temp[3] = ~(a ^ b);
    
    assign s = (~c1 & ~c2 & temp[0]) | 
               (~c1 & c2 & temp[1]) | 
               (c1 & c2 & temp[2]) | 
               (c1 & c2 & temp[3]);

endmodule

