module origen_115572 (
    input logic clk,
    input logic rst,
    input logic [15:0] Immediate,
    input logic [3:0] ALUOp,
    output logic [4:0] ALU_Sel
);

    logic [5:0] Funct;
    assign Funct = Immediate[5:0];

    // ALU operations
    localparam logic [4:0] 
        shla  = 5'b00000,
        shra  = 5'b00001,
        mula  = 5'b00010,
        diva  = 5'b00011,
        adda  = 5'b00100,
        suba  = 5'b00101,
        anda  = 5'b00110,
        ora   = 5'b00111,
        xora  = 5'b01000,
        nora  = 5'b01001,
        slta  = 5'b01010,
        sgta  = 5'b01011,
        slea  = 5'b01100,
        sgea  = 5'b01101,
        seqa  = 5'b01110,
        snea  = 5'b01111;

    // Function codes
    localparam logic [5:0] 
        shli = 6'b000000,
        shri = 6'b000001,
        shl  = 6'b000010,
        shr  = 6'b000011,
        mul  = 6'b000100,
        div  = 6'b000101,
        add  = 6'b000110,
        sub  = 6'b000111,
        and_ = 6'b001000,
        or_  = 6'b001001,
        xor_ = 6'b001010,
        nor_ = 6'b001011,
        slt  = 6'b001100,
        sgt  = 6'b001101,
        sle  = 6'b001110,
        sge  = 6'b001111,
        seq  = 6'b010000,
        sne  = 6'b010001,
        yesB = 6'b010010;

    // Instruction types
    localparam logic [3:0] 
        rtyp  = 4'b0000,
        addi  = 4'b0001,
        addiu = 4'b0010,
        andi  = 4'b0011,
        ori   = 4'b0100,
        xori  = 4'b0101,
        lw    = 4'b0110,
        sw    = 4'b0111,
        beq   = 4'b1000,
        bne   = 4'b1001,
        slti  = 4'b1010,
        sgti  = 4'b1011,
        slei  = 4'b1100,
        sgei  = 4'b1101,
        seqi  = 4'b1110,
        snei  = 4'b1111;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            ALU_Sel <= 5'b0;
        end else begin
            case (ALUOp)
                rtyp: begin
                    case (Funct)
                        shli, shri, shl:  ALU_Sel <= shla;
                        shr:              ALU_Sel <= shra;
                        mul:              ALU_Sel <= mula;
                        div:              ALU_Sel <= diva;
                        add:              ALU_Sel <= adda;
                        sub:              ALU_Sel <= suba;
                        and_:             ALU_Sel <= anda;
                        or_:              ALU_Sel <= ora;
                        xor_:             ALU_Sel <= xora;
                        nor_:             ALU_Sel <= nora;
                        slt:              ALU_Sel <= slta;
                        sgt:              ALU_Sel <= sgta;
                        sle:              ALU_Sel <= slea;
                        sge:              ALU_Sel <= sgea;
                        seq:              ALU_Sel <= seqa;
                        sne:              ALU_Sel <= snea;
                        yesB:             ALU_Sel <= 5'd16;
                        default:          ALU_Sel <= 5'b0;
                    endcase
                end
                addi, addiu, lw, sw:  ALU_Sel <= adda;
                andi:                 ALU_Sel <= anda;
                ori:                  ALU_Sel <= ora;
                xori:                 ALU_Sel <= xora;
                beq, seqi:            ALU_Sel <= seqa;
                bne, snei:            ALU_Sel <= snea;
                slti:                 ALU_Sel <= slta;
                sgti:                 ALU_Sel <= sgta;
                slei:                 ALU_Sel <= slea;
                sgei:                 ALU_Sel <= sgea;
                default:              ALU_Sel <= 5'b0;
            endcase
        end
    end

endmodule