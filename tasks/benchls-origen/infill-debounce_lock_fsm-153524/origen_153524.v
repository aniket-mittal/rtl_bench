module origen_153524(
    input clk,
    input reset,
    input sig_in,
    input unlock,
    input [31:0] timeout,
    output reg sig_out,
    output reg sig_changed,
    output reg [7:0] cycles
);

// Debouncing state machine
localparam DSTATE_STABLE = 2'b00, DSTATE_BOUNCE1 = 2'b01, DSTATE_BOUNCE2 = 2'b10;
reg [1:0] dstate, next_dstate;

// Debounced output state machine
localparam STATE_UNLOCKED = 1'b0, STATE_LOCKED = 1'b1;
reg state, next_state;

// Internal signals
reg sig_in_reg, next_sig_in_reg;
reg [31:0] count, next_count;
reg sig_changed_d, next_sig_changed_d;
reg [7:0] cycles_d, next_cycles_d;
reg sig_out_d, next_sig_out_d;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dstate <= DSTATE_STABLE;
        state <= STATE_UNLOCKED;
        sig_in_reg <= 1'b0;
        count <= 32'b0;
        sig_changed_d <= 1'b0;
        cycles_d <= 8'b0;
        sig_out_d <= 1'b0;
    end else begin
        dstate <= next_dstate;
        state <= next_state;
        sig_in_reg <= next_sig_in_reg;
        count <= next_count;
        sig_changed_d <= next_sig_changed_d;
        cycles_d <= next_cycles_d;
        sig_out_d <= next_sig_out_d;
    end
end

[MASKED]

// Assign outputs
assign sig_out = sig_out_d;
assign sig_changed = sig_changed_d;
assign cycles = cycles_d;

endmodule