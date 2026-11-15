module autovcoder_026884 #(
    parameter MEM_WIDTH = 32,
    parameter MEM_DEPTH = 64,
    parameter MEM_ADDRW = $clog2(MEM_DEPTH)
) (
    input                    i_clk,
    input                    i_rst_n,
    input                    i_wen,
    input  [MEM_ADDRW-1 : 0] i_addr,
    input  [MEM_WIDTH-1 : 0] i_wdata,
    output [MEM_WIDTH-1 : 0] o_rdata
);
  reg [MEM_WIDTH-1 : 0] mem_r[0 : MEM_DEPTH-1];
  reg [MEM_WIDTH-1 : 0] mem_w[0 : MEM_DEPTH-1];
  reg [MEM_WIDTH-1 : 0] rdata_w, rdata_r;
  wire [MEM_ADDRW-1 : 0] vaddr;
  integer i;

  assign o_rdata = rdata_r;
  assign vaddr   = i_addr;

  always @(*) begin
    for (i = 0; i < MEM_DEPTH; i = i + 1) begin
      mem_w[i] = mem_r[i];
    end
    rdata_w = rdata_r;

    if (!i_wen) begin
      rdata_w = mem_r[vaddr];
    end else begin
      mem_w[vaddr] = i_wdata;
    end
  end

  [MASKED]

endmodule

