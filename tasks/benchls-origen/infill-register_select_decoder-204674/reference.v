module origen_204674 (
    input [2:0] select,
    output reg AC, AR, IR, PC, R, DR, TR, Write
);

parameter ac = 3'b000;
parameter ar = 3'b001;
parameter dr = 3'b010;
parameter ir = 3'b011;
parameter pc = 3'b100;
parameter r = 3'b101;
parameter tr = 3'b110;
parameter ra = 3'b111;

always @(*) begin
    AC = 1'b0;
    AR = 1'b0;
    IR = 1'b0;
    PC = 1'b0;
    R = 1'b0;
    DR = 1'b0;
    TR = 1'b0;
    case (select)
        ac: begin
            AC = 1'b1;
        end
        ar: begin
            AR = 1'b1;
        end
        dr: begin
            DR = 1'b1;
        end
        ir: begin
            IR = 1'b1;
        end
        pc: begin
            PC = 1'b1;
        end
        r: begin
            R = 1'b1;
        end
        tr: begin
            TR = 1'b1;
        end
        ra: begin
            // Do nothing, all outputs are 0
        end
    endcase
end

assign Write = (select == ac) || (select == ar) || (select == dr) || (select == ir) || (select == pc) || (select == r) || (select == tr) || (select == ra);

endmodule