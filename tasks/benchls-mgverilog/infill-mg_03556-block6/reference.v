module mg_03556(input wire clk, res,input wire sensorA,input wire sensorB,output wire [3:0] car_count);
localparam abUnblocked=2'b00, aBlocked=2'b01, abBlocked=2'b10, bBlocked=2'b11; 
 reg [1:0] current_state; 
 reg increase, decrease; 
 reg [3:0] count = 0; 
 initial begin 
  increase = 0; 
  decrease = 0; 
  current_state = 0; 
 end 
 always@(posedge clk, posedge res) begin 
  if (res) 
  current_state <= abUnblocked; 
  else 
  begin 
  increase <= 0; 
  decrease <= 0; 
  case(current_state) 
  abUnblocked: if ({sensorA,sensorB} == 2'b10) begin 
  current_state <= aBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b01) begin 
  current_state <= bBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b00) begin 
  current_state <= abUnblocked; 
  end 
  aBlocked: if ({sensorA,sensorB} == 2'b10) begin 
  current_state <= aBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b11) begin 
  current_state <= abBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b00) begin 
  current_state <= abUnblocked; 
  decrease <= 1; 
  end 
  abBlocked: if ({sensorA,sensorB} == 2'b10) begin 
  current_state <= aBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b11) begin 
  current_state <= abBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b01) begin 
  current_state <= bBlocked; 
  end 
  bBlocked: if ({sensorA,sensorB} == 2'b00) begin 
  current_state <= abUnblocked; 
  increase <= 1; 
  end 
  else if ({sensorA,sensorB} == 2'b11) begin 
  current_state <= abBlocked; 
  end 
  else if ({sensorA,sensorB} == 2'b01) begin 
  current_state <= bBlocked; 
  end 
  default: current_state <= abUnblocked; 
  endcase 
  if(increase) 
  count <= count + 1'b1; 
  else if(decrease) 
  count <= count - 1'b1; 
  end 
 end 
 assign car_count = count; 
 endmodule