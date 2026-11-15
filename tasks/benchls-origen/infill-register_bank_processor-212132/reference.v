module origen_212132 #(
    parameter WORD_SIZE = 32,
    parameter MAX_NUMBER = 16,
    parameter PC_REGISTER = 0,
    parameter SP_REGISTER = 1,
    parameter SPECREG_LENGTH = 8,
    parameter KERNEL_STACK = 32'h0000_1000,
    parameter USER_STACK = 32'h0000_2000,
    parameter OS_START = 32'h0000_0000
) (
    input enable,
    input reset,
    input slow_clock,
    input fast_clock,
    input [2:0] control,
    input [3:0] register_source_A,
    input [3:0] register_source_B,
    input [3:0] register_Dest,
    input [WORD_SIZE-1:0] ALU_result,
    input [WORD_SIZE-1:0] data_from_memory,
    input [WORD_SIZE-1:0] new_SP,
    input [WORD_SIZE-1:0] new_PC,
    input [SPECREG_LENGTH-1:0] special_register,
    output reg [WORD_SIZE-1:0] read_data_A,
    output reg [WORD_SIZE-1:0] read_data_B,
    output reg [WORD_SIZE-1:0] current_PC,
    output reg [WORD_SIZE-1:0] current_SP,
    output reg [WORD_SIZE-1:0] memory_output
);

    reg [WORD_SIZE-1:0] Bank [0:MAX_NUMBER-1];
    reg [WORD_SIZE-1:0] PC_KEEPER_REGISTER, SP_KEEPER_REGISTER, SYSTEM_CALL_REGISTER;

    always @(posedge fast_clock) begin
        read_data_A <= Bank[register_source_A];
        read_data_B <= Bank[register_source_B];
        current_PC <= Bank[PC_REGISTER];
        current_SP <= Bank[SP_REGISTER];
        memory_output <= Bank[register_source_B];
    end

    always @(posedge slow_clock) begin
        if (reset) begin
            Bank[PC_REGISTER] <= 0;
            Bank[SP_REGISTER] <= KERNEL_STACK;
            PC_KEEPER_REGISTER <= 0;
            SP_KEEPER_REGISTER <= KERNEL_STACK;
            SYSTEM_CALL_REGISTER <= 0;
        end else if (enable) begin
            case (control)
                3'b001: begin
                    if (register_Dest != PC_REGISTER && register_Dest != SP_REGISTER) begin
                        Bank[register_Dest] <= ALU_result;
                    end
                    Bank[PC_REGISTER] <= new_PC;
                    Bank[SP_REGISTER] <= new_SP;
                end
                3'b010: begin
                    if (register_Dest != PC_REGISTER && register_Dest != SP_REGISTER) begin
                        Bank[register_Dest] <= data_from_memory;
                    end
                    Bank[PC_REGISTER] <= new_PC;
                    Bank[SP_REGISTER] <= new_SP;
                end
                3'b011: begin
                    PC_KEEPER_REGISTER <= Bank[PC_REGISTER];
                    SP_KEEPER_REGISTER <= Bank[SP_REGISTER];
                    Bank[PC_REGISTER] <= OS_START;
                    Bank[SP_REGISTER] <= KERNEL_STACK;
                    SYSTEM_CALL_REGISTER <= ALU_result;
                end
                3'b100: begin
                    Bank[PC_REGISTER] <= PC_KEEPER_REGISTER;
                    Bank[SP_REGISTER] <= SP_KEEPER_REGISTER;
                end
                3'b101: begin
                    if (register_Dest != PC_REGISTER && register_Dest != SP_REGISTER) begin
                        Bank[register_Dest] <= special_register;
                    end
                    Bank[PC_REGISTER] <= new_PC;
                    Bank[SP_REGISTER] <= new_SP;
                end
                default: begin
                    Bank[PC_REGISTER] <= new_PC;
                    Bank[SP_REGISTER] <= new_SP;
                end
            endcase
        end
    end

endmodule