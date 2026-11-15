// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 84;
  localparam OW = 81;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097740 dut (
    .sm_clk(clk),
    .reset(in_vec[83:83]),
    .start_request_a(in_vec[82:82]),
    .start_request_b(in_vec[81:81]),
    .target_state_machine_finished(in_vec[80:80]),
    .input_arguments_a(in_vec[79:48]),
    .input_arguments_b(in_vec[47:16]),
    .in_received_data(in_vec[15:0]),
    .output_arguments(out_vec[80:49]),
    .start_target_state_machine(out_vec[48:48]),
    .finish_a(out_vec[47:47]),
    .finish_b(out_vec[46:46]),
    .reset_start_request_a(out_vec[45:45]),
    .reset_start_request_b(out_vec[44:44]),
    .received_data_a(out_vec[43:28]),
    .received_data_b(out_vec[27:12]),
    .state(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 84'h9567a40447d3ce874d37e;
    stim[1] = 84'haa5f605b13e48b22dd44e;
    stim[2] = 84'h003806b99b1a18afd9806;
    stim[3] = 84'h3658a568a1da900512d3b;
    stim[4] = 84'h2fb2ea83e7a450f74d153;
    stim[5] = 84'h36e1c0b9edd101c4cee8e;
    stim[6] = 84'h25db6cb76cde85c20f4dd;
    stim[7] = 84'h23d2e4957e883598f774a;
    stim[8] = 84'h4891cfdacee953026c8b4;
    stim[9] = 84'h5e95675ac16dbcc7a49eb;
    stim[10] = 84'h180d6bef3b19007fad82b;
    stim[11] = 84'h57f71d5190e21a04c2c63;
    stim[12] = 84'h729da6264670c12a41de9;
    stim[13] = 84'h58a046d76487bde68f94c;
    stim[14] = 84'h37b8d0f207f436eeb0172;
    stim[15] = 84'h689933fc882165642794b;
    stim[16] = 84'h22b0d162e42eb513376d4;
    stim[17] = 84'h3d07dbe3797fb45d8b760;
    stim[18] = 84'h08e6fc50d0cdd622ab873;
    stim[19] = 84'h7fbc6dfa05999c9318693;
    stim[20] = 84'h403509a1e11cbb04b7f55;
    stim[21] = 84'h4bb5bfeed7985d147396b;
    stim[22] = 84'h712834743d5d1f4fbeeaf;
    stim[23] = 84'h03ce7339d9fc6947b3a67;
    stim[24] = 84'h595c06ee4291b50eaf103;
    stim[25] = 84'h4638ea04aeedfe4251e30;
    stim[26] = 84'h23b5ce83fa2cc80c55165;
    stim[27] = 84'h00dce8f06c9cb004b8b15;
    stim[28] = 84'h7a5386c8ec1e2805b113f;
    stim[29] = 84'h736082edac7c9c8a02364;
    stim[30] = 84'h388376646cd68a0f27745;
    stim[31] = 84'h0e906902ce7c8feee228f;
    stim[32] = 84'h11aaa7aa80de702954d97;
    stim[33] = 84'h103d773c4cb2d0229233b;
    stim[34] = 84'h3834aaa23088b4cb5a232;
    stim[35] = 84'h4bb91a5ae071c3fccf6ed;
    stim[36] = 84'h614324561ec2216444568;
    stim[37] = 84'h28000da3184ce2704fedb;
    stim[38] = 84'h3394ebcdfddb381ffdb0e;
    stim[39] = 84'h45501dd545a86e659c13f;
    stim[40] = 84'h2889775e401c408613dad;
    stim[41] = 84'h5112d50b6578d5be0340b;
    stim[42] = 84'h2bba192da30f9d3adb350;
    stim[43] = 84'h1c60d66d56296ee14c29d;
    stim[44] = 84'h10e615f82131f144c67ea;
    stim[45] = 84'h1d0a9a9fe8cb5f4886729;
    stim[46] = 84'h66c47e9166393fe011116;
    stim[47] = 84'h57ff0f4718c609a12ea63;
    stim[48] = 84'h672d3d45d5720dee3edf0;
    stim[49] = 84'h72215be2773013a7f0559;
    stim[50] = 84'h0dfdd0a4d68a3709c78d3;
    stim[51] = 84'h481440fdef4b726580721;
    stim[52] = 84'h795eed676140763b6a18f;
    stim[53] = 84'h6a11a87a432b99693484d;
    stim[54] = 84'h131959f0e36ccafb39030;
    stim[55] = 84'h258972c92e3f0addeacbe;
    stim[56] = 84'h452617676402975f15c4b;
    stim[57] = 84'h7af9293dbf0866fa0dd80;
    stim[58] = 84'h0c8d265a04c46fb2308cc;
    stim[59] = 84'h0f167fe30805e2c4deab4;
    stim[60] = 84'h3aba442f8dba12631f4aa;
    stim[61] = 84'h6a80d081b222ed7ad3e3e;
    stim[62] = 84'h5d31a459e4385212fecbc;
    stim[63] = 84'h3f06fc9f55ea33b643d7d;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 81'h000000000000000000001;
      expv[1] = 81'h000000000000000000001;
      expv[2] = 81'h000000000000000000001;
      expv[3] = 81'h000000000000000000020;
      expv[4] = 81'h03b5200a2000000000040;
      expv[5] = 81'h03b5200a3000000000080;
      expv[6] = 81'h03b5200a2000000000100;
      expv[7] = 81'h03b5200a200000f4dd200;
      expv[8] = 81'h03b5200a250000f4dd001;
      expv[9] = 81'h11239fb5800000f4dd002;
      expv[10] = 81'h11239fb5900000f4dd004;
      expv[11] = 81'h11239fb5800000f4dd008;
      expv[12] = 81'h11239fb5802c63f4dd010;
      expv[13] = 81'h11239fb58a2c63f4dd020;
      expv[14] = 81'h11239fb5802c63f4dd001;
      expv[15] = 81'h11239fb5802c63f4dd020;
      expv[16] = 81'h1042cac8402c63f4dd040;
      expv[17] = 81'h1042cac8502c63f4dd080;
      expv[18] = 81'h1042cac8402c63f4dd100;
      expv[19] = 81'h1042cac8402c63b873200;
      expv[20] = 81'h1042cac8452c63b873001;
      expv[21] = 81'h006a1343c02c63b873002;
      expv[22] = 81'h006a1343d02c63b873004;
      expv[23] = 81'h006a1343c02c63b873008;
      expv[24] = 81'h006a1343c03a67b873010;
      expv[25] = 81'h006a1343ca3a67b873020;
      expv[26] = 81'h006a1343c03a67b873001;
      expv[27] = 81'h006a1343c03a67b873020;
      expv[28] = 81'h006a1343c03a67b873001;
      expv[29] = 81'h14a70d91c03a67b873002;
      expv[30] = 81'h14a70d91d03a67b873004;
      expv[31] = 81'h14a70d91c03a67b873008;
      expv[32] = 81'h14a70d91c0228fb873010;
      expv[33] = 81'h14a70d91ca228fb873020;
      expv[34] = 81'h14a70d91c0228fb873001;
      expv[35] = 81'h14a70d91c0228fb873020;
      expv[36] = 81'h14a70d91c0228fb873001;
      expv[37] = 81'h028648ac20228fb873002;
      expv[38] = 81'h028648ac30228fb873004;
      expv[39] = 81'h028648ac20228fb873008;
      expv[40] = 81'h028648ac20c13fb873010;
      expv[41] = 81'h028648ac2ac13fb873020;
      expv[42] = 81'h028648ac20c13fb873001;
      expv[43] = 81'h028648ac20c13fb873020;
      expv[44] = 81'h028648ac20c13fb873001;
      expv[45] = 81'h028648ac20c13fb873020;
      expv[46] = 81'h028648ac20c13fb873001;
      expv[47] = 81'h0d88fd22c0c13fb873002;
      expv[48] = 81'h0d88fd22d0c13fb873004;
      expv[49] = 81'h0d88fd22c0c13fb873004;
      expv[50] = 81'h0d88fd22c0c13fb873008;
      expv[51] = 81'h0d88fd22c078d3b873010;
      expv[52] = 81'h0d88fd22ca78d3b873020;
      expv[53] = 81'h0280ec76c078d3b873040;
      expv[54] = 81'h0280ec76d078d3b873080;
      expv[55] = 81'h0280ec76c078d3b873100;
      expv[56] = 81'h0280ec76c078d3acbe200;
      expv[57] = 81'h0280ec76c578d3acbe001;
      expv[58] = 81'h15f2527b6078d3acbe002;
      expv[59] = 81'h15f2527b7078d3acbe004;
      expv[60] = 81'h15f2527b6078d3acbe004;
      expv[61] = 81'h15f2527b6078d3acbe008;
      expv[62] = 81'h15f2527b603e3eacbe010;
      expv[63] = 81'h15f2527b6a3e3eacbe020;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
