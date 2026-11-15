// ALU Module
module origen_092928 (
    input [31:0] in1, in2,
    input [3:0] EXE_CMD,
    input c,
    output reg N, Z, C, V,
    output reg [31:0] out
);

    // Operation codes
    localparam ALU_MOV = 4'b0001,
               ALU_MVN = 4'b1001,
               ALU_ADD = 4'b0010,
               ALU_ADC = 4'b0011,
               ALU_SUB = 4'b0100,
               ALU_SBC = 4'b0101,
               ALU_AND = 4'b0110,
               ALU_ORR = 4'b0111,
               ALU_EOR = 4'b1000,
               ALU_CMP = 4'b0100,
               ALU_TST = 4'b0110,
               ALU_LDR = 4'b0010;

    reg [32:0] result;
    
    always @(*) begin
        case (EXE_CMD)
            ALU_MOV: result = in2;
            ALU_MVN: result = ~in2;
            ALU_ADD: result = in1 + in2;
            ALU_ADC: result = in1 + in2 + c;
            ALU_SUB: result = in1 - in2;
            ALU_SBC: result = in1 - in2 - !c;
            ALU_AND: result = in1 & in2;
            ALU_ORR: result = in1 | in2;
            ALU_EOR: result = in1 ^ in2;
            ALU_CMP: result = in1 - in2;
            ALU_TST: result = in1 & in2;
            ALU_LDR: result = in1 + in2;
            default: result = 33'b0;
        endcase

        // Set flags
        N = result[31];
        Z = (result[31:0] == 32'b0);
        C = result[32];
        
        // Overflow flag
        case (EXE_CMD)
            ALU_ADD, ALU_ADC:
                V = (in1[31] == in2[31]) && (in1[31] != result[31]);
            ALU_SUB, ALU_SBC, ALU_CMP:
                V = (in1[31] != in2[31]) && (in1[31] != result[31]);
            default:
                V = 1'b0;
        endcase

        // Set output
        out = result[31:0];
    end
endmodule

// Testbench
