module origen_032613 #(
    parameter BASE_ADDR = 32'h10000000,
    parameter UPPER_ADDR = 32'h1FFFFFFF
) (
    input wire clk_a,
    input wire clk_b,
    input wire rst_n,

    // Clock domain A interface
    input wire mem_valid_a,
    input wire [31:0] mem_addr_a,
    input wire [31:0] mem_wdata_a,
    input wire [3:0] mem_wstrb_a,
    output reg mem_ready_a,
    output reg [31:0] mem_rdata_a,

    // Clock domain B interface
    output reg mem_valid_b,
    output reg [31:0] mem_addr_b,
    output reg [31:0] mem_wdata_b,
    output reg [3:0] mem_wstrb_b,
    input wire mem_ready_b,
    input wire [31:0] mem_rdata_b
);

    // Address validation
    wire addr_valid_a = (mem_addr_a >= BASE_ADDR) && (mem_addr_a <= UPPER_ADDR);

    // Clock domain A registers
    reg req_a;
    reg [2:0] req_b_sync_a;
    reg busy_a;
    reg [31:0] addr_a, wdata_a;
    reg [3:0] wstrb_a;

    // Clock domain B registers
    reg req_b;
    reg [2:0] req_a_sync_b;
    reg [31:0] rdata_b;

    // Clock domain A logic
    always @(posedge clk_a or negedge rst_n) begin
        if (!rst_n) begin
            req_a <= 1'b0;
            busy_a <= 1'b0;
            mem_ready_a <= 1'b0;
            mem_rdata_a <= 32'b0;
            addr_a <= 32'b0;
            wdata_a <= 32'b0;
            wstrb_a <= 4'b0;
        end else begin
            req_b_sync_a <= {req_b_sync_a[1:0], req_b};
            
            if (mem_valid_a && addr_valid_a && !busy_a) begin
                req_a <= ~req_a;
                busy_a <= 1'b1;
                addr_a <= mem_addr_a;
                wdata_a <= mem_wdata_a;
                wstrb_a <= mem_wstrb_a;
            end

            if (busy_a && (req_b_sync_a[2] ^ req_b_sync_a[1])) begin
                busy_a <= 1'b0;
                mem_ready_a <= 1'b1;
                mem_rdata_a <= rdata_b;
            end else begin
                mem_ready_a <= 1'b0;
            end
        end
    end

    // Clock domain B logic
    always @(posedge clk_b or negedge rst_n) begin
        if (!rst_n) begin
            req_b <= 1'b0;
            mem_valid_b <= 1'b0;
            mem_addr_b <= 32'b0;
            mem_wdata_b <= 32'b0;
            mem_wstrb_b <= 4'b0;
            rdata_b <= 32'b0;
        end else begin
            req_a_sync_b <= {req_a_sync_b[1:0], req_a};
            
            if (req_a_sync_b[2] ^ req_a_sync_b[1]) begin
                mem_valid_b <= 1'b1;
                mem_addr_b <= addr_a;
                mem_wdata_b <= wdata_a;
                mem_wstrb_b <= wstrb_a;
            end else if (mem_ready_b) begin
                mem_valid_b <= 1'b0;
                rdata_b <= mem_rdata_b;
                req_b <= ~req_b;
            end
        end
    end

endmodule