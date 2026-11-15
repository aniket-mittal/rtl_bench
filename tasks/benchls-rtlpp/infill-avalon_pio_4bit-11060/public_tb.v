// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11060 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h18d4ff936e0;
    stim[1] = 41'h1e57294fab2;
    stim[2] = 41'h00660c1c857;
    stim[3] = 41'h01f502c5583;
    stim[4] = 41'h1a635c93ab8;
    stim[5] = 41'h00ad7b90043;
    stim[6] = 41'h053d22cc60f;
    stim[7] = 41'h116fec5f0fb;
    stim[8] = 41'h1fe48deb98a;
    stim[9] = 41'h09fc8ae3e92;
    stim[10] = 41'h14e3b294598;
    stim[11] = 41'h1c71846805d;
    stim[12] = 41'h14ee6fc4c90;
    stim[13] = 41'h15b8a67e6e9;
    stim[14] = 41'h1fa553af973;
    stim[15] = 41'h0df2d681848;
    stim[16] = 41'h167a8ab80cf;
    stim[17] = 41'h186c9ddf9ac;
    stim[18] = 41'h01b62a7d235;
    stim[19] = 41'h052df23e92f;
    stim[20] = 41'h0bfaaacf5ae;
    stim[21] = 41'h19375e9b788;
    stim[22] = 41'h1ca4306e2b3;
    stim[23] = 41'h11b9aa6fe04;
    stim[24] = 41'h1c7b6b691bf;
    stim[25] = 41'h113aacf072e;
    stim[26] = 41'h143483d52b3;
    stim[27] = 41'h06e51620b86;
    stim[28] = 41'h18bc9c4ab5b;
    stim[29] = 41'h0de823e202b;
    stim[30] = 41'h1b6c071684b;
    stim[31] = 41'h0cf938b738c;
    stim[32] = 41'h06ebade9269;
    stim[33] = 41'h11fdcc18146;
    stim[34] = 41'h0ee359f6efd;
    stim[35] = 41'h10237612720;
    stim[36] = 41'h177a3171428;
    stim[37] = 41'h0428b668fcc;
    stim[38] = 41'h11738ea8d1d;
    stim[39] = 41'h0b685b4b708;
    stim[40] = 41'h05620ba581a;
    stim[41] = 41'h1b3a8a53282;
    stim[42] = 41'h1cf769c8ab1;
    stim[43] = 41'h1277872e78d;
    stim[44] = 41'h14e949a4e79;
    stim[45] = 41'h1eb7e501b9f;
    stim[46] = 41'h01af028c560;
    stim[47] = 41'h1b205441ba2;
    stim[48] = 41'h0039f6202be;
    stim[49] = 41'h156a9d872d8;
    stim[50] = 41'h1b48fb585ef;
    stim[51] = 41'h0a20fb44a31;
    stim[52] = 41'h01b8a99f576;
    stim[53] = 41'h02a58136379;
    stim[54] = 41'h0fa1d2baf5a;
    stim[55] = 41'h08a9231ddd7;
    stim[56] = 41'h0436f529ef5;
    stim[57] = 41'h157f3beb221;
    stim[58] = 41'h17ef45b5ecd;
    stim[59] = 41'h16e3cd5110d;
    stim[60] = 41'h12fd204c0e6;
    stim[61] = 41'h1f27e216882;
    stim[62] = 41'h03f38d9d016;
    stim[63] = 41'h1e6192979e0;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000007;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000002;
      expv[7] = 33'h000000004;
      expv[8] = 33'h000000000;
      expv[9] = 33'h00000000f;
      expv[10] = 33'h000000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000008;
      expv[13] = 33'h000000008;
      expv[14] = 33'h000000000;
      expv[15] = 33'h00000000e;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000008;
      expv[19] = 33'h000000006;
      expv[20] = 33'h000000004;
      expv[21] = 33'h000000000;
      expv[22] = 33'h00000000f;
      expv[23] = 33'h00000000f;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000004;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h00000000b;
      expv[29] = 33'h000000007;
      expv[30] = 33'h000000000;
      expv[31] = 33'h00000000f;
      expv[32] = 33'h000000000;
      expv[33] = 33'h00000000b;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000005;
      expv[42] = 33'h00000000f;
      expv[43] = 33'h00000000f;
      expv[44] = 33'h000000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h10000000f;
      expv[47] = 33'h100000006;
      expv[48] = 33'h10000000f;
      expv[49] = 33'h100000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000006;
      expv[54] = 33'h00000000a;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h10000000d;
      expv[61] = 33'h10000000d;
      expv[62] = 33'h00000000e;
      expv[63] = 33'h10000000f;
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
