module origen_166722 #(
    parameter FREQ_IN = 100,  // Input clock frequency in MHz
    parameter FREQ_OUT = 1    // Desired output clock frequency in MHz
)(
    input  wire clk_in,
    input  wire rst,
    output reg  clk_out
);

    // Calculate internal parameters
    localparam DIV_RATE = FREQ_IN / FREQ_OUT;
    localparam COMPENSATION = (FREQ_IN % FREQ_OUT) * DIV_RATE / FREQ_OUT;

    // Internal signals
    reg [31:0] count_ff;
    reg [31:0] count_nxt;
    reg        clk_out_ff;
    reg        clk_out_nxt;
    reg [31:0] compensation_ff;
    reg [31:0] compensation_nxt;

    // Combinational logic
    always @* begin
        count_nxt = count_ff + 1;
        if (count_nxt >= DIV_RATE) begin
            count_nxt = 0;
            clk_out_nxt = ~clk_out_ff;
            compensation_nxt = compensation_ff + 1;
            if (compensation_nxt >= COMPENSATION) begin
                compensation_nxt = 0;
            end
        end else begin
            clk_out_nxt = clk_out_ff;
            compensation_nxt = compensation_ff;
        end
    end

    // Sequential logic
    [MASKED]

    // Output assignment
    assign clk_out = clk_out_ff;

endmodule