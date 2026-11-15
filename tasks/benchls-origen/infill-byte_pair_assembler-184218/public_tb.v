// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184218 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .datain(in_vec[8:1]),
    .readyb0(in_vec[0:0]),
    .combbyte(out_vec[23:8]),
    .addrb0(out_vec[7:1]),
    .finishb0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h03f;
    stim[1] = 10'h122;
    stim[2] = 10'h386;
    stim[3] = 10'h30e;
    stim[4] = 10'h397;
    stim[5] = 10'h20a;
    stim[6] = 10'h3c8;
    stim[7] = 10'h24e;
    stim[8] = 10'h291;
    stim[9] = 10'h25c;
    stim[10] = 10'h290;
    stim[11] = 10'h336;
    stim[12] = 10'h2af;
    stim[13] = 10'h2a6;
    stim[14] = 10'h251;
    stim[15] = 10'h2a1;
    stim[16] = 10'h2e3;
    stim[17] = 10'h217;
    stim[18] = 10'h309;
    stim[19] = 10'h379;
    stim[20] = 10'h02f;
    stim[21] = 10'h2d0;
    stim[22] = 10'h3a0;
    stim[23] = 10'h258;
    stim[24] = 10'h320;
    stim[25] = 10'h292;
    stim[26] = 10'h1d8;
    stim[27] = 10'h38b;
    stim[28] = 10'h35c;
    stim[29] = 10'h3f4;
    stim[30] = 10'h29a;
    stim[31] = 10'h235;
    stim[32] = 10'h3b6;
    stim[33] = 10'h32b;
    stim[34] = 10'h2fc;
    stim[35] = 10'h28d;
    stim[36] = 10'h242;
    stim[37] = 10'h247;
    stim[38] = 10'h34e;
    stim[39] = 10'h29d;
    stim[40] = 10'h2f9;
    stim[41] = 10'h384;
    stim[42] = 10'h386;
    stim[43] = 10'h22c;
    stim[44] = 10'h1e3;
    stim[45] = 10'h37e;
    stim[46] = 10'h273;
    stim[47] = 10'h3f0;
    stim[48] = 10'h201;
    stim[49] = 10'h287;
    stim[50] = 10'h34b;
    stim[51] = 10'h2d6;
    stim[52] = 10'h2c4;
    stim[53] = 10'h29e;
    stim[54] = 10'h3de;
    stim[55] = 10'h34c;
    stim[56] = 10'h23c;
    stim[57] = 10'h2f4;
    stim[58] = 10'h3cc;
    stim[59] = 10'h210;
    stim[60] = 10'h231;
    stim[61] = 10'h360;
    stim[62] = 10'h3d1;
    stim[63] = 10'h3cc;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'hxxxx00;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000002;
      expv[7] = 24'h000002;
      expv[8] = 24'h000002;
      expv[9] = 24'h000002;
      expv[10] = 24'h000005;
      expv[11] = 24'h000005;
      expv[12] = 24'h000005;
      expv[13] = 24'h000005;
      expv[14] = 24'h000006;
      expv[15] = 24'h000006;
      expv[16] = 24'h000000;
      expv[17] = 24'h000002;
      expv[18] = 24'h000005;
      expv[19] = 24'h000006;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h0b8400;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000002;
      expv[30] = 24'h000002;
      expv[31] = 24'h000002;
      expv[32] = 24'h000002;
      expv[33] = 24'h000005;
      expv[34] = 24'h000005;
      expv[35] = 24'h000006;
      expv[36] = 24'h000006;
      expv[37] = 24'h000000;
      expv[38] = 24'h954600;
      expv[39] = 24'h954602;
      expv[40] = 24'h954602;
      expv[41] = 24'h954605;
      expv[42] = 24'h954606;
      expv[43] = 24'h954606;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h954600;
      expv[47] = 24'h000000;
      expv[48] = 24'h000002;
      expv[49] = 24'h000002;
      expv[50] = 24'h000005;
      expv[51] = 24'h000006;
      expv[52] = 24'h000000;
      expv[53] = 24'h43a500;
      expv[54] = 24'h43a500;
      expv[55] = 24'h43a500;
      expv[56] = 24'h43a500;
      expv[57] = 24'h43a500;
      expv[58] = 24'h43a500;
      expv[59] = 24'h43a500;
      expv[60] = 24'h43a500;
      expv[61] = 24'h43a500;
      expv[62] = 24'h43a502;
      expv[63] = 24'h43a502;
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
