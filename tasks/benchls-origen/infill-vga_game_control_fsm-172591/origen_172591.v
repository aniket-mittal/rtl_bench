module origen_172591 (
    input clk,
    input reset_n,
    input start,
    output reg move_en,
    output reg load_coord,
    output reg datapath_en,
    output reg plot,
    output reg reset_n_out,
    output reg [1:0] op
);

    // States
    localparam S_START = 3'b000;
    localparam S_START_WAIT = 3'b001;
    localparam S_RESET = 3'b010;
    localparam S_ERASE = 3'b011;
    localparam S_WAIT = 3'b100;
    localparam S_CHECK_OVER = 3'b101;
    localparam S_GAME_OVER = 3'b110;
    localparam S_DRAW = 3'b111;
    localparam S_LOAD_COORD = 4'b1000;

    reg [3:0] state;
    reg done;
    reg go;

    [MASKED]

endmodule