// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184926 dut (
    .aluctr(in_vec[67:64]),
    .aluoprand_a(in_vec[63:32]),
    .aluoprand_b(in_vec[31:0]),
    .aluoutput_c(out_vec[34:3]),
    .ifzero(out_vec[2:2]),
    .ifgtz(out_vec[1:1]),
    .ifeqz(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hb8395704d4e03c84b;
    stim[1] = 68'h673c5f8116f71f4e4;
    stim[2] = 68'h0ca03232653850e1d;
    stim[3] = 68'h401659abb93099008;
    stim[4] = 68'h0f909fbb59bc80fed;
    stim[5] = 68'h6ed354850a6efb234;
    stim[6] = 68'hf9557c48532c14845;
    stim[7] = 68'hf13e5c7c1fd00054c;
    stim[8] = 68'hf3d59dfc542504971;
    stim[9] = 68'h6e14cf4dd25191e7a;
    stim[10] = 68'hac5b4a3598d81a121;
    stim[11] = 68'hcaeda14e84a710042;
    stim[12] = 68'h2636b0045ea3ac17f;
    stim[13] = 68'ha593437996ecb0275;
    stim[14] = 68'ha24ce2b98082c9ffb;
    stim[15] = 68'hec8129603f7c56a08;
    stim[16] = 68'h7ae6e8de41d821f0e;
    stim[17] = 68'hde31bde32660a29fe;
    stim[18] = 68'ha86571e1c79a2ecd6;
    stim[19] = 68'h60460e17a5c3fb1db;
    stim[20] = 68'h23f37c9fba75f5bea;
    stim[21] = 68'hc32179f27d44caa4d;
    stim[22] = 68'h23076c3f5b8d9b6ed;
    stim[23] = 68'h4fbac354bdbd7b390;
    stim[24] = 68'h6f3aec127a069ecc3;
    stim[25] = 68'h534f94966f5cac46b;
    stim[26] = 68'h2a550536386709d8b;
    stim[27] = 68'hd689620dfe0804e5c;
    stim[28] = 68'h23ed169ae553eb7ae;
    stim[29] = 68'h52d39ab6b38c2d394;
    stim[30] = 68'hbf414e3042328a252;
    stim[31] = 68'hf767a8c159e75e265;
    stim[32] = 68'h9096d8ad6053bf9de;
    stim[33] = 68'h65d43f1305a036485;
    stim[34] = 68'hb732fe44a7b8446c0;
    stim[35] = 68'h711a2ee2ac725b4f6;
    stim[36] = 68'h86e7092865f40bcd6;
    stim[37] = 68'h842984225fbfb79dc;
    stim[38] = 68'h0e08fb08e25dfa4c5;
    stim[39] = 68'h9688793456d121510;
    stim[40] = 68'ha973342f18843a062;
    stim[41] = 68'h9aaf7bf59cccaadcd;
    stim[42] = 68'ha774febb5cdfaebc3;
    stim[43] = 68'h0b27af7d08a375c49;
    stim[44] = 68'hd7794e23378efbf02;
    stim[45] = 68'hc58aa17bc39632116;
    stim[46] = 68'h3f33f18ad75cda813;
    stim[47] = 68'ha4550f7546211e8cb;
    stim[48] = 68'he7fc46525905fbc77;
    stim[49] = 68'h6461e78506f034636;
    stim[50] = 68'hf399d5ac73a65e207;
    stim[51] = 68'h2e95ff75a6a417d16;
    stim[52] = 68'he55ef12093f1c3926;
    stim[53] = 68'hc81f305bffeeb4c22;
    stim[54] = 68'h65222f92bcd650b0e;
    stim[55] = 68'h12b735e7193a7b75e;
    stim[56] = 68'h55d3cf9bc0c76b176;
    stim[57] = 68'h901c4342c6d7f7d44;
    stim[58] = 68'hcae90d6573fce973d;
    stim[59] = 68'hca683084be9f8135c;
    stim[60] = 68'h940c28288763d1954;
    stim[61] = 68'hda0a14c61fa19c31d;
    stim[62] = 68'h5839843dff90da8cf;
    stim[63] = 68'haa7ce7b420fd0f66c;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h0ec418a1a;
      expv[3] = 35'h000000000;
      expv[4] = 35'h4a6905d10;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h75bde0bf8;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h5fbfedfd8;
      expv[21] = 35'h000000000;
      expv[22] = 35'h5c7ffbfe8;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h53b86ff58;
      expv[27] = 35'h000000000;
      expv[28] = 35'h3fffffd72;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h0337aaa9a;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h1e592a0ca;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h00000f33a;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h75afffaf0;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h4be5d3898;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
