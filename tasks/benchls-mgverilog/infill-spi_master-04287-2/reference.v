module mg_04287(CLK,RST,SPI_EN,SPI_DATA,CS,SDO,SCLK,SPI_FIN);
input CLK; 
  input RST; 
  input SPI_EN; 
  input [7:0] SPI_DATA; 
  output CS; 
  output SDO; 
  output SCLK; 
  output SPI_FIN; 
  wire CS, SDO, SCLK, SPI_FIN; 
  reg [7:0] shift_register = 8'h00; 
  reg [3:0] shift_counter = 4'h0; 
  wire clk_divided; 
  reg [1:0] counter = 2'b00; 
  reg temp_sdo = 1'b1; 
  reg falling = 1'b0; 
  parameter Idle = 3'd0, Send = 3'd1, Hold1 = 3'd2, Hold2 = 3'd3, Hold3 = 3'd4, Hold4 = 3'd5, Done = 3'd6; 
  reg [2:0] current_state = Idle; 
  assign clk_divided = ~counter[1]; 
  assign SCLK = clk_divided; 
  assign SDO = temp_sdo; 
  assign CS = (current_state == Idle && SPI_EN == 1'b0) ? 1'b1 : 1'b0; 
  assign SPI_FIN = (current_state == Done) ? 1'b1 : 1'b0; 
  always @(posedge CLK) begin 
  if(RST == 1'b1) begin 
  current_state <= Idle; 
  end 
  else begin 
  case(current_state) 
  Idle : begin 
  if(SPI_EN == 1'b1) begin 
  current_state <= Send; 
  end 
  end 
  Send : begin 
  if(shift_counter == 4'h8 && falling == 1'b0) begin 
  current_state <= Hold1; 
  end 
  end 
  Hold1 : begin 
  current_state <= Hold2; 
  end 
  Hold2 : begin 
  current_state <= Hold3; 
  end 
  Hold3 : begin 
  current_state <= Hold4; 
  end 
  Hold4 : begin 
  current_state <= Done; 
  end 
  Done : begin 
  if(SPI_EN == 1'b0) begin 
  current_state <= Idle; 
  end 
  end 
  default : current_state <= Idle; 
  endcase 
  end 
  end 
  always @(posedge CLK) begin 
  if(current_state == Send) begin 
  counter <= counter + 1'b1; 
  end 
  else begin 
  counter <= 2'b00; 
  end 
  end 
  always @(posedge CLK) begin 
  if(current_state == Idle) begin 
  shift_counter <= 4'h0; 
  shift_register <= SPI_DATA; 
  temp_sdo <= 1'b1; 
  end 
  else if(current_state == Send) begin 
  if(clk_divided == 1'b0 && falling == 1'b0) begin 
  falling <= 1'b1; 
  temp_sdo <= shift_register[7]; 
  shift_register <= {shift_register[6:0],1'b0}; 
  shift_counter <= shift_counter + 1'b1; 
  end 
  else if(clk_divided == 1'b1) begin 
  falling <= 1'b0; 
  end 
  end 
  end 
 endmodule