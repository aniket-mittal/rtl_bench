module origen_059498 (
    input wire rst,
    input wire cs,
    input wire clk,
    input wire done_collide,
    output reg rstOut
);

    // FSM state definition
    localparam STATE_RESET_DEASSERTED = 1'b0;
    localparam STATE_RESET_ASSERTED = 1'b1;

    reg state;

    // Unused registers
    reg [3:0] counter;
    reg [3:0] counter2;
    reg flagRst;
    reg flagRst2;

    // FSM state transition and output logic
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= STATE_RESET_ASSERTED;
            rstOut <= 1'b1;
        end else begin
            case (state)
                STATE_RESET_DEASSERTED: begin
                    if (cs) begin
                        state <= STATE_RESET_ASSERTED;
                        rstOut <= 1'b1;
                    end else begin
                        state <= STATE_RESET_DEASSERTED;
                        rstOut <= 1'b0;
                    end
                end
                STATE_RESET_ASSERTED: begin
                    if (cs) begin
                        state <= STATE_RESET_DEASSERTED;
                        rstOut <= 1'b0;
                    end else begin
                        state <= STATE_RESET_ASSERTED;
                        rstOut <= 1'b1;
                    end
                end
                default: begin
                    state <= STATE_RESET_ASSERTED;
                    rstOut <= 1'b1;
                end
            endcase
        end
    end

endmodule