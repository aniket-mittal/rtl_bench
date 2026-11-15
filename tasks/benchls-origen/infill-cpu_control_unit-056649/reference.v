module origen_056649(
    input [7:0] IR_opcode,
    input [3:0] IR_oldopcode,
    input EXEC1, EXEC2, EXEC3,
    input EQ, MI,
    input [3:0] CMPFlag,
    output reg PC_sync_load,
    output reg PC_count_enable,
    output reg [1:0] MUX1_select,
    output reg RAM_write_enable,
    output reg [1:0] MUX2sel,
    output reg [1:0] MUXLsel,
    output reg EXTRA1, EXTRA2,
    output reg [1:0] SpMux,
    output reg [1:0] SP_Cnt,
    output reg pushpop,
    output reg ldnsel
);

    // Instruction decoding
    wire LDA = (IR_opcode[7:4] == 4'b0000);
    wire STA = (IR_opcode[7:4] == 4'b0001);
    wire ADD = (IR_opcode[7:4] == 4'b0010);
    wire SUB = (IR_opcode[7:4] == 4'b0011);
    wire AND = (IR_opcode[7:4] == 4'b0100);
    wire OR  = (IR_opcode[7:4] == 4'b0101);
    wire XOR = (IR_opcode[7:4] == 4'b0110);
    wire INC = (IR_opcode == 8'b01110000);
    wire DEC = (IR_opcode == 8'b01110001);
    wire NOT = (IR_opcode == 8'b01110010);
    wire SHL = (IR_opcode == 8'b01110011);
    wire SHR = (IR_opcode == 8'b01110100);
    wire JMP = (IR_opcode[7:4] == 4'b1000);
    wire BEQ = (IR_opcode[7:4] == 4'b1001);
    wire BNE = (IR_opcode[7:4] == 4'b1010);
    wire BLT = (IR_opcode[7:4] == 4'b1011);
    wire BGT = (IR_opcode[7:4] == 4'b1100);
    wire CALL = (IR_opcode[7:4] == 4'b1101);
    wire RET = (IR_opcode == 8'b11100000);
    wire PUSH = (IR_opcode == 8'b11110000);
    wire POP = (IR_opcode == 8'b11110001);

    wire LDN_old = (IR_oldopcode == 4'b1111);

    always @(*) begin
        // Default values
        PC_sync_load = 1'b0;
        PC_count_enable = 1'b0;
        MUX1_select = 2'b00;
        RAM_write_enable = 1'b0;
        MUX2sel = 2'b00;
        MUXLsel = 2'b00;
        EXTRA1 = 1'b0;
        EXTRA2 = 1'b0;
        SpMux = 2'b00;
        SP_Cnt = 2'b00;
        pushpop = 1'b0;
        ldnsel = 1'b0;

        // Instruction-specific control signals
        if (LDA || STA || ADD || SUB || AND || OR || XOR) begin
            PC_count_enable = EXEC1;
            MUX1_select = 2'b01;
            RAM_write_enable = STA & EXEC2;
            MUX2sel = {1'b0, EXEC2};
            MUXLsel = {1'b0, EXEC2};
        end else if (INC || DEC || NOT || SHL || SHR) begin
            PC_count_enable = EXEC1;
            MUX2sel = 2'b10;
            MUXLsel = 2'b10;
        end else if (JMP) begin
            PC_sync_load = EXEC1;
            MUX1_select = 2'b10;
        end else if (BEQ || BNE || BLT || BGT) begin
            PC_sync_load = EXEC1 & (
                (BEQ & EQ) | (BNE & ~EQ) | (BLT & MI) | (BGT & ~(EQ | MI))
            );
            MUX1_select = 2'b10;
            PC_count_enable = EXEC1 & ~PC_sync_load;
        end else if (CALL) begin
            PC_sync_load = EXEC2;
            MUX1_select = 2'b10;
            SpMux = 2'b01;
            SP_Cnt = 2'b10;
            pushpop = EXEC1;
        end else if (RET) begin
            PC_sync_load = EXEC2;
            MUX1_select = 2'b11;
            SpMux = 2'b10;
            SP_Cnt = 2'b01;
            pushpop = EXEC1;
        end else if (PUSH) begin
            SpMux = 2'b01;
            SP_Cnt = 2'b10;
            pushpop = EXEC1;
            PC_count_enable = EXEC2;
        end else if (POP) begin
            SpMux = 2'b10;
            SP_Cnt = 2'b01;
            pushpop = EXEC1;
            PC_count_enable = EXEC2;
        end

        // LDN handling
        ldnsel = LDN_old & EXEC3;

        // Additional control for comparison operations
        EXTRA1 = (ADD | SUB | AND | OR | XOR) & EXEC2;
        EXTRA2 = |CMPFlag & EXEC2;
    end

endmodule