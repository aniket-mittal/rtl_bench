module origen_053835 (
    input wire clk,
    input wire reset,
    input wire sig_in,
    input wire unlock,
    input wire [31:0] timeout,
    output reg sig_out,
    output reg sig_changed,
    output reg [7:0] cycles
);

    // State definitions
    localparam DSTATE_STABLE = 2'd0;
    localparam DSTATE_BOUNCE1 = 2'd1;
    localparam DSTATE_BOUNCE2 = 2'd2;
    
    localparam STATE_UNLOCKED = 1'b0;
    localparam STATE_LOCKED = 1'b1;

    // Internal signals
    reg [1:0] sig_meta;
    reg [1:0] dstate;
    reg lock_state;
    reg [15:0] timer;
    reg debounced_sig;
    reg prev_debounced_sig;

    // Combinational logic
    wire timeout_reached = (timer >= timeout[15:0]);
    wire sig_in_sync = sig_meta[1];

    // Sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sig_meta <= 2'b00;
            dstate <= DSTATE_STABLE;
            lock_state <= STATE_UNLOCKED;
            timer <= 16'd0;
            debounced_sig <= 1'b0;
            prev_debounced_sig <= 1'b0;
            sig_out <= 1'b0;
            sig_changed <= 1'b0;
            cycles <= 8'd0;
        end else begin
            // Double-buffering for metastability prevention
            sig_meta <= {sig_meta[0], sig_in};

            // Debounce FSM
            case (dstate)
                DSTATE_STABLE: begin
                    if (sig_in_sync != debounced_sig) begin
                        dstate <= DSTATE_BOUNCE1;
                        timer <= 16'd0;
                    end
                end
                DSTATE_BOUNCE1: begin
                    if (sig_in_sync == debounced_sig) begin
                        dstate <= DSTATE_STABLE;
                    end else if (timeout_reached) begin
                        dstate <= DSTATE_BOUNCE2;
                        timer <= 16'd0;
                    end else begin
                        timer <= timer + 1'b1;
                    end
                end
                DSTATE_BOUNCE2: begin
                    if (sig_in_sync != debounced_sig) begin
                        dstate <= DSTATE_BOUNCE1;
                        timer <= 16'd0;
                    end else if (timeout_reached) begin
                        dstate <= DSTATE_STABLE;
                        debounced_sig <= sig_in_sync;
                    end else begin
                        timer <= timer + 1'b1;
                    end
                end
            endcase

            // Lock FSM
            case (lock_state)
                STATE_UNLOCKED: begin
                    if (debounced_sig != prev_debounced_sig) begin
                        sig_out <= debounced_sig;
                        sig_changed <= 1'b1;
                        cycles <= cycles + 1'b1;
                    end else begin
                        sig_changed <= 1'b0;
                    end
                    if (sig_changed) lock_state <= STATE_LOCKED;
                end
                STATE_LOCKED: begin
                    sig_changed <= 1'b0;
                    if (debounced_sig != prev_debounced_sig) begin
                        cycles <= cycles + 1'b1;
                    end
                    if (unlock) begin
                        lock_state <= STATE_UNLOCKED;
                        sig_out <= debounced_sig;
                    end
                end
            endcase

            prev_debounced_sig <= debounced_sig;
        end
    end

endmodule