module origen_136494 (
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire s_axi_bready,
    input wire m_axi_aresetn,
    input wire m_axi_bvalid,
    input wire out,
    input wire [1:0] m_axi_bresp,
    output reg [1:0] s_axi_bresp,
    output reg m_axi_bready,
    output reg s_axi_bvalid
);

// FSM states
localparam IDLE = 2'b00;
localparam WAIT_AXI4 = 2'b01;
localparam WAIT_AXI4LITE = 2'b10;
localparam COMPLETE = 2'b11;

// FSM state registers
reg [1:0] axi4lite_state, axi4_state;
reg [1:0] next_axi4lite_state, next_axi4_state;

// Handshake signals
reg handshake_req, handshake_ack;

// AXI4-Lite response register
reg [1:0] axi4lite_resp_reg;

// AXI4 response ready register
reg axi4_bready_reg;

// AXI4-Lite FSM
always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
    if (!s_axi_aresetn) begin
        axi4lite_state <= IDLE;
    end else begin
        axi4lite_state <= next_axi4lite_state;
    end
end

// AXI4-Lite FSM next state logic
always @(*) begin
    case (axi4lite_state)
        IDLE: next_axi4lite_state = (handshake_req) ? WAIT_AXI4 : IDLE;
        WAIT_AXI4: next_axi4lite_state = (handshake_ack) ? WAIT_AXI4LITE : WAIT_AXI4;
        WAIT_AXI4LITE: next_axi4lite_state = (s_axi_bready) ? COMPLETE : WAIT_AXI4LITE;
        COMPLETE: next_axi4lite_state = IDLE;
        default: next_axi4lite_state = IDLE;
    endcase
end

// AXI4 FSM
always @(posedge out or negedge m_axi_aresetn) begin
    if (!m_axi_aresetn) begin
        axi4_state <= IDLE;
    end else begin
        axi4_state <= next_axi4_state;
    end
end

// AXI4 FSM next state logic
always @(*) begin
    case (axi4_state)
        IDLE: next_axi4_state = (m_axi_bvalid) ? WAIT_AXI4LITE : IDLE;
        WAIT_AXI4LITE: next_axi4_state = (handshake_ack) ? COMPLETE : WAIT_AXI4LITE;
        COMPLETE: next_axi4_state = IDLE;
        default: next_axi4_state = IDLE;
    endcase
end

// Handshake logic
always @(posedge out) begin
    if (!m_axi_aresetn) begin
        handshake_req <= 1'b0;
        handshake_ack <= 1'b0;
    end else begin
        if (axi4_state == WAIT_AXI4LITE && axi4lite_state == WAIT_AXI4) begin
            handshake_req <= 1'b1;
            handshake_ack <= 1'b1;
        end else begin
            handshake_req <= 1'b0;
            handshake_ack <= 1'b0;
        end
    end
end

// AXI4-Lite response register
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        axi4lite_resp_reg <= 2'b00;
    end else if (handshake_ack) begin
        axi4lite_resp_reg <= m_axi_bresp;
    end
end

// AXI4 response ready register
always @(posedge out) begin
    if (!m_axi_aresetn) begin
        axi4_bready_reg <= 1'b0;
    end else begin
        axi4_bready_reg <= (axi4_state == IDLE);
    end
end

// Output assignments
always @(*) begin
    s_axi_bresp = axi4lite_resp_reg;
    m_axi_bready = axi4_bready_reg;
    s_axi_bvalid = (axi4lite_state == WAIT_AXI4LITE);
end

endmodule