module rtlpp_03015 (
  input [7:0] io_in,
  output [7:0] io_out
);

  wire clk = io_in[0];
  wire reset = io_in[1];
  wire sclk = io_in[2];
  wire cs = io_in[3];
  wire mosi = io_in[4];

  wire [6:0] pwm_out;
  assign io_out[6:0] = pwm_out;
  wire miso;
  assign io_out[7] = miso;

  reg prev_sclk;
  reg [2:0] spi_counter;
  reg is_writing;
  reg is_reading;
  reg [2:0] cur_addr;
  reg [7:0] in_buf;
  reg [7:0] out_buf;
  reg [7:0] counter;
  reg [7:0] pwm_level[6:0];
  
  assign miso = out_buf[7];
  
  function automatic is_on(input [7:0] level, input[7:0] counter);
    is_on = (counter < level);
  endfunction

  assign pwm_out[0] = is_on(pwm_level[0], counter);
  assign pwm_out[1] = is_on(pwm_level[1], counter);
  assign pwm_out[2] = is_on(pwm_level[2], counter);
  assign pwm_out[3] = is_on(pwm_level[3], counter);
  assign pwm_out[4] = is_on(pwm_level[4], counter);
  assign pwm_out[5] = is_on(pwm_level[5], counter);
  assign pwm_out[6] = is_on(pwm_level[6], counter);

  always @(posedge clk) begin
    
    if (reset) begin
      counter <= 0;
      pwm_level[0] <= 0;
      pwm_level[1] <= 0;
      pwm_level[2] <= 0;
      pwm_level[3] <= 0;
      pwm_level[4] <= 0;
      pwm_level[5] <= 0;
      pwm_level[6] <= 0;
    end else begin 
      if (counter == 254) begin
        counter <= 0;
      end else begin
        counter <= counter + 1'b1;
      end
    end 

    if (reset || cs) begin
      in_buf <= 0;
      out_buf <= 0;
      prev_sclk <= 0;
      spi_counter <= 0;
      is_writing <= 0;
      is_reading <= 0;
      cur_addr <= 0;
    end 

    if (~reset && ~cs && (prev_sclk != sclk)) begin
      if (sclk) begin
        in_buf <= (in_buf << 1) | mosi;
        spi_counter <= spi_counter + 1'b1;
      end else begin
        if ((spi_counter == 0) && is_writing) begin
          if (cur_addr <= 6) begin
            pwm_level[cur_addr] <= in_buf;
          end
          is_writing <= 0;
          is_reading <= 1;
        end 
        if ((spi_counter == 0) && ~is_writing) begin
          if (in_buf[7]) begin
            is_writing <= 1;
          end else begin
            is_reading <= 1;
          end
          cur_addr <= in_buf[2:0];
        end 
        if ((spi_counter == 1) && is_reading) begin
          if (cur_addr <= 6) begin
            out_buf <= pwm_level[cur_addr];
          end else begin
            out_buf <= 0;
          end
          is_reading <= 0;
          cur_addr <= 0;
        end else begin 
          out_buf <= out_buf << 1;
        end
      end
      prev_sclk <= sclk;
    end 
  end 
endmodule