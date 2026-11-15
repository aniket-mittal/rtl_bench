module origen_116079(
    input logic [1:0] Intr_Mode,
    input logic [5:0] I_Function_S,
    input logic [3:0] Rdestiny,
    output logic [1:0] wFlag_bools,
    output logic PCS,
    output logic wregister_boolean,
    output logic wmemory_boolean,
    output logic MemtoReg,
    output logic B_ALU_selec,
    output logic [1:0] Imm_selec,
    output logic [1:0] registers_selec_mux,
    output logic [3:0] ALU_selec,
    output logic mov_selec
);

    logic [9:0] controls;
    logic Branch, ALUOp;

    always_comb begin
        case(Intr_Mode)
            2'b00: controls = (I_Function_S[5:4] == 2'b00) ? 10'b0000101001 :
                             (I_Function_S[5:4] == 2'b01) ? 10'b0000100001 :
                             (I_Function_S[5:4] == 2'b10) ? 10'b1100100000 :
                                                            10'b0000000000;
            2'b01: controls = 10'b0001110100;
            2'b10: controls = 10'b0010001001;
            2'b11: controls = 10'b0100001000;
            default: controls = 10'b0000000000;
        endcase
    end

    always_comb begin
        {Branch, ALUOp, wregister_boolean, wmemory_boolean, MemtoReg, B_ALU_selec, Imm_selec, registers_selec_mux} = controls;

        if (ALUOp) begin
            case(I_Function_S[4:1])
                4'b0100: ALU_selec = 4'b0000; // ADD
                4'b0010: ALU_selec = 4'b0001; // SUB
                4'b0000: ALU_selec = 4'b0010; // AND
                4'b1100: ALU_selec = 4'b0011; // ORR
                4'b1010: ALU_selec = 4'b0111; // CMP
                4'b1000: ALU_selec = 4'b1100; // MOV
                default: ALU_selec = 4'b1111; // Undefined
            endcase
        end else begin
            ALU_selec = 4'b0000; // Default to ADD for non-ALU operations
        end

        wFlag_bools[1] = ALUOp & ~I_Function_S[0] & (I_Function_S[4:1] != 4'b1000);
        wFlag_bools[0] = ALUOp & ~I_Function_S[0] & (I_Function_S[4:1] == 4'b1010);

        PCS = Branch & (Rdestiny == 4'b1111);

        mov_selec = (I_Function_S[4:1] == 4'b1000);
    end

endmodule