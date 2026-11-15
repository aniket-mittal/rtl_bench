module origen_124249 (
    input wire aclk,
    input wire aresetn,
    
    // AXI Write Address Channel
    input wire [3:0] m_axi_awid,
    input wire [31:0] m_axi_awaddr,
    input wire [7:0] m_axi_awlen,
    input wire [2:0] m_axi_awsize,
    input wire [1:0] m_axi_awburst,
    input wire m_axi_awlock,
    input wire [3:0] m_axi_awcache,
    input wire [2:0] m_axi_awprot,
    input wire [3:0] m_axi_awqos,
    input wire m_axi_awvalid,
    output reg m_axi_awready,
    
    // AXI Write Data Channel
    input wire [31:0] m_axi_wdata,
    input wire [3:0] m_axi_wstrb,
    input wire m_axi_wlast,
    input wire m_axi_wvalid,
    output reg m_axi_wready,
    
    // AXI Write Response Channel
    input wire [3:0] m_axi_bid,
    input wire [1:0] m_axi_bresp,
    input wire m_axi_bvalid,
    output reg m_axi_bready,
    
    // AXI Read Address Channel
    input wire [3:0] m_axi_arid,
    input wire [31:0] m_axi_araddr,
    input wire [7:0] m_axi_arlen,
    input wire [2:0] m_axi_arsize,
    input wire [1:0] m_axi_arburst,
    input wire m_axi_arlock,
    input wire [3:0] m_axi_arcache,
    input wire [2:0] m_axi_arprot,
    input wire [3:0] m_axi_arqos,
    input wire m_axi_arvalid,
    output reg m_axi_arready,
    
    // AXI Read Data Channel
    output reg [3:0] m_axi_rid,
    output reg [31:0] m_axi_rdata,
    output reg [1:0] m_axi_rresp,
    output reg m_axi_rlast,
    output reg m_axi_rvalid,
    input wire m_axi_rready
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam WRITE = 2'b01;
    localparam READ = 2'b10;

    reg [1:0] state, next_state;

    // State machine
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (m_axi_awvalid)
                    next_state = WRITE;
                else if (m_axi_arvalid)
                    next_state = READ;
                else
                    next_state = IDLE;
            end
            WRITE: begin
                if (m_axi_bvalid && m_axi_bready)
                    next_state = IDLE;
                else
                    next_state = WRITE;
            end
            READ: begin
                if (m_axi_rvalid && m_axi_rready && m_axi_rlast)
                    next_state = IDLE;
                else
                    next_state = READ;
            end
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            m_axi_awready <= 1'b0;
            m_axi_wready <= 1'b0;
            m_axi_bready <= 1'b0;
            m_axi_arready <= 1'b0;
            m_axi_rid <= 4'b0;
            m_axi_rdata <= 32'b0;
            m_axi_rresp <= 2'b0;
            m_axi_rlast <= 1'b0;
            m_axi_rvalid <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    m_axi_awready <= 1'b1;
                    m_axi_arready <= 1'b1;
                    m_axi_wready <= 1'b0;
                    m_axi_bready <= 1'b0;
                    m_axi_rvalid <= 1'b0;
                end
                WRITE: begin
                    m_axi_awready <= 1'b0;
                    m_axi_arready <= 1'b0;
                    m_axi_wready <= 1'b1;
                    m_axi_bready <= 1'b1;
                    if (m_axi_wvalid && m_axi_wlast) begin
                        m_axi_wready <= 1'b0;
                    end
                end
                READ: begin
                    m_axi_awready <= 1'b0;
                    m_axi_arready <= 1'b0;
                    m_axi_rvalid <= 1'b1;
                    m_axi_rid <= m_axi_arid;
                    m_axi_rdata <= 32'hDEADBEEF; // Example data, replace with actual JTAG data
                    m_axi_rresp <= 2'b00; // OKAY response
                    m_axi_rlast <= 1'b1; // Assuming single transfer
                    if (m_axi_rready) begin
                        m_axi_rvalid <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule