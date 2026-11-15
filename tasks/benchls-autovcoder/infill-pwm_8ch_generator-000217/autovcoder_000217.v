module autovcoder_000217 (
    input  [7:0] io_in,
    output [7:0] io_out
);

  wire clk = io_in[0];
  wire pset = io_in[1];
  wire [2:0] addr = io_in[4:2];
  wire [2:0] level = io_in[7:5];

  wire [7:0] pwm_out;
  assign io_out[7:0] = pwm_out;

  // This register is used to determine if the execution just started and we need to reset.
  // It's a bullshit implementation and will most likely not work. I am curious to test it anyway.
  // The idea is that initially this register has a somewhat random value. If it does not match what we expect,
  // we're in a reset mode and set this register to the expected state + reset all other registers.
  // This is not a great way, as it does not guarantee anything, but I already use all input pins and
  // like to live dangerously.
  reg [8:0] reset_canary = 0;

  // 3-bit PWM counter that goes from 0 to 7.
  reg [2:0] counter;

  function is_reset(input [8:0] a);
    begin
      is_reset = (a != 8'b01010101);
    end
  endfunction

  // PWM level for channel0.
  // 0 means always off.
  // 1 means that PWM will be on for just 1 clock cycle and then off for the other 6, giving 1/7 on average.
  // 6 means 6/7 on.
  // 7 means always on.
  reg [2:0] pwm0_level;
  // The rest of the channels.
  reg [2:0] pwm1_level;
  reg [2:0] pwm2_level;
  reg [2:0] pwm3_level;
  reg [2:0] pwm4_level;
  reg [2:0] pwm5_level;
  reg [2:0] pwm6_level;
  reg [2:0] pwm7_level;

  function is_on(input [3:0] level, input [3:0] counter);
    begin
      is_on = (counter < level);
    end
  endfunction  // is_on

  assign pwm_out[0] = is_on(pwm0_level, counter);
  assign pwm_out[1] = is_on(pwm1_level, counter);
  assign pwm_out[2] = is_on(pwm2_level, counter);
  assign pwm_out[3] = is_on(pwm3_level, counter);
  assign pwm_out[4] = is_on(pwm4_level, counter);
  assign pwm_out[5] = is_on(pwm5_level, counter);
  assign pwm_out[6] = is_on(pwm6_level, counter);
  assign pwm_out[7] = is_on(pwm7_level, counter);

  // external clock is 1000Hz.
  [MASKED]  // always @ (posedge clk)
endmodule

