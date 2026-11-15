module origen_137828 (
    input wire m_axi_aclk,
    input wire m_axi_aresetn,
    input wire req_valid,
    input wire [31:0] req_address,
    input wire [7:0] req_last_burst_length,
    input wire [2:0] req_last_beat_bytes,
    input wire enable,
    input wire pause,
    input wire sync_id,
    input wire fifo_valid,
    input wire [63:0] fifo_data,

    output reg req_ready,
    output reg enabled,
    output reg sync_id_ret,
    output reg response_valid,
    output reg response_ready,
    output reg [1:0] response_resp,
    output reg response_resp_eot,
    output reg [3:0] response_id,
    output reg [3:0] data_id,
    output reg [3:0] address_id,
    output reg data_eot,
    output reg address_eot,
    output reg m_axi_awvalid,
    output reg [31:0] m_axi_awaddr,
    output reg [7:0] m_axi_awlen,
    output reg [2:0] m_axi_awsize,
    output reg [1:0] m_axi_awburst,
    output reg [2:0] m_axi_awprot,
    output reg [3:0] m_axi_awcache,
    output reg [63:0] m_axi_wdata,
    output reg [7:0] m_axi_wstrb,
    output reg m_axi_wvalid,
    output reg m_axi_wlast,
    input wire m_axi_bvalid,
    input wire [1:0] m_axi_bresp,
    output reg m_axi_bready
);

    // State machine states
    localparam IDLE = 3'b000;
    localparam WRITE_ADDR = 3'b001;
    localparam WRITE_DATA = 3'b010;
    localparam WRITE_RESP = 3'b011;
    localparam READ_ADDR = 3'b100;
    localparam READ_DATA = 3'b101;

    reg [2:0] state;
    reg [7:0] burst_count;
    reg [2:0] beat_bytes;
    reg is_write;

    [MASKED]

endmodule