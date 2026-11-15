module origen_092723 #(
    parameter CHOP_DLAY = 3,
    parameter HOLD_SAMPLES = 3
) (
    input wire clk,
    input wire chop_en,
    input wire chop_default,
    input wire [15:0] change_count,
    input wire [15:0] max_count,
    output wire chop_o,
    output wire chop_dly_o,
    output wire data_hold_o
);

    reg [15:0] chop_counter_r;
    reg chop_r;
    reg hold_r;
    reg [CHOP_DLAY-1:0] chop_dly_r;
    reg [CHOP_DLAY-1:0] hold_dly_r;

    always @(negedge clk) begin
        if (!chop_en) begin
            chop_counter_r <= 16'd0;
            chop_r <= chop_default;
            hold_r <= 1'b0;
        end else begin
            if (chop_counter_r == max_count - 1) begin
                chop_counter_r <= 16'd0;
                chop_r <= chop_default;
                hold_r <= 1'b1;
            end else begin
                chop_counter_r <= chop_counter_r + 1'b1;
                
                if (chop_counter_r == change_count - 1) begin
                    chop_r <= !chop_default;
                    hold_r <= 1'b1;
                end else if (chop_counter_r == change_count + HOLD_SAMPLES - 1) begin
                    hold_r <= 1'b0;
                end else if (chop_counter_r == HOLD_SAMPLES - 1) begin
                    hold_r <= 1'b0;
                end
            end
        end
    end

    always @(negedge clk) begin
        chop_dly_r <= {chop_dly_r[CHOP_DLAY-2:0], chop_r};
        hold_dly_r <= {hold_dly_r[CHOP_DLAY-2:0], hold_r};
    end

    assign chop_o = chop_r;
    assign chop_dly_o = chop_dly_r[CHOP_DLAY-1];
    assign data_hold_o = hold_dly_r[CHOP_DLAY-1];

endmodule