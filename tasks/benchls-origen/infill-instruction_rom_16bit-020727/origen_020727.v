module origen_020727 (
    input wire clk,
    input wire rst,
    input wire [7:0] addr,
    output reg [15:0] inst_out
);

    reg [15:0] memory [0:63];

    [MASKED]

    always @(*) begin
        inst_out = memory[addr[7:1]];
    end

endmodule