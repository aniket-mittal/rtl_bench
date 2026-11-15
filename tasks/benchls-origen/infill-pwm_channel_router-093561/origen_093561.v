module origen_093561 (
    input wire clk_control,
    input wire [7:0] control,
    input wire [11:0] data_0, data_1, data_2, data_3,
    input wire en,
    input wire [8:0] addr,
    output reg [11:0] data_out,
    output reg en_0, en_1, en_2, en_3,
    output reg [8:0] addr_0, addr_1, addr_2, addr_3,
    output reg [8:0] freq
);

    reg [11:0] data;

    [MASKED]

endmodule