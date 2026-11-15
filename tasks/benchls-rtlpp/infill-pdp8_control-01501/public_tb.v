// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01501 dut (
    .clk(clk),
    .reset(in_vec[25:25]),
    .EN(in_vec[24:24]),
    .IR(in_vec[23:21]),
    .AC(in_vec[20:9]),
    .LINK(in_vec[8:8]),
    .ckFetch(in_vec[7:7]),
    .ck1(in_vec[6:6]),
    .ck2(in_vec[5:5]),
    .stbFetchA(in_vec[4:4]),
    .stbFetchB(in_vec[3:3]),
    .stb1(in_vec[2:2]),
    .irqRq(in_vec[1:1]),
    .anyDone(in_vec[0:0]),
    .done(out_vec[21:21]),
    .rot2ac(out_vec[20:20]),
    .ac_ck(out_vec[19:19]),
    .clr(out_vec[18:18]),
    .ACclr(out_vec[17:17]),
    .linkclr(out_vec[16:16]),
    .linkcml(out_vec[15:15]),
    .link_ck(out_vec[14:14]),
    .pc_ck(out_vec[13:13]),
    .ACGTF(out_vec[12:1]),
    .irqOverride(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2c610d9;
    stim[1] = 26'h2174de1;
    stim[2] = 26'h185fed2;
    stim[3] = 26'h158674f;
    stim[4] = 26'h078081a;
    stim[5] = 26'h0c8d012;
    stim[6] = 26'h0cfe55d;
    stim[7] = 26'h1bfd77b;
    stim[8] = 26'h0aa97e2;
    stim[9] = 26'h0cc488c;
    stim[10] = 26'h073226e;
    stim[11] = 26'h13b6d2a;
    stim[12] = 26'h15cd92f;
    stim[13] = 26'h19bf2b2;
    stim[14] = 26'h16691ef;
    stim[15] = 26'h1d792a9;
    stim[16] = 26'h179a010;
    stim[17] = 26'h1fe9fe2;
    stim[18] = 26'h0c8c5c2;
    stim[19] = 26'h0f3c539;
    stim[20] = 26'h0d06876;
    stim[21] = 26'h12d0dab;
    stim[22] = 26'h1ac6bf2;
    stim[23] = 26'h0132643;
    stim[24] = 26'h0dfb911;
    stim[25] = 26'h0756fd4;
    stim[26] = 26'h1003eb8;
    stim[27] = 26'h129d0ee;
    stim[28] = 26'h0dc42ec;
    stim[29] = 26'h124a1b1;
    stim[30] = 26'h03e327c;
    stim[31] = 26'h235dee6;
    stim[32] = 26'h13d49f5;
    stim[33] = 26'h02e9430;
    stim[34] = 26'h089a688;
    stim[35] = 26'h1f25561;
    stim[36] = 26'h1e6494f;
    stim[37] = 26'h0cdef9f;
    stim[38] = 26'h0d83140;
    stim[39] = 26'h1353559;
    stim[40] = 26'h003b9f3;
    stim[41] = 26'h10eef5c;
    stim[42] = 26'h19f9803;
    stim[43] = 26'h1a43d67;
    stim[44] = 26'h0968cb9;
    stim[45] = 26'h19b5624;
    stim[46] = 26'h12ab0c7;
    stim[47] = 26'h0e45739;
    stim[48] = 26'h009ac22;
    stim[49] = 26'h14848e7;
    stim[50] = 26'h1c86b8e;
    stim[51] = 26'h1ad246f;
    stim[52] = 26'h048f123;
    stim[53] = 26'h1276449;
    stim[54] = 26'h0f3c92e;
    stim[55] = 26'h1eab90c;
    stim[56] = 26'h1f7b045;
    stim[57] = 26'h07cac2f;
    stim[58] = 26'h140f28a;
    stim[59] = 26'h060e136;
    stim[60] = 26'h0d482d9;
    stim[61] = 26'h026cca9;
    stim[62] = 26'h0f6193c;
    stim[63] = 26'h10eeee4;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h120400;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h218000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h200000;
      expv[12] = 22'h200000;
      expv[13] = 22'h200000;
      expv[14] = 22'h202000;
      expv[15] = 22'h000000;
      expv[16] = 22'h000000;
      expv[17] = 22'h350000;
      expv[18] = 22'h000000;
      expv[19] = 22'h000000;
      expv[20] = 22'h000000;
      expv[21] = 22'h200000;
      expv[22] = 22'h210000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h200000;
      expv[27] = 22'h200000;
      expv[28] = 22'h000000;
      expv[29] = 22'h200000;
      expv[30] = 22'h000000;
      expv[31] = 22'h000000;
      expv[32] = 22'h200000;
      expv[33] = 22'h000000;
      expv[34] = 22'h000000;
      expv[35] = 22'h350000;
      expv[36] = 22'h1d4000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h214000;
      expv[44] = 22'h000000;
      expv[45] = 22'h280000;
      expv[46] = 22'h000000;
      expv[47] = 22'h000000;
      expv[48] = 22'h000001;
      expv[49] = 22'h200000;
      expv[50] = 22'h000000;
      expv[51] = 22'h214000;
      expv[52] = 22'h000000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000001;
      expv[55] = 22'h084000;
      expv[56] = 22'h1d4000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h200000;
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
