module origen_184926(
    input [3:0] aluctr,
    input [31:0] aluoprand_a,
    input [31:0] aluoprand_b,
    output reg [31:0] aluoutput_c,
    output reg ifzero,
    output reg ifgtz,
    output reg ifeqz
);

parameter ADDU = 4'b0000;
parameter SUBU = 4'b0001;
parameter ORI  = 4'b0010;
parameter SRLV = 4'b0011;

always @(*) begin
    case (aluctr)
        ADDU: begin
            aluoutput_c = aluoprand_a + aluoprand_b;
            ifzero = (aluoutput_c == 32'b0);
            ifgtz = ($signed(aluoutput_c) > 0);
            ifeqz = (aluoprand_a == 32'b0);
        end
        SUBU: begin
            aluoutput_c = aluoprand_a - aluoprand_b;
            ifzero = (aluoutput_c == 32'b0);
            ifgtz = ($signed(aluoutput_c) > 0);
            ifeqz = (aluoprand_a == 32'b0);
        end
        ORI: begin
            aluoutput_c = aluoprand_a | aluoprand_b;
            ifzero = (aluoutput_c == 32'b0);
            ifgtz = ($signed(aluoutput_c) > 0);
            ifeqz = (aluoprand_a == 32'b0);
        end
        SRLV: begin
            aluoutput_c = aluoprand_a >> aluoprand_b[4:0];
            ifzero = (aluoutput_c == 32'b0);
            ifgtz = ($signed(aluoutput_c) > 0);
            ifeqz = (aluoprand_a == 32'b0);
        end
        default: begin
            aluoutput_c = 32'b0;
            ifzero = 1'b0;
            ifgtz = 1'b0;
            ifeqz = 1'b0;
        end
    endcase
end

endmodule