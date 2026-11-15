module origen_195863 (
    input [5:0] Op,
    input [5:0] Func,
    input Z,
    output reg Wmem,
    output reg Wreg,
    output reg Regrt,
    output reg Reg2reg,
    output reg [3:0] Aluc,
    output reg Shift,
    output reg Aluqb,
    output reg [1:0] Pcsrc,
    output reg jal,
    output reg Se
);

    wire rtype, lw, sw, beq, j, jal_inst, addi, andi, ori, xori;

    // Instruction type decoding
    assign rtype = (~Op[5]) & (~Op[4]) & (~Op[3]) & (~Op[2]) & (~Op[1]) & (~Op[0]);
    assign lw = Op[5] & (~Op[4]) & (~Op[3]) & Op[2] & Op[1] & Op[0];
    assign sw = Op[5] & (~Op[4]) & Op[3] & Op[2] & Op[1] & Op[0];
    assign beq = (~Op[5]) & (~Op[4]) & Op[3] & (~Op[2]) & (~Op[1]) & (~Op[0]);
    assign j = (~Op[5]) & (~Op[4]) & (~Op[3]) & Op[2] & (~Op[1]) & Op[0];
    assign jal_inst = (~Op[5]) & (~Op[4]) & (~Op[3]) & Op[2] & Op[1] & Op[0];
    assign addi = Op[5] & (~Op[4]) & (~Op[3]) & (~Op[2]) & Op[1] & (~Op[0]);
    assign andi = Op[5] & (~Op[4]) & (~Op[3]) & Op[2] & (~Op[1]) & (~Op[0]);
    assign ori = Op[5] & (~Op[4]) & (~Op[3]) & Op[2] & Op[1] & (~Op[0]);
    assign xori = Op[5] & (~Op[4]) & (~Op[3]) & Op[2] & Op[1] & Op[0];

    always @(*) begin
        // Default values
        Wmem = 1'b0;
        Wreg = 1'b0;
        Regrt = 1'b0;
        Reg2reg = 1'b0;
        Aluc = 4'b0000;
        Shift = 1'b0;
        Aluqb = 1'b0;
        Pcsrc = 2'b00;
        jal = 1'b0;
        Se = 1'b0;

        if (rtype) begin
            Wreg = 1'b1;
            Regrt = 1'b0;
            Reg2reg = 1'b1;
            Aluc = {2'b00, Func[1:0]};
            Shift = Func[2];
        end else if (lw) begin
            Wreg = 1'b1;
            Regrt = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0000;
            Se = 1'b1;
        end else if (sw) begin
            Wmem = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0000;
            Se = 1'b1;
        end else if (beq) begin
            Pcsrc = (Z) ? 2'b01 : 2'b00;
        end else if (j) begin
            Pcsrc = 2'b10;
        end else if (jal_inst) begin
            Wreg = 1'b1;
            Regrt = 1'b0;
            Reg2reg = 1'b1;
            Aluc = 4'b0000;
            Pcsrc = 2'b11;
            jal = 1'b1;
        end else if (addi) begin
            Wreg = 1'b1;
            Regrt = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0000;
            Se = 1'b1;
        end else if (andi) begin
            Wreg = 1'b1;
            Regrt = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0010;
            Se = 1'b0;
        end else if (ori) begin
            Wreg = 1'b1;
            Regrt = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0001;
            Se = 1'b0;
        end else if (xori) begin
            Wreg = 1'b1;
            Regrt = 1'b1;
            Reg2reg = 1'b0;
            Aluc = 4'b0011;
            Se = 1'b0;
        end
    end

endmodule