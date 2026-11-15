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

  [MASKED] 

  assign end_of_work = device_in_work && reset_device;

endmodule