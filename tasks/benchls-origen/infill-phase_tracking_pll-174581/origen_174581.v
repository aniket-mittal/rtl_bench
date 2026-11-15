module origen_174581 #(
    parameter PHASE_BITS = 16,
    parameter OPT_TRACK_FREQUENCY = 1,
    parameter INITIAL_PHASE_STEP = 1
)(
    input  wire         clk,
    input  wire         nrst,
    input  wire         swiptAlive,
    input  wire         pll_in,
    input  wire         load_freq,
    input  wire [15:0]  freq,
    input  wire [3:0]   lgcoefficient,
    output reg  [PHASE_BITS-1:0] phase,
    output reg  [1:0]   error
);

    reg [PHASE_BITS-1:0] ctr;
    reg [15:0] freq_step;
    wire agreed_output;

    initial begin
        ctr = 0;
        freq_step = INITIAL_PHASE_STEP;
    end

    [MASKED]

    assign agreed_output = (ctr[PHASE_BITS-1] == pll_in);
    assign phase = ctr;

endmodule