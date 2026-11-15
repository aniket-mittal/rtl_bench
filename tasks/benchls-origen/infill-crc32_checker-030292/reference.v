module origen_030292 #(
    parameter CRC_WIDTH = 32
) (
    input wire CLK,
    input wire RESET_N,
    input wire PKT_CRC_VALID_IN,
    input wire [CRC_WIDTH-1:0] PKT_CRC_CHECKSUM_IN,
    input wire CRC_GEN_VALID_IN,
    input wire [CRC_WIDTH-1:0] CRC_GEN_CHECKSUM_IN,
    output reg CRC_CHK_VALID_OUT,
    output reg CRC_CHK_BAD_STATUS_OUT
);

    reg pkt_crc_ready;
    reg crc_gen_ready;
    reg [CRC_WIDTH-1:0] pkt_crc_checksum;
    reg [CRC_WIDTH-1:0] crc_gen_checksum;

    always @(posedge CLK or negedge RESET_N) begin
        if (!RESET_N) begin
            pkt_crc_ready <= 1'b0;
            crc_gen_ready <= 1'b0;
            pkt_crc_checksum <= {CRC_WIDTH{1'b0}};
            crc_gen_checksum <= {CRC_WIDTH{1'b0}};
            CRC_CHK_VALID_OUT <= 1'b0;
            CRC_CHK_BAD_STATUS_OUT <= 1'b0;
        end else begin
            // Handle packet CRC input
            if (PKT_CRC_VALID_IN) begin
                pkt_crc_ready <= 1'b1;
                pkt_crc_checksum <= PKT_CRC_CHECKSUM_IN;
            end

            // Handle generated CRC input
            if (CRC_GEN_VALID_IN) begin
                crc_gen_ready <= 1'b1;
                crc_gen_checksum <= CRC_GEN_CHECKSUM_IN;
            end

            // Perform comparison when both CRCs are ready
            if (pkt_crc_ready && crc_gen_ready) begin
                CRC_CHK_VALID_OUT <= 1'b1;
                CRC_CHK_BAD_STATUS_OUT <= (pkt_crc_checksum != crc_gen_checksum);
                pkt_crc_ready <= 1'b0;
                crc_gen_ready <= 1'b0;
            end else begin
                CRC_CHK_VALID_OUT <= 1'b0;
            end
        end
    end

endmodule