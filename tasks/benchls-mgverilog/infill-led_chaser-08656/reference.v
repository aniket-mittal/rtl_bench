module mg_08656 (input nReset,input clock,output reg [7:0] leds);
reg [31:0] timer; 
 reg direction; 
 reg [3:0] position; 
 always @ (posedge clock, negedge nReset) begin 
  if (!nReset) begin 
  leds <= 8'b00000001; 
  timer <= 16'd0; 
  direction <= 1'b1; 
  position <= 4'd0; 
  end else begin 
  timer <= timer + 32'd1; 
  if (timer >= 32'd4000000) begin 
  case(position) 
  4'd0:leds <= 8'b00000001; 
  4'd1:leds <= 8'b00000010; 
  4'd2:leds <= 8'b00000100; 
  4'd3:leds <= 8'b00001000; 
  4'd4:leds <= 8'b00010000; 
  4'd5:leds <= 8'b00100000; 
  4'd6:leds <= 8'b01000000; 
  4'd7:leds <= 8'b10000000; 
  endcase 
  if (direction) begin 
  if (position == 4'd7) begin 
  position <= 4'd6; 
  direction <= 1'b0; 
  end else begin 
  position <= position + 4'd1; 
  end 
  end else begin 
  if (position == 4'd0) begin 
  position <= 4'd1; 
  direction <= 1'b1; 
  end else begin 
  position <= position - 4'd1; 
  end 
  end 
  timer <= 16'd0; 
  end 
  end 
 end 
 endmodule