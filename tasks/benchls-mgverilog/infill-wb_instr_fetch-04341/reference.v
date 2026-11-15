module mg_04341(i_clk, i_rst, i_new_pc, i_clear_cache, i_stalled_n, i_pc,o_i, o_pc, o_valid, o_illegal,o_wb_cyc, o_wb_stb, o_wb_we, o_wb_addr, o_wb_data,i_wb_ack, i_wb_stall, i_wb_err, i_wb_data);
parameter ADDRESS_WIDTH=32; 
  localparam AW=ADDRESS_WIDTH; 
  input wire i_clk, i_rst, i_new_pc, i_clear_cache, 
  i_stalled_n; 
  input wire [(AW-1):0] i_pc; 
  output reg [31:0] o_i; 
  output wire [(AW-1):0] o_pc; 
  output reg o_valid; 
  output reg o_wb_cyc, o_wb_stb; 
  output wire o_wb_we; 
  output reg [(AW-1):0] o_wb_addr; 
  output wire [31:0] o_wb_data; 
  input wire i_wb_ack, i_wb_stall, i_wb_err; 
  input wire [31:0] i_wb_data; 
  output reg o_illegal; 
  assign o_wb_we = 1'b0; 
  assign o_wb_data = 32'h0000; 
  initial o_wb_cyc = 1'b0; 
  initial o_wb_stb = 1'b0; 
  initial o_wb_addr= 0; 
  always @(posedge i_clk) 
  if ((i_rst)||(i_wb_ack)||(i_wb_err)) 
  begin 
  o_wb_cyc <= 1'b0; 
  o_wb_stb <= 1'b0; 
  end else if ((!o_wb_cyc)&&((i_stalled_n)||(!o_valid)||(i_new_pc))) 
  begin 
  o_wb_cyc <= 1'b1; 
  o_wb_stb <= 1'b1; 
  end else if (o_wb_cyc) 
  begin 
  if (!i_wb_stall) 
  o_wb_stb <= 1'b0; 
  end 
  reg invalid; 
  initial invalid = 1'b0; 
  always @(posedge i_clk) 
  if (!o_wb_cyc) 
  invalid <= 1'b0; 
  else if ((i_new_pc)||(i_clear_cache)) 
  invalid <= 1'b1; 
  always @(posedge i_clk) 
  if (i_new_pc) 
  o_wb_addr <= i_pc; 
  else if ((!o_wb_cyc)&&(i_stalled_n)&&(!invalid)) 
  o_wb_addr <= o_wb_addr + 1'b1; 
  always @(posedge i_clk) 
  if ((o_wb_cyc)&&(i_wb_ack)) 
  o_i <= i_wb_data; 
  initial o_valid = 1'b0; 
  initial o_illegal = 1'b0; 
  always @(posedge i_clk) 
  if ((i_rst)||(i_new_pc)) 
  begin 
  o_valid <= 1'b0; 
  o_illegal <= 1'b0; 
  end else if ((o_wb_cyc)&&((i_wb_ack)||(i_wb_err))) 
  begin 
  o_valid <= (!invalid); 
  o_illegal <= ( i_wb_err)&&(!invalid); 
  end else if ((i_stalled_n)||(i_clear_cache)||(i_new_pc)) 
  begin 
  o_valid <= 1'b0; 
  o_illegal <= 1'b0; 
  end 
  assign o_pc = o_wb_addr; 
 endmodule