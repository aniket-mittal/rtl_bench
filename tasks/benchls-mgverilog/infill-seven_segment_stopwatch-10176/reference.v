module mg_10176(clock,reset,pause,reverse,data);
input clock; 
 input reset; 
 input pause; 
 input reverse; 
 output reg [6:0] data; 
  reg [6:0] temp_data; 
 parameter ZERO = 7'b1111110; 
 parameter ONE = 7'b0110000; 
 parameter TWO = 7'b1101101; 
 parameter THREE = 7'b1101101; 
 parameter FOUR = 7'b0110011; 
 parameter FIVE = 7'b1011011; 
 parameter SIX = 7'b1011011; 
 parameter SEVEN = 7'b1110000; 
 parameter EIGHT = 7'b1111111; 
 parameter NINE = 7'b1111011; 
 parameter PAUSE = 7'b1100111; 
 parameter HOLD = 7'b0110111; 
 always @ ( posedge clock ) begin 
  if (pause==0) 
  data <= PAUSE; 
  else 
  data <= temp_data; 
  case(reset) 
  0: temp_data <= HOLD; 
  1: case (pause) 
  0: temp_data <= temp_data; 
  default: case (temp_data) 
  HOLD: case (reverse) 
  0: temp_data <= ZERO; 
  default: temp_data <= NINE; 
  endcase 
  ZERO: case (reverse) 
  0: temp_data <= ONE; 
  default: temp_data <= NINE; 
  endcase 
  ONE: case (reverse) 
  0: temp_data <= TWO; 
  default: temp_data <= ZERO; 
  endcase 
  TWO: case (reverse) 
  0: temp_data <= THREE; 
  default: temp_data <= ONE; 
  endcase 
  THREE: case (reverse) 
  0: temp_data <= FOUR; 
  default: temp_data <= TWO; 
  endcase 
  FOUR: case (reverse) 
  0: temp_data <= FIVE; 
  default: temp_data <= THREE; 
  endcase 
  FIVE: case (reverse) 
  0: temp_data <= SIX; 
  default: temp_data <= FOUR; 
  endcase 
  SIX: case (reverse) 
  0: temp_data <= SEVEN; 
  default: temp_data <= FIVE; 
  endcase 
  SEVEN: case (reverse) 
  0: temp_data <= EIGHT; 
  default: temp_data <= SIX; 
  endcase 
  EIGHT: case (reverse) 
  0: temp_data <= NINE; 
  default: temp_data <= SEVEN; 
  endcase 
  NINE: case (reverse) 
  0: temp_data <= ZERO; 
  default: temp_data <= EIGHT; 
  endcase 
  default:temp_data <= HOLD; 
  endcase 
  endcase 
  endcase 
 end 
 endmodule