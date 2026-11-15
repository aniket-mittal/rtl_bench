module origen_215945 #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 64
) (
    input ACLK,
    input ARESETN,
    input CONFIG_VALID,
    input [ADDR_WIDTH-1:0] CONFIG_START_ADDR,
    input [31:0] CONFIG_NBYTES,
    input [DATA_WIDTH-1:0] DATA,
    input DATA_VALID,
    output reg [ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output M_AXI_AWREADY,
    output reg M_AXI_AWVALID,
    output reg [DATA_WIDTH-1:0] M_AXI_WDATA,
    output reg [7:0] M_AXI_WSTRB,
    output M_AXI_WREADY,
    output reg M_AXI_WVALID,
    output reg M_AXI_WLAST,
    input [1:0] M_AXI_BRESP,
    input M_AXI_BVALID,
    output reg M_AXI_BREADY,
    output reg [3:0] M_AXI_AWLEN,
    output reg [2:0] M_AXI_AWSIZE,
    output reg [1:0] M_AXI_AWBURST,
    output reg CONFIG_READY,
    output reg DATA_READY
);

    reg [1:0] state;
    parameter IDLE = 2'b00, RWAIT = 2'b01;

    reg [ADDR_WIDTH-1:0] a_addr;
    reg [31:0] a_count;
    reg [31:0] b_count;

    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            state <= IDLE;
            a_addr <= 0;
            a_count <= 0;
            b_count <= 0;
            CONFIG_READY <= 1'b1;
            DATA_READY <= 1'b1;
        end else begin
            case (state)
                IDLE: begin
                    if (CONFIG_VALID) begin
                        a_addr <= CONFIG_START_ADDR;
                        a_count <= CONFIG_NBYTES[31:3];
                        b_count <= 0;
                        CONFIG_READY <= 1'b0;
                        DATA_READY <= 1'b0;
                        state <= RWAIT;
                    end else begin
                        CONFIG_READY <= 1'b1;
                        DATA_READY <= 1'b1;
                    end
                end
                RWAIT: begin
                    if (M_AXI_AWREADY) begin
                        M_AXI_AWVALID <= 1'b1;
                        M_AXI_AWADDR <= a_addr;
                        M_AXI_AWLEN <= 4'b0000;
                        M_AXI_AWSIZE <= 3'b011;
                        M_AXI_AWBURST <= 2'b01;
                        a_addr <= a_addr + 8;
                        a_count <= a_count - 1;
                        if (a_count == 1) begin
                            state <= IDLE;
                            CONFIG_READY <= 1'b1;
                            DATA_READY <= 1'b1;
                        end
                    end else begin
                        M_AXI_AWVALID <= 1'b0;
                    end

                    if (M_AXI_WREADY && DATA_VALID) begin
                        M_AXI_WVALID <= 1'b1;
                        M_AXI_WDATA <= DATA;
                        M_AXI_WSTRB <= 8'b11111111;
                        M_AXI_WLAST <= (b_count == 7);
                        b_count <= b_count + 1;
                        if (b_count == 7) begin
                            b_count <= 0;
                        end
                    end else begin
                        M_AXI_WVALID <= 1'b0;
                    end

                    if (M_AXI_BVALID) begin
                        M_AXI_BREADY <= 1'b1;
                    end else begin
                        M_AXI_BREADY <= 1'b0;
                    end
                end
            endcase
        end
    end

    assign M_AXI_AWREADY = 1'b1;
    assign M_AXI_WREADY = 1'b1;

endmodule