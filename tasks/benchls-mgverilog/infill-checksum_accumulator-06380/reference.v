module mg_06380(clk,rst_n,data_in,data_in_sign,data_out,data_out_sign,data_valid,data_ok);
input clk; 
  input rst_n; 
  input [6:0] data_in; 
  input data_in_sign; 
  output [6:0] data_out; 
  output data_out_sign; 
  input data_valid; 
  output data_ok; 
  reg [6:0] data_reg; 
  reg [3:0] data_regnum; 
  reg data_ok; 
  reg [6:0] data_out; 
  reg data_out_sign; 
  always @(posedge clk or negedge rst_n)begin 
  if(!rst_n)begin 
  data_reg <= 7'h0; 
  data_regnum <= 4'h0; 
  data_ok <= 1'h0; 
  end 
  else if(data_regnum == 4'h8) begin 
 data_ok <= ((data_reg == 7'd28)||(data_reg== 7'd36))?1'b1:1'b0; 
  end 
  else begin 
  data_regnum <= data_in_sign ? data_regnum + 1'b1 : data_regnum; 
  data_reg <= data_reg + (data_in_sign ? data_in : 7'h0); 
  end 
  end 
  always @(posedge clk or negedge rst_n)begin 
  if(!rst_n)begin 
  data_out_sign <= 1'b0; 
  data_out <= 'h0; 
  end 
  else if(data_regnum < 4'h7)begin 
  if(~data_out_sign & data_valid) data_out_sign <= 1'b1; 
  else data_out_sign <= 1'b0; 
  data_out <= ~data_out_sign & data_valid ? data_out + 1'b1 : data_out; 
  end 
  end 
 endmodule