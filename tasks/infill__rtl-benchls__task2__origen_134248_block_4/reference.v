module origen_134248 (
    // Clock and reset
    input wire m_axi_aclk,
    input wire m_axi_aresetn,

    // Request interface
    input wire req_valid,
    input wire [31:0] req_address,
    input wire [7:0] req_last_burst_length,
    input wire [2:0] req_last_beat_bytes,
    output wire req_ready,

    // Control signals
    input wire enable,
    input wire pause,
    output wire enabled,

    // Sync interface
    input wire [3:0] sync_id,
    output wire [3:0] sync_id_ret,

    // FIFO interface
    input wire fifo_valid,
    input wire [63:0] fifo_data,

    // Response interface
    output wire response_valid,
    input wire response_ready,
    output wire [1:0] response_resp,
    output wire response_resp_eot,

    // ID signals
    output wire [3:0] request_id,
    output wire [3:0] response_id,
    output wire [3:0] data_id,
    output wire [3:0] address_id,

    // AXI4 Write Address Channel
    output wire m_axi_awvalid,
    input wire m_axi_awready,
    output wire [31:0] m_axi_awaddr,
    output wire [7:0] m_axi_awlen,
    output wire [2:0] m_axi_awsize,
    output wire [1:0] m_axi_awburst,
    output wire [2:0] m_axi_awprot,
    output wire [3:0] m_axi_awcache,

    // AXI4 Write Data Channel
    output wire m_axi_wvalid,
    input wire m_axi_wready,
    output wire [63:0] m_axi_wdata,
    output wire [7:0] m_axi_wstrb,
    output wire m_axi_wlast,

    // AXI4 Write Response Channel
    input wire m_axi_bvalid,
    output wire m_axi_bready,
    input wire [1:0] m_axi_bresp
);

    // State machine states
    localparam IDLE = 3'd0;
    localparam WRITE_ADDR = 3'd1;
    localparam WRITE_DATA = 3'd2;
    localparam WRITE_RESP = 3'd3;

    reg [2:0] state, next_state;

    // Internal registers
    reg [31:0] current_address;
    reg [7:0] burst_count;
    reg [2:0] last_beat_bytes;
    reg eot;

    // Control logic
    assign enabled = enable && !pause;
    assign sync_id_ret = sync_id;

    // Request handling
    assign req_ready = (state == IDLE) && enabled;

    // ID handling
    reg [3:0] current_id;
    assign request_id = current_id;
    assign response_id = current_id;
    assign data_id = current_id;
    assign address_id = current_id;

    // AXI4 Write Address Channel
    assign m_axi_awvalid = (state == WRITE_ADDR);
    assign m_axi_awaddr = current_address;
    assign m_axi_awlen = burst_count;
    assign m_axi_awsize = 3'b011; // 8 bytes
    assign m_axi_awburst = 2'b01; // INCR
    assign m_axi_awprot = 3'b000;
    assign m_axi_awcache = 4'b0011;

    // AXI4 Write Data Channel
    assign m_axi_wvalid = (state == WRITE_DATA) && fifo_valid;
    assign m_axi_wdata = fifo_data;
    assign m_axi_wstrb = (burst_count == 0) ? ((1 << last_beat_bytes) - 1) : 8'hFF;
    assign m_axi_wlast = (burst_count == 0);

    // AXI4 Write Response Channel
    assign m_axi_bready = (state == WRITE_RESP);

    // Response interface
    assign response_valid = (state == WRITE_RESP) && m_axi_bvalid;
    assign response_resp = m_axi_bresp;
    assign response_resp_eot = eot;

    // State machine
    always @(posedge m_axi_aclk or negedge m_axi_aresetn) begin
        if (!m_axi_aresetn) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (req_valid && enabled) begin
                    next_state = WRITE_ADDR;
                end
            end
            WRITE_ADDR: begin
                if (m_axi_awready) begin
                    next_state = WRITE_DATA;
                end
            end
            WRITE_DATA: begin
                if (m_axi_wready && m_axi_wvalid && m_axi_wlast) begin
                    next_state = WRITE_RESP;
                end
            end
            WRITE_RESP: begin
                if (m_axi_bvalid && m_axi_bready) begin
                    next_state = IDLE;
                end
            end
        endcase
    end

    // Control and data path logic
    always @(posedge m_axi_aclk or negedge m_axi_aresetn) begin
        if (!m_axi_aresetn) begin
            current_address <= 32'h0;
            burst_count <= 8'h0;
            last_beat_bytes <= 3'h0;
            eot <= 1'b0;
            current_id <= 4'h0;
        end else begin
            case (state)
                IDLE: begin
                    if (req_valid && enabled) begin
                        current_address <= req_address;
                        burst_count <= req_last_burst_length;
                        last_beat_bytes <= req_last_beat_bytes;
                        eot <= 1'b1;
                        current_id <= current_id + 1;
                    end
                end
                WRITE_DATA: begin
                    if (m_axi_wready && m_axi_wvalid) begin
                        current_address <= current_address + 8;
                        if (burst_count > 0) begin
                            burst_count <= burst_count - 1;
                        end
                    end
                end
                WRITE_RESP: begin
                    if (m_axi_bvalid && m_axi_bready) begin
                        eot <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule