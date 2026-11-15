module origen_089953(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input [11:0] background,
    input [11:0] axes,
    input [11:0] grid,
    input [11:0] ticks,
    output reg [3:0] VGA_Red_Grid,
    output reg [3:0] VGA_Green_Grid,
    output reg [3:0] VGA_Blue_Grid
);

    wire Condition_For_Axes, Condition_For_Ticks, Condition_For_SmallT, Condition_For_Grid;
    
    assign Condition_For_Axes = (VGA_HORZ_COORD == 640) || (VGA_VERT_COORD == 512);
    assign Condition_For_Ticks = ((VGA_HORZ_COORD % 64 == 0) && (VGA_VERT_COORD >= 507 && VGA_VERT_COORD <= 517)) ||
                                 ((VGA_VERT_COORD % 64 == 0) && (VGA_HORZ_COORD >= 635 && VGA_HORZ_COORD <= 645));
    assign Condition_For_SmallT = ((VGA_HORZ_COORD % 32 == 0) && (VGA_VERT_COORD >= 509 && VGA_VERT_COORD <= 515)) ||
                                  ((VGA_VERT_COORD % 32 == 0) && (VGA_HORZ_COORD >= 637 && VGA_HORZ_COORD <= 643));
    assign Condition_For_Grid = (VGA_HORZ_COORD % 32 == 0) || (VGA_VERT_COORD % 32 == 0);

    wire [3:0] background_red, background_green, background_blue;
    wire [3:0] axes_red, axes_green, axes_blue;
    wire [3:0] grid_red, grid_green, grid_blue;
    wire [3:0] ticks_red, ticks_green, ticks_blue;

    assign {background_red, background_green, background_blue} = background;
    assign {axes_red, axes_green, axes_blue} = axes;
    assign {grid_red, grid_green, grid_blue} = grid;
    assign {ticks_red, ticks_green, ticks_blue} = ticks;

    [MASKED]

endmodule