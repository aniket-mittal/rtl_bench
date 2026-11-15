module origen_168719 #(
    parameter OUTPUT_BIT = 8
)(
    input  wire             i_clk,
    input  wire             i_rst_n,
    input  wire [31:0]      i_freq_cnt,
    input  wire [OUTPUT_BIT-1:0] i_amp_H,
    input  wire [OUTPUT_BIT-1:0] i_amp_L,
    output reg  [OUTPUT_BIT-1:0] o_mod_out,
    output reg              o_status
);

reg [31:0] freq_cnt;
reg        SM;

always @(posedge i_clk or negedge i_rst_n) begin
    if (~i_rst_n) begin
        o_mod_out <= {OUTPUT_BIT{1'b0}};
        o_status <= 1'b0;
        SM <= 1'b0;
        freq_cnt <= 32'd125;
    end
    else begin
        case (SM)
            1'b0: begin // LOW state
                o_status <= 1'b0;
                o_mod_out <= i_amp_L;
                if (freq_cnt == 32'd1) begin
                    SM <= 1'b1;
                    freq_cnt <= i_freq_cnt;
                end
                else begin
                    freq_cnt <= freq_cnt - 32'd1;
                end
            end
            1'b1: begin // HIGH state
                o_status <= 1'b1;
                o_mod_out <= i_amp_H;
                if (freq_cnt == 32'd1) begin
                    SM <= 1'b0;
                    freq_cnt <= i_freq_cnt;
                end
                else begin
                    freq_cnt <= freq_cnt - 32'd1;
                end
            end
        endcase
    end
end

endmodule