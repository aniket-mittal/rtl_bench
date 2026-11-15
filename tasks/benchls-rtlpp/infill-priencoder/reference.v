module priencoder(w, z, y);
    input [15:0] w;
    output reg z;
    output reg [3:0] y;
    integer k;

    always @(w) begin
        z = 0;
        y = 4'bx;
        for (k=0; k<16; k=k+1) begin
            if (w[k]) begin
                y = k;
                z = 1;
            end
        end
    end
endmodule