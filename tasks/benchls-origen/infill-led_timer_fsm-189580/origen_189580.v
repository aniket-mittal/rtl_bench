module origen_189580 (
    input Sensor_Sync,
    input WR,
    input Prog_Sync,
    input Reset_Sync,
    input expired,
    input clk,
    output reg WR_Reset,
    output reg [6:0] LEDs,
    output reg [1:0] interval,
    output reg start_timer
);

    localparam tb = 2'b00;
    localparam te = 2'b01;
    localparam ty = 2'b10;
    localparam tbx2 = 2'b11;

    localparam A = 7'b0000001;
    localparam B = 7'b0000010;
    localparam C = 7'b0000100;
    localparam D = 7'b0001000;
    localparam E = 7'b0010000;

    reg [1:0] state;
    reg deviate;
    reg senseOneTime;

    [MASKED]

endmodule