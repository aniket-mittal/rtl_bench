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

    always @(posedge m_axi_aclk or negedge m_axi_aresetn) begin
        if (!m_axi_aresetn) begin
            state <= IDLE;
            req_ready <= 1'b1;
            enabled <= 1'b0;
            sync_id_ret <= 1'b0;
            response_valid <= 1'b0;
            response_ready <= 1'b0;
            response_resp <= 2'b00;
            response_resp_eot <= 1'b0;
            response_id <= 4'b0000;
            data_id <= 4'b0000;
            address_id <= 4'b0000;
            data_eot <= 1'b0;
            address_eot <= 1'b0;
            m_axi_awvalid <= 1'b0;
            m_axi_awaddr <= 32'b0;
            m_axi_awlen <= 8'b0;
            m_axi_awsize <= 3'b0;
            m_axi_awburst <= 2'b01;
            m_axi_awprot <= 3'b000;
            m_axi_awcache <= 4'b0011;
            m_axi_wdata <= 64'b0;
            m_axi_wstrb <= 8'b0;
            m_axi_wvalid <= 1'b0;
            m_axi_wlast <= 1'b0;
            m_axi_bready <= 1'b0;
            burst_count <= 8'b0;
            beat_bytes <= 3'b0;
            is_write <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (req_valid && enable && !pause) begin
                        req_ready <= 1'b0;
                        enabled <= 1'b1;
                        sync_id_ret <= sync_id;
                        m_axi_awaddr <= req_address;
                        m_axi_awlen <= req_last_burst_length;
                        beat_bytes <= req_last_beat_bytes;
                        is_write <= fifo_valid;
                        state <= is_write ? WRITE_ADDR : READ_ADDR;
                    end
                end

                WRITE_ADDR: begin
                    m_axi_awvalid <= 1'b1;
                    m_axi_awsize <= (beat_bytes == 3'b001) ? 3'b000 :
                                    (beat_bytes == 3'b010) ? 3'b001 :
                                    (beat_bytes == 3'b100) ? 3'b010 : 3'b011;
                    state <= WRITE_DATA;
                end

                WRITE_DATA: begin
                    m_axi_awvalid <= 1'b0;
                    if (fifo_valid) begin
                        m_axi_wdata <= fifo_data;
                        m_axi_wvalid <= 1'b1;
                        m_axi_wstrb <= (beat_bytes == 3'b001) ? 8'b00000001 :
                                       (beat_bytes == 3'b010) ? 8'b00000011 :
                                       (beat_bytes == 3'b100) ? 8'b00001111 : 8'b11111111;
                        burst_count <= burst_count + 1;
                        if (burst_count == m_axi_awlen) begin
                            m_axi_wlast <= 1'b1;
                            state <= WRITE_RESP;
                        end
                    end
                end

                WRITE_RESP: begin
                    m_axi_wvalid <= 1'b0;
                    m_axi_wlast <= 1'b0;
                    m_axi_bready <= 1'b1;
                    if (m_axi_bvalid) begin
                        response_valid <= 1'b1;
                        response_resp <= m_axi_bresp;
                        response_resp_eot <= 1'b1;
                        m_axi_bready <= 1'b0;
                        state <= IDLE;
                    end
                end

                READ_ADDR: begin
                    // Implement read address logic here
                    state <= READ_DATA;
                end

                READ_DATA: begin
                    // Implement read data logic here
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule