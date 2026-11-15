module rtlpp_02712(Fun,
                 MIO_ready,
                 OPcode,
                 ALUSrc_B,
                 ALU_Control,
                 Branch,
                 CPU_MIO,
                 Jump,
                 MemtoReg,
                 mem_w,
                 RegDst,
                 RegWrite);

    input [5:0] Fun;
    input MIO_ready;
    input [5:0] OPcode;
    output ALUSrc_B;
    output [2:0] ALU_Control;
    output Branch;
    output CPU_MIO;
    output Jump;
    output MemtoReg;
    output mem_w;
    output RegDst;
    output RegWrite;

    wire ALUop0;
    wire ALUop1;
    wire XLXN_61;
    wire XLXN_62;
    wire XLXN_84;
    wire Branch_DUMMY;
    wire RegDst_DUMMY;
    wire mem_w_DUMMY;
    wire MemtoReg_DUMMY;
    
    assign Branch = Branch_DUMMY;
    assign MemtoReg = MemtoReg_DUMMY;
    assign mem_w = mem_w_DUMMY;
    assign RegDst = RegDst_DUMMY;
    
    // NOR6 logic
    assign RegDst_DUMMY = !(OPcode[5] || OPcode[4] || OPcode[3] || OPcode[2] || OPcode[1] || OPcode[0]);

    // AND5B2 logic
    assign MemtoReg_DUMMY = OPcode[3] & OPcode[2] & OPcode[1] & OPcode[0] & OPcode[5];

    // AND5B1 logic
    assign mem_w_DUMMY = OPcode[2] & OPcode[5] & OPcode[3] & OPcode[1] & OPcode[0];

    // AND5B4 logic (Branch_DUMMY)
    assign Branch_DUMMY = OPcode[5] & OPcode[3] & OPcode[1] & OPcode[0] & OPcode[2];

    // AND5B4 logic (Jump)
    assign Jump = OPcode[5] & OPcode[3] & OPcode[2] & OPcode[0] & OPcode[1];

    // OR2 logic
    assign ALUSrc_B = mem_w_DUMMY | MemtoReg_DUMMY;

    // OR2 logic
    assign RegWrite = RegDst_DUMMY | MemtoReg_DUMMY;

    // BUF logic
    assign ALUop1 = RegDst_DUMMY;
    assign ALUop0 = Branch_DUMMY;

    // AND2 logic
    assign XLXN_62 = Fun[1] & ALUop1;

    // AND2 logic
    assign ALU_Control[0] = XLXN_61 & ALUop1;

    // OR2 logic
    assign XLXN_61 = Fun[3] | XLXN_84;

    // OR2 logic
    assign ALU_Control[2] = XLXN_62 | ALUop0;

    // NAND2 logic
    assign ALU_Control[1] = ~(Fun[2] & ALUop1);

    // AND2B1 logic
    assign XLXN_84 = Fun[1] & ~Fun[0];

endmodule