module rtlpp_01007
(
  input  wire       clk_in,       
  input  wire       rst_in,       
  input  wire [3:0] mute_in,      
  input  wire [3:0] pulse0_in,    
  input  wire [3:0] pulse1_in,    
  input  wire [3:0] triangle_in,  
  input  wire [3:0] noise_in,     
  output wire       audio_out     
);

reg [3:0] pulse0;
reg [3:0] pulse1;
reg [3:0] triangle;
reg [3:0] noise;

reg [4:0] pulse_in_total;
reg [5:0] pulse_out;

reg [6:0] tnd_in_total;
reg [5:0] tnd_out;

reg [5:0] mixed_out;

[MASKED]

reg  [5:0] q_pwm_cnt;
wire [5:0] d_pwm_cnt;

always @(posedge clk_in)
  begin
    if (rst_in)
      begin
        q_pwm_cnt  <= 6'h0;
      end
    else
      begin
        q_pwm_cnt  <= d_pwm_cnt;
      end
  end

assign d_pwm_cnt = q_pwm_cnt + 4'h1;

always @(*)
begin
  pulse0   = (mute_in[0]) ? 4'h0 : pulse0_in;
  pulse1   = (mute_in[1]) ? 4'h0 : pulse1_in;
  triangle = (mute_in[2]) ? 4'h0 : triangle_in;
  noise    = (mute_in[3]) ? 4'h0 : noise_in;
end

assign audio_out = mixed_out > q_pwm_cnt;

endmodule