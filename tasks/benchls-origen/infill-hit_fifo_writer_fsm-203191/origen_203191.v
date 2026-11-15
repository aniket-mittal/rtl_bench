module origen_203191 (
    input fifo_comb_empty,
    input [4:0] fifo_comb_hitmap,
    input fifo_comb_ee,
    input fifo_comb_valid,
    input fifo_comb45_hfull,
    input clock,
    input reset,

    output reg [2:0] hitmux_sel,
    output reg fifo_comb45_we,
    output reg fifo_comb_re,
    output reg is_45,
    output reg invalid_data
);

    localparam WAIT = 3'b000,
              WRITE_1 = 3'b001,
              WRITE_2 = 3'b010,
              WRITE_3 = 3'b011,
              WRITE_4 = 3'b100,
              WRITE_5 = 3'b101;

    reg [2:0] current_state, next_state;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            current_state <= WAIT;
        end else begin
            current_state <= next_state;
        end
    end

    [MASKED]

endmodule