module origen_058581(
    input [3:0] a,
    input [3:0] b,
    input carryin,
    output [3:0] sum,
    output cout
);
    wire [3:0] c;
    
    [MASKED]
    fa fa1(.a(a[1]), .b(b[1]), .c(c[0]), .su(sum[1]), .cout(c[1]));
    fa fa2(.a(a[2]), .b(b[2]), .c(c[1]), .su(sum[2]), .cout(c[2]));
    fa fa3(.a(a[3]), .b(b[3]), .c(c[2]), .su(sum[3]), .cout(cout));
endmodule

module fa(
    input a,
    input b,
    input c,
    output su,
    output cout
);
    assign su = a ^ b ^ c;
    assign cout = (a & b) | (b & c) | (c & a);
endmodule

module testbench;
    reg [3:0] a, b;
    reg carryin;
    wire [3:0] sum;
    wire cout;
    
    csaadder uut(
        .a(a),
        .b(b),
        .carryin(carryin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $dumpfile("csaadder.vcd");
        $dumpvars(0, testbench);
        
        // Test case 1
        a = 4'b1010; b = 4'b0101; carryin = 1'b0;
        #10;
        
        // Test case 2
        a = 4'b1111; b = 4'b1111; carryin = 1'b1;
        #10;
        
        // Test case 3
        a = 4'b1001; b = 4'b0110; carryin = 1'b1;
        #10;
        
        ;
    end
endmodule