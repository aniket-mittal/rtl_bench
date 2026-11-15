module rtlpp_08211
  (
    clk,
    reset,
    enb,
    processDataIn,
    validIn,
    dumping,
    outputData,
    processData,
    dumpOrValid
  );

  input  clk;
  input  reset;
  input  enb;
  input  processDataIn;
  input  validIn;
  input  dumping;
  input  outputData;
  
  output processData;
  output dumpOrValid;

  wire processNull;
  reg  validREG;
  wire validOrDumping;
  wire processValid;

  assign processNull = 1'b0;

  always @(posedge clk or posedge reset)
  begin : reg_rsvd_process
    if (reset == 1'b1) begin
      validREG <= 1'b0;
    end
    else if (enb) begin
      validREG <= validIn;
    end
  end

  assign validOrDumping = validREG | dumping;
  assign processValid = processDataIn & validOrDumping;
  assign processData = (outputData == 1'b0 ? processNull : processValid);
  assign dumpOrValid = validOrDumping;

endmodule