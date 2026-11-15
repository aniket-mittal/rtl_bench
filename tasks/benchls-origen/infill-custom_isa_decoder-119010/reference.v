module origen_119010(
    input [31:0] instr,
    output [5:0] rs, rt, rd,
    output [14:0] imm,
    output reg [3:0] ALUopsel,
    output MUXsel1,
    output reg MUXsel2,
    output reg REGwrite,
    output reg MEMwrite
);

    assign MUXsel1 = instr[31];
    assign rs = instr[30:25];
    assign rd = instr[24:19];
    assign rt = instr[14:9];
    assign imm = instr[14:0];

    always @(*) begin
        case(instr[18:15])
            4'b0000: begin
                ALUopsel = 4'b0000;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b0001: begin
                ALUopsel = 4'b0001;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b0010: begin
                ALUopsel = 4'b0010;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b0011: begin
                ALUopsel = 4'b0011;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b0100: begin
                ALUopsel = 4'b0100;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b0;
            end
            4'b0101: begin
                ALUopsel = 4'b0101;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b0110: begin
                ALUopsel = 4'b0110;
                REGwrite = 1'b0;
                MEMwrite = 1'b1;
                MUXsel2 = 1'b1;
            end
            4'b0111: begin
                ALUopsel = 4'b0111;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b1000: begin
                ALUopsel = 4'b1000;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b1001: begin
                ALUopsel = 4'b1001;
                REGwrite = (rd != 6'b000000);
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            4'b1111: begin
                ALUopsel = 4'b1111;
                REGwrite = 1'b0;
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
            default: begin
                ALUopsel = 4'b1111;
                REGwrite = 1'b0;
                MEMwrite = 1'b0;
                MUXsel2 = 1'b1;
            end
        endcase
    end

endmodule