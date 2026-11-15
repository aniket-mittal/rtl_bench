module mg_10121 (input Reset_n_i,input Clk_i,input SPI_FSM_Start,input SPI_Transmission_i,output reg MAX6682CS_n_o,output reg SPI_Write_o,output reg SPI_ReadNext_o,output reg SPI_FSM_Done,input [7:0] SPI_Data_i,output reg [7:0] Byte0,output reg [7:0] Byte1);
localparam stIdleSPI = 3'b000; 
  localparam stWrite1 = 3'b001; 
  localparam stWrite2 = 3'b010; 
  localparam stWait = 3'b011; 
  localparam stRead1 = 3'b100; 
  localparam stRead2 = 3'b101; 
  localparam stPause = 3'b110; 
  reg [2:0] SPI_FSM_State; 
  reg [2:0] SPI_FSM_NextState; 
  reg SPI_FSM_Wr1; 
  reg SPI_FSM_Wr0; 
  always @(negedge Reset_n_i or posedge Clk_i) 
  begin 
  if (!Reset_n_i) 
  begin 
  SPI_FSM_State <= stIdleSPI; 
  end 
  else 
  begin 
  SPI_FSM_State <= SPI_FSM_NextState; 
  end 
  end 
  always @(SPI_FSM_State, SPI_FSM_Start, SPI_Transmission_i) 
  begin 
  SPI_FSM_NextState = SPI_FSM_State; 
  MAX6682CS_n_o = 1'b1; 
  SPI_Write_o = 1'b0; 
  SPI_ReadNext_o = 1'b0; 
  SPI_FSM_Wr1 = 1'b0; 
  SPI_FSM_Wr0 = 1'b0; 
  SPI_FSM_Done = 1'b0; 
  case (SPI_FSM_State) 
  stIdleSPI: begin 
  if (SPI_FSM_Start == 1'b1) 
  begin 
  SPI_FSM_NextState = stWrite1; 
  MAX6682CS_n_o = 1'b0; 
  SPI_Write_o = 1'b1; 
  end 
  end 
  stWrite1: begin 
  SPI_FSM_NextState = stWrite2; 
  MAX6682CS_n_o = 1'b0; 
  SPI_Write_o = 1'b1; 
  end 
  stWrite2: begin 
  SPI_FSM_NextState = stWait; 
  MAX6682CS_n_o = 1'b0; 
  end 
  stWait: begin 
  MAX6682CS_n_o = 1'b0; 
  if (SPI_Transmission_i == 1'b0) begin 
  SPI_FSM_NextState = stRead1; 
  SPI_ReadNext_o = 1'b1; 
  SPI_FSM_Wr1 = 1'b1; 
  end 
  end 
  stRead1: begin 
  SPI_FSM_NextState = stRead2; 
  MAX6682CS_n_o = 1'b0; 
  SPI_ReadNext_o = 1'b1; 
  SPI_FSM_Wr0 = 1'b1; 
  end 
  stRead2: begin 
  SPI_FSM_NextState = stPause; 
  SPI_FSM_Done = 1'b1; 
  end 
  stPause: begin 
  SPI_FSM_NextState = stIdleSPI; 
  SPI_FSM_Done = 1'b1; 
  end 
  default: begin 
  end 
  endcase 
  end 
  always @(negedge Reset_n_i or posedge Clk_i) 
  begin 
  if (!Reset_n_i) 
  begin 
  Byte0 <= 8'd0; 
  Byte1 <= 8'd0; 
  end 
  else 
  begin 
  if (SPI_FSM_Wr0) 
  begin 
  Byte0 <= SPI_Data_i; 
  end 
  if (SPI_FSM_Wr1) 
  begin 
  Byte1 <= SPI_Data_i; 
  end 
  end 
  end 
 endmodule