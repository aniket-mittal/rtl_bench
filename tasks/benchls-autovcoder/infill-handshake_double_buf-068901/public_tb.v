// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_068901 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h53b2c3c26;
    stim[1] = 35'h79f13b98f;
    stim[2] = 35'h065604b94;
    stim[3] = 35'h394ee9df3;
    stim[4] = 35'h3146352dd;
    stim[5] = 35'h0407fb994;
    stim[6] = 35'h3b3b93849;
    stim[7] = 35'h2cafce9fa;
    stim[8] = 35'h03a48a833;
    stim[9] = 35'h13789ebd2;
    stim[10] = 35'h0230af909;
    stim[11] = 35'h377ab9681;
    stim[12] = 35'h0fe7bf7a6;
    stim[13] = 35'h3b045f265;
    stim[14] = 35'h22707b893;
    stim[15] = 35'h2f446b916;
    stim[16] = 35'h10a045851;
    stim[17] = 35'h3bc117d92;
    stim[18] = 35'h3e6de4750;
    stim[19] = 35'h021b6c492;
    stim[20] = 35'h05dc1e7a5;
    stim[21] = 35'h0e9812782;
    stim[22] = 35'h249f18958;
    stim[23] = 35'h39495adf8;
    stim[24] = 35'h76f8f4205;
    stim[25] = 35'h3b83cb8e3;
    stim[26] = 35'h14d06be09;
    stim[27] = 35'h2eba2b5a4;
    stim[28] = 35'h32aef3c7d;
    stim[29] = 35'h2b6205929;
    stim[30] = 35'h3fe032f20;
    stim[31] = 35'h0bf258ae4;
    stim[32] = 35'h1b92ddcfb;
    stim[33] = 35'h27fae0ddd;
    stim[34] = 35'h07ad7d9c2;
    stim[35] = 35'h01ff98c27;
    stim[36] = 35'h3e99610ed;
    stim[37] = 35'h1c996feaa;
    stim[38] = 35'h0bd59c066;
    stim[39] = 35'h1023dbcbb;
    stim[40] = 35'h2c3417cee;
    stim[41] = 35'h38e6afa63;
    stim[42] = 35'h103cdab2c;
    stim[43] = 35'h15fa89057;
    stim[44] = 35'h2ab92e013;
    stim[45] = 35'h2e80d19f6;
    stim[46] = 35'h19d3cfcc5;
    stim[47] = 35'h2533a1409;
    stim[48] = 35'h2bf8b7889;
    stim[49] = 35'h083442cb0;
    stim[50] = 35'h3fab1ab2c;
    stim[51] = 35'h089d6be8c;
    stim[52] = 35'h22a840a30;
    stim[53] = 35'h1d394c2d7;
    stim[54] = 35'h1feef6d4c;
    stim[55] = 35'h1aa118034;
    stim[56] = 35'h304e22d07;
    stim[57] = 35'h04371ee74;
    stim[58] = 35'h090e6d683;
    stim[59] = 35'h2f3d709b4;
    stim[60] = 35'h008aca96f;
    stim[61] = 35'h29e6b0f23;
    stim[62] = 35'h20c776217;
    stim[63] = 35'h301467f2b;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h39f13b98c;
      expv[3] = 35'h465604b94;
      expv[4] = 35'h794ee9df2;
      expv[5] = 35'h7146352dc;
      expv[6] = 35'h4407fb994;
      expv[7] = 35'h7b3b93848;
      expv[8] = 35'h6cafce9fa;
      expv[9] = 35'h43a48a833;
      expv[10] = 35'h03a48a833;
      expv[11] = 35'h53789ebd2;
      expv[12] = 35'h777ab9680;
      expv[13] = 35'h4fe7bf7a6;
      expv[14] = 35'h7b045f264;
      expv[15] = 35'h62707b893;
      expv[16] = 35'h22707b893;
      expv[17] = 35'h6f446b917;
      expv[18] = 35'h2f446b917;
      expv[19] = 35'h2f446b917;
      expv[20] = 35'h2f446b917;
      expv[21] = 35'h7bc117d93;
      expv[22] = 35'h3bc117d93;
      expv[23] = 35'h3bc117d93;
      expv[24] = 35'h3bc117d93;
      expv[25] = 35'h0e9812780;
      expv[26] = 35'h7b83cb8e0;
      expv[27] = 35'h54d06be08;
      expv[28] = 35'h6eba2b5a4;
      expv[29] = 35'h72aef3c7c;
      expv[30] = 35'h6b6205928;
      expv[31] = 35'h7fe032f20;
      expv[32] = 35'h4bf258ae4;
      expv[33] = 35'h5b92ddcfa;
      expv[34] = 35'h67fae0ddc;
      expv[35] = 35'h47ad7d9c2;
      expv[36] = 35'h41ff98c26;
      expv[37] = 35'h7e99610ec;
      expv[38] = 35'h5c996feab;
      expv[39] = 35'h1c996feab;
      expv[40] = 35'h4bd59c067;
      expv[41] = 35'h0bd59c067;
      expv[42] = 35'h6c3417cef;
      expv[43] = 35'h6c3417cee;
      expv[44] = 35'h55fa89056;
      expv[45] = 35'h6ab92e013;
      expv[46] = 35'h2ab92e013;
      expv[47] = 35'h6e80d19f6;
      expv[48] = 35'h6533a1408;
      expv[49] = 35'h6bf8b7888;
      expv[50] = 35'h483442cb0;
      expv[51] = 35'h7fab1ab2c;
      expv[52] = 35'h489d6be8c;
      expv[53] = 35'h62a840a30;
      expv[54] = 35'h5d394c2d7;
      expv[55] = 35'h5d394c2d7;
      expv[56] = 35'h5d394c2d6;
      expv[57] = 35'h704e22d07;
      expv[58] = 35'h704e22d06;
      expv[59] = 35'h490e6d683;
      expv[60] = 35'h490e6d682;
      expv[61] = 35'h408aca96e;
      expv[62] = 35'h69e6b0f22;
      expv[63] = 35'h60c776216;
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
