// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061459 dut (
    .clk(clk),
    .reset(in_vec[22:22]),
    .in_rxdatahs(in_vec[21:6]),
    .in_rxvalidhs(in_vec[5:4]),
    .in_rxactivehs(in_vec[3:2]),
    .in_rxsynchs(in_vec[1:0]),
    .out_first(out_vec[18:18]),
    .out_last(out_vec[17:17]),
    .out_data(out_vec[16:1]),
    .out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h4c5c89;
    stim[1] = 23'h6b7b24;
    stim[2] = 23'h0934e3;
    stim[3] = 23'h3552f6;
    stim[4] = 23'h32eb18;
    stim[5] = 23'h28e040;
    stim[6] = 23'h064262;
    stim[7] = 23'h04f3ef;
    stim[8] = 23'h3dbedc;
    stim[9] = 23'h3f1348;
    stim[10] = 23'h3ae697;
    stim[11] = 23'h28975e;
    stim[12] = 23'h001372;
    stim[13] = 23'h13d435;
    stim[14] = 23'h1d81c4;
    stim[15] = 23'h262f14;
    stim[16] = 23'h29b694;
    stim[17] = 23'h07d2e1;
    stim[18] = 23'h075f39;
    stim[19] = 23'h2647b2;
    stim[20] = 23'h259a17;
    stim[21] = 23'h3d9420;
    stim[22] = 23'h2b88e6;
    stim[23] = 23'h19f9e5;
    stim[24] = 23'h17aa32;
    stim[25] = 23'h02c08e;
    stim[26] = 23'h235c2f;
    stim[27] = 23'h0bd192;
    stim[28] = 23'h05b9f1;
    stim[29] = 23'h2691f8;
    stim[30] = 23'h2e18ec;
    stim[31] = 23'h2f7068;
    stim[32] = 23'h36cd55;
    stim[33] = 23'h21e4a0;
    stim[34] = 23'h042c3e;
    stim[35] = 23'h0544b2;
    stim[36] = 23'h3c5b10;
    stim[37] = 23'h293672;
    stim[38] = 23'h1c7919;
    stim[39] = 23'h345b3f;
    stim[40] = 23'h128445;
    stim[41] = 23'h2e190a;
    stim[42] = 23'h382b05;
    stim[43] = 23'h0e1b92;
    stim[44] = 23'h3af418;
    stim[45] = 23'h09f174;
    stim[46] = 23'h291336;
    stim[47] = 23'h061d85;
    stim[48] = 23'h342891;
    stim[49] = 23'h1511ed;
    stim[50] = 23'h12484d;
    stim[51] = 23'h2e5727;
    stim[52] = 23'h0533ff;
    stim[53] = 23'h1e5b78;
    stim[54] = 23'h11b67a;
    stim[55] = 23'h224820;
    stim[56] = 23'h1f8ed6;
    stim[57] = 23'h1bce1b;
    stim[58] = 23'h0a0f9b;
    stim[59] = 23'h35cc4d;
    stim[60] = 23'h117f71;
    stim[61] = 23'h2b127f;
    stim[62] = 23'h6e2d74;
    stim[63] = 23'h18d540;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h5a2d9;
      expv[42] = 19'h29422;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h4299f;
      expv[55] = 19'h0f2db;
      expv[56] = 19'h28db2;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
