module rtlpp_02959 (start_impulse, clk, Data_out, end_of_work);

  input start_impulse;
  input clk;
  output reg [3:0] Data_out = 4'b0000;
  output wire end_of_work;

  reg start_work = 1'b0;
  reg device_in_work = 1'b0;
  reg reset_device = 1'b0;
  integer i = 0;   

  always @ (posedge start_impulse or posedge device_in_work)
  begin  
    if (device_in_work)
      start_work <= 1'b0;
    else
      start_work <= 1'b1;
  end

  always @ (posedge clk)
  begin
    if (start_work == 1'b1)
      device_in_work <= 1'b1;
    else
      device_in_work <= 1'b0;

    if (device_in_work == 1'b1)
    begin
      if (i < 13)
      begin
        case (i)
          0:  Data_out <= 4'b1000;
          1:  Data_out <= 4'b0100;
          2:  Data_out <= 4'b1100;
          3:  Data_out <= 4'b0010;
          4:  Data_out <= 4'b1010;
          5:  Data_out <= 4'b0110;
          6:  Data_out <= 4'b1110;
          7:  Data_out <= 4'b0001;
          8:  Data_out <= 4'b1001;
          9:  Data_out <= 4'b0101;
          10: Data_out <= 4'b1101;
          11: 
          begin
            Data_out <= 4'b0000;
            reset_device <= 1'b1;
          end
          default:
          begin
            Data_out <= 4'b0000;
            reset_device <= 1'b0;
          end
        endcase
        i <= i + 1;
      end
      else
      begin
        i <= 0;
        device_in_work <= 1'b0;
      end
    end
  end 

  assign end_of_work = device_in_work && reset_device;

endmodule