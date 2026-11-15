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

    [MASKED]

endmodule