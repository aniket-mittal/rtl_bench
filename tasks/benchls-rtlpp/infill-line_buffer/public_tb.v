// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Line_Buffer dut (
    .clock(clk),
    .clken(in_vec[12:12]),
    .shiftin(in_vec[11:0]),
    .taps0x(out_vec[23:12]),
    .taps1x(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h193e;
    stim[1] = 13'h1263;
    stim[2] = 13'h1fd3;
    stim[3] = 13'h0a2c;
    stim[4] = 13'h0b7c;
    stim[5] = 13'h09a5;
    stim[6] = 13'h11d0;
    stim[7] = 13'h04d0;
    stim[8] = 13'h1945;
    stim[9] = 13'h1448;
    stim[10] = 13'h00f6;
    stim[11] = 13'h0d19;
    stim[12] = 13'h0b50;
    stim[13] = 13'h1003;
    stim[14] = 13'h0cad;
    stim[15] = 13'h1a15;
    stim[16] = 13'h1525;
    stim[17] = 13'h19fa;
    stim[18] = 13'h0d35;
    stim[19] = 13'h13ef;
    stim[20] = 13'h13d3;
    stim[21] = 13'h0bb7;
    stim[22] = 13'h1522;
    stim[23] = 13'h1926;
    stim[24] = 13'h16a7;
    stim[25] = 13'h0522;
    stim[26] = 13'h1007;
    stim[27] = 13'h043e;
    stim[28] = 13'h0746;
    stim[29] = 13'h1551;
    stim[30] = 13'h1246;
    stim[31] = 13'h1d18;
    stim[32] = 13'h0664;
    stim[33] = 13'h03cd;
    stim[34] = 13'h0d50;
    stim[35] = 13'h1171;
    stim[36] = 13'h1b3b;
    stim[37] = 13'h1b16;
    stim[38] = 13'h0894;
    stim[39] = 13'h1ade;
    stim[40] = 13'h0db3;
    stim[41] = 13'h0071;
    stim[42] = 13'h1073;
    stim[43] = 13'h07fd;
    stim[44] = 13'h16f3;
    stim[45] = 13'h1e2d;
    stim[46] = 13'h1b10;
    stim[47] = 13'h1e49;
    stim[48] = 13'h16d6;
    stim[49] = 13'h07ba;
    stim[50] = 13'h05b1;
    stim[51] = 13'h10aa;
    stim[52] = 13'h05d1;
    stim[53] = 13'h0e5d;
    stim[54] = 13'h0ba8;
    stim[55] = 13'h0f13;
    stim[56] = 13'h0678;
    stim[57] = 13'h19fe;
    stim[58] = 13'h1d30;
    stim[59] = 13'h0cfe;
    stim[60] = 13'h1db2;
    stim[61] = 13'h1aac;
    stim[62] = 13'h1860;
    stim[63] = 13'h00bc;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxx93e;
      expv[2] = 24'h93e263;
      expv[3] = 24'h263fd3;
      expv[4] = 24'h263fd3;
      expv[5] = 24'h263fd3;
      expv[6] = 24'h263fd3;
      expv[7] = 24'hfd31d0;
      expv[8] = 24'hfd31d0;
      expv[9] = 24'h1d0945;
      expv[10] = 24'h945448;
      expv[11] = 24'h945448;
      expv[12] = 24'h945448;
      expv[13] = 24'h945448;
      expv[14] = 24'h448003;
      expv[15] = 24'h448003;
      expv[16] = 24'h003a15;
      expv[17] = 24'ha15525;
      expv[18] = 24'h5259fa;
      expv[19] = 24'h5259fa;
      expv[20] = 24'h9fa3ef;
      expv[21] = 24'h3ef3d3;
      expv[22] = 24'h3ef3d3;
      expv[23] = 24'h3d3522;
      expv[24] = 24'h522926;
      expv[25] = 24'h9266a7;
      expv[26] = 24'h9266a7;
      expv[27] = 24'h6a7007;
      expv[28] = 24'h6a7007;
      expv[29] = 24'h6a7007;
      expv[30] = 24'h007551;
      expv[31] = 24'h551246;
      expv[32] = 24'h246d18;
      expv[33] = 24'h246d18;
      expv[34] = 24'h246d18;
      expv[35] = 24'h246d18;
      expv[36] = 24'hd18171;
      expv[37] = 24'h171b3b;
      expv[38] = 24'hb3bb16;
      expv[39] = 24'hb3bb16;
      expv[40] = 24'hb16ade;
      expv[41] = 24'hb16ade;
      expv[42] = 24'hb16ade;
      expv[43] = 24'hade073;
      expv[44] = 24'hade073;
      expv[45] = 24'h0736f3;
      expv[46] = 24'h6f3e2d;
      expv[47] = 24'he2db10;
      expv[48] = 24'hb10e49;
      expv[49] = 24'he496d6;
      expv[50] = 24'he496d6;
      expv[51] = 24'he496d6;
      expv[52] = 24'h6d60aa;
      expv[53] = 24'h6d60aa;
      expv[54] = 24'h6d60aa;
      expv[55] = 24'h6d60aa;
      expv[56] = 24'h6d60aa;
      expv[57] = 24'h6d60aa;
      expv[58] = 24'h0aa9fe;
      expv[59] = 24'h9fed30;
      expv[60] = 24'h9fed30;
      expv[61] = 24'hd30db2;
      expv[62] = 24'hdb2aac;
      expv[63] = 24'haac860;
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
