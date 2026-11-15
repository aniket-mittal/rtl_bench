// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02824 dut (
    .clk(clk),
    .rst(in_vec[59:59]),
    .isDispatch(in_vec[58:58]),
    .isSW(in_vec[57:57]),
    .RegDest(in_vec[56:56]),
    .PR_old_DP(in_vec[55:50]),
    .PR_new_DP(in_vec[49:44]),
    .rd_DP(in_vec[43:39]),
    .complete(in_vec[38:38]),
    .rob_number(in_vec[37:34]),
    .jb_addr(in_vec[33:2]),
    .changeFlow(in_vec[1:1]),
    .hazard_stall(in_vec[0:0]),
    .rob_num_dp(out_vec[74:71]),
    .PR_old_RT(out_vec[70:65]),
    .RegDest_retire(out_vec[64:64]),
    .retire_reg(out_vec[63:63]),
    .retire_ST(out_vec[62:62]),
    .retire_rob(out_vec[61:58]),
    .full(out_vec[57:57]),
    .empty(out_vec[56:56]),
    .RegDest_out(out_vec[55:55]),
    .PR_old_flush(out_vec[54:49]),
    .PR_new_flush(out_vec[48:43]),
    .rd_flush(out_vec[42:38]),
    .out_rob_num(out_vec[37:34]),
    .changeFlow_out(out_vec[33:33]),
    .changeFlow_addr(out_vec[32:1]),
    .recover(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'he48eb73dfb84dfb;
    stim[1] = 60'h89a90b3e8511543;
    stim[2] = 60'h7651c4a17c51af4;
    stim[3] = 60'h7233a959a06a158;
    stim[4] = 60'h7e4a27894b8e222;
    stim[5] = 60'h44a2e9659bd3931;
    stim[6] = 60'h0edf98e773e741a;
    stim[7] = 60'h77d13a7ad628fd9;
    stim[8] = 60'h010f1f642de003f;
    stim[9] = 60'h1274c5f0438a9c6;
    stim[10] = 60'h740a5c2ad3037a4;
    stim[11] = 60'h2784665db4ba7cb;
    stim[12] = 60'h4955d41eae98277;
    stim[13] = 60'h083b0b47452aee9;
    stim[14] = 60'h5334c117c34f68e;
    stim[15] = 60'h5f0d52bc001b2ec;
    stim[16] = 60'h22b050bc5dc4f64;
    stim[17] = 60'h46382efe8e398a7;
    stim[18] = 60'h5524630c86f1b0b;
    stim[19] = 60'h3e56a8bea72ab84;
    stim[20] = 60'h13cd20c20069759;
    stim[21] = 60'h62176075a4e8c27;
    stim[22] = 60'h500110ae380a970;
    stim[23] = 60'h61d67af1a4f730f;
    stim[24] = 60'h31beb01b2dd244b;
    stim[25] = 60'h344f6fadea18428;
    stim[26] = 60'h6a0aec3b1b73432;
    stim[27] = 60'h3dea64de4388f89;
    stim[28] = 60'h3e81c230561547c;
    stim[29] = 60'h4aac2d9c91497e6;
    stim[30] = 60'h638372ed2c0d63b;
    stim[31] = 60'h6de4d59465900fd;
    stim[32] = 60'h176acb45f3ce900;
    stim[33] = 60'h60382f02ad3c8a5;
    stim[34] = 60'h1ed2dc3f1aa0827;
    stim[35] = 60'h42f3287acf89039;
    stim[36] = 60'hada1c411c0ea5f4;
    stim[37] = 60'h2941d52daf80801;
    stim[38] = 60'h05b45e5dfbfab55;
    stim[39] = 60'h49870f58a2dd2fc;
    stim[40] = 60'h3bab5fa27d682b6;
    stim[41] = 60'h35f6d4b606c726d;
    stim[42] = 60'h417f4a73f6d0401;
    stim[43] = 60'h4572dfa79104b56;
    stim[44] = 60'h5b5e108b7b6dd17;
    stim[45] = 60'h77b06f1f8dc8392;
    stim[46] = 60'h2519988c4014089;
    stim[47] = 60'h3f3fb6369a9520e;
    stim[48] = 60'h5e627460b0b8ee3;
    stim[49] = 60'h63f64ff8cbc9670;
    stim[50] = 60'h0adcef6bd320fca;
    stim[51] = 60'h21e8be330ba38ea;
    stim[52] = 60'h5d91eb43018b1f7;
    stim[53] = 60'h2655e4ec5641357;
    stim[54] = 60'h31b1c9d342be5a1;
    stim[55] = 60'h6727a355300bddf;
    stim[56] = 60'h10c2f0b0b940560;
    stim[57] = 60'h227336bd541fdf9;
    stim[58] = 60'h2f1a6c9208f891b;
    stim[59] = 60'h49e6ca067db4d4c;
    stim[60] = 60'h4220ce7eddab839;
    stim[61] = 60'h78663f4bf7267a3;
    stim[62] = 60'h22e1c3bf2508978;
    stim[63] = 60'h38202be3c057909;
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
      expv[0] = 75'h0xxx1xxxxx000000001;
      expv[1] = 75'h7xxx2xxxxxdefdc26fd;
      expv[2] = 75'h0xxx1xxxxx000000000;
      expv[3] = 75'h0xxx1xxxxx000000000;
      expv[4] = 75'h0xxx1xxxxx000000001;
      expv[5] = 75'h0xxx1xxxxx000000000;
      expv[6] = 75'h0xxx1xxxxx000000000;
      expv[7] = 75'h0xxx1xxxxx000000000;
      expv[8] = 75'h0xxx1xxxxx000000001;
      expv[9] = 75'h0xxx1xxxxx000000001;
      expv[10] = 75'h0xxx1xxxxx000000000;
      expv[11] = 75'h0xxx1xxxxx000000001;
      expv[12] = 75'h0xxx1xxxxx000000001;
      expv[13] = 75'h0xxx1xxxxx000000000;
      expv[14] = 75'h0xxx1xxxxx000000000;
      expv[15] = 75'h0xxx1xxxxx000000000;
      expv[16] = 75'h0xxx1xxxxx000000000;
      expv[17] = 75'h0xxx1xxxxx000000001;
      expv[18] = 75'h0xxx1xxxxx000000000;
      expv[19] = 75'h0xxx1xxxxx000000000;
      expv[20] = 75'h0xxx1xxxxx000000000;
      expv[21] = 75'h0xxx1xxxxx000000000;
      expv[22] = 75'h0xxx1xxxxx000000000;
      expv[23] = 75'h0xxx1xxxxx000000000;
      expv[24] = 75'h0xxx1xxxxx000000000;
      expv[25] = 75'h0xxx1xxxxx000000000;
      expv[26] = 75'h0xxx1xxxxx000000001;
      expv[27] = 75'h0xxx1xxxxx000000000;
      expv[28] = 75'h0xxx1xxxxx000000000;
      expv[29] = 75'h0xxx1xxxxx000000001;
      expv[30] = 75'h0xxx1xxxxx000000000;
      expv[31] = 75'h0xxx1xxxxx000000000;
      expv[32] = 75'h0xxx1xxxxx000000000;
      expv[33] = 75'h0xxx1xxxxx000000000;
      expv[34] = 75'h0xxx1xxxxx000000001;
      expv[35] = 75'h0xxx1xxxxx000000000;
      expv[36] = 75'h0xxx1xxxxx000000000;
      expv[37] = 75'h0xxx1xxxxx000000000;
      expv[38] = 75'h0xxx1xxxxx000000000;
      expv[39] = 75'h0xxx1xxxxx000000000;
      expv[40] = 75'h0xxx1xxxxx000000001;
      expv[41] = 75'h0xxx1xxxxx000000000;
      expv[42] = 75'h0xxx1xxxxx000000000;
      expv[43] = 75'h0xxx1xxxxx000000001;
      expv[44] = 75'h0xxx1xxxxx000000000;
      expv[45] = 75'h0xxx1xxxxx000000001;
      expv[46] = 75'h0xxx1xxxxx000000000;
      expv[47] = 75'h0xxx1xxxxx000000001;
      expv[48] = 75'h0xxx1xxxxx000000001;
      expv[49] = 75'h0xxx1xxxxx000000000;
      expv[50] = 75'h0xxx1xxxxx000000001;
      expv[51] = 75'h0xxx1xxxxx000000001;
      expv[52] = 75'h0xxx1xxxxx000000000;
      expv[53] = 75'h0xxx1xxxxx000000001;
      expv[54] = 75'h0xxx1xxxxx000000000;
      expv[55] = 75'h0xxx1xxxxx000000000;
      expv[56] = 75'h0xxx1xxxxx000000000;
      expv[57] = 75'h0xxx1xxxxx000000000;
      expv[58] = 75'h0xxx1xxxxx000000001;
      expv[59] = 75'h0xxx1xxxxx000000000;
      expv[60] = 75'h0xxx1xxxxx000000000;
      expv[61] = 75'h0xxx1xxxxx000000001;
      expv[62] = 75'h0xxx1xxxxx000000000;
      expv[63] = 75'h0xxx1xxxxx000000000;
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
