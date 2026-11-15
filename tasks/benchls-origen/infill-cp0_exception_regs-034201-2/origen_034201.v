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

    [MASKED]

endmodule