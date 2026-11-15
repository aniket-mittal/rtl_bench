module mg_09117(CLK,RST,SPI_EN,SPI_DATA,SDO,SCLK,SPI_FIN);
input CLK; 
  input RST; 
  input SPI_EN; 
  input [7:0] SPI_DATA; 
  output SDO; 
  output SCLK; 
  output SPI_FIN; 
  wire SDO, SCLK, SPI_FIN; 
  reg [39:0] current_state = "Idle"; 
  reg [7:0] shift_register = 8'h00; 
  reg [3:0] shift_counter = 4'h0; 
  wire clk_divided; 
  reg [4:0] counter = 5'b00000; 
  reg temp_sdo = 1'b1; 
  reg falling = 1'b0; 
  assign clk_divided = ~counter[4]; 
  assign SCLK = clk_divided; 
  assign SDO = temp_sdo; 
  assign SPI_FIN = (current_state == "Done") ? 1'b1 : 1'b0; 
  always @(posedge CLK) begin 
  if(RST == 1'b1) begin 
  current_state <= "Idle"; 
  end 
  else begin 
  case(current_state) 
  "Idle" : begin 
  if(SPI_EN == 1'b1) begin 
  current_state <= "Send"; 
  end 
  end 
  "Send" : begin 
  if(shift_counter == 4'h8 && falling == 1'b0) begin 
  current_state <= "Done"; 
  end 
  end 
  "Done" : begin 
  if(SPI_EN == 1'b0) begin 
  current_state <= "Idle"; 
  end 
  end 
  default : current_state <= "Idle"; 
  endcase 
  end 
  end 
  always @(posedge CLK) begin 
  if(current_state == "Send") begin 
  counter <= counter + 1'b1; 
  end 
  else begin 
  counter <= 5'b00000; 
  end 
  end 
  always @(posedge CLK) begin 
  if(current_state == "Idle") begin 
  shift_counter <= 4'h0; 
  shift_register <= SPI_DATA; 
  temp_sdo <= 1'b1; 
  end 
  else if(current_state == "Send") begin 
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