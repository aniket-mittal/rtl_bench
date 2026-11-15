module mg_03944(clk, rst, m_read, m_write, m_addr, m_din,m_dout);
input clk, rst; 
  input m_read; 
  input m_write; 
  input [31:0] m_addr; 
  input [31:0] m_din; 
  output reg [31:0] m_dout; 
  reg m_ready; 
  integer i; 
  reg [31:0] ram [2<<10 - 1:0]; 
  wire [9:0] r_addr = m_addr[9:0]; 
  [MASKED] 
  always @(posedge clk) begin 
  if (m_read == 1'b1) 
  m_dout = ram[r_addr]; 
  end 
 endmodule