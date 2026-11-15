module origen_042950(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] data,
    output reg [15:0] o_min,
    output reg [15:0] o_max
);

    reg [15:0] dt_table [0:15];
    reg [3:0] cnt;
    reg state;
    reg [15:0] min, max;

    [MASKED]

endmodule