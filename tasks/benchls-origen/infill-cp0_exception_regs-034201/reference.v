module origen_034201 (
    input wire clk,
    input wire rst,
    input wire mfc0,
    input wire [4:0] addr,
    input wire mtc0,
    input wire [31:0] data,
    input wire exception,
    input wire eret,
    input wire [31:0] pc,
    input wire [3:0] cause,
    output reg [31:0] CP0_out,
    output wire [31:0] status,
    output wire [31:0] epc_out
);

    reg [31:0] memory [0:31];
    reg in_exception;

    wire valid_exception = exception && 
        ((cause == 4'b1000 && memory[12][1]) || // Syscall
         (cause == 4'b1001 && memory[12][2]) || // Breakpoint
         (cause == 4'b1101 && memory[12][3]));  // Trap

    assign status = memory[12];
    assign epc_out = memory[14];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            memory[12] <= 32'h0000000f; // Status register
            memory[13] <= 32'h0; // Cause register
            memory[14] <= 32'h0; // EPC register
            in_exception <= 1'b0;
        end else begin
            if (valid_exception && !in_exception) begin
                memory[12] <= {memory[12][26:0], 5'b0}; // Shift Status left
                memory[13][6:2] <= cause; // Update Cause
                memory[14] <= pc - 32'h4; // Save PC to EPC
                in_exception <= 1'b1;
            end else if (eret) begin
                memory[12] <= {5'b0, memory[12][31:5]}; // Shift Status right
                in_exception <= 1'b0;
            end

            if (mtc0) begin
                memory[addr] <= data;
            end

            if (mfc0) begin
                CP0_out <= memory[addr];
            end
        end
    end

endmodule