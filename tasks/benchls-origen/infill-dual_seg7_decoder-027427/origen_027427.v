module origen_027427(
    input w, x, y, z,
    output reg a, b, c, d, e, f, g,
    output reg h, i, j, k, l, m, n
);

    [MASKED]

    always @(*) begin
        case({w,x,y,z})
            4'b0000: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0001: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0010: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0011: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0100: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0101: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0110: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b0111: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b1000: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b1001: {h,i,j,k,l,m,n} = 7'b1111111;
            4'b1010: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            4'b1011: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            4'b1100: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            4'b1101: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            4'b1110: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            4'b1111: {h,i,j,k,l,m,n} = 7'b0000001; // Corrected to affect second display
            default: {h,i,j,k,l,m,n} = 7'b0000000; // All off
        endcase
    end

endmodule