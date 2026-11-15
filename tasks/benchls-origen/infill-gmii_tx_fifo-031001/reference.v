module origen_031001 (
    input wire clk_gmii_2x,
    input wire mac_clk_tx,
    input wire resetn_tx,
    input wire gmii_mode,
    input wire [7:0] txd_in,
    input wire txen_in,
    output reg [7:0] txd_out,
    output reg txen_out,
    output wire txer_out
);

    reg [7:0] tmem [0:3];
    reg [1:0] twadr, tradr;
    reg [1:0] twadr_gray, twadr_gray_sync1, twadr_gray_sync2;
    reg tfifo_wr, tfifo_rd, tfifo_rd_del;
    wire tfifo_empty;
    reg [7:0] txd_reg;
    reg txen_reg;
    reg resetn_tx_sync1, resetn_tx_sync2;

    // Reset synchronization
    always @(posedge clk_gmii_2x or negedge resetn_tx) begin
        if (!resetn_tx) begin
            resetn_tx_sync1 <= 1'b0;
            resetn_tx_sync2 <= 1'b0;
        end else begin
            resetn_tx_sync1 <= 1'b1;
            resetn_tx_sync2 <= resetn_tx_sync1;
        end
    end

    // FIFO write logic
    always @(posedge mac_clk_tx or negedge resetn_tx) begin
        if (!resetn_tx) begin
            twadr <= 2'b00;
            tfifo_wr <= 1'b0;
        end else begin
            if (!gmii_mode && txen_in) begin
                tmem[twadr] <= txd_in;
                twadr <= twadr + 1'b1;
                tfifo_wr <= 1'b1;
            end else begin
                tfifo_wr <= 1'b0;
            end
        end
    end

    // Gray code conversion and synchronization
    always @(posedge mac_clk_tx) begin
        twadr_gray <= twadr ^ (twadr >> 1);
    end

    always @(posedge clk_gmii_2x) begin
        twadr_gray_sync1 <= twadr_gray;
        twadr_gray_sync2 <= twadr_gray_sync1;
    end

    // FIFO empty detection
    assign tfifo_empty = (twadr_gray_sync2 == tradr);

    // FIFO read logic
    always @(posedge clk_gmii_2x or negedge resetn_tx_sync2) begin
        if (!resetn_tx_sync2) begin
            tradr <= 2'b00;
            tfifo_rd <= 1'b0;
            tfifo_rd_del <= 1'b0;
            txd_reg <= 8'h00;
            txen_reg <= 1'b0;
        end else begin
            tfifo_rd_del <= tfifo_rd;
            if (!tfifo_empty && !tfifo_rd) begin
                txd_reg <= tmem[tradr];
                tradr <= tradr + 1'b1;
                tfifo_rd <= 1'b1;
                txen_reg <= 1'b1;
            end else if (tfifo_rd) begin
                tfifo_rd <= 1'b0;
            end else if (tfifo_empty) begin
                txen_reg <= 1'b0;
            end
        end
    end

    // Output logic
    always @(posedge clk_gmii_2x) begin
        if (gmii_mode) begin
            txd_out <= txd_in;
            txen_out <= txen_in;
        end else begin
            if (tfifo_rd_del) begin
                txd_out <= {txd_reg[3:0], txd_reg[3:0]};
            end else if (tfifo_rd) begin
                txd_out <= {txd_reg[7:4], txd_reg[7:4]};
            end else begin
                txd_out <= 8'h00;
            end
            txen_out <= txen_reg;
        end
    end

    assign txer_out = 1'b0;

endmodule