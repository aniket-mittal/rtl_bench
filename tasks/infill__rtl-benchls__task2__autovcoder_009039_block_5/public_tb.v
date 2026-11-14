// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009039 dut (
    .Rs1E(in_vec[40:36]),
    .Rs2E(in_vec[35:31]),
    .RdM(in_vec[30:26]),
    .RdW(in_vec[25:21]),
    .RegWriteM(in_vec[20:20]),
    .RegWriteW(in_vec[19:19]),
    .ResultSrc0(in_vec[18:18]),
    .RdE(in_vec[17:13]),
    .Rs1D(in_vec[12:8]),
    .Rs2D(in_vec[7:3]),
    .PCSrcE(in_vec[2:2]),
    .intrupt(in_vec[1:1]),
    .ret(in_vec[0:0]),
    .ForwardAE(out_vec[8:7]),
    .ForwardBE(out_vec[6:5]),
    .StallF(out_vec[4:4]),
    .StallD(out_vec[3:3]),
    .FlushE(out_vec[2:2]),
    .FlushD(out_vec[1:1]),
    .FlushM(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h09fa93e7ed9;
    stim[1] = 41'h11978336b32;
    stim[2] = 41'h1a24421dffb;
    stim[3] = 41'h03aa0539348;
    stim[4] = 41'h04d41d78715;
    stim[5] = 41'h0752369b577;
    stim[6] = 41'h1ec9e688c4e;
    stim[7] = 41'h06b51e4eb99;
    stim[8] = 41'h1057fbc1b7c;
    stim[9] = 41'h1b4c1471944;
    stim[10] = 41'h1a60d034ba4;
    stim[11] = 41'h1f75b8314a4;
    stim[12] = 41'h16e4bc1719e;
    stim[13] = 41'h1f240234e28;
    stim[14] = 41'h197cb4059d3;
    stim[15] = 41'h17a3c2008f9;
    stim[16] = 41'h048d6141a51;
    stim[17] = 41'h12b3cbb23a8;
    stim[18] = 41'h1a8902ee6f2;
    stim[19] = 41'h11ef20ad83b;
    stim[20] = 41'h1baa9baf4e4;
    stim[21] = 41'h096ef4361c3;
    stim[22] = 41'h15f36f40940;
    stim[23] = 41'h014e222a172;
    stim[24] = 41'h1d5bdd560a0;
    stim[25] = 41'h040eb0054a4;
    stim[26] = 41'h0f94e370423;
    stim[27] = 41'h1046be17a85;
    stim[28] = 41'h1a4d1712236;
    stim[29] = 41'h1f2808b169d;
    stim[30] = 41'h1a229b2a7bd;
    stim[31] = 41'h1b51dc0fd05;
    stim[32] = 41'h0d1220e0132;
    stim[33] = 41'h0977c89f34c;
    stim[34] = 41'h0ad8c23e070;
    stim[35] = 41'h0cfe32859ef;
    stim[36] = 41'h19a2c5c4de7;
    stim[37] = 41'h0e4ebe15df9;
    stim[38] = 41'h13943abfa7a;
    stim[39] = 41'h105b166fffc;
    stim[40] = 41'h024ce9081a8;
    stim[41] = 41'h1999b215011;
    stim[42] = 41'h13a8e0937cd;
    stim[43] = 41'h0cc72717f88;
    stim[44] = 41'h18098cb86eb;
    stim[45] = 41'h16cd9a214c3;
    stim[46] = 41'h047c480f303;
    stim[47] = 41'h140263c82d0;
    stim[48] = 41'h0cf610d053b;
    stim[49] = 41'h1f928d27052;
    stim[50] = 41'h1b201804e8d;
    stim[51] = 41'h14a1a6125a1;
    stim[52] = 41'h138e3339d6c;
    stim[53] = 41'h0b631580aeb;
    stim[54] = 41'h17ec2c0afb2;
    stim[55] = 41'h1b9cdac2aac;
    stim[56] = 41'h0c05a399045;
    stim[57] = 41'h0a6a74c3fa5;
    stim[58] = 41'h1f79a8f06d6;
    stim[59] = 41'h063d5e68af6;
    stim[60] = 41'h11bc4c46ff0;
    stim[61] = 41'h1e88c17b601;
    stim[62] = 41'h06bdf1320c9;
    stim[63] = 41'h19a1185c950;
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
      expv[0] = 9'h082;
      expv[1] = 9'h007;
      expv[2] = 9'h007;
      expv[3] = 9'h000;
      expv[4] = 9'h006;
      expv[5] = 9'h007;
      expv[6] = 9'h007;
      expv[7] = 9'h002;
      expv[8] = 9'h006;
      expv[9] = 9'h006;
      expv[10] = 9'h006;
      expv[11] = 9'h006;
      expv[12] = 9'h007;
      expv[13] = 9'h000;
      expv[14] = 9'h007;
      expv[15] = 9'h002;
      expv[16] = 9'h002;
      expv[17] = 9'h000;
      expv[18] = 9'h007;
      expv[19] = 9'h007;
      expv[20] = 9'h006;
      expv[21] = 9'h007;
      expv[22] = 9'h000;
      expv[23] = 9'h007;
      expv[24] = 9'h000;
      expv[25] = 9'h006;
      expv[26] = 9'h007;
      expv[27] = 9'h006;
      expv[28] = 9'h007;
      expv[29] = 9'h006;
      expv[30] = 9'h006;
      expv[31] = 9'h006;
      expv[32] = 9'h007;
      expv[33] = 9'h006;
      expv[34] = 9'h000;
      expv[35] = 9'h007;
      expv[36] = 9'h007;
      expv[37] = 9'h002;
      expv[38] = 9'h007;
      expv[39] = 9'h006;
      expv[40] = 9'h000;
      expv[41] = 9'h002;
      expv[42] = 9'h006;
      expv[43] = 9'h000;
      expv[44] = 9'h007;
      expv[45] = 9'h007;
      expv[46] = 9'h007;
      expv[47] = 9'h000;
      expv[48] = 9'h007;
      expv[49] = 9'h007;
      expv[50] = 9'h006;
      expv[51] = 9'h002;
      expv[52] = 9'h006;
      expv[53] = 9'h047;
      expv[54] = 9'h007;
      expv[55] = 9'h006;
      expv[56] = 9'h006;
      expv[57] = 9'h006;
      expv[58] = 9'h007;
      expv[59] = 9'h007;
      expv[60] = 9'h000;
      expv[61] = 9'h002;
      expv[62] = 9'h042;
      expv[63] = 9'h000;
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
