module origen_046677(a, b, c, s);
    input a, b;
    output c, s;
    
    assign c = a & b;
    assign s = a ^ b;
endmodule

module fa_df(a, b, cin, c, s);
    input a, b, cin;
    output c, s;
    
    assign c = (a & b) | (b & cin) | (a & cin);
    assign s = a ^ b ^ cin;
endmodule

module wtm(a, b, p);
    input [3:0] a, b;
    output [7:0] p;
    
    wire [23:0] w;
    
    // Generate partial products
    assign w[0] = a[0] & b[0];
    assign w[1] = a[1] & b[0];
    assign w[2] = a[2] & b[0];
    assign w[3] = a[3] & b[0];
    assign w[4] = a[0] & b[1];
    assign w[5] = a[1] & b[1];
    assign w[6] = a[2] & b[1];
    assign w[7] = a[3] & b[1];
    assign w[8] = a[0] & b[2];
    assign w[9] = a[1] & b[2];
    assign w[10] = a[2] & b[2];
    assign w[11] = a[3] & b[2];
    assign w[12] = a[0] & b[3];
    assign w[13] = a[1] & b[3];
    assign w[14] = a[2] & b[3];
    assign w[15] = a[3] & b[3];
    
    // Stage 1
    ha_df ha1(w[1], w[4], w[16], p[1]);
    fa_df fa1(w[2], w[5], w[8], w[17], w[18]);
    fa_df fa2(w[3], w[6], w[9], w[19], w[20]);
    ha_df ha2(w[7], w[10], w[21], w[22]);
    
    // Stage 2
    ha_df ha3(w[18], w[12], w[23], p[2]);
    fa_df fa3(w[20], w[13], w[23], , p[3]);
    fa_df fa4(w[22], w[14], w[19], , p[4]);
    fa_df fa5(w[15], w[21], w[17], , p[5]);
    
    // Stage 3
    ha_df ha4(w[11], p[5], , p[6]);
    
    // Final assignments
    assign p[0] = w[0];
    assign p[7] = w[15];
endmodule