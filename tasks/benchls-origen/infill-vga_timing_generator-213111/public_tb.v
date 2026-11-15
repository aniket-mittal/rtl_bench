// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213111 dut (
    .clk(clk),
    .reset(in_vec[24:24]),
    .red(in_vec[23:16]),
    .green(in_vec[15:8]),
    .blue(in_vec[7:0]),
    .r(out_vec[25:18]),
    .g(out_vec[17:10]),
    .b(out_vec[9:2]),
    .hsync(out_vec[1:1]),
    .vsync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h19b4011;
    stim[1] = 25'h1431831;
    stim[2] = 25'h02e0550;
    stim[3] = 25'h0b39d14;
    stim[4] = 25'h00325d8;
    stim[5] = 25'h03dfe67;
    stim[6] = 25'h0cc4383;
    stim[7] = 25'h0db778d;
    stim[8] = 25'h08f774d;
    stim[9] = 25'h062ac13;
    stim[10] = 25'h0276c49;
    stim[11] = 25'h0dbe83a;
    stim[12] = 25'h054edb7;
    stim[13] = 25'h0859960;
    stim[14] = 25'h02ac07f;
    stim[15] = 25'h0298243;
    stim[16] = 25'h005b710;
    stim[17] = 25'h095bab5;
    stim[18] = 25'h0f66727;
    stim[19] = 25'h0d0a6a1;
    stim[20] = 25'h09c27e2;
    stim[21] = 25'h0113625;
    stim[22] = 25'h0c0730d;
    stim[23] = 25'h06c8427;
    stim[24] = 25'h00510af;
    stim[25] = 25'h02bb8d1;
    stim[26] = 25'h0a729b7;
    stim[27] = 25'h0cd53e2;
    stim[28] = 25'h0511de0;
    stim[29] = 25'h072f85f;
    stim[30] = 25'h07e0cd4;
    stim[31] = 25'h0559432;
    stim[32] = 25'h0b9f913;
    stim[33] = 25'h07a0114;
    stim[34] = 25'h00df81a;
    stim[35] = 25'h0a63db4;
    stim[36] = 25'h00c10d4;
    stim[37] = 25'h07ada78;
    stim[38] = 25'h09151d9;
    stim[39] = 25'h0a26519;
    stim[40] = 25'h0695c89;
    stim[41] = 25'h0930018;
    stim[42] = 25'h0b89d46;
    stim[43] = 25'h09a0cd8;
    stim[44] = 25'h0b87c75;
    stim[45] = 25'h04e1370;
    stim[46] = 25'h0f26278;
    stim[47] = 25'h09ecb66;
    stim[48] = 25'h0d8350a;
    stim[49] = 25'h0b53c68;
    stim[50] = 25'h0e3829b;
    stim[51] = 25'h0f92557;
    stim[52] = 25'h089e990;
    stim[53] = 25'h0a20da7;
    stim[54] = 25'h044b58a;
    stim[55] = 25'h07654db;
    stim[56] = 25'h0753dc0;
    stim[57] = 25'h09b0d68;
    stim[58] = 25'h0de1e31;
    stim[59] = 25'h084f181;
    stim[60] = 25'h0411fc2;
    stim[61] = 25'h012a85b;
    stim[62] = 25'h0343147;
    stim[63] = 25'h032fe7a;
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
      expv[0] = 26'h000000x;
      expv[1] = 26'h10c60c7;
      expv[2] = 26'h0b81543;
      expv[3] = 26'h2ce7453;
      expv[4] = 26'h00c9763;
      expv[5] = 26'h0f7f99f;
      expv[6] = 26'h3310e0f;
      expv[7] = 26'h36dde37;
      expv[8] = 26'h23ddd37;
      expv[9] = 26'h18ab04f;
      expv[10] = 26'h09db127;
      expv[11] = 26'h36fa0eb;
      expv[12] = 26'h153b6df;
      expv[13] = 26'h2166583;
      expv[14] = 26'h0ab01ff;
      expv[15] = 26'h0a6090f;
      expv[16] = 26'h016dc43;
      expv[17] = 26'h256ead7;
      expv[18] = 26'h3d99c9f;
      expv[19] = 26'h3429a87;
      expv[20] = 26'h2709f8b;
      expv[21] = 26'h044d897;
      expv[22] = 26'h301cc37;
      expv[23] = 26'h1b2109f;
      expv[24] = 26'h01442bf;
      expv[25] = 26'h0aee347;
      expv[26] = 26'h29ca6df;
      expv[27] = 26'h3354f8b;
      expv[28] = 26'h1447783;
      expv[29] = 26'h1cbe17f;
      expv[30] = 26'h1f83353;
      expv[31] = 26'h15650cb;
      expv[32] = 26'h2e7e44f;
      expv[33] = 26'h1e80453;
      expv[34] = 26'h037e06b;
      expv[35] = 26'h298f6d3;
      expv[36] = 26'h0304353;
      expv[37] = 26'h1eb69e3;
      expv[38] = 26'h2454767;
      expv[39] = 26'h2899467;
      expv[40] = 26'h1a57227;
      expv[41] = 26'h24c0063;
      expv[42] = 26'h2e2751b;
      expv[43] = 26'h2683363;
      expv[44] = 26'h2e1f1d7;
      expv[45] = 26'h1384dc3;
      expv[46] = 26'h3c989e3;
      expv[47] = 26'h27b2d9b;
      expv[48] = 26'h360d42b;
      expv[49] = 26'h2d4f1a3;
      expv[50] = 26'h38e0a6f;
      expv[51] = 26'h3e4955f;
      expv[52] = 26'h227a643;
      expv[53] = 26'h288369f;
      expv[54] = 26'h112d62b;
      expv[55] = 26'h1d9536f;
      expv[56] = 26'h1d4f703;
      expv[57] = 26'h26c35a3;
      expv[58] = 26'h37878c7;
      expv[59] = 26'h213c607;
      expv[60] = 26'h1047f0b;
      expv[61] = 26'h04aa16f;
      expv[62] = 26'h0d0c51f;
      expv[63] = 26'h0cbf9eb;
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
