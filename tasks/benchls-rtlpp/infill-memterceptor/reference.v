module memterceptor(ADR, FFT_DATA, MEM_DATA, WRITE, ADR_IS_FFT, ADR_IS_MEM, FFT_WRITE, MEM_WRITE, READ_DATA);
  input [7:0] ADR;
  input [7:0] FFT_DATA;
  input [7:0] MEM_DATA;
  input WRITE;
  output ADR_IS_FFT;
  output ADR_IS_MEM;
  output FFT_WRITE;
  output MEM_WRITE;
  output [7:0] READ_DATA;

  supply1 vdd;
  supply0 gnd;
  wire net_12;
  wire net_0, net_1, net_2;

  // Inlined LF_Adder__and2_1x and2_1x_0
  assign FFT_WRITE = WRITE & ADR_IS_FFT;

  // Inlined LF_Adder__and2_1x and2_1x_1
  assign MEM_WRITE = WRITE & ADR_IS_MEM;

  // Inlined LF_Adder__and3_1x and3_1x_0
  assign net_12 = ADR[7] & ADR[6] & ADR[5];

  // Inlined LF_Adder__nand3_1x nand3_1x_0
  assign ADR_IS_MEM = ~(net_12 & ADR[4] & ADR[3]);

  // Inlined LF_Adder__inv_1x inv_1x_1
  assign ADR_IS_FFT = ~ADR_IS_MEM;

  // Inlined LF_Adder__buftri8_c_1x buftri8__0
  assign READ_DATA = ADR_IS_MEM ? MEM_DATA : 8'bz;

  // Inlined LF_Adder__buftri8_c_1x buftri8__1
  assign READ_DATA = ADR_IS_FFT ? FFT_DATA : 8'bz;
endmodule