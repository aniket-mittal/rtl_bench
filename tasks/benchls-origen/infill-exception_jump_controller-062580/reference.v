module origen_062580 (
    input wire clk,
    input wire rst,
    input wire miss,
    input wire jump,
    input wire [15:0] new_PC,
    input wire [15:0] branch_PC,
    input wire [1:0] Mode_Set,
    input wire Bad_Instr_in,
    input wire Illegal_PC_in,
    input wire Illegal_Memory_in,
    input wire Spart_RCV_in,
    input wire Accelerator_keyfound_in,
    input wire IFID_Stall,
    output reg [15:0] J_R,
    output reg J,
    output reg [1:0] Mode,
    output reg Store_Current
);

    // Exception handler addresses
    localparam [15:0] BAD_INSTR_HANDLER = 16'h0100;
    localparam [15:0] ILLEGAL_PC_HANDLER = 16'h0200;
    localparam [15:0] ILLEGAL_MEMORY_HANDLER = 16'h0300;
    localparam [15:0] SPART_RCV_HANDLER = 16'h0400;
    localparam [15:0] ACCELERATOR_KEYFOUND_HANDLER = 16'h0500;

    // Exception flags
    reg Bad_Instr, Illegal_PC, Illegal_Memory, Spart_RCV, Accelerator_keyfound;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Bad_Instr <= 0;
            Illegal_PC <= 0;
            Illegal_Memory <= 0;
            Spart_RCV <= 0;
            Accelerator_keyfound <= 0;
            Mode <= 2'b00;
            J <= 0;
            J_R <= 16'h0000;
            Store_Current <= 0;
        end else begin
            // Sample and store exception signals
            Bad_Instr <= Bad_Instr | (Bad_Instr_in & ~miss);
            Illegal_PC <= Illegal_PC | (Illegal_PC_in & ~miss);
            Illegal_Memory <= Illegal_Memory | (Illegal_Memory_in & ~miss);
            Spart_RCV <= Spart_RCV | (Spart_RCV_in & ~miss);
            Accelerator_keyfound <= Accelerator_keyfound | (Accelerator_keyfound_in & ~miss);

            // Mode management
            if (Bad_Instr | Illegal_PC | Illegal_Memory | Spart_RCV | Accelerator_keyfound) begin
                Mode <= 2'b11; // Exception mode
            end else if (Mode_Set != 2'b00) begin
                Mode <= Mode_Set;
            end

            // Jump control
            if (miss) begin
                J <= 1;
                J_R <= branch_PC;
                Store_Current <= 0;
            end else if (Spart_RCV) begin
                J <= 1;
                J_R <= SPART_RCV_HANDLER;
                Store_Current <= 1;
                Spart_RCV <= 0;
            end else if (Accelerator_keyfound) begin
                J <= 1;
                J_R <= ACCELERATOR_KEYFOUND_HANDLER;
                Store_Current <= 1;
                Accelerator_keyfound <= 0;
            end else if (Illegal_PC) begin
                J <= 1;
                J_R <= ILLEGAL_PC_HANDLER;
                Store_Current <= 1;
                Illegal_PC <= 0;
            end else if (Illegal_Memory) begin
                J <= 1;
                J_R <= ILLEGAL_MEMORY_HANDLER;
                Store_Current <= 1;
                Illegal_Memory <= 0;
            end else if (Bad_Instr) begin
                J <= 1;
                J_R <= BAD_INSTR_HANDLER;
                Store_Current <= 1;
                Bad_Instr <= 0;
            end else if (jump & ~IFID_Stall) begin
                J <= 1;
                J_R <= new_PC;
                Store_Current <= 0;
            end else begin
                J <= 0;
                Store_Current <= 0;
            end
        end
    end

endmodule