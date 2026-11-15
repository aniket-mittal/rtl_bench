module origen_065596 (
    input wire i_pxlclk,
    input wire i_serclk,
    input wire i_rstn,
    input wire [9:0] i_enc_b,
    input wire [9:0] i_enc_g,
    input wire [9:0] i_enc_r,
    output reg [2:0] o_ser_re,
    output reg [2:0] o_ser_fe
);

    reg [9:0] r_pxlclk_b, r_pxlclk_g, r_pxlclk_r;
    reg [9:0] r_serclk_b, r_serclk_g, r_serclk_r;
    reg [2:0] r_bit_cnt;

    // Pixel clock domain
    always @(posedge i_pxlclk or negedge i_rstn) begin
        if (!i_rstn) begin
            r_pxlclk_b <= 10'b0;
            r_pxlclk_g <= 10'b0;
            r_pxlclk_r <= 10'b0;
        end else begin
            r_pxlclk_b <= i_enc_b;
            r_pxlclk_g <= i_enc_g;
            r_pxlclk_r <= i_enc_r;
        end
    end

    // Serializer clock domain
    always @(posedge i_serclk or negedge i_rstn) begin
        if (!i_rstn) begin
            r_serclk_b <= 10'b0;
            r_serclk_g <= 10'b0;
            r_serclk_r <= 10'b0;
            r_bit_cnt <= 3'b0;
            o_ser_re <= 3'b0;
            o_ser_fe <= 3'b0;
        end else begin
            r_bit_cnt <= (r_bit_cnt == 3'd4) ? 3'd0 : r_bit_cnt + 1'b1;

            if (r_bit_cnt == 3'd4) begin
                r_serclk_b <= r_pxlclk_b;
                r_serclk_g <= r_pxlclk_g;
                r_serclk_r <= r_pxlclk_r;
            end

            o_ser_re[0] <= r_serclk_b[r_bit_cnt*2];
            o_ser_re[1] <= r_serclk_g[r_bit_cnt*2];
            o_ser_re[2] <= r_serclk_r[r_bit_cnt*2];

            o_ser_fe[0] <= r_serclk_b[r_bit_cnt*2+1];
            o_ser_fe[1] <= r_serclk_g[r_bit_cnt*2+1];
            o_ser_fe[2] <= r_serclk_r[r_bit_cnt*2+1];
        end
    end

endmodule