module origen_018564(
    input a, b, c1, c2,
    output s
);

    wire [3:0] temp;
    
    assign temp[0] = a | b;
    assign temp[1] = ~(a | b);
    assign temp[2] = a ^ b;
    assign temp[3] = ~(a ^ b);
    
    [MASKED]

endmodule

module test_f4;
    reg a, b, c1, c2;
    wire s;
    
    f4 uut (
        .a(a),
        .b(b),
        .c1(c1),
        .c2(c2),
        .s(s)
    );
    
    initial begin
        a = 0; b = 0; c1 = 0; c2 = 0;
        
        $display("a b c1 c2 | s");
        $display("------------");
        
        $monitor("%b %b %b  %b  | %b", a, b, c1, c2, s);
        
        #1 {a, b, c1, c2} = 4'b0001;
        #1 {a, b, c1, c2} = 4'b0010;
        #1 {a, b, c1, c2} = 4'b0011;
        #1 {a, b, c1, c2} = 4'b0100;
        #1 {a, b, c1, c2} = 4'b0101;
        #1 {a, b, c1, c2} = 4'b0110;
        #1 {a, b, c1, c2} = 4'b0111;
        #1 {a, b, c1, c2} = 4'b1000;
        #1 {a, b, c1, c2} = 4'b1001;
        #1 {a, b, c1, c2} = 4'b1010;
        #1 {a, b, c1, c2} = 4'b1011;
        #1 {a, b, c1, c2} = 4'b1100;
        #1 {a, b, c1, c2} = 4'b1101;
        #1 {a, b, c1, c2} = 4'b1110;
        #1 {a, b, c1, c2} = 4'b1111;
        
        #1 ;
    end
    
endmodule