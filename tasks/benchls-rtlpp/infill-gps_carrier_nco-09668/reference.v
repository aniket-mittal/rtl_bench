module rtlpp_09668 (clk, rstn, tic_enable, f_control, carrier_val, i_sign, i_mag, q_sign, q_mag);

  input clk, rstn, tic_enable;
  input [28:0] f_control;
  output reg [31:0] carrier_val;
  output reg i_sign, i_mag; 
  output reg q_sign, q_mag; 

  reg [29:0] accum_reg;
  reg [21:0] cycle_count_reg;
   
  wire [3:0] phase_key;
  wire [30:0] accum_sum;
  wire accum_carry;
  wire [31:0] combined_carr_value;
  
  always @(posedge clk or negedge rstn)
  begin
    if (!rstn)
      accum_reg <= 0;
    else
      accum_reg <= accum_sum[29:0];
  end

  assign accum_sum = {1'b0, accum_reg} + {2'b0, f_control};
  assign accum_carry = accum_sum[30];
  assign phase_key = accum_sum[29:26];
   
  assign combined_carr_value[9:0] = accum_reg[29:20];
  assign combined_carr_value[31:10] = cycle_count_reg;

  always @(posedge clk or negedge rstn)
  begin
    if (!rstn) 
      cycle_count_reg <= 0;
    else if (tic_enable)
    begin
      carrier_val <= combined_carr_value; 
      cycle_count_reg <= 0; 
    end
    else if (accum_carry)
      cycle_count_reg <= cycle_count_reg + 1;
  end

  always @(*)
  begin
    case (phase_key)
      15, 0:
      begin
        i_sign = 0;
        i_mag  = 0;
        q_sign = 1;
        q_mag  = 1;
      end
      1, 2:
      begin
        i_sign = 1;
        i_mag  = 0;
        q_sign = 1;
        q_mag  = 1;
      end
      3, 4:
      begin
        i_sign = 1;
        i_mag  = 1;
        q_sign = 1;
        q_mag  = 0;
      end
      5, 6:
      begin
        i_sign = 1;
        i_mag  = 1;
        q_sign = 0;
        q_mag  = 0;
      end
      7, 8:
      begin
        i_sign = 1;
        i_mag  = 0;
        q_sign = 0;
        q_mag  = 1;
      end
      9, 10:
      begin
        i_sign = 0;
        i_mag  = 0;
        q_sign = 0;
        q_mag  = 1;
      end
      11, 12:
      begin
        i_sign = 0;
        i_mag  = 1;
        q_sign = 0;
        q_mag  = 0;
      end
      13, 14:
      begin
        i_sign = 0;
        i_mag  = 1;
        q_sign = 1;
        q_mag  = 0;
      end
      default:
      begin
        i_sign = 0;
        i_mag  = 0;
        q_sign = 0;
        q_mag  = 0;
      end
    endcase 
  end

endmodule