module autovcoder_024990 (
    input clk,  //dac clock expected
    input reset,  //dac reset expected
    input start,  //the start signal synced to dac clock expected
    input trigger,	   //the trigger synced to dac clock to look for before setting dac_start high, usually the reset pulse (ie when integrator reset starts)
    output dac_start		//this goes high when we are ready to write to the dac, aka just after the reset
);

  reg [0:2] state;

  //parameter s_reset = 2'b00;
  parameter s_wait_for_start = 2'b00;
  parameter s_wait_for_trig_high = 2'b01;
  parameter s_wait_for_stop = 2'b10;

  reg dac_start_out;

  assign dac_start = dac_start_out;

  //always @ (posedge clk or posedge reset) begin

  [MASKED]
endmodule

