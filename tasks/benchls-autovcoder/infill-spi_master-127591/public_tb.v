// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_127591 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .send(in_vec[10:10]),
    .receive(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .miso(in_vec[0:0]),
    .data_out(out_vec[10:3]),
    .busy(out_vec[2:2]),
    .sclk(out_vec[1:1]),
    .mosi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbd4;
    stim[1] = 12'hfd7;
    stim[2] = 12'h78d;
    stim[3] = 12'h219;
    stim[4] = 12'h51f;
    stim[5] = 12'h65a;
    stim[6] = 12'h321;
    stim[7] = 12'h725;
    stim[8] = 12'h625;
    stim[9] = 12'h4b2;
    stim[10] = 12'h46b;
    stim[11] = 12'h49e;
    stim[12] = 12'h2e1;
    stim[13] = 12'h618;
    stim[14] = 12'h417;
    stim[15] = 12'h490;
    stim[16] = 12'h1a7;
    stim[17] = 12'h02b;
    stim[18] = 12'h19f;
    stim[19] = 12'h097;
    stim[20] = 12'h03b;
    stim[21] = 12'h1e5;
    stim[22] = 12'h43e;
    stim[23] = 12'h31c;
    stim[24] = 12'h3bf;
    stim[25] = 12'h200;
    stim[26] = 12'h10a;
    stim[27] = 12'h73d;
    stim[28] = 12'h573;
    stim[29] = 12'h259;
    stim[30] = 12'h5ba;
    stim[31] = 12'h307;
    stim[32] = 12'h38a;
    stim[33] = 12'h56e;
    stim[34] = 12'h719;
    stim[35] = 12'h697;
    stim[36] = 12'h19f;
    stim[37] = 12'h624;
    stim[38] = 12'h5fc;
    stim[39] = 12'h067;
    stim[40] = 12'h40f;
    stim[41] = 12'h36b;
    stim[42] = 12'h7f5;
    stim[43] = 12'h238;
    stim[44] = 12'h271;
    stim[45] = 12'h5c5;
    stim[46] = 12'h720;
    stim[47] = 12'h7c2;
    stim[48] = 12'h01a;
    stim[49] = 12'h227;
    stim[50] = 12'h866;
    stim[51] = 12'h7fc;
    stim[52] = 12'h40d;
    stim[53] = 12'h7eb;
    stim[54] = 12'h096;
    stim[55] = 12'h2ba;
    stim[56] = 12'h535;
    stim[57] = 12'h24f;
    stim[58] = 12'h044;
    stim[59] = 12'h6a1;
    stim[60] = 12'h3bf;
    stim[61] = 12'h38f;
    stim[62] = 12'h566;
    stim[63] = 12'h582;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h004;
      expv[4] = 11'h00e;
      expv[5] = 11'h00d;
      expv[6] = 11'h017;
      expv[7] = 11'h015;
      expv[8] = 11'h02f;
      expv[9] = 11'h02c;
      expv[10] = 11'h056;
      expv[11] = 11'h054;
      expv[12] = 11'h0a6;
      expv[13] = 11'h0a4;
      expv[14] = 11'h146;
      expv[15] = 11'h145;
      expv[16] = 11'h287;
      expv[17] = 11'h285;
      expv[18] = 11'h50b;
      expv[19] = 11'h50b;
      expv[20] = 11'h50b;
      expv[21] = 11'h50b;
      expv[22] = 11'h50b;
      expv[23] = 11'h50d;
      expv[24] = 11'h217;
      expv[25] = 11'h214;
      expv[26] = 11'h426;
      expv[27] = 11'h424;
      expv[28] = 11'h04e;
      expv[29] = 11'h04c;
      expv[30] = 11'h09e;
      expv[31] = 11'h09d;
      expv[32] = 11'h13f;
      expv[33] = 11'h13d;
      expv[34] = 11'h277;
      expv[35] = 11'h275;
      expv[36] = 11'h4ef;
      expv[37] = 11'h4ed;
      expv[38] = 11'h1d3;
      expv[39] = 11'h1d5;
      expv[40] = 11'h3af;
      expv[41] = 11'h3ad;
      expv[42] = 11'h75f;
      expv[43] = 11'h75d;
      expv[44] = 11'h6b7;
      expv[45] = 11'h6b5;
      expv[46] = 11'h56f;
      expv[47] = 11'h56d;
      expv[48] = 11'h2d7;
      expv[49] = 11'h2d5;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h004;
      expv[53] = 11'h00e;
      expv[54] = 11'h00d;
      expv[55] = 11'h017;
      expv[56] = 11'h015;
      expv[57] = 11'h02f;
      expv[58] = 11'h02d;
      expv[59] = 11'h057;
      expv[60] = 11'h055;
      expv[61] = 11'h0af;
      expv[62] = 11'h0ad;
      expv[63] = 11'h157;
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
