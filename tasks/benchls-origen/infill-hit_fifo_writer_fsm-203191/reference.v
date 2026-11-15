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

    always @(*) begin
        next_state = current_state;
        case (current_state)
            WAIT: begin
                fifo_comb_re = 0;
                fifo_comb45_we = 0;
                is_45 = 0;
                invalid_data = 0;
                if (!fifo_comb_empty && !fifo_comb45_hfull && fifo_comb_ee && fifo_comb_valid) begin
                    next_state = WRITE_1;
                end
            end
            WRITE_1: begin
                fifo_comb_re = 1;
                fifo_comb45_we = 1;
                hitmux_sel = 3'b000;
                is_45 = 1;
                invalid_data = 0;
                next_state = WRITE_2;
            end
            WRITE_2: begin
                fifo_comb_re = 1;
                fifo_comb45_we = 1;
                hitmux_sel = 3'b001;
                is_45 = 1;
                invalid_data = 0;
                next_state = WRITE_3;
            end
            WRITE_3: begin
                fifo_comb_re = 1;
                fifo_comb45_we = 1;
                hitmux_sel = 3'b010;
                is_45 = 1;
                invalid_data = 0;
                next_state = WRITE_4;
            end
            WRITE_4: begin
                fifo_comb_re = 1;
                fifo_comb45_we = 1;
                hitmux_sel = 3'b011;
                is_45 = 1;
                invalid_data = 0;
                next_state = WRITE_5;
            end
            WRITE_5: begin
                fifo_comb_re = 1;
                fifo_comb45_we = 1;
                hitmux_sel = 3'b100;
                is_45 = 1;
                invalid_data = 0;
                next_state = WAIT;
            end
            default: begin
                fifo_comb_re = 0;
                fifo_comb45_we = 0;
                is_45 = 0;
                invalid_data = 1;
                next_state = WAIT;
            end
        endcase
    end

endmodule