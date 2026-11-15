module origen_060116(
    input [31:0] instruction,
    output reg [3:0] Af,
    output reg I,
    output reg ALU_MUX_SEL,
    output reg [4:0] Cad,
    output reg GP_WE,
    output reg [1:0] GP_MUX_SEL,
    output reg [3:0] Bf,
    output reg [1:0] PC_MUX_SEL,
    output reg DM_WE,
    output reg [2:0] Shift_type
);

    wire [5:0] opcode;
    wire [5:0] funct;
    wire [4:0] rs, rt, rd, shamt;

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign shamt = instruction[10:6];
    assign funct = instruction[5:0];

    always @(*) begin
        // Default values
        Af = 4'b0000;
        I = 1'b0;
        ALU_MUX_SEL = 1'b0;
        Cad = 5'b00000;
        GP_WE = 1'b0;
        GP_MUX_SEL = 2'b00;
        Bf = 4'b0000;
        PC_MUX_SEL = 2'b00;
        DM_WE = 1'b0;
        Shift_type = 3'b000;

        case(opcode)
            6'b000000: begin // R-type
                case(funct)
                    6'b100000: Af = 4'b0010; // ADD
                    6'b100010: Af = 4'b0110; // SUB
                    6'b100100: Af = 4'b0000; // AND
                    6'b100101: Af = 4'b0001; // OR
                    6'b101010: Af = 4'b0111; // SLT
                    6'b000000: begin // SLL
                        Af = 4'b1000;
                        Shift_type = 3'b001;
                    end
                    6'b000010: begin // SRL
                        Af = 4'b1000;
                        Shift_type = 3'b010;
                    end
                    6'b000011: begin // SRA
                        Af = 4'b1000;
                        Shift_type = 3'b011;
                    end
                    6'b001000: PC_MUX_SEL = 2'b11; // JR
                endcase
                Cad = rd;
                GP_WE = 1'b1;
            end
            6'b001000: begin // ADDI
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
            end
            6'b001100: begin // ANDI
                Af = 4'b0000;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
            end
            6'b001101: begin // ORI
                Af = 4'b0001;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
            end
            6'b100011: begin // LW
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b01;
            end
            6'b101011: begin // SW
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                DM_WE = 1'b1;
            end
            6'b000100: begin // BEQ
                Bf = 4'b0000;
                PC_MUX_SEL = 2'b01;
            end
            6'b000101: begin // BNE
                Bf = 4'b0001;
                PC_MUX_SEL = 2'b01;
            end
            6'b000010: PC_MUX_SEL = 2'b10; // J
            6'b000011: begin // JAL
                PC_MUX_SEL = 2'b10;
                Cad = 5'b11111; // $ra
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b10;
            end
        endcase
    end
endmodule