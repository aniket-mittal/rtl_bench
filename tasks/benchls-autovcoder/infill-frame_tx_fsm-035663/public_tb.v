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

  autovcoder_035663 dut (
    .clk_top(clk),
    .rst(in_vec[9:9]),
    .SystemEnd(in_vec[8:8]),
    .SystemStart(in_vec[7:7]),
    .PHYInitEnd(in_vec[6:6]),
    .NumbFrameReturned(in_vec[5:5]),
    .DistFrameReturned(in_vec[4:4]),
    .DelayFrameReturned(in_vec[3:3]),
    .DelayDistFrameReturned(in_vec[2:2]),
    .ConfigEnd(in_vec[1:1]),
    .DataFrameGo(in_vec[0:0]),
    .StateIdle(out_vec[6:6]),
    .StateNumb(out_vec[5:5]),
    .StateDist(out_vec[4:4]),
    .StateDelay(out_vec[3:3]),
    .StateDelayDist(out_vec[2:2]),
    .StateData(out_vec[1:1]),
    .StateWait(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h309;
    stim[1] = 10'h3d9;
    stim[2] = 10'h0d6;
    stim[3] = 10'h083;
    stim[4] = 10'h0fb;
    stim[5] = 10'h185;
    stim[6] = 10'h091;
    stim[7] = 10'h0dc;
    stim[8] = 10'h0b8;
    stim[9] = 10'h0df;
    stim[10] = 10'h1a1;
    stim[11] = 10'h16d;
    stim[12] = 10'h36a;
    stim[13] = 10'h1a1;
    stim[14] = 10'h132;
    stim[15] = 10'h10c;
    stim[16] = 10'h03e;
    stim[17] = 10'h03e;
    stim[18] = 10'h1ab;
    stim[19] = 10'h1c7;
    stim[20] = 10'h03e;
    stim[21] = 10'h08a;
    stim[22] = 10'h165;
    stim[23] = 10'h02a;
    stim[24] = 10'h00e;
    stim[25] = 10'h1b2;
    stim[26] = 10'h172;
    stim[27] = 10'h24b;
    stim[28] = 10'h004;
    stim[29] = 10'h063;
    stim[30] = 10'h1f8;
    stim[31] = 10'h0e1;
    stim[32] = 10'h19e;
    stim[33] = 10'h10d;
    stim[34] = 10'h10a;
    stim[35] = 10'h079;
    stim[36] = 10'h003;
    stim[37] = 10'h1f3;
    stim[38] = 10'h18c;
    stim[39] = 10'h08c;
    stim[40] = 10'h0ad;
    stim[41] = 10'h008;
    stim[42] = 10'h17d;
    stim[43] = 10'h150;
    stim[44] = 10'h1a1;
    stim[45] = 10'h015;
    stim[46] = 10'h015;
    stim[47] = 10'h15d;
    stim[48] = 10'h13b;
    stim[49] = 10'h147;
    stim[50] = 10'h122;
    stim[51] = 10'h145;
    stim[52] = 10'h191;
    stim[53] = 10'h046;
    stim[54] = 10'h1b6;
    stim[55] = 10'h2f3;
    stim[56] = 10'h1f9;
    stim[57] = 10'h10e;
    stim[58] = 10'h1bd;
    stim[59] = 10'h036;
    stim[60] = 10'h16b;
    stim[61] = 10'h192;
    stim[62] = 10'h157;
    stim[63] = 10'h0e2;
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
      expv[0] = 7'h40;
      expv[1] = 7'h40;
      expv[2] = 7'h40;
      expv[3] = 7'h20;
      expv[4] = 7'h01;
      expv[5] = 7'h1e;
      expv[6] = 7'h40;
      expv[7] = 7'h40;
      expv[8] = 7'h20;
      expv[9] = 7'h01;
      expv[10] = 7'h0e;
      expv[11] = 7'h40;
      expv[12] = 7'h40;
      expv[13] = 7'h40;
      expv[14] = 7'h40;
      expv[15] = 7'h40;
      expv[16] = 7'h40;
      expv[17] = 7'h40;
      expv[18] = 7'h40;
      expv[19] = 7'h40;
      expv[20] = 7'h00;
      expv[21] = 7'h00;
      expv[22] = 7'h00;
      expv[23] = 7'h40;
      expv[24] = 7'h40;
      expv[25] = 7'h40;
      expv[26] = 7'h40;
      expv[27] = 7'h40;
      expv[28] = 7'h40;
      expv[29] = 7'h40;
      expv[30] = 7'h40;
      expv[31] = 7'h00;
      expv[32] = 7'h00;
      expv[33] = 7'h40;
      expv[34] = 7'h40;
      expv[35] = 7'h40;
      expv[36] = 7'h40;
      expv[37] = 7'h40;
      expv[38] = 7'h00;
      expv[39] = 7'h40;
      expv[40] = 7'h40;
      expv[41] = 7'h40;
      expv[42] = 7'h40;
      expv[43] = 7'h40;
      expv[44] = 7'h40;
      expv[45] = 7'h40;
      expv[46] = 7'h40;
      expv[47] = 7'h40;
      expv[48] = 7'h40;
      expv[49] = 7'h40;
      expv[50] = 7'h40;
      expv[51] = 7'h40;
      expv[52] = 7'h40;
      expv[53] = 7'h40;
      expv[54] = 7'h40;
      expv[55] = 7'h40;
      expv[56] = 7'h40;
      expv[57] = 7'h00;
      expv[58] = 7'h40;
      expv[59] = 7'h40;
      expv[60] = 7'h40;
      expv[61] = 7'h40;
      expv[62] = 7'h40;
      expv[63] = 7'h40;
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
