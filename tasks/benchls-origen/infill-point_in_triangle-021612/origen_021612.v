module origen_021612(
    input [11:0] p1x, p1y, p2x, p2y, p3x, p3y,
    output s
);
    wire signed [23:0] s1, s2, s3, s4;
    
    assign s1 = p1x - p3x;
    assign s2 = p2y - p3y;
    assign s3 = p2x - p3x;
    assign s4 = p1y - p3y;
    
    [MASKED]
endmodule

module isPointinTri(
    input [11:0] p1x, p1y, p2x, p2y, p3x, p3y, px, py,
    output s
);
    wire s1, s2, s3;
    
    sign sign1(.p1x(px), .p1y(py), .p2x(p1x), .p2y(p1y), .p3x(p2x), .p3y(p2y), .s(s1));
    sign sign2(.p1x(px), .p1y(py), .p2x(p2x), .p2y(p2y), .p3x(p3x), .p3y(p3y), .s(s2));
    sign sign3(.p1x(px), .p1y(py), .p2x(p3x), .p2y(p3y), .p3x(p1x), .p3y(p1y), .s(s3));
    
    assign s = (s1 == s2) && (s2 == s3);
endmodule

module test;
    reg [11:0] p1x, p1y, p2x, p2y, p3x, p3y, px, py;
    wire s;
    
    isPointinTri dut(
        .p1x(p1x), .p1y(p1y),
        .p2x(p2x), .p2y(p2y),
        .p3x(p3x), .p3y(p3y),
        .px(px), .py(py),
        .s(s)
    );
    
    initial begin
        // Test case 1: Point inside triangle
        p1x = 0; p1y = 0;
        p2x = 10; p2y = 0;
        p3x = 5; p3y = 10;
        px = 5; py = 5;
        #10 $display("Test 1: s = %b (Expected: 1)", s);
        
        // Test case 2: Point outside triangle
        px = 15; py = 15;
        #10 $display("Test 2: s = %b (Expected: 0)", s);
        
        // Test case 3: Point on edge of triangle
        px = 5; py = 0;
        #10 $display("Test 3: s = %b (Expected: 1)", s);
        
        // Test case 4: Point at vertex of triangle
        px = 0; py = 0;
        #10 $display("Test 4: s = %b (Expected: 1)", s);
        
        ;
    end
endmodule