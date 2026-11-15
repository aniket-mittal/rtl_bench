module rtlpp_02679(
    clk, 
    rst,
    tlb_en, 
    vaddr, 
    hit, 
    ppn, 
    uxe, 
    sxe, 
    ci, 
    spr_cs, 
    spr_write, 
    spr_addr, 
    spr_dat_i, 
    spr_dat_o
);

parameter dw = 32;
parameter aw = 32;

input               clk;
input               rst;
input               tlb_en;
input   [aw-1:0]    vaddr;
output              hit;
output  [31:10]     ppn;
output              uxe;
output              sxe;
output              ci;
input               spr_cs;
input               spr_write;
input   [31:0]      spr_addr;
input   [31:0]      spr_dat_i;
output  [31:0]      spr_dat_o;

wire    [19:0]      vpn;
wire                v;
wire    [5:0]       tlb_index;
wire                tlb_mr_en;
wire                tlb_mr_we;
wire    [13:0]      tlb_mr_ram_in;
wire    [13:0]      tlb_mr_ram_out;
wire                tlb_tr_en;
wire                tlb_tr_we;
wire    [21:0]      tlb_tr_ram_in;
wire    [21:0]      tlb_tr_ram_out;

assign tlb_mr_en = tlb_en | (spr_cs & !spr_addr[31]);
assign tlb_mr_we = spr_cs & spr_write & !spr_addr[31];
assign tlb_tr_en = tlb_en | (spr_cs & spr_addr[31]);
assign tlb_tr_we = spr_cs & spr_write & spr_addr[31];

assign spr_dat_o = (!spr_write & !spr_addr[31]) ?
            {vpn, tlb_index & {6{v}}, {7{1'b0}}, 1'b0, 5'b00000, v} :
        (!spr_write & spr_addr[31]) ?
            {ppn, {14{1'b0}}, uxe, sxe, {4{1'b0}}, ci, 1'b0} :
            32'h00000000;

assign {vpn, v} = tlb_mr_ram_out;
assign tlb_mr_ram_in = {spr_dat_i[19:0], spr_dat_i[0]};
assign {ppn, uxe, sxe, ci} = tlb_tr_ram_out;
assign tlb_tr_ram_in = {spr_dat_i[31:10], spr_dat_i[9], spr_dat_i[8], spr_dat_i[7]};

assign hit = (vpn == vaddr[31:12]) & v;
assign tlb_index = spr_cs ? spr_addr[5:0] : vaddr[11:6];

reg [13:0] itlb_mr_ram [0:63];
reg [21:0] itlb_tr_ram [0:63];
reg [5:0] addr_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Initialization if required
    end else begin
        if (tlb_mr_en) begin
            if (tlb_mr_we)
                itlb_mr_ram[tlb_index] <= tlb_mr_ram_in;
            addr_reg <= tlb_index;
        end
    end
end

assign tlb_mr_ram_out = itlb_mr_ram[addr_reg];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Initialization if required
    end else begin
        if (tlb_tr_en) begin
            if (tlb_tr_we)
                itlb_tr_ram[tlb_index] <= tlb_tr_ram_in;
            addr_reg <= tlb_index;
        end
    end
end

assign tlb_tr_ram_out = itlb_tr_ram[addr_reg];

endmodule