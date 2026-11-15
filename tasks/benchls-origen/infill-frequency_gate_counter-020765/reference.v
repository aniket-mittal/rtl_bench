module origen_020765 #(
    parameter CLK_FS = 50_000_000,
    parameter GATE_CLK_CNT = 5000
)(
    input wire clk_fs,
    input wire rst_n,
    input wire clk_fx,
    output reg [19:0] data_fx
);

    reg [12:0] gata_cnt;
    reg gata, gata_fx1, gata_fx2, gata_fs1, gata_fs2;
    reg [12:0] gata_fx_cnt, gata_fs_cnt;
    reg gata_fx_neg, gata_fs_neg;
    reg [19:0] data_fx_temp;

    // Gate signal generation
    always @(posedge clk_fs or negedge rst_n) begin
        if (!rst_n) begin
            gata_cnt <= 13'd0;
            gata <= 1'b0;
        end else begin
            if (gata_cnt == GATE_CLK_CNT - 1) begin
                gata_cnt <= 13'd0;
                gata <= ~gata;
            end else begin
                gata_cnt <= gata_cnt + 1'b1;
            end
        end
    end

    // Synchronization and edge detection for clk_fx domain
    always @(posedge clk_fx or negedge rst_n) begin
        if (!rst_n) begin
            gata_fx1 <= 1'b0;
            gata_fx2 <= 1'b0;
            gata_fx_neg <= 1'b0;
        end else begin
            gata_fx1 <= gata;
            gata_fx2 <= gata_fx1;
            gata_fx_neg <= gata_fx2 & ~gata_fx1;
        end
    end

    // Synchronization and edge detection for clk_fs domain
    always @(posedge clk_fs or negedge rst_n) begin
        if (!rst_n) begin
            gata_fs1 <= 1'b0;
            gata_fs2 <= 1'b0;
            gata_fs_neg <= 1'b0;
        end else begin
            gata_fs1 <= gata;
            gata_fs2 <= gata_fs1;
            gata_fs_neg <= gata_fs2 & ~gata_fs1;
        end
    end

    // Counter for clk_fx domain
    always @(posedge clk_fx or negedge rst_n) begin
        if (!rst_n) begin
            gata_fx_cnt <= 13'd0;
        end else begin
            if (gata_fx_neg) begin
                gata_fx_cnt <= 13'd0;
            end else if (gata_fx2) begin
                gata_fx_cnt <= gata_fx_cnt + 1'b1;
            end
        end
    end

    // Counter for clk_fs domain
    always @(posedge clk_fs or negedge rst_n) begin
        if (!rst_n) begin
            gata_fs_cnt <= 13'd0;
        end else begin
            if (gata_fs_neg) begin
                gata_fs_cnt <= 13'd0;
            end else if (gata_fs2) begin
                gata_fs_cnt <= gata_fs_cnt + 1'b1;
            end
        end
    end

    // Frequency calculation
    always @(posedge clk_fs or negedge rst_n) begin
        if (!rst_n) begin
            data_fx_temp <= 20'd0;
            data_fx <= 20'd0;
        end else begin
            if (gata_fs_neg) begin
                data_fx_temp <= (CLK_FS / gata_fs_cnt) * gata_fx_cnt;
                data_fx <= data_fx_temp;
            end
        end
    end

endmodule