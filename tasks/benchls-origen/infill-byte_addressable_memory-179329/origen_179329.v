module origen_179329(
    input clk,
    input MemRead,
    input MemWrite,
    input [7:0] addr,
    input [2:0] funct3,
    input [31:0] data_in,
    output reg [31:0] data_out
);

    reg [7:0] mem [0:255];

    initial begin
        // Initialize the memory contents
        mem[0] = 8'h11;
        mem[1] = 8'h22;
        mem[2] = 8'h33;
        mem[3] = 8'h44;
        // Add more initial values as needed
    end

    [MASKED]

endmodule