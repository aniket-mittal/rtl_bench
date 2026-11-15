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

    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            ctr <= 0;
            freq_step <= INITIAL_PHASE_STEP;
            error <= 2'b00;
        end else if (swiptAlive) begin
            // Phase and frequency tracking
            if (pll_in ^ ctr[PHASE_BITS-1]) begin
                error <= {1'b1, pll_in ^ ctr[PHASE_BITS-1]};
                ctr <= ctr + {1'b0, {(PHASE_BITS-1){1'b1}}} - ({{(PHASE_BITS-4){1'b0}}, lgcoefficient});
            end else begin
                error <= 2'b00;
                if (OPT_TRACK_FREQUENCY) begin
                    ctr <= ctr + freq_step;
                end else begin
                    ctr <= ctr + 1;
                end
            end

            // Frequency update
            if (load_freq) begin
                freq_step <= freq;
            end
        end
    end

    assign agreed_output = (ctr[PHASE_BITS-1] == pll_in);
    assign phase = ctr;

endmodule