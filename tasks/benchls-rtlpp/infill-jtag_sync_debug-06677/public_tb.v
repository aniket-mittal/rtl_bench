// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06677 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h1fae5380c5e;
    stim[1] = 42'h190692af710;
    stim[2] = 42'h26b6bf0b55a;
    stim[3] = 42'h0f813ad48e0;
    stim[4] = 42'h1b3105b2e63;
    stim[5] = 42'h3baeb335d95;
    stim[6] = 42'h05c89365627;
    stim[7] = 42'h1876b716a40;
    stim[8] = 42'h299199bfc1d;
    stim[9] = 42'h1858759daea;
    stim[10] = 42'h25abe17e89c;
    stim[11] = 42'h0d914e557e9;
    stim[12] = 42'h320949a92ff;
    stim[13] = 42'h25ff9b1056e;
    stim[14] = 42'h3009eadce3f;
    stim[15] = 42'h1dd63705499;
    stim[16] = 42'h3e203e9977e;
    stim[17] = 42'h1c26179ff0b;
    stim[18] = 42'h17a2652d94a;
    stim[19] = 42'h221dcb2eead;
    stim[20] = 42'h051a1120c0d;
    stim[21] = 42'h322d228cf30;
    stim[22] = 42'h385370bc326;
    stim[23] = 42'h0f68784cc5a;
    stim[24] = 42'h2fd34d76b38;
    stim[25] = 42'h194d8133bea;
    stim[26] = 42'h07afa913877;
    stim[27] = 42'h04b967048c3;
    stim[28] = 42'h2a6a9151028;
    stim[29] = 42'h2f98788f4d1;
    stim[30] = 42'h29bbb9b9d9a;
    stim[31] = 42'h2b5f8448c48;
    stim[32] = 42'h182094deaed;
    stim[33] = 42'h0cc264d0d97;
    stim[34] = 42'h3de978ae33f;
    stim[35] = 42'h07ca2e28592;
    stim[36] = 42'h05a3d399a07;
    stim[37] = 42'h2cc44f944bb;
    stim[38] = 42'h16923bb0031;
    stim[39] = 42'h1ca48d7283f;
    stim[40] = 42'h1cbe1b525a9;
    stim[41] = 42'h3a12d0ff03d;
    stim[42] = 42'h0369fea42ce;
    stim[43] = 42'h328172de102;
    stim[44] = 42'h3e9179ab17e;
    stim[45] = 42'h3b3c197bc45;
    stim[46] = 42'h35450359f86;
    stim[47] = 42'h36c545f3db0;
    stim[48] = 42'h3e473d702d9;
    stim[49] = 42'h3081750d9b5;
    stim[50] = 42'h28dcbf7a4ea;
    stim[51] = 42'h18ae9574743;
    stim[52] = 42'h33f4dca7c0a;
    stim[53] = 42'h115735960df;
    stim[54] = 42'h25bd637bd25;
    stim[55] = 42'h1ede794b477;
    stim[56] = 42'h06ee849faa5;
    stim[57] = 42'h343201ea788;
    stim[58] = 42'h21ca49e58f8;
    stim[59] = 42'h3ad77143c8f;
    stim[60] = 42'h1577c89fac0;
    stim[61] = 42'h1c05633a04f;
    stim[62] = 42'h24c91e62b59;
    stim[63] = 42'h2f3a8d5e75f;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'h5d7599aecxxx0;
      expv[7] = 51'h5d7599aeca000;
      expv[8] = 51'h43b5b8b520020;
      expv[9] = 51'h43b5b8b520000;
      expv[10] = 51'h42c3aced74020;
      expv[11] = 51'h42c3aced74000;
      expv[12] = 51'h42c3aced74000;
      expv[13] = 51'h104a4d497e100;
      expv[14] = 51'h104a4d497e000;
      expv[15] = 51'h104a4d497e000;
      expv[16] = 51'h6eb1b82a4c000;
      expv[17] = 51'h6eb1b82a4c000;
      expv[18] = 51'h6eb1b82a4c000;
      expv[19] = 51'h6eb1b82a4c000;
      expv[20] = 51'h10ee597756001;
      expv[21] = 51'h10ee597756000;
      expv[22] = 51'h10ee597756000;
      expv[23] = 51'h10ee597756000;
      expv[24] = 51'h10ee597756000;
      expv[25] = 51'h10ee597756000;
      expv[26] = 51'h4a6c099df4080;
      expv[27] = 51'h4a6c099df4000;
      expv[28] = 51'h4a6c099df4000;
      expv[29] = 51'h53548a8814000;
      expv[30] = 51'h53548a8814000;
      expv[31] = 51'h53548a8814000;
      expv[32] = 51'h53548a8814000;
      expv[33] = 51'h53548a8814000;
      expv[34] = 51'h66132686ca020;
      expv[35] = 51'h66132686ca000;
      expv[36] = 51'h66132686ca000;
      expv[37] = 51'h2d1e9ccd02200;
      expv[38] = 51'h2d1e9ccd02000;
      expv[39] = 51'h2d1e9ccd02000;
      expv[40] = 51'h2d1e9ccd02000;
      expv[41] = 51'h2d1e9ccd02000;
      expv[42] = 51'h2d1e9ccd02000;
      expv[43] = 51'h1b4ff52166001;
      expv[44] = 51'h1b4ff52166000;
      expv[45] = 51'h1b4ff52166000;
      expv[46] = 51'h59e0cbde22020;
      expv[47] = 51'h59e0cbde22000;
      expv[48] = 51'h59e0cbde22000;
      expv[49] = 51'h59e0cbde22000;
      expv[50] = 51'h040ba86cda000;
      expv[51] = 51'h040ba86cda000;
      expv[52] = 51'h040ba86cda000;
      expv[53] = 51'h040ba86cda000;
      expv[54] = 51'h0ab9acb06e001;
      expv[55] = 51'h0ab9acb06e000;
      expv[56] = 51'h0ab9acb06e000;
      expv[57] = 51'h0ab9acb06e000;
      expv[58] = 51'h0ab9acb06e000;
      expv[59] = 51'h0e524f2c7c200;
      expv[60] = 51'h0e524f2c7c000;
      expv[61] = 51'h0e524f2c7c000;
      expv[62] = 51'h0e524f2c7c000;
      expv[63] = 51'h2648f315ac008;
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
