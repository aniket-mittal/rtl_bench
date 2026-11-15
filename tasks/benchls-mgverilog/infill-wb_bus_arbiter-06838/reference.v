module mg_06838 (sys_clk,resetcpu,h_cyc,h_stb,h_we,h_sel,h_ack,h_adr,h_dat_o,h_dat_i,l_cyc,l_stb,l_we,l_sel,l_ack,l_adr,l_dat_o,l_dat_i,m_cyc,m_stb,m_we,m_sel,m_ack,m_adr,m_dat_o,m_dat_i);
input sys_clk; 
 input resetcpu; 
 input h_cyc; 
 input h_stb; 
 input h_we; 
 input [3:0] h_sel; 
 input [31:0] h_adr; 
 input [31:0] h_dat_o; 
 output [31:0] h_dat_i; 
 output h_ack; 
 input l_cyc; 
 input l_stb; 
 input l_we; 
 input [3:0] l_sel; 
 input [31:0] l_adr; 
 input [31:0] l_dat_o; 
 output [31:0] l_dat_i; 
 output l_ack; 
 output m_cyc; 
 output m_stb; 
 output m_we; 
 output [3:0] m_sel; 
 output [31:0] m_adr; 
 output [31:0] m_dat_o; 
 input [31:0] m_dat_i; 
 input m_ack; 
 reg active; 
 reg h_owns_bus_reg; 
 wire sel_h = (h_cyc & ~active) | (h_owns_bus_reg & active); 
 assign m_cyc = h_cyc | l_cyc; 
 assign m_stb = sel_h ? h_stb : l_stb; 
 assign m_we = sel_h ? h_we : l_we; 
 assign m_sel = sel_h ? h_sel : l_sel; 
 assign m_adr = sel_h ? h_adr : l_adr; 
 assign m_dat_o = sel_h ? h_dat_o : l_dat_o; 
 assign h_dat_i = m_dat_i; 
 assign l_dat_i = m_dat_i; 
 assign h_ack = h_owns_bus_reg & m_ack; 
 assign l_ack = ~h_owns_bus_reg & m_ack; 
 always @(posedge sys_clk or posedge resetcpu) 
 begin 
  if (resetcpu == 1'b1) 
  begin 
  active <= 1'b0; 
  h_owns_bus_reg <= 1'b0; 
  end 
  else 
  begin 
  active <= (active | h_cyc | l_cyc) & ~m_ack; 
  h_owns_bus_reg <= (active & h_owns_bus_reg) | (~active & h_cyc); 
  end 
 end 
 endmodule