// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129462 dut (
    .SNnotDB(in_vec[9:9]),
    .DBnotSN(in_vec[8:8]),
    .RomExpConCtl(in_vec[7:0]),
    .Constantb(out_vec[6:6]),
    .Constantc(out_vec[5:5]),
    .Constantd(out_vec[4:4]),
    .Constante(out_vec[3:3]),
    .Constantf(out_vec[2:2]),
    .Constantg(out_vec[1:1]),
    .Constanth(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2a6;
    stim[1] = 10'h19e;
    stim[2] = 10'h137;
    stim[3] = 10'h0c3;
    stim[4] = 10'h1c4;
    stim[5] = 10'h31c;
    stim[6] = 10'h0f5;
    stim[7] = 10'h1c5;
    stim[8] = 10'h31b;
    stim[9] = 10'h1a3;
    stim[10] = 10'h20e;
    stim[11] = 10'h121;
    stim[12] = 10'h2f2;
    stim[13] = 10'h113;
    stim[14] = 10'h0d5;
    stim[15] = 10'h312;
    stim[16] = 10'h1f0;
    stim[17] = 10'h0a9;
    stim[18] = 10'h382;
    stim[19] = 10'h007;
    stim[20] = 10'h005;
    stim[21] = 10'h0e2;
    stim[22] = 10'h1f9;
    stim[23] = 10'h26a;
    stim[24] = 10'h20a;
    stim[25] = 10'h2a0;
    stim[26] = 10'h3e3;
    stim[27] = 10'h223;
    stim[28] = 10'h3e5;
    stim[29] = 10'h0ee;
    stim[30] = 10'h28a;
    stim[31] = 10'h07f;
    stim[32] = 10'h26f;
    stim[33] = 10'h0d3;
    stim[34] = 10'h01c;
    stim[35] = 10'h1a5;
    stim[36] = 10'h251;
    stim[37] = 10'h1f3;
    stim[38] = 10'h2ec;
    stim[39] = 10'h2f6;
    stim[40] = 10'h28e;
    stim[41] = 10'h32d;
    stim[42] = 10'h35d;
    stim[43] = 10'h294;
    stim[44] = 10'h344;
    stim[45] = 10'h296;
    stim[46] = 10'h285;
    stim[47] = 10'h3c8;
    stim[48] = 10'h081;
    stim[49] = 10'h174;
    stim[50] = 10'h31e;
    stim[51] = 10'h01b;
    stim[52] = 10'h1b2;
    stim[53] = 10'h1d3;
    stim[54] = 10'h153;
    stim[55] = 10'h08b;
    stim[56] = 10'h273;
    stim[57] = 10'h35a;
    stim[58] = 10'h29d;
    stim[59] = 10'h093;
    stim[60] = 10'h239;
    stim[61] = 10'h322;
    stim[62] = 10'h2c6;
    stim[63] = 10'h089;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h3f;
      expv[3] = 7'h3f;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h0d;
      expv[7] = 7'h0d;
      expv[8] = 7'h3f;
      expv[9] = 7'h3f;
      expv[10] = 7'h00;
      expv[11] = 7'h0d;
      expv[12] = 7'h00;
      expv[13] = 7'h3f;
      expv[14] = 7'h0d;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h0d;
      expv[18] = 7'h00;
      expv[19] = 7'h3f;
      expv[20] = 7'h0d;
      expv[21] = 7'h00;
      expv[22] = 7'h0d;
      expv[23] = 7'h00;
      expv[24] = 7'h00;
      expv[25] = 7'h00;
      expv[26] = 7'h3f;
      expv[27] = 7'h1f;
      expv[28] = 7'h0d;
      expv[29] = 7'h00;
      expv[30] = 7'h00;
      expv[31] = 7'h3f;
      expv[32] = 7'h1f;
      expv[33] = 7'h3f;
      expv[34] = 7'h00;
      expv[35] = 7'h0d;
      expv[36] = 7'h06;
      expv[37] = 7'h3f;
      expv[38] = 7'h00;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h0d;
      expv[42] = 7'h0d;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h00;
      expv[46] = 7'h06;
      expv[47] = 7'h00;
      expv[48] = 7'h0d;
      expv[49] = 7'h00;
      expv[50] = 7'h00;
      expv[51] = 7'h3f;
      expv[52] = 7'h00;
      expv[53] = 7'h3f;
      expv[54] = 7'h3f;
      expv[55] = 7'h3f;
      expv[56] = 7'h1f;
      expv[57] = 7'h00;
      expv[58] = 7'h06;
      expv[59] = 7'h3f;
      expv[60] = 7'h06;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h0d;
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
