module origen_136184 (
    input wire ARESETN,
    input wire ACLK,
    input wire [31:0] S_AXI_AWADDR,
    input wire [3:0] S_AXI_AWCACHE,
    input wire [2:0] S_AXI_AWPROT,
    input wire S_AXI_AWVALID,
    output reg S_AXI_AWREADY,
    input wire [31:0] S_AXI_WDATA,
    input wire [3:0] S_AXI_WSTRB,
    input wire S_AXI_WVALID,
    output reg S_AXI_WREADY,
    output reg S_AXI_BVALID,
    input wire S_AXI_BREADY,
    output reg [1:0] S_AXI_BRESP,
    input wire [31:0] S_AXI_ARADDR,
    input wire [3:0] S_AXI_ARCACHE,
    input wire [2:0] S_AXI_ARPROT,
    input wire S_AXI_ARVALID,
    output reg S_AXI_ARREADY,
    output reg [31:0] S_AXI_RDATA,
    output reg [1:0] S_AXI_RRESP,
    output reg S_AXI_RVALID,
    input wire S_AXI_RREADY,

    input wire LOCAL_CLK,
    output reg LOCAL_CS,
    output reg LOCAL_RNW,
    input wire LOCAL_ACK,
    output reg [31:0] LOCAL_ADDR,
    output reg [3:0] LOCAL_BE,
    output reg [31:0] LOCAL_WDATA,
    input wire [31:0] LOCAL_RDATA
);

    localparam S_IDLE = 2'b00;
    localparam S_WRITE = 2'b01;
    localparam S_WRITE2 = 2'b10;
    localparam S_READ = 2'b11;

    reg [1:0] state;
    reg [31:0] addr_reg;
    reg [31:0] data_reg;
    reg [3:0] be_reg;

    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            state <= S_IDLE;
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY <= 1'b0;
            S_AXI_BVALID <= 1'b0;
            S_AXI_ARREADY <= 1'b0;
            S_AXI_RVALID <= 1'b0;
            LOCAL_CS <= 1'b0;
            LOCAL_RNW <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    if (S_AXI_AWVALID) begin
                        addr_reg <= S_AXI_AWADDR;
                        S_AXI_AWREADY <= 1'b1;
                        state <= S_WRITE;
                    end else if (S_AXI_ARVALID) begin
                        addr_reg <= S_AXI_ARADDR;
                        S_AXI_ARREADY <= 1'b1;
                        state <= S_READ;
                    end
                end
                S_WRITE: begin
                    S_AXI_AWREADY <= 1'b0;
                    if (S_AXI_WVALID) begin
                        data_reg <= S_AXI_WDATA;
                        be_reg <= S_AXI_WSTRB;
                        S_AXI_WREADY <= 1'b1;
                        state <= S_WRITE2;
                    end
                end
                S_WRITE2: begin
                    S_AXI_WREADY <= 1'b0;
                    LOCAL_CS <= 1'b1;
                    LOCAL_RNW <= 1'b0;
                    LOCAL_ADDR <= addr_reg;
                    LOCAL_BE <= be_reg;
                    LOCAL_WDATA <= data_reg;
                    if (LOCAL_ACK) begin
                        LOCAL_CS <= 1'b0;
                        S_AXI_BVALID <= 1'b1;
                        S_AXI_BRESP <= 2'b00;
                        if (S_AXI_BREADY) begin
                            S_AXI_BVALID <= 1'b0;
                            state <= S_IDLE;
                        end
                    end
                end
                S_READ: begin
                    S_AXI_ARREADY <= 1'b0;
                    LOCAL_CS <= 1'b1;
                    LOCAL_RNW <= 1'b1;
                    LOCAL_ADDR <= addr_reg;
                    if (LOCAL_ACK) begin
                        LOCAL_CS <= 1'b0;
                        S_AXI_RDATA <= LOCAL_RDATA;
                        S_AXI_RRESP <= 2'b00;
                        S_AXI_RVALID <= 1'b1;
                        if (S_AXI_RREADY) begin
                            S_AXI_RVALID <= 1'b0;
                            state <= S_IDLE;
                        end
                    end
                end
            endcase
        end
    end

endmodule