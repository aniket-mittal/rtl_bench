module origen_053154 #(
    parameter TX_DATA_WIDTH = 64
) (
    input [TX_DATA_WIDTH-1:0] data_in_rx_uns,
    input [TX_DATA_WIDTH-1:0] data_in,
    input enable,
    input [1:0] sync_info,
    input clk,
    input rst,
    input blocksync_out,
    input valid_frame,
    input [57:0] ber_poly,
    output reg [TX_DATA_WIDTH+1:0] data_out,
    output reg ber_sync,
    output reg sync_init
);

    reg [57:0] scrambler;
    reg [TX_DATA_WIDTH-1:0] tempData;
    wire [57:0] poly;
    wire xorBit;

    assign poly = {scrambler[56:0], xorBit};
    assign xorBit = scrambler[57] ^ scrambler[38] ^ data_in[TX_DATA_WIDTH-1];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            scrambler <= {58{1'b1}};
            ber_sync <= 1'b0;
            sync_init <= 1'b0;
        end else if (enable) begin
            if (valid_frame && blocksync_out) begin
                if (!ber_sync) begin
                    scrambler <= scrambler ^ ber_poly;
                    ber_sync <= 1'b1;
                    sync_init <= 1'b1;
                end else begin
                    scrambler <= poly;
                end
            end else begin
                ber_sync <= 1'b0;
                sync_init <= 1'b0;
            end
        end
    end

    always @(posedge clk) begin
        if (enable) begin
            tempData <= {xorBit, tempData[TX_DATA_WIDTH-1:1]};
            data_out <= {tempData ^ data_in, sync_info};
        end
    end

endmodule