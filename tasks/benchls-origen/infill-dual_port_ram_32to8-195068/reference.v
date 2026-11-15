module origen_195068 (
    wrclock,
    wren,
    wraddress,
    byteena_a,
    data,
    rdclock,
    rden,
    rdaddress,
    q
);

input wrclock;
input wren;
input [7:0] wraddress;
input [3:0] byteena_a;
input [31:0] data;

input rdclock;
input rden;
input [9:0] rdaddress;
output [7:0] q;

reg [7:0] r_mem_blk_0 [0:255];
reg [7:0] r_mem_blk_1 [0:255];
reg [7:0] r_mem_blk_2 [0:255];
reg [7:0] r_mem_blk_3 [0:255];

reg [7:0] q_reg1, q_reg2;

initial begin
    integer i;
    for (i = 0; i < 256; i = i + 1) begin
        r_mem_blk_0[i] <= 8'h00;
        r_mem_blk_1[i] <= 8'h00;
        r_mem_blk_2[i] <= 8'h00;
        r_mem_blk_3[i] <= 8'h00;
    end
end

always @(posedge wrclock) begin
    if (wren) begin
        if (byteena_a[0]) r_mem_blk_0[wraddress] <= data[7:0];
        if (byteena_a[1]) r_mem_blk_1[wraddress] <= data[15:8];
        if (byteena_a[2]) r_mem_blk_2[wraddress] <= data[23:16];
        if (byteena_a[3]) r_mem_blk_3[wraddress] <= data[31:24];
    end
end

always @(posedge rdclock) begin
    if (rden) begin
        q_reg1 <= {r_mem_blk_3[rdaddress[7:0]], r_mem_blk_2[rdaddress[7:0]], r_mem_blk_1[rdaddress[7:0]], r_mem_blk_0[rdaddress[7:0]]};
        q_reg2 <= q_reg1;
    end
end

assign q = q_reg2;

endmodule