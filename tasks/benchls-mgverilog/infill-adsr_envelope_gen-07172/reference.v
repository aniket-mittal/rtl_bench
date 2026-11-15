module mg_07172( clk, GATE, A, D, S, R, sout);
output reg [31:0] sout; 
  input wire clk; 
  input wire GATE; 
  input wire [31:0] A; 
  input wire [31:0] D; 
  input wire [31:0] S; 
  input wire [31:0] R; 
  reg [2:0] state; 
  initial begin 
  state = 3'b000; 
  sout = 0; 
  end 
  parameter IDLE = 3'b000; 
  parameter ATTACK = 3'b001; 
  parameter DECAY = 3'b010; 
  parameter SUSTAIN = 3'b011; 
  parameter RELEASE = 3'b100; 
  always @ ( posedge clk ) 
  begin 
  case ( state ) 
  IDLE: 
  begin 
  state <= ( GATE == 1'b1 ) ? ATTACK : IDLE; 
  end 
  ATTACK: 
  begin 
  if ( GATE == 1'b1 ) begin 
  if ( (sout + A) <= {1'b0,{32{1'b1}}} ) begin 
  sout <= sout + A; 
  end else begin 
  sout <= {32{1'b1}}; 
  end 
  end 
  if ( GATE == 1'b0 ) begin 
  state <= RELEASE; 
  end else begin 
  if ( (sout + A) > {1'b0,{32{1'b1}}} ) begin 
  state <= DECAY; 
  end 
  end 
  end 
  DECAY: 
  begin 
  if ( GATE == 1'b1 ) begin 
  if ((sout-D) > S) begin 
  sout <= sout - D; 
  end else begin 
  sout <= S; 
  end 
  end 
  if ( GATE == 1'b1 ) begin 
  if ( sout == S) begin 
  state <= SUSTAIN; 
  end 
  end else if ( GATE == 1'b0 ) begin 
  state <= RELEASE; 
  end 
  end 
  SUSTAIN: 
  begin 
  if ( GATE == 1'b0 ) state <= RELEASE; 
  end 
  RELEASE: 
  begin 
  if ( GATE == 1'b0 ) begin 
  if ( sout > R ) begin 
  sout <= (sout - R); 
  end else begin 
  sout <= 0; 
  end 
  end else if ( GATE == 1'b1 ) begin 
  sout <= 0; 
  end 
  if ( GATE == 1'b1 ) begin 
  state <= ATTACK; 
  end else begin 
  if ( sout == 0 ) begin 
  state <= IDLE; 
  end 
  end 
  end 
  endcase 
  end 
 endmodule