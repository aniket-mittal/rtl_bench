module origen_021612(
    input [11:0] p1x, p1y, p2x, p2y, p3x, p3y,
    output s
);
    wire signed [23:0] s1, s2, s3, s4;
    
    assign s1 = p1x - p3x;
    assign s2 = p2y - p3y;
    assign s3 = p2x - p3x;
    assign s4 = p1y - p3y;
    
    assign s = ((s1 * s2) - (s3 * s4)) >= 0;
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

