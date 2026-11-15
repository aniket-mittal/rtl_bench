module autovcoder_140624(  
    input clk,  
    input rst,  
    input [3:0] instruction,  
    output reg [15:0] result  
);  
    reg [3:0] opcode;  
    reg [15:0] operand1, operand2;  
    reg [15:0] exec_result;  
      
    // Pipeline registers  
    reg [3:0] IF_ID_opcode;  
    reg [15:0] IF_ID_operand1;  
    reg [15:0] IF_ID_operand2;  
    reg [15:0] ID_EX_operand1;  
    reg [15:0] ID_EX_operand2;  
    reg [3:0] ID_EX_opcode;  

    // State machine for operation  
    always @(posedge clk or posedge rst) begin  
        if (rst) begin  
            result <= 0;  
            IF_ID_opcode <= 0;  
            IF_ID_operand1 <= 0;  
            IF_ID_operand2 <= 0;  
            ID_EX_opcode <= 0;  
            ID_EX_operand1 <= 0;  
            ID_EX_operand2 <= 0;  
            exec_result <= 0;  
        end else begin  
            // Stage IF to ID  
            IF_ID_opcode <= instruction[3:0];  
            IF_ID_operand1 <= 10;   // Example operand 1  
            IF_ID_operand2 <= 5;    // Example operand 2  
            
            // Stage ID to EX  
            ID_EX_opcode <= IF_ID_opcode;  
            ID_EX_operand1 <= IF_ID_operand1;  
            ID_EX_operand2 <= IF_ID_operand2;  
            
            // Stage EX  
            case (ID_EX_opcode)  
                4'b0001: exec_result <= ID_EX_operand1 + ID_EX_operand2; // ADD  
                4'b0010: exec_result <= ID_EX_operand1 - ID_EX_operand2; // SUB  
                4'b0011: exec_result <= ID_EX_operand1 * ID_EX_operand2; // MUL  
                default: exec_result <= 0;  
            endcase  
            
            // Output result  
            result <= exec_result;  
        end  
    end  
endmodule