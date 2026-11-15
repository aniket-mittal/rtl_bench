module mg_03315(clk, ar, start, stop, ctr_en, ctr_ar);
parameter [1:0] IDLE=2'b00, PRERUN=2'b01, RUN=2'b10, STOPPED=2'b11; 
  parameter start_assert = 1'b1; 
  parameter stop_assert = 1'b0; 
  input clk, ar, start, stop; 
  output ctr_en, ctr_ar; 
  reg [1:0] state; 
  assign ctr_en = (state==RUN); 
  assign ctr_ar = ~(state==PRERUN|state==IDLE); 
  always @ (posedge clk or negedge ar) 
  begin 
  if(~ar) 
  begin 
  state <= IDLE; 
  end else 
  begin 
  case(state) 
  IDLE:begin 
  if(start==start_assert) 
  begin 
  state<=PRERUN; 
  end else 
  begin 
  state<=IDLE; 
  end 
  end 
  PRERUN:begin 
  if(stop==stop_assert) 
  begin 
  state<=STOPPED; 
  end else 
  begin 
  state<=RUN; 
  end 
  end 
  RUN:begin 
  if(stop==stop_assert) 
  begin 
  state<=STOPPED; 
  end 
  else begin 
  state<=RUN; 
  end 
  end 
  default:begin 
  if(start==~start_assert) 
  begin 
  state<=IDLE; 
  end else 
  begin 
  state<=STOPPED; 
  end 
  end 
  endcase 
  end 
  end 
  endmodule