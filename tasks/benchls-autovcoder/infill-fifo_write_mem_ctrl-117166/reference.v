module autovcoder_117166 #(
    parameter ADDR_DEPTH = 16384,
    parameter ADDR_WIDTH = clog2(ADDR_DEPTH),
    parameter FIFO_START = 0,
    parameter DATA_WIDTH = 32,
    parameter BYTE_WIDTH = (DATA_WIDTH / 8),
    parameter MEM_TYPE   = "EBR"
) (
    input fifo_clk_i,
    input fifo_wr_en_i,
    input [7:0] fifo_wr_data_i,
    input fifo_rst_i,
    output reg fifo_full_o,
    output [(DATA_WIDTH - 1):0] mem_wdata_o,
    output mem_clk_en_o,
    output [(ADDR_WIDTH - 1):0] mem_addr_o,
    output [(BYTE_WIDTH - 1):0] mem_byte_en_o
);
  reg fifo_full_int_r;
  reg [ADDR_WIDTH:0] mem_addr_r;
  reg [ADDR_WIDTH:0] mem_addr_nxt_c;
  reg fifo_full_nxt_c;
  reg [(BYTE_WIDTH - 1):0] mem_byte_en_r;
  reg [(BYTE_WIDTH - 1):0] mem_byte_en_nxt_c;
  assign mem_addr_o   = mem_addr_r[(ADDR_WIDTH-1):0];
  assign mem_wdata_o  = {BYTE_WIDTH{fifo_wr_data_i}};
  assign mem_clk_en_o = ((~fifo_full_int_r) & fifo_wr_en_i);
  if ((MEM_TYPE == "LRAM")) begin : genblk1
    genvar i0;
    for (i0 = 0; (i0 < BYTE_WIDTH); i0 = (i0 + 1)) begin : genblk1
      assign mem_byte_en_o[i0] = (~mem_byte_en_r[i0]);
    end
  end else begin : genblk1
    assign mem_byte_en_o = mem_byte_en_r;
  end
  if ((BYTE_WIDTH == 1)) begin : genblk2
    always @(*) begin
      mem_addr_nxt_c = mem_addr_r;
      if (mem_clk_en_o) begin
        mem_addr_nxt_c = (mem_addr_r + 1'b1);
      end
    end
    always @(*) begin
      mem_byte_en_nxt_c = 1'b1;
    end
  end else begin : genblk2
    always @(*) begin
      mem_addr_nxt_c = mem_addr_r;
      if ((mem_clk_en_o & mem_byte_en_r[(BYTE_WIDTH-1)])) begin
        mem_addr_nxt_c = (mem_addr_r + 1'b1);
      end
    end
    always @(*) begin
      mem_byte_en_nxt_c = (mem_clk_en_o ? {mem_byte_en_r[(BYTE_WIDTH - 2):0],
                            mem_byte_en_r[(BYTE_WIDTH - 1)]} : mem_byte_en_r) ;
    end
  end
  always @(*) begin
    fifo_full_nxt_c = (fifo_full_int_r | (fifo_wr_en_i && (mem_addr_nxt_c == ADDR_DEPTH)));
  end
  always @(posedge fifo_clk_i or negedge fifo_rst_i) begin
    if ((~fifo_rst_i)) begin
      mem_addr_r <= FIFO_START;
      mem_byte_en_r <= 4'h1;
      fifo_full_o <= 1'b0;
      fifo_full_int_r <= 1'b0;
    end else begin
      mem_addr_r <= mem_addr_nxt_c;
      mem_byte_en_r <= mem_byte_en_nxt_c;
      fifo_full_o <= fifo_full_nxt_c;
      fifo_full_int_r <= fifo_full_nxt_c;
    end
  end
  //------------------------------------------------------------------------------
  // Function Definition
  //------------------------------------------------------------------------------
  function [31:0] clog2;
    input [31:0] value;
    reg [31:0] num;
    begin
      num = (value - 1);
      for (clog2 = 0; (num > 0); clog2 = (clog2 + 1)) num = (num >> 1);
    end
  endfunction
endmodule

