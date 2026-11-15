module origen_016073 (
    input wire clk,
    input wire rst,
    output reg [13:0] block_addr,
    output reg [5:0] block_data,
    output reg block_we
);

    reg [13:0] addr_counter;
    reg [2:0] state;

    localparam IDLE = 3'b000;
    localparam INIT = 3'b001;
    localparam WRITE = 3'b010;
    localparam DONE = 3'b011;

    [MASKED]

endmodule