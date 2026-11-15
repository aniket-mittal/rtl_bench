// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071665 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .datain(in_vec[9:2]),
    .readyb0(in_vec[1:1]),
    .readya1(in_vec[0:0]),
    .dataout(out_vec[24:17]),
    .addrb0(out_vec[16:10]),
    .addra1(out_vec[9:3]),
    .wea(out_vec[2:2]),
    .finishb0(out_vec[1:1]),
    .finisha1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h130;
    stim[1] = 11'h34e;
    stim[2] = 11'h535;
    stim[3] = 11'h4ee;
    stim[4] = 11'h454;
    stim[5] = 11'h6fc;
    stim[6] = 11'h516;
    stim[7] = 11'h432;
    stim[8] = 11'h4a5;
    stim[9] = 11'h6f1;
    stim[10] = 11'h4b4;
    stim[11] = 11'h5a2;
    stim[12] = 11'h468;
    stim[13] = 11'h451;
    stim[14] = 11'h4f9;
    stim[15] = 11'h6ee;
    stim[16] = 11'h785;
    stim[17] = 11'h42a;
    stim[18] = 11'h5a6;
    stim[19] = 11'h617;
    stim[20] = 11'h76f;
    stim[21] = 11'h70e;
    stim[22] = 11'h5cf;
    stim[23] = 11'h534;
    stim[24] = 11'h42b;
    stim[25] = 11'h7f5;
    stim[26] = 11'h6db;
    stim[27] = 11'h75c;
    stim[28] = 11'h587;
    stim[29] = 11'h403;
    stim[30] = 11'h7be;
    stim[31] = 11'h7b5;
    stim[32] = 11'h60f;
    stim[33] = 11'h654;
    stim[34] = 11'h51c;
    stim[35] = 11'h7d4;
    stim[36] = 11'h784;
    stim[37] = 11'h439;
    stim[38] = 11'h5ab;
    stim[39] = 11'h44e;
    stim[40] = 11'h482;
    stim[41] = 11'h4cf;
    stim[42] = 11'h515;
    stim[43] = 11'h6b1;
    stim[44] = 11'h6b7;
    stim[45] = 11'h735;
    stim[46] = 11'h6ca;
    stim[47] = 11'h72b;
    stim[48] = 11'h72d;
    stim[49] = 11'h45c;
    stim[50] = 11'h79a;
    stim[51] = 11'h6eb;
    stim[52] = 11'h686;
    stim[53] = 11'h502;
    stim[54] = 11'h450;
    stim[55] = 11'h58a;
    stim[56] = 11'h7f0;
    stim[57] = 11'h6b3;
    stim[58] = 11'h5c3;
    stim[59] = 11'h498;
    stim[60] = 11'h792;
    stim[61] = 11'h418;
    stim[62] = 11'h5b5;
    stim[63] = 11'h74d;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h09c0000;
      expv[4] = 25'h0780000;
      expv[5] = 25'h02c0000;
      expv[6] = 25'h1800000;
      expv[7] = 25'h08c0000;
      expv[8] = 25'h01a0000;
      expv[9] = 25'h0540000;
      expv[10] = 25'h17a0000;
      expv[11] = 25'h05c0000;
      expv[12] = 25'h0d20000;
      expv[13] = 25'h0360000;
      expv[14] = 25'h02a0000;
      expv[15] = 25'h07e0000;
      expv[16] = 25'h1780000;
      expv[17] = 25'h1c40000;
      expv[18] = 25'h0160000;
      expv[19] = 25'h0d40000;
      expv[20] = 25'h10c0400;
      expv[21] = 25'h1b80808;
      expv[22] = 25'h1880814;
      expv[23] = 25'h0e80c14;
      expv[24] = 25'h09c0c18;
      expv[25] = 25'h016101c;
      expv[26] = 25'h1fc1020;
      expv[27] = 25'h16e1424;
      expv[28] = 25'h1b01428;
      expv[29] = 25'h0c4182c;
      expv[30] = 25'h0021c30;
      expv[31] = 25'h1e01c3e;
      expv[32] = 25'h1dc1c3d;
      expv[33] = 25'h108003a;
      expv[34] = 25'h12c0003;
      expv[35] = 25'h0900007;
      expv[36] = 25'h1ec0003;
      expv[37] = 25'h1c40003;
      expv[38] = 25'h01e0003;
      expv[39] = 25'h0d60403;
      expv[40] = 25'h028040b;
      expv[41] = 25'h042040f;
      expv[42] = 25'h068080b;
      expv[43] = 25'h08c0813;
      expv[44] = 25'h15a0817;
      expv[45] = 25'h15c0c13;
      expv[46] = 25'h19c0c1b;
      expv[47] = 25'h1660c1f;
      expv[48] = 25'h196101b;
      expv[49] = 25'h1981023;
      expv[50] = 25'h0301027;
      expv[51] = 25'h1ce1023;
      expv[52] = 25'h1761423;
      expv[53] = 25'h144142b;
      expv[54] = 25'h082142f;
      expv[55] = 25'h02a142b;
      expv[56] = 25'h0c6142b;
      expv[57] = 25'h1fa142b;
      expv[58] = 25'h15a182b;
      expv[59] = 25'h0e21c33;
      expv[60] = 25'h04e1c3d;
      expv[61] = 25'h1ca1c3e;
      expv[62] = 25'h00e1c39;
      expv[63] = 25'h0dc1c3a;
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
