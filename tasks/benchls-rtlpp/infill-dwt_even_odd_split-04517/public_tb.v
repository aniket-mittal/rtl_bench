// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04517 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .clk2(out_vec[77:77]),
    .x_e(out_vec[76:60]),
    .x_o(out_vec[59:43]),
    .g0(out_vec[42:26]),
    .g1(out_vec[25:9]),
    .y_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h12a;
    stim[1] = 9'h1aa;
    stim[2] = 9'h08c;
    stim[3] = 9'h09a;
    stim[4] = 9'h059;
    stim[5] = 9'h0e8;
    stim[6] = 9'h028;
    stim[7] = 9'h072;
    stim[8] = 9'h0d4;
    stim[9] = 9'h0c5;
    stim[10] = 9'h1fc;
    stim[11] = 9'h0bb;
    stim[12] = 9'h06e;
    stim[13] = 9'h04e;
    stim[14] = 9'h0c8;
    stim[15] = 9'h0a5;
    stim[16] = 9'h05e;
    stim[17] = 9'h0fb;
    stim[18] = 9'h098;
    stim[19] = 9'h055;
    stim[20] = 9'h0d5;
    stim[21] = 9'h0bb;
    stim[22] = 9'h095;
    stim[23] = 9'h04a;
    stim[24] = 9'h073;
    stim[25] = 9'h0e4;
    stim[26] = 9'h0a3;
    stim[27] = 9'h062;
    stim[28] = 9'h033;
    stim[29] = 9'h0a3;
    stim[30] = 9'h05e;
    stim[31] = 9'h0bb;
    stim[32] = 9'h058;
    stim[33] = 9'h043;
    stim[34] = 9'h0ec;
    stim[35] = 9'h0cb;
    stim[36] = 9'h098;
    stim[37] = 9'h0dd;
    stim[38] = 9'h0b2;
    stim[39] = 9'h0e7;
    stim[40] = 9'h0e6;
    stim[41] = 9'h0d2;
    stim[42] = 9'h0ee;
    stim[43] = 9'h063;
    stim[44] = 9'h076;
    stim[45] = 9'h019;
    stim[46] = 9'h037;
    stim[47] = 9'h00e;
    stim[48] = 9'h08d;
    stim[49] = 9'h08f;
    stim[50] = 9'h0d1;
    stim[51] = 9'h00c;
    stim[52] = 9'h031;
    stim[53] = 9'h041;
    stim[54] = 9'h094;
    stim[55] = 9'h025;
    stim[56] = 9'h05f;
    stim[57] = 9'h011;
    stim[58] = 9'h011;
    stim[59] = 9'h002;
    stim[60] = 9'h059;
    stim[61] = 9'h0b7;
    stim[62] = 9'h0f2;
    stim[63] = 9'h030;
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
      expv[0] = 78'h00000000000000000000;
      expv[1] = 78'h00000000000000000000;
      expv[2] = 78'h00000000000000000000;
      expv[3] = 78'h3ff8c000000000000000;
      expv[4] = 78'h1ff8c000071f40000000;
      expv[5] = 78'h20059ffcd71f40000000;
      expv[6] = 78'h00059ffcd045235579ff;
      expv[7] = 78'h20028fff4045235579ff;
      expv[8] = 78'h00028fff409cc7f22c00;
      expv[9] = 78'h3ffd4003909cc7f22c00;
      expv[10] = 78'h00000000000000000000;
      expv[11] = 78'h00000000000000000000;
      expv[12] = 78'h3ffbb000000000000000;
      expv[13] = 78'h1ffbb000077a50000000;
      expv[14] = 78'h2004e003777a50000000;
      expv[15] = 78'h0004e0037059acb7e800;
      expv[16] = 78'h3ffa5ffe4059acb7e800;
      expv[17] = 78'h1ffa5ffe47952b860400;
      expv[18] = 78'h3fffb002f7952b860400;
      expv[19] = 78'h1fffb002f7a544ab9800;
      expv[20] = 78'h20055ffcc7a544ab9800;
      expv[21] = 78'h00055ffcc0a03f39e5ff;
      expv[22] = 78'h3ffbbffea8a03f39e5ff;
      expv[23] = 78'h1ffbbffeafc607d2edff;
      expv[24] = 78'h2004affcafc607d2edff;
      expv[25] = 78'h0004affca851ef583200;
      expv[26] = 78'h3ffe40039851ef583200;
      expv[27] = 78'h1ffe4003980ba8dbda00;
      expv[28] = 78'h20062ffd180ba8dbda00;
      expv[29] = 78'h00062ffd18a4f346de00;
      expv[30] = 78'h3ffa300198a4f346de00;
      expv[31] = 78'h1ffa30019fa3186d3e00;
      expv[32] = 78'h3ffbb002f7a3186d3e00;
      expv[33] = 78'h1ffbb002f7277c9003ff;
      expv[34] = 78'h20043002c7277c9003ff;
      expv[35] = 78'h00043002c0445c7ae5ff;
      expv[36] = 78'h3ffcbfff60445c7ae5ff;
      expv[37] = 78'h1ffcbfff67d4ffc7e000;
      expv[38] = 78'h3ffddffcc7d4ffc7e000;
      expv[39] = 78'h1ffddffcc78cff5749ff;
      expv[40] = 78'h3ffe7ffd978cff5749ff;
      expv[41] = 78'h1ffe7ffd97b067986800;
      expv[42] = 78'h3ffd2fff37b067986800;
      expv[43] = 78'h1ffd2fff37909fe8a400;
      expv[44] = 78'h20063fff77909fe8a400;
      expv[45] = 78'h00063fff7096dbe89c00;
      expv[46] = 78'h20019003b096dbe89c00;
      expv[47] = 78'h00019003b0889cc9ec00;
      expv[48] = 78'h2000e001b8889cc9ec00;
      expv[49] = 78'h0000e001b831643d89ff;
      expv[50] = 78'h3ff8fffc6831643d89ff;
      expv[51] = 78'h1ff8fffc6f318b318fff;
      expv[52] = 78'h2000cffe8f318b318fff;
      expv[53] = 78'h0000cffe8fb29fcf13ff;
      expv[54] = 78'h200410018fb29fcf13ff;
      expv[55] = 78'h000410018888a05e0a00;
      expv[56] = 78'h20025ffca088a05e0a00;
      expv[57] = 78'h00025ffca081973ecfff;
      expv[58] = 78'h20011002f881973ecfff;
      expv[59] = 78'h00011002f841e4baadff;
      expv[60] = 78'h200020008841e4baadff;
      expv[61] = 78'h0000200088130403efff;
      expv[62] = 78'h3ffb7002c8130403efff;
      expv[63] = 78'h1ffb7002cf7458906a00;
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
