// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07651 dut (
    .ctu_tst_pre_grst_l(in_vec[12:12]),
    .arst_l(in_vec[11:11]),
    .global_shift_enable(in_vec[10:10]),
    .ctu_tst_scan_disable(in_vec[9:9]),
    .ctu_tst_scanmode(in_vec[8:8]),
    .ctu_tst_macrotest(in_vec[7:7]),
    .ctu_tst_short_chain(in_vec[6:6]),
    .long_chain_so_0(in_vec[5:5]),
    .short_chain_so_0(in_vec[4:4]),
    .long_chain_so_1(in_vec[3:3]),
    .short_chain_so_1(in_vec[2:2]),
    .long_chain_so_2(in_vec[1:1]),
    .short_chain_so_2(in_vec[0:0]),
    .mux_drive_disable(out_vec[8:8]),
    .mem_write_disable(out_vec[7:7]),
    .sehold(out_vec[6:6]),
    .se(out_vec[5:5]),
    .testmode_l(out_vec[4:4]),
    .mem_bypass(out_vec[3:3]),
    .so_0(out_vec[2:2]),
    .so_1(out_vec[1:1]),
    .so_2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1827;
    stim[1] = 13'h092d;
    stim[2] = 13'h0687;
    stim[3] = 13'h050f;
    stim[4] = 13'h1168;
    stim[5] = 13'h169c;
    stim[6] = 13'h0722;
    stim[7] = 13'h0787;
    stim[8] = 13'h174d;
    stim[9] = 13'h0059;
    stim[10] = 13'h01e5;
    stim[11] = 13'h0506;
    stim[12] = 13'h051f;
    stim[13] = 13'h15ae;
    stim[14] = 13'h05bd;
    stim[15] = 13'h0783;
    stim[16] = 13'h1586;
    stim[17] = 13'h0110;
    stim[18] = 13'h051e;
    stim[19] = 13'h15b1;
    stim[20] = 13'h0629;
    stim[21] = 13'h0d70;
    stim[22] = 13'h17aa;
    stim[23] = 13'h038c;
    stim[24] = 13'h0205;
    stim[25] = 13'h0260;
    stim[26] = 13'h1650;
    stim[27] = 13'h0245;
    stim[28] = 13'h182b;
    stim[29] = 13'h1308;
    stim[30] = 13'h140e;
    stim[31] = 13'h13df;
    stim[32] = 13'h00f1;
    stim[33] = 13'h01f6;
    stim[34] = 13'h107f;
    stim[35] = 13'h0619;
    stim[36] = 13'h159d;
    stim[37] = 13'h01cd;
    stim[38] = 13'h042a;
    stim[39] = 13'h125e;
    stim[40] = 13'h0017;
    stim[41] = 13'h1559;
    stim[42] = 13'h17e8;
    stim[43] = 13'h01ea;
    stim[44] = 13'h02c5;
    stim[45] = 13'h1237;
    stim[46] = 13'h1111;
    stim[47] = 13'h0506;
    stim[48] = 13'h0604;
    stim[49] = 13'h000b;
    stim[50] = 13'h0419;
    stim[51] = 13'h1758;
    stim[52] = 13'h027b;
    stim[53] = 13'h163a;
    stim[54] = 13'h0708;
    stim[55] = 13'h020f;
    stim[56] = 13'h017b;
    stim[57] = 13'h0348;
    stim[58] = 13'h13bf;
    stim[59] = 13'h160e;
    stim[60] = 13'h0635;
    stim[61] = 13'h1088;
    stim[62] = 13'h0042;
    stim[63] = 13'h05e4;
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
      expv[0] = 9'h015;
      expv[1] = 9'h18e;
      expv[2] = 9'h1b1;
      expv[3] = 9'h1ab;
      expv[4] = 9'h108;
      expv[5] = 9'h1b2;
      expv[6] = 9'h1ad;
      expv[7] = 9'h1a1;
      expv[8] = 9'h1aa;
      expv[9] = 9'h192;
      expv[10] = 9'h1c3;
      expv[11] = 9'h1a9;
      expv[12] = 9'h1ab;
      expv[13] = 9'h1a7;
      expv[14] = 9'h1a6;
      expv[15] = 9'h1a1;
      expv[16] = 9'h1a1;
      expv[17] = 9'h188;
      expv[18] = 9'h1ab;
      expv[19] = 9'h1a4;
      expv[20] = 9'h1b6;
      expv[21] = 9'h1ac;
      expv[22] = 9'h1a7;
      expv[23] = 9'h1c2;
      expv[24] = 9'h190;
      expv[25] = 9'h194;
      expv[26] = 9'h1b0;
      expv[27] = 9'h190;
      expv[28] = 9'h017;
      expv[29] = 9'h00a;
      expv[30] = 9'h1b3;
      expv[31] = 9'h147;
      expv[32] = 9'h1d4;
      expv[33] = 9'h1c6;
      expv[34] = 9'h017;
      expv[35] = 9'h1b2;
      expv[36] = 9'h1a2;
      expv[37] = 9'h1c3;
      expv[38] = 9'h1b7;
      expv[39] = 9'h013;
      expv[40] = 9'h191;
      expv[41] = 9'h1ad;
      expv[42] = 9'h1a6;
      expv[43] = 9'h1c0;
      expv[44] = 9'h1d0;
      expv[45] = 9'h015;
      expv[46] = 9'h008;
      expv[47] = 9'h1a9;
      expv[48] = 9'h1b0;
      expv[49] = 9'h193;
      expv[50] = 9'h1b2;
      expv[51] = 9'h1aa;
      expv[52] = 9'h197;
      expv[53] = 9'h1b7;
      expv[54] = 9'h1aa;
      expv[55] = 9'h193;
      expv[56] = 9'h18d;
      expv[57] = 9'h188;
      expv[58] = 9'h047;
      expv[59] = 9'h1b3;
      expv[60] = 9'h1b4;
      expv[61] = 9'h052;
      expv[62] = 9'h191;
      expv[63] = 9'h1a2;
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
