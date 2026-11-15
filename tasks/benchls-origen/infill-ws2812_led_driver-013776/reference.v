module origen_013776 (
    input wire clk,
    input wire rst_n,
    input wire tx_done,
    output reg tx_en,
    output reg [23:0] RGB
);

    reg [31:0] cnt;
    reg [23:0] RGB_reg [4:0];
    reg [3:0] k;
    reg tx_en_r;
    reg tx_done_r0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 32'd0;
            k <= 4'd0;
            tx_en_r <= 1'b0;
            tx_done_r0 <= 1'b0;
            RGB <= 24'd0;
            RGB_reg[0] <= 24'hFF0000;
            RGB_reg[1] <= 24'h00FF00;
            RGB_reg[2] <= 24'h0000FF;
            RGB_reg[3] <= 24'hFFFF00;
            RGB_reg[4] <= 24'h00FFFF;
        end else begin
            tx_done_r0 <= tx_done;

            if (cnt < 32'd14999) begin
                cnt <= cnt + 1'b1;
            end

            if (cnt == 32'd14999 && tx_done) begin
                tx_en_r <= 1'b1;
            end

            if (tx_en_r && !tx_done_r0 && tx_done) begin
                RGB <= RGB_reg[k];
                if (k == 4'd4) begin
                    k <= 4'd0;
                    tx_en_r <= 1'b0;
                end else begin
                    k <= k + 1'b1;
                end
                cnt <= 32'd0;
            end
        end
    end

    always @(*) begin
        tx_en = tx_en_r;
    end

endmodule