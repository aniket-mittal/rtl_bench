module mg_07884 (clk_i,rst_i,start_i,done_o,busy_o,data_i,data_o,spi_clk_o,spi_ss_o,spi_mosi_o,spi_miso_i);
parameter [31:0] CLK_DIV = 32; 
 parameter [31:0] TRANSFER_WIDTH = 8; 
 input clk_i ; 
 input rst_i ; 
 input start_i ; 
 output done_o ; 
 output busy_o ; 
 input [(TRANSFER_WIDTH - 1):0] data_i ; 
 output [(TRANSFER_WIDTH - 1):0] data_o ; 
 output spi_clk_o ; 
 output spi_ss_o ; 
 output spi_mosi_o ; 
 input spi_miso_i ; 
 reg running; 
 integer cycle_count; 
 reg [(TRANSFER_WIDTH - 1):0] shift_reg; 
 reg spi_clk_gen; 
 reg last_clk_gen; 
 integer clk_div_count; 
 reg done_o; 
 reg spi_ss_o; 
 reg spi_clk_o; 
 always @ (posedge clk_i or posedge rst_i ) 
 begin 
  if (rst_i == 1'b1) 
  begin 
  clk_div_count <= 0; 
  spi_clk_gen <= 1'b0; 
  end 
  else 
  begin 
  if (running == 1'b1) 
  begin 
  if (clk_div_count == (CLK_DIV - 1)) 
  begin 
  spi_clk_gen <= ~(spi_clk_gen); 
  clk_div_count <= 0; 
  end 
  else 
  clk_div_count <= (clk_div_count + 1); 
  end 
  else 
  spi_clk_gen <= 1'b0; 
  end 
 end 
 always @ (posedge clk_i or posedge rst_i ) 
 begin 
  if (rst_i == 1'b1) 
  begin 
  cycle_count <= 0; 
  shift_reg <= {(TRANSFER_WIDTH - 0){1'b0}}; 
  last_clk_gen <= 1'b0; 
  spi_clk_o <= 1'b0; 
  running <= 1'b0; 
  done_o <= 1'b0; 
  spi_ss_o <= 1'b0; 
  end 
  else 
  begin 
  last_clk_gen <= spi_clk_gen; 
  done_o <= 1'b0; 
  if (running == 1'b0) 
  begin 
  if (start_i == 1'b1) 
  begin 
  cycle_count <= 0; 
  shift_reg <= data_i; 
  running <= 1'b1; 
  spi_ss_o <= 1'b1; 
  end 
  end 
  else 
  begin 
  if ((last_clk_gen == 1'b1) && (spi_clk_gen == 1'b0)) 
  begin 
  spi_clk_o <= 1'b0; 
  cycle_count <= (cycle_count + 1); 
  shift_reg <= {shift_reg[(TRANSFER_WIDTH - 2):0],spi_miso_i}; 
  if (cycle_count == (TRANSFER_WIDTH - 1)) 
  begin 
  running <= 1'b0; 
  done_o <= 1'b1; 
  spi_ss_o <= 1'b0; 
  end 
  end 
  else if ((last_clk_gen == 1'b0) & (spi_clk_gen == 1'b1)) 
  begin 
  spi_clk_o <= 1'b1; 
  end 
  end 
  end 
 end 
 assign spi_mosi_o = shift_reg[(TRANSFER_WIDTH - 1)]; 
 assign data_o = shift_reg; 
 assign busy_o = ((running == 1'b1) || (start_i == 1'b1)) ? 1'b1 : 1'b0; 
 endmodule