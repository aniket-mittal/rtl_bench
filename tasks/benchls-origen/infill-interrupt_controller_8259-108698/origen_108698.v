module origen_108698 (
    input wire clk,
    input wire ce,
    input wire reset,
    input wire cs,
    input wire wr,
    input wire rd,
    input wire a0,
    input wire [7:0] din,
    input wire [7:0] intp,
    output reg int_req,
    input wire int_ack,
    output reg [8:0] int_vector
);

// Configuration registers
reg [7:0] IW1, IW2, IW3, IW4;
reg [7:0] IMW, PFCW, MCW;

// Interrupt registers
reg [7:0] IRR, ISR;
reg [7:0] prev_intp;

// Initialization state machine
reg [2:0] init_state;
localparam UNINIT = 3'd0, INIT_IW2 = 3'd1, INIT_IW3 = 3'd2, INIT_IW4 = 3'd3, INIT_DONE = 3'd4;

// Operating mode flags
wire single_mode, level_triggered, addr_gap_8;
assign single_mode = IW1[1];
assign level_triggered = IW1[3];
assign addr_gap_8 = IW1[2];

[MASKED]

endmodule