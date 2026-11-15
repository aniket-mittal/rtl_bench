// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005250 dut (
    .clock(clk),
    .resetn(in_vec[12:12]),
    .load(in_vec[11:11]),
    .go(in_vec[10:10]),
    .colour_in(in_vec[9:7]),
    .location(in_vec[6:0]),
    .x_out(out_vec[17:10]),
    .y_out(out_vec[9:3]),
    .colour_out(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0c66;
    stim[1] = 13'h0548;
    stim[2] = 13'h1849;
    stim[3] = 13'h1fce;
    stim[4] = 13'h1621;
    stim[5] = 13'h1b1a;
    stim[6] = 13'h1f70;
    stim[7] = 13'h12b6;
    stim[8] = 13'h185c;
    stim[9] = 13'h1e89;
    stim[10] = 13'h14ae;
    stim[11] = 13'h1bbd;
    stim[12] = 13'h16dd;
    stim[13] = 13'h1e00;
    stim[14] = 13'h1a29;
    stim[15] = 13'h19c1;
    stim[16] = 13'h10c8;
    stim[17] = 13'h1803;
    stim[18] = 13'h1d3a;
    stim[19] = 13'h1791;
    stim[20] = 13'h120a;
    stim[21] = 13'h1cb7;
    stim[22] = 13'h18b5;
    stim[23] = 13'h107d;
    stim[24] = 13'h116f;
    stim[25] = 13'h14d0;
    stim[26] = 13'h17a1;
    stim[27] = 13'h1312;
    stim[28] = 13'h0014;
    stim[29] = 13'h1d64;
    stim[30] = 13'h18c9;
    stim[31] = 13'h1820;
    stim[32] = 13'h1b0e;
    stim[33] = 13'h12e8;
    stim[34] = 13'h17ec;
    stim[35] = 13'h1f2a;
    stim[36] = 13'h165c;
    stim[37] = 13'h1b0d;
    stim[38] = 13'h1a06;
    stim[39] = 13'h1f66;
    stim[40] = 13'h1b44;
    stim[41] = 13'h1ae5;
    stim[42] = 13'h132f;
    stim[43] = 13'h1379;
    stim[44] = 13'h1693;
    stim[45] = 13'h1672;
    stim[46] = 13'h1473;
    stim[47] = 13'h1da8;
    stim[48] = 13'h1ccd;
    stim[49] = 13'h17c4;
    stim[50] = 13'h1bac;
    stim[51] = 13'h1287;
    stim[52] = 13'h1b48;
    stim[53] = 13'h1118;
    stim[54] = 13'h11b1;
    stim[55] = 13'h1f00;
    stim[56] = 13'h1fde;
    stim[57] = 13'h1c17;
    stim[58] = 13'h143d;
    stim[59] = 13'h15c6;
    stim[60] = 13'h12ba;
    stim[61] = 13'h123b;
    stim[62] = 13'h1baa;
    stim[63] = 13'h1869;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h12400;
      expv[4] = 18'h12400;
      expv[5] = 18'h12400;
      expv[6] = 18'h124d6;
      expv[7] = 18'h12786;
      expv[8] = 18'h12786;
      expv[9] = 18'h12b86;
      expv[10] = 18'h12f86;
      expv[11] = 18'h13386;
      expv[12] = 18'h13786;
      expv[13] = 18'h13b86;
      expv[14] = 18'h13f86;
      expv[15] = 18'h14386;
      expv[16] = 18'h14786;
      expv[17] = 18'h14b86;
      expv[18] = 18'h14f86;
      expv[19] = 18'h15386;
      expv[20] = 18'h15786;
      expv[21] = 18'h15b86;
      expv[22] = 18'h15f86;
      expv[23] = 18'h16386;
      expv[24] = 18'h1278e;
      expv[25] = 18'h12b8e;
      expv[26] = 18'h12f8e;
      expv[27] = 18'h1338e;
      expv[28] = 18'h1378e;
      expv[29] = 18'h00000;
      expv[30] = 18'h19000;
      expv[31] = 18'h19000;
      expv[32] = 18'h19000;
      expv[33] = 18'h19000;
      expv[34] = 18'h19000;
      expv[35] = 18'h19367;
      expv[36] = 18'h19367;
      expv[37] = 18'h19367;
      expv[38] = 18'h19367;
      expv[39] = 18'h19767;
      expv[40] = 18'h19b67;
      expv[41] = 18'h19f67;
      expv[42] = 18'h1a367;
      expv[43] = 18'h1a767;
      expv[44] = 18'h1ab67;
      expv[45] = 18'h1af67;
      expv[46] = 18'h1b367;
      expv[47] = 18'h1b767;
      expv[48] = 18'h1bb67;
      expv[49] = 18'h1bf67;
      expv[50] = 18'h1c367;
      expv[51] = 18'h1c767;
      expv[52] = 18'h1cb67;
      expv[53] = 18'h1cf67;
      expv[54] = 18'h1936f;
      expv[55] = 18'h1976f;
      expv[56] = 18'h19b6f;
      expv[57] = 18'h19f6f;
      expv[58] = 18'h1a36f;
      expv[59] = 18'h1a76f;
      expv[60] = 18'h1ab6f;
      expv[61] = 18'h1af6f;
      expv[62] = 18'h1b36f;
      expv[63] = 18'h1b76f;
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
