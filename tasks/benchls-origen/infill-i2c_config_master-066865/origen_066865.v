module origen_066865(
    input wire reset,
    input wire clk2,
    input wire sda,
    input wire clk1,
    input wire [15:0] data,
    output reg [7:0] reg_address,
    output reg sda_w,
    output reg ctrl_h
);

    reg [2:0] fsm;
    reg [4:0] add_con;
    reg [7:0] address_ba;
    reg [1:0] mode;
    reg sda_r;

    [MASKED]

endmodule