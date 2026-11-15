module origen_018698 (
    input wire clk_75m,
    input wire host_rst,
    input wire [31:0] cs2phy_data,
    output reg [31:0] phy2cs_data,
    input wire link_up,
    output reg phy2cs_k,
    input wire fsm2phy_k,
    input wire [31:0] rxdata_fis,
    input wire [3:0] rxcharisk,
    output wire [31:0] txdata_fis,
    output wire tx_charisk_fis
);

    reg phy_sync_0001;
    reg phy_sync_0010;
    reg phy_sync_0100;
    reg phy_sync_1000;
    reg phy2cs_k_next;

    // Transmit path
    assign txdata_fis = cs2phy_data;
    assign tx_charisk_fis = fsm2phy_k;

    // Receive path
    always @(posedge clk_75m or posedge host_rst) begin
        if (host_rst) begin
            phy2cs_data <= 32'hb5b5_957c;
            phy_sync_0001 <= 1'b0;
            phy_sync_0010 <= 1'b0;
            phy_sync_0100 <= 1'b0;
            phy_sync_1000 <= 1'b0;
            phy2cs_k <= 1'b0;
        end else begin
            if (!link_up) begin
                phy2cs_data <= 32'hb5b5_957c;
                phy_sync_0001 <= 1'b0;
                phy_sync_0010 <= 1'b0;
                phy_sync_0100 <= 1'b0;
                phy_sync_1000 <= 1'b0;
            end else begin
                case (rxcharisk)
                    4'b0001: begin
                        phy2cs_data <= rxdata_fis;
                        phy_sync_0001 <= 1'b1;
                        phy_sync_0010 <= 1'b0;
                        phy_sync_0100 <= 1'b0;
                        phy_sync_1000 <= 1'b0;
                    end
                    4'b0010: begin
                        phy2cs_data <= {rxdata_fis[23:0], phy2cs_data[31:24]};
                        phy_sync_0001 <= 1'b0;
                        phy_sync_0010 <= 1'b1;
                        phy_sync_0100 <= 1'b0;
                        phy_sync_1000 <= 1'b0;
                    end
                    4'b0100: begin
                        phy2cs_data <= {rxdata_fis[15:0], phy2cs_data[31:16]};
                        phy_sync_0001 <= 1'b0;
                        phy_sync_0010 <= 1'b0;
                        phy_sync_0100 <= 1'b1;
                        phy_sync_1000 <= 1'b0;
                    end
                    4'b1000: begin
                        phy2cs_data <= {rxdata_fis[7:0], phy2cs_data[31:8]};
                        phy_sync_0001 <= 1'b0;
                        phy_sync_0010 <= 1'b0;
                        phy_sync_0100 <= 1'b0;
                        phy_sync_1000 <= 1'b1;
                    end
                    default: begin
                        if (phy_sync_0001)
                            phy2cs_data <= rxdata_fis;
                        else if (phy_sync_0010)
                            phy2cs_data <= {rxdata_fis[23:0], phy2cs_data[31:24]};
                        else if (phy_sync_0100)
                            phy2cs_data <= {rxdata_fis[15:0], phy2cs_data[31:16]};
                        else if (phy_sync_1000)
                            phy2cs_data <= {rxdata_fis[7:0], phy2cs_data[31:8]};
                    end
                endcase
            end

            phy2cs_k <= phy2cs_k_next;
        end
    end

    // K-character handling
    always @(*) begin
        if (rxcharisk[0])
            phy2cs_k_next = 1'b1;
        else if (|rxcharisk[3:1])
            phy2cs_k_next = 1'b1;
        else
            phy2cs_k_next = 1'b0;
    end

endmodule