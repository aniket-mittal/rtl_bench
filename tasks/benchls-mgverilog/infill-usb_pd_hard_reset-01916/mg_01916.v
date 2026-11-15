module mg_01916(output wire Start_tHardResetComplete_timer,output wire Request_PHY_to_Send_Hard_Reset,output wire Request_PHY_to_Send_Cable_Reset,output wire Stop_PHY_attempting_to_send_Hard_Reset,output wire Stop_PHY_attempting_to_send_Cable_Reset,output wire Stop_tHardResetComplete_timer,output wire ALERT_TransmitSuccessful,output wire ALERT_TransmitSOP_MessageFailed,input wire [2:0] TRANSMIT,input wire tHard_Reset_Complete_expires,input wire Hard_Reset_sent,input wire Cable_Reset_sent,input wire tHardResetComplete_expires,input wire RESET,input wire CLK);
wire Hard_Reset_Request; 
  wire Cable_Reset_Request; 
  reg [5:0] CurrentState; 
  reg [5:0] NextState; 
  reg [8:0] HardResetComplete_timer; 
  localparam Wait_for_Reset_Request = 6'b000001; 
  localparam Construct_Message = 6'b000010; 
  localparam Wait_for_Hard_Reset_sent = 6'b000100; 
  localparam Wait_for_Cable_Reset_sent = 6'b001000; 
  localparam Success = 6'b010000; 
  localparam Failure = 6'b100000; 
  assign Hard_Reset_Request = TRANSMIT[2] && !TRANSMIT[1] && TRANSMIT[0]; 
  assign Cable_Reset_Request= TRANSMIT[2] && TRANSMIT[1] && !TRANSMIT[0]; 
  assign Request_PHY_to_Send_Hard_Reset = Hard_Reset_Request && CurrentState==Construct_Message; 
  assign Request_PHY_to_Send_Cable_Reset= Cable_Reset_Request && CurrentState==Construct_Message; 
  assign Start_tHardResetComplete_timer = CurrentState==Construct_Message; 
  assign Stop_PHY_attempting_to_send_Hard_Reset = CurrentState==Failure; 
  assign Stop_PHY_attempting_to_send_Cable_Reset= CurrentState==Failure; 
  assign ALERT_TransmitSOP_MessageFailed= CurrentState==Failure; 
  assign Stop_tHardResetComplete_timer = CurrentState==Success; 
  assign ALERT_TransmitSuccessful = CurrentState==Success; 
  [MASKED] 
  always@(posedge CLK) 
  begin 
  if(RESET) CurrentState <= Wait_for_Reset_Request; 
  else CurrentState <= NextState; 
  end 
 endmodule