// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07603 dut (
    .clk(clk),
    .resetn(in_vec[46:46]),
    .processing_resetn(in_vec[45:45]),
    .s_axis_sample_valid(in_vec[44:44]),
    .s_axis_sample_data(in_vec[43:36]),
    .sample_has_stat(in_vec[35:35]),
    .conv_done(in_vec[34:34]),
    .phase(in_vec[33:2]),
    .m_axis_sample_ready(in_vec[1:1]),
    .m_axis_phase_ready(in_vec[0:0]),
    .s_axis_sample_ready(out_vec[59:59]),
    .m_axis_sample_valid(out_vec[58:58]),
    .m_axis_sample_data(out_vec[57:34]),
    .m_axis_phase_valid(out_vec[33:33]),
    .m_axis_phase_data(out_vec[32:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h19e25f2f5cc6;
    stim[1] = 47'h2490564b5a6e;
    stim[2] = 47'h73829f5e3a48;
    stim[3] = 47'h41bd8eee919d;
    stim[4] = 47'h44d8371fe86d;
    stim[5] = 47'h4bcf6b073c30;
    stim[6] = 47'h6725aab0c262;
    stim[7] = 47'h6b6c43b82c54;
    stim[8] = 47'h6f57205bb882;
    stim[9] = 47'h7f826549e210;
    stim[10] = 47'h6d3bf128d121;
    stim[11] = 47'h4676a0e55839;
    stim[12] = 47'h5a43f6cbf5c5;
    stim[13] = 47'h7b99c4a678bb;
    stim[14] = 47'h6c9a23a92951;
    stim[15] = 47'h5014d7e2d8b3;
    stim[16] = 47'h650e07b76b08;
    stim[17] = 47'h52f7865c7296;
    stim[18] = 47'h70ab64ab35d6;
    stim[19] = 47'h4486dbeb6fc6;
    stim[20] = 47'h4f3e0d841586;
    stim[21] = 47'h459f5e06ac90;
    stim[22] = 47'h642c45030515;
    stim[23] = 47'h54f01b9229a9;
    stim[24] = 47'h77af762e53cb;
    stim[25] = 47'h5eee6eaebeb5;
    stim[26] = 47'h68fd9644796c;
    stim[27] = 47'h77713a9e9b1a;
    stim[28] = 47'h4eef65700513;
    stim[29] = 47'h7b28c37de62e;
    stim[30] = 47'h65613deb4a7c;
    stim[31] = 47'h566a4df6c881;
    stim[32] = 47'h5cc4d86e2740;
    stim[33] = 47'h7e85dc9d3765;
    stim[34] = 47'h5f4060bd001b;
    stim[35] = 47'h507ff107c446;
    stim[36] = 47'h5bc7f0125de4;
    stim[37] = 47'h48e59514d37b;
    stim[38] = 47'h631a6f9931b8;
    stim[39] = 47'h523908c6f3d6;
    stim[40] = 47'h740c3b3d589c;
    stim[41] = 47'h692b8d91ce8a;
    stim[42] = 47'h408b84c6dd89;
    stim[43] = 47'h4ad75e306806;
    stim[44] = 47'h7a446c3b5a64;
    stim[45] = 47'h4d12e220f909;
    stim[46] = 47'h4f055483a344;
    stim[47] = 47'h6baa3ff28548;
    stim[48] = 47'h5ffb51486ac3;
    stim[49] = 47'h5bae86bfb017;
    stim[50] = 47'h7496e631a209;
    stim[51] = 47'h73ad0a681fa1;
    stim[52] = 47'h786c25d75757;
    stim[53] = 47'h6910d28b71a5;
    stim[54] = 47'h5e95625e6c05;
    stim[55] = 47'h4fd67f74201e;
    stim[56] = 47'h41b35a158604;
    stim[57] = 47'h69385b7c50b1;
    stim[58] = 47'h408a69f8545a;
    stim[59] = 47'h58b316ca28cf;
    stim[60] = 47'h6137ce7138a9;
    stim[61] = 47'h4a3ab129c8de;
    stim[62] = 47'h7cccca659417;
    stim[63] = 47'h4eac65ad2b25;
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
      expv[0] = 60'hx00000x0000000x;
      expv[1] = 60'ha00027800000000;
      expv[2] = 60'ha00027800000000;
      expv[3] = 60'ha0278e000000000;
      expv[4] = 60'ha0278e000000001;
      expv[5] = 60'ha0278e000000000;
      expv[6] = 60'ha0278e000000001;
      expv[7] = 60'ha0278e000000000;
      expv[8] = 60'ha0278e000000000;
      expv[9] = 60'ha0278e000000000;
      expv[10] = 60'h878e3e000000000;
      expv[11] = 60'hc78e3e200000000;
      expv[12] = 60'h878e3e000000001;
      expv[13] = 60'hae3e29000000000;
      expv[14] = 60'h9e292e400000000;
      expv[15] = 60'h9e292e400000000;
      expv[16] = 60'h892e40400000001;
      expv[17] = 60'hc92e40600000000;
      expv[18] = 60'h8e404bc00000000;
      expv[19] = 60'ha04bc2800000000;
      expv[20] = 60'ha04bc2800000001;
      expv[21] = 60'ha04bc2800000000;
      expv[22] = 60'ha04bc2800000000;
      expv[23] = 60'ha04bc2800000000;
      expv[24] = 60'habc293c00000000;
      expv[25] = 60'he293debbb1729e4;
      expv[26] = 60'hb3debb9bb1729e4;
      expv[27] = 60'hb3debb9bb1729e4;
      expv[28] = 60'hbebb9ddbb1729e4;
      expv[29] = 60'hbebb9ddbb1729e5;
      expv[30] = 60'h9b9dec9bb1729e4;
      expv[31] = 60'h9b9dec9bb1729e4;
      expv[32] = 60'hbdec999bb1729e4;
      expv[33] = 60'h8c99b31bb1729e5;
      expv[34] = 60'hf9b33a3bb1729e4;
      expv[35] = 60'h933a3d1bb1729e4;
      expv[36] = 60'h9a3d01dbb1729e5;
      expv[37] = 60'h9a3d01dbb1729e4;
      expv[38] = 60'h9a3d01dbb1729e4;
      expv[39] = 60'h9a3d01dbb1729e4;
      expv[40] = 60'h9d01c8dbb1729e4;
      expv[41] = 60'ha1c8d001d9eac4e;
      expv[42] = 60'ha1c8d001d9eac4e;
      expv[43] = 60'ha1c8d001d9eac4e;
      expv[44] = 60'ha1c8d001d9eac4f;
      expv[45] = 60'ha8d02901d9eac4e;
      expv[46] = 60'ha8d02901d9eac4e;
      expv[47] = 60'ha8d02901d9eac4f;
      expv[48] = 60'ha8d02901d9eac4e;
      expv[49] = 60'hb0293fc1d9eac4e;
      expv[50] = 60'h893fee81d9eac4f;
      expv[51] = 60'h9fee9241d9eac4e;
      expv[52] = 60'hce924ea1d9eac4e;
      expv[53] = 60'hb24ea181d9eac4e;
      expv[54] = 60'hb24ea181d9eac4e;
      expv[55] = 60'haea1ba41d9eac4f;
      expv[56] = 60'haea1ba41d9eac4e;
      expv[57] = 60'haea1ba41d9eac4e;
      expv[58] = 60'haea1ba41d9eac4e;
      expv[59] = 60'haea1ba41d9eac4e;
      expv[60] = 60'h81ba62c1d9eac4e;
      expv[61] = 60'h81ba62de7389c54;
      expv[62] = 60'h81ba62de7389c54;
      expv[63] = 60'h9a62f306532ca0a;
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
