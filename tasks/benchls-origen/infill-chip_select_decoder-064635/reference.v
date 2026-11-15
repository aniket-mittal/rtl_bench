module origen_064635 (
    input [7:0] addr,
    input CS,
    output reg cs1,
    output reg cs2,
    output reg cs3,
    output reg cs4
);

    parameter chip1_decode = 2'b00;
    parameter chip2_decode = 2'b01;
    parameter chip3_decode = 2'b10;
    parameter chip4_decode = 2'b11;

    always @(*) begin
        if (CS) begin
            cs1 = 1'b1;
            cs2 = 1'b1;
            cs3 = 1'b1;
            cs4 = 1'b1;
        end else begin
            case (addr[7:6])
                chip1_decode: begin
                    cs1 = 1'b0;
                    cs2 = 1'b1;
                    cs3 = 1'b1;
                    cs4 = 1'b1;
                end
                chip2_decode: begin
                    cs1 = 1'b1;
                    cs2 = 1'b0;
                    cs3 = 1'b1;
                    cs4 = 1'b1;
                end
                chip3_decode: begin
                    cs1 = 1'b1;
                    cs2 = 1'b1;
                    cs3 = 1'b0;
                    cs4 = 1'b1;
                end
                chip4_decode: begin
                    cs1 = 1'b1;
                    cs2 = 1'b1;
                    cs3 = 1'b1;
                    cs4 = 1'b0;
                end
            endcase
        end
    end

endmodule