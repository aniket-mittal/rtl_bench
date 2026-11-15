module origen_046805 #(
    parameter CLKCOUNT = 200,
    parameter XGMIICOUNT = 200
) (
    input wire clk,
    input wire rst_n,
    input wire xgmii_clk,
    output reg ready
);

    // Main clock domain
    reg [7:0] clk_count;
    reg clk_ready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_count <= 8'd0;
            clk_ready <= 1'b0;
        end else begin
            if (!clk_ready) begin
                if (clk_count < CLKCOUNT) begin
                    clk_count <= clk_count + 1'b1;
                end else begin
                    clk_ready <= 1'b1;
                end
            end
        end
    end

    // XGMII clock domain
    reg [7:0] xgmii_count;
    reg clk_ready_xgmii, clk_ready_xgmii_meta;

    always @(posedge xgmii_clk or negedge rst_n) begin
        if (!rst_n) begin
            xgmii_count <= 8'd0;
            ready <= 1'b0;
            clk_ready_xgmii <= 1'b0;
            clk_ready_xgmii_meta <= 1'b0;
        end else begin
            // Synchronize clk_ready to xgmii_clk domain
            clk_ready_xgmii_meta <= clk_ready;
            clk_ready_xgmii <= clk_ready_xgmii_meta;

            if (clk_ready_xgmii && !ready) begin
                if (xgmii_count < XGMIICOUNT) begin
                    xgmii_count <= xgmii_count + 1'b1;
                end else begin
                    ready <= 1'b1;
                end
            end
        end
    end

endmodule