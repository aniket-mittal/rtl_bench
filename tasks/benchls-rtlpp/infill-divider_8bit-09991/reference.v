module rtlpp_09991 (
  clk_i,
  clk_en_i,
  rst_i,
  divide_i,
  dividend_i,
  divisor_i,
  quotient_o,
  done_o
  );

parameter M_PP = 16;           
parameter N_PP = 8;            
parameter R_PP = 0;            
parameter S_PP = 0;            
parameter COUNT_WIDTH_PP = 5;  
parameter HELD_OUTPUT_PP = 0;  

input  clk_i;                           
input  clk_en_i;
input  rst_i;                           
input  divide_i;                        
input  [M_PP-1:0] dividend_i;           
input  [N_PP-1:0] divisor_i;            
output [M_PP+R_PP-S_PP-1:0] quotient_o; 
output done_o;                          

reg  done_o;

reg  [M_PP+R_PP-1:0] grand_dividend;
reg  [M_PP+N_PP+R_PP-2:0] grand_divisor;
reg  [M_PP+R_PP-S_PP-1:0] quotient;
reg  [M_PP+R_PP-1:0] quotient_reg;       
reg  [COUNT_WIDTH_PP-1:0] divide_count;

wire [M_PP+N_PP+R_PP-1:0] subtract_node; 
wire [M_PP+R_PP-1:0]      quotient_node; 
wire [M_PP+N_PP+R_PP-2:0]  divisor_node; 

always @(posedge clk_i)
begin
  if (rst_i)
  begin
    grand_dividend <= 0;
    grand_divisor <= 0;
    divide_count <= 0;
    quotient <= 0;
    done_o <= 0;
  end
  else if (clk_en_i)
  begin
    done_o <= 0;
    if (divide_i)
    begin
      quotient <= 0;
      divide_count <= 0;
      grand_dividend <= dividend_i << R_PP;
      grand_divisor  <= divisor_i << (N_PP+R_PP-S_PP-1);
    end
    else if (divide_count == M_PP+R_PP-S_PP-1)
    begin
      if (~done_o) quotient <= quotient_node;
      if (~done_o) quotient_reg <= quotient_node;
      done_o <= 1;
    end
    else
    begin
      if (~subtract_node[M_PP+N_PP+R_PP-1]) grand_dividend <= subtract_node;
      quotient <= quotient_node;
      grand_divisor <= divisor_node;
      divide_count <= divide_count + 1;
    end
  end  
end 

assign subtract_node = {1'b0,grand_dividend} - {1'b0,grand_divisor};
assign quotient_node = 
  {quotient[M_PP+R_PP-S_PP-2:0],~subtract_node[M_PP+N_PP+R_PP-1]};
assign divisor_node  = {1'b0,grand_divisor[M_PP+N_PP+R_PP-2:1]};

assign quotient_o = (HELD_OUTPUT_PP == 0) ? quotient : quotient_reg;

endmodule