module mg_08749 (input reset,input aux_clk,input clk_fpga,output [1:0] clk_en,output [1:0] clk_sel,input clk_func,input clk_status,output sen,output sclk,input sdi,output sdo);
wire read = 1'b0; 
  wire [1:0] w = 2'b00; 
  assign clk_sel = 2'b00; 
  assign clk_en = 2'b11; 
  reg [20:0] addr_data; 
  reg [5:0] entry; 
  reg start; 
  reg [7:0] counter; 
  reg [23:0] command; 
  always @* 
  case(entry) 
  6'd00 : addr_data = {13'h00,8'h10}; 
  6'd01 : addr_data = {13'h45,8'h00}; 
  6'd02 : addr_data = {13'h3D,8'h80}; 
  6'd03 : addr_data = {13'h4B,8'h80}; 
  6'd04 : addr_data = {13'h08,8'h47}; 
  6'd05 : addr_data = {13'h09,8'h70}; 
  6'd06 : addr_data = {13'h0A,8'h04}; 
  6'd07 : addr_data = {13'h0B,8'h00}; 
  6'd08 : addr_data = {13'h0C,8'h01}; 
  6'd09 : addr_data = {13'h0D,8'h00}; 
  6'd10 : addr_data = {13'h07,8'h00}; 
  6'd11 : addr_data = {13'h04,8'h00}; 
  6'd12 : addr_data = {13'h05,8'h00}; 
  6'd13 : addr_data = {13'h06,8'h05}; 
  default : addr_data = {13'h5A,8'h01}; 
  endcase 
  wire [5:0] lastentry = 6'd15; 
  wire done = (counter == 8'd49); 
  always @(posedge aux_clk) 
  if(reset) 
  begin 
  entry <= #1 6'd0; 
  start <= #1 1'b1; 
  end 
  else if(start) 
  start <= #1 1'b0; 
  else if(done && (entry<lastentry)) 
  begin 
  entry <= #1 entry + 6'd1; 
  start <= #1 1'b1; 
  end 
  always @(posedge aux_clk) 
  if(reset) 
  begin 
  counter <= #1 7'd0; 
  command <= #1 20'd0; 
  end 
  else if(start) 
  begin 
  counter <= #1 7'd1; 
  command <= #1 {read,w,addr_data}; 
  end 
  else if( |counter && ~done ) 
  begin 
  counter <= #1 counter + 7'd1; 
  if(~counter[0]) 
  command <= {command[22:0],1'b0}; 
  end 
  assign sen = (done | counter == 8'd0); 
  assign sclk = ~counter[0]; 
  assign sdo = command[23]; 
 endmodule