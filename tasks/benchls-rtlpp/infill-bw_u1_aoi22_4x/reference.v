module bw_u1_aoi22_4x(
    input a1, 
    input a2, 
    input b1, 
    input b2, 
    output z
);
assign z = ~( (a1 & a2) | (b1 & b2) );
endmodule