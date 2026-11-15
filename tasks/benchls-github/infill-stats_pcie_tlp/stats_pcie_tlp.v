module stats_pcie_tlp #
(
    // TLP header width
    parameter TLP_HDR_WIDTH = 128,
    // TLP segment count
    parameter TLP_SEG_COUNT = 1
)
(
    input  wire                                    clk,
    input  wire                                    rst,

    /*
     * TLP monitor input
     */
    input  wire [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0]  tlp_hdr,
    input  wire [TLP_SEG_COUNT-1:0]                tlp_valid,
    input  wire [TLP_SEG_COUNT-1:0]                tlp_sop,
    input  wire [TLP_SEG_COUNT-1:0]                tlp_eop,

    /*
     * Statistics outputs
     */
    output wire                                    stat_tlp_mem_rd,
    output wire                                    stat_tlp_mem_wr,
    output wire                                    stat_tlp_io,
    output wire                                    stat_tlp_cfg,
    output wire                                    stat_tlp_msg,
    output wire                                    stat_tlp_cpl,
    output wire                                    stat_tlp_cpl_ur,
    output wire                                    stat_tlp_cpl_ca,
    output wire                                    stat_tlp_atomic,
    output wire                                    stat_tlp_ep,
    output wire [2:0]                              stat_tlp_hdr_dw,
    output wire [10:0]                             stat_tlp_req_dw,
    output wire [10:0]                             stat_tlp_payload_dw,
    output wire [10:0]                             stat_tlp_cpl_dw
);

localparam [2:0]
    TLP_FMT_3DW = 3'b000,
    TLP_FMT_4DW = 3'b001,
    TLP_FMT_3DW_DATA = 3'b010,
    TLP_FMT_4DW_DATA = 3'b011,
    TLP_FMT_PREFIX = 3'b100;

localparam [2:0]
    CPL_STATUS_SC  = 3'b000, // successful completion
    CPL_STATUS_UR  = 3'b001, // unsupported request
    CPL_STATUS_CRS = 3'b010, // configuration request retry status
    CPL_STATUS_CA  = 3'b100; // completer abort

reg [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0]  tlp_hdr_reg = 0;
reg [TLP_SEG_COUNT-1:0]                tlp_valid_reg = 0;
reg [TLP_SEG_COUNT-1:0]                tlp_sop_reg = 0;
reg [TLP_SEG_COUNT-1:0]                tlp_eop_reg = 0;

reg stat_tlp_mem_rd_reg = 1'b0;
reg stat_tlp_mem_wr_reg = 1'b0;
reg stat_tlp_io_reg = 1'b0;
reg stat_tlp_cfg_reg = 1'b0;
reg stat_tlp_msg_reg = 1'b0;
reg stat_tlp_cpl_reg = 1'b0;
reg stat_tlp_cpl_ur_reg = 1'b0;
reg stat_tlp_cpl_ca_reg = 1'b0;
reg stat_tlp_atomic_reg = 1'b0;
reg stat_tlp_ep_reg = 1'b0;
reg [2:0] stat_tlp_hdr_dw_reg = 3'd0;
reg [10:0] stat_tlp_req_dw_reg = 11'd0;
reg [10:0] stat_tlp_payload_dw_reg = 11'd0;
reg [10:0] stat_tlp_cpl_dw_reg = 11'd0;

wire tlp_hdr_valid = tlp_valid_reg && tlp_sop_reg;
wire [7:0] tlp_hdr_fmt_type = tlp_hdr_reg[127:120];
wire [2:0] tlp_hdr_fmt = tlp_hdr_reg[127:125];
wire [4:0] tlp_hdr_type = tlp_hdr_reg[124:120];
wire tlp_hdr_ep = tlp_hdr_reg[110];
wire [9:0] tlp_hdr_length = tlp_hdr_reg[105:96];
wire [3:0] tlp_hdr_cpl_status = tlp_hdr_reg[79:77];

assign stat_tlp_mem_rd = stat_tlp_mem_rd_reg;
assign stat_tlp_mem_wr = stat_tlp_mem_wr_reg;
assign stat_tlp_io = stat_tlp_io_reg;
assign stat_tlp_cfg = stat_tlp_cfg_reg;
assign stat_tlp_msg = stat_tlp_msg_reg;
assign stat_tlp_cpl = stat_tlp_cpl_reg;
assign stat_tlp_cpl_ur = stat_tlp_cpl_ur_reg;
assign stat_tlp_cpl_ca = stat_tlp_cpl_ca_reg;
assign stat_tlp_atomic = stat_tlp_atomic_reg;
assign stat_tlp_ep = stat_tlp_ep_reg;
assign stat_tlp_hdr_dw = stat_tlp_hdr_dw_reg;
assign stat_tlp_req_dw = stat_tlp_req_dw_reg;
assign stat_tlp_payload_dw = stat_tlp_payload_dw_reg;
assign stat_tlp_cpl_dw = stat_tlp_cpl_dw_reg;

[MASKED]

endmodule