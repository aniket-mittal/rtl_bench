// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074868 dut (
    .op(in_vec[43:38]),
    .low6(in_vec[37:32]),
    .instr(in_vec[31:0]),
    .aluCtrl(out_vec[39:35]),
    .ifWrGrf(out_vec[34:34]),
    .grfWa(out_vec[33:29]),
    .grfRa1(out_vec[28:24]),
    .grfRa2(out_vec[23:19]),
    .ifReDm(out_vec[18:18]),
    .ifWrDm(out_vec[17:17]),
    .ifBeq(out_vec[16:16]),
    .ifJal(out_vec[15:15]),
    .ifJr(out_vec[14:14]),
    .ifJ(out_vec[13:13]),
    .ifImmExt(out_vec[12:12]),
    .tUseRs(out_vec[11:10]),
    .tUseRt(out_vec[9:8]),
    .tNew(out_vec[7:6]),
    .ifAddu(out_vec[5:5]),
    .ifSubu(out_vec[4:4]),
    .ifOri(out_vec[3:3]),
    .ifLui(out_vec[2:2]),
    .ifLw(out_vec[1:1]),
    .ifSw(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'hecb7599ae69;
    stim[1] = 44'h284086aeb01;
    stim[2] = 44'h5269d48416c;
    stim[3] = 44'h5bd32c282bd;
    stim[4] = 44'h0ea15385978;
    stim[5] = 44'h486c67b4cb3;
    stim[6] = 44'hf92218ffba5;
    stim[7] = 44'h0a8220aef2b;
    stim[8] = 44'h4e66ef53c40;
    stim[9] = 44'h05a4fcecfcc;
    stim[10] = 44'he00aa269d3e;
    stim[11] = 44'hbf8afec81e8;
    stim[12] = 44'h9f3387fd0ac;
    stim[13] = 44'h2e8655252b0;
    stim[14] = 44'h6005bdb867e;
    stim[15] = 44'h2fd2946014a;
    stim[16] = 44'hab9012c93b9;
    stim[17] = 44'h1d94c2b3712;
    stim[18] = 44'h9e91a4b5f87;
    stim[19] = 44'h73446f10570;
    stim[20] = 44'h48d7a22a2c5;
    stim[21] = 44'h709ec3b0009;
    stim[22] = 44'hd466ecc90af;
    stim[23] = 44'h6491fc78545;
    stim[24] = 44'h379f8fc6ba3;
    stim[25] = 44'h4e3d2ea9ca5;
    stim[26] = 44'hd71bd8e302a;
    stim[27] = 44'hba1d631259d;
    stim[28] = 44'h62b654d700e;
    stim[29] = 44'h4432be2bbc5;
    stim[30] = 44'h54a471bc608;
    stim[31] = 44'h562d078e819;
    stim[32] = 44'h40436c45ae2;
    stim[33] = 44'hc456d011e3a;
    stim[34] = 44'h07a3b2ab34c;
    stim[35] = 44'h6989244326a;
    stim[36] = 44'hae16f47930a;
    stim[37] = 44'h81e8adec362;
    stim[38] = 44'h8a6cbb347e5;
    stim[39] = 44'h216d1974334;
    stim[40] = 44'h5421c54357b;
    stim[41] = 44'h62feed69d4e;
    stim[42] = 44'h2c4b4498bd6;
    stim[43] = 44'h344e5d6144c;
    stim[44] = 44'h96181c25748;
    stim[45] = 44'hba744f72860;
    stim[46] = 44'h382bd32f394;
    stim[47] = 44'h13d54fa2f9f;
    stim[48] = 44'h1413222b8ba;
    stim[49] = 44'h91b5a3e897e;
    stim[50] = 44'hfc80b101e8c;
    stim[51] = 44'h4829f77f3e0;
    stim[52] = 44'h010fd0ef5a1;
    stim[53] = 44'h085739250ec;
    stim[54] = 44'h1a5d0a51882;
    stim[55] = 44'h6200714e3bb;
    stim[56] = 44'h20265081d52;
    stim[57] = 44'h32877c05b3f;
    stim[58] = 44'h36d03ab01d8;
    stim[59] = 44'hb947398e514;
    stim[60] = 44'h386052968da;
    stim[61] = 44'h0c465743866;
    stim[62] = 44'hd961f2165ee;
    stim[63] = 44'h30742aed813;
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
      expv[0] = 40'h000cc80f00;
      expv[1] = 40'h0003500f00;
      expv[2] = 40'h000a400f00;
      expv[3] = 40'h0016100f00;
      expv[4] = 40'h07e9c08f00;
      expv[5] = 40'h0013d80f00;
      expv[6] = 40'h000c780f00;
      expv[7] = 40'h0010502f00;
      expv[8] = 40'h0017a80f00;
      expv[9] = 40'h001e700f00;
      expv[10] = 40'h0011300f00;
      expv[11] = 40'h001f600f00;
      expv[12] = 40'h0003f80f00;
      expv[13] = 40'h000a900f00;
      expv[14] = 40'h001ed80f00;
      expv[15] = 40'h000a300f00;
      expv[16] = 40'h0009600f00;
      expv[17] = 40'h0001580f00;
      expv[18] = 40'h0012580f00;
      expv[19] = 40'h0017880f00;
      expv[20] = 40'h0011100f00;
      expv[21] = 40'h0001d80f00;
      expv[22] = 40'h0016600f00;
      expv[23] = 40'h001e380f00;
      expv[24] = 40'h1f87e01788;
      expv[25] = 40'h0017500f00;
      expv[26] = 40'h000c700f00;
      expv[27] = 40'h0011880f00;
      expv[28] = 40'h000a680f00;
      expv[29] = 40'h001f100f00;
      expv[30] = 40'h0018d80f00;
      expv[31] = 40'h0003c00f00;
      expv[32] = 40'h0016200f00;
      expv[33] = 40'h0008080f00;
      expv[34] = 40'h0019500f00;
      expv[35] = 40'h0012200f00;
      expv[36] = 40'h301a3a1601;
      expv[37] = 40'h0016f00f00;
      expv[38] = 40'h001d980f00;
      expv[39] = 40'h000cb80f00;
      expv[40] = 40'h0002a00f00;
      expv[41] = 40'h0016b00f00;
      expv[42] = 40'h0002480f00;
      expv[43] = 40'h1eceb01788;
      expv[44] = 40'h000e100f00;
      expv[45] = 40'h0007b80f00;
      expv[46] = 40'h0009900f00;
      expv[47] = 40'h3807d10000;
      expv[48] = 40'h0011100f00;
      expv[49] = 40'h0011f00f00;
      expv[50] = 40'h0018800f00;
      expv[51] = 40'h001bb80f00;
      expv[52] = 40'h0008700f00;
      expv[53] = 40'h001c902f00;
      expv[54] = 40'h0005280f00;
      expv[55] = 40'h0018a00f00;
      expv[56] = 40'h0008400f00;
      expv[57] = 40'h001e000f00;
      expv[58] = 40'h1d7d581788;
      expv[59] = 40'h001cc00f00;
      expv[60] = 40'h0009480f00;
      expv[61] = 40'h07eba08f00;
      expv[62] = 40'h0019080f00;
      expv[63] = 40'h0015700f00;
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
