module rtlpp_03785(A, ADR_MATCH, EN);
  input [7:0] A;
  output ADR_MATCH;
  output [7:0] EN;

  supply1 vdd;
  supply0 gnd;
  wire net_106, net_108, net_116, net_12, net_15, net_18, net_21, net_23;
  wire net_25, net_3, net_6, net_9, net_93;
  wire [2:0] nA;

  wire en0, en1, en2, en3, en4, en5, en6, en7;

  assign ADR_MATCH = net_108 & A[4] & A[3];

  assign nA[2] = ~A[2];
  assign nA[1] = ~A[1];
  assign nA[0] = ~A[0];

  assign net_21 = A[0];
  assign net_23 = A[1];
  assign net_25 = A[2];

  assign net_18 = ~(net_23 | net_25);
  assign net_15 = ~(net_25 | net_21);
  assign net_12 = ~(nA[0] | nA[1]);
  assign net_9 = ~(net_21 | net_23);
  assign net_6 = ~(nA[0] | nA[2]);
  assign net_3 = ~(nA[1] | nA[2]);
  assign net_93 = ~(net_21 | net_23 | net_25);

  assign en0 = net_93 & ADR_MATCH;
  assign en1 = net_18 & net_21 & ADR_MATCH;
  assign en2 = net_15 & net_23 & ADR_MATCH;
  assign en3 = net_12 & nA[2] & ADR_MATCH;
  assign en4 = net_9 & net_25 & ADR_MATCH;
  assign en5 = nA[1] & net_6 & ADR_MATCH;
  assign en6 = nA[0] & net_3 & ADR_MATCH;
  assign en7 = (~(net_21 | net_23 | net_25)) & ADR_MATCH;

  assign EN = {en7, en6, en5, en4, en3, en2, en1, en0};

  assign net_108 = A[7] & A[6] & A[5];

  assign net_116 = net_108 & A[4] & A[3];

endmodule