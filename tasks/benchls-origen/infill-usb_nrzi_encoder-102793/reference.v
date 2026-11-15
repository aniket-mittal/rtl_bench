module origen_102793 (
    input wire clk,
    input wire n_rst,
    input wire shift_enable,
    input wire serial_out,
    input wire crc_out,
    input wire load_eop,
    input wire load_crc1,
    input wire load_crc2,
    input wire pause,
    input wire complete,
    output reg dplus_out,
    output reg dminus_out
);

    reg next_dplus, next_dminus;

    always @(posedge clk or negedge n_rst) begin
        if (~n_rst) begin
            dplus_out <= 1'b1;
            dminus_out <= 1'b0;
        end else begin
            dplus_out <= next_dplus;
            dminus_out <= next_dminus;
        end
    end

    always @* begin
        next_dplus = dplus_out;
        next_dminus = dminus_out;

        if (shift_enable) begin
            if (load_eop) begin
                next_dplus = 1'b0;
                next_dminus = 1'b0;
            end else if (complete) begin
                next_dplus = 1'b1;
                next_dminus = 1'b0;
            end else if (pause) begin
                next_dplus = ~dplus_out;
                next_dminus = ~dminus_out;
            end else if (load_crc1 || load_crc2) begin
                if (~crc_out) begin
                    next_dplus = ~dplus_out;
                    next_dminus = ~dminus_out;
                end
            end else if (~serial_out) begin
                next_dplus = ~dplus_out;
                next_dminus = ~dminus_out;
            end
        end
    end

endmodule