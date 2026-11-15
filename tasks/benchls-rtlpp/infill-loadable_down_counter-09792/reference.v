module rtlpp_09792(load, input_number , clock, borrow, counter_output);

  input clock , load; 
  input [3:0] input_number;

  output reg [3:0] counter_output;
  output reg borrow;

  always@( posedge clock ) begin
    if (load) 
      {borrow, counter_output} <= {1'b0, input_number};
    else 
      {borrow, counter_output} <= {borrow, counter_output} - 1;
  end

endmodule