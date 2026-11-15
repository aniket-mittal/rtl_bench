module origen_210087(
    input [4:0] state,
    input is_modify,
    input i_plus,
    input i_minus,
    input i_enable,
    input i_clk_0_001s,
    output reg o_enable,
    output reg [14:0] o_month
);

    reg r_enable;
    reg r_enable_falling;
    reg r_plus;
    reg r_plus_falling;
    reg r_minus;
    reg r_minus_falling;

    always @(posedge i_clk_0_001s) begin
        r_enable <= i_enable;
        r_enable_falling <= r_enable & ~i_enable;
        r_plus <= i_plus;
        r_plus_falling <= r_plus & ~i_plus;
        r_minus <= i_minus;
        r_minus_falling <= r_minus & ~i_minus;
    end

    initial begin
        o_month <= 15'h0005; // May
        o_enable <= 1'b0;
    end

    always @(posedge i_clk_0_001s) begin
        if (r_enable_falling) begin
            if (o_month == 15'h000C) begin // December
                o_month <= 15'h0000; // January
                o_enable <= 1'b1;
            end else begin
                o_month <= o_month + 15'h0001;
                o_enable <= 1'b0;
            end
        end else if (r_minus_falling && is_modify && (state == 5)) begin
            o_month <= (o_month == 15'h0000) ? 15'h000C : o_month - 15'h0001; // Decrement with wrap-around
            o_enable <= 1'b0;
        end else if (r_plus_falling && is_modify && (state == 5)) begin
            o_month <= (o_month == 15'h000C) ? 15'h0000 : o_month + 15'h0001; // Increment with wrap-around
            o_enable <= 1'b0;
        end else begin
            o_enable <= 1'b0;
        end
    end

endmodule