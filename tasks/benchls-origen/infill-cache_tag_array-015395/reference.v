module origen_015395 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire wen,
    input wire [20:0] wdata,
    output reg [20:0] rdata,
    input wire [31:0] addr,
    output reg hit,
    output wire valid,
    output reg work,
    input wire op
);

reg [31:0] addr_r;
reg [6:0] rst_cnt;
reg [20:0] tag_ram [127:0];
reg [20:0] tag_read;

always @(posedge clk) begin
    if (rst) begin
        addr_r <= 32'b0;
        rst_cnt <= 7'b0;
        work <= 1'b0;
        hit <= 1'b0;
        rdata <= 21'b0;
    end else begin
        addr_r <= addr;
        
        if (!work) begin
            if (rst_cnt == 7'd127) begin
                work <= 1'b1;
            end else begin
                rst_cnt <= rst_cnt + 1'b1;
            end
        end
        
        if (work && (wen || op)) begin
            tag_ram[addr[11:5]] <= wdata;
        end
        
        tag_read <= tag_ram[addr[11:5]];
        rdata <= tag_read;
        hit <= (tag_read[19:0] == addr[31:12]) && tag_read[20];
    end
end

assign valid = rdata[20];

integer i;
initial begin
    for (i = 0; i < 128; i = i + 1) begin
        tag_ram[i] = 21'b0;
    end
end

endmodule