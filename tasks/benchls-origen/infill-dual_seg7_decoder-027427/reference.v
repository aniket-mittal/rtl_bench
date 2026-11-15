module origen_027427(
    input w, x, y, z,
    output reg a, b, c, d, e, f, g,
    output reg h, i, j, k, l, m, n
);

    always @(*) begin
        case({w,x,y,z})
            4'b0000: {a,b,c,d,e,f,g} = 7'b1111110; // 0
            4'b0001: {a,b,c,d,e,f,g} = 7'b0110000; // 1
            4'b0010: {a,b,c,d,e,f,g} = 7'b1101101; // 2
            4'b0011: {a,b,c,d,e,f,g} = 7'b1111001; // 3
            4'b0100: {a,b,c,d,e,f,g} = 7'b0110011; // 4
            4'b0101: {a,b,c,d,e,f,g} = 7'b1011011; // 5
            4'b0110: {a,b,c,d,e,f,g} = 7'b1011111; // 6
            4'b0111: {a,b,c,d,e,f,g} = 7'b1110000; // 7
            4'b1000: {a,b,c,d,e,f,g} = 7'b1111111; // 8
            4'b1001: {a,b,c,d,e,f,g} = 7'b1111011; // 9
            4'b1010: {a,b,c,d,e,f,g} = 7'b1111110; // A (0)
            4'b1011: {a,b,c,d,e,f,g} = 7'b0110000; // B (1)
            4'b1100: {a,b,c,d,e,f,g} = 7'b1101101; // C (2)
            4'b1101: {a,b,c,d,e,f,g} = 7'b1111001; // D (3)
            4'b1110: {a,b,c,d,e,f,g} = 7'b0110011; // E (4)
            4'b1111: {a,b,c,d,e,f,g} = 7'b1011011; // F (5)
            default: {a,b,c,d,e,f,g} = 7'b0000000; // All off
        endcase
    end

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