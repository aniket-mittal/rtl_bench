module bandwidth_throttle(
    clk
    ,holdoff
    ,ready_in
    ,valid_in
    ,ready_out
    ,valid_out
  );
  input clk;
  input holdoff;
  input ready_in;
  input valid_in;

  output ready_out;
  output valid_out;

  [MASKED]
  assign valid_out = valid_in & !holdoff;

endmodule