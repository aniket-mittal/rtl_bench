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

  always @(posedge clk) begin  //posedge because we are looking for the rising edge of the trigger 
    if (reset) begin
      dac_start_out <= 0;
      state <= s_wait_for_start;
    end else begin
      case (state)
        s_wait_for_start: begin
          dac_start_out <= 0;
          if (1 == start) begin
            state <= s_wait_for_trig_high;
          end
        end

        s_wait_for_trig_high: begin
          dac_start_out <= 0;
          if (1 == trigger) begin
            state <= s_wait_for_stop;
            dac_start_out <= 1;
          end
        end

        s_wait_for_stop: begin
          dac_start_out <= 1;
          if (0 == start) begin
            state <= s_wait_for_start;
          end
        end

        default: state <= s_wait_for_start;

      endcase
    end
  end
endmodule

