// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_138515 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .start(in_vec[9:9]),
    .write(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .busy(out_vec[9:9]),
    .data_out(out_vec[8:1]),
    .ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h531;
    stim[1] = 11'h4bd;
    stim[2] = 11'h0ef;
    stim[3] = 11'h34a;
    stim[4] = 11'h10e;
    stim[5] = 11'h301;
    stim[6] = 11'h309;
    stim[7] = 11'h2a9;
    stim[8] = 11'h25c;
    stim[9] = 11'h259;
    stim[10] = 11'h372;
    stim[11] = 11'h24b;
    stim[12] = 11'h19a;
    stim[13] = 11'h335;
    stim[14] = 11'h2c6;
    stim[15] = 11'h15a;
    stim[16] = 11'h39f;
    stim[17] = 11'h089;
    stim[18] = 11'h337;
    stim[19] = 11'h0fb;
    stim[20] = 11'h1af;
    stim[21] = 11'h2ba;
    stim[22] = 11'h326;
    stim[23] = 11'h3b0;
    stim[24] = 11'h01d;
    stim[25] = 11'h0cf;
    stim[26] = 11'h2b7;
    stim[27] = 11'h2a7;
    stim[28] = 11'h326;
    stim[29] = 11'h363;
    stim[30] = 11'h26a;
    stim[31] = 11'h2fc;
    stim[32] = 11'h313;
    stim[33] = 11'h2e6;
    stim[34] = 11'h329;
    stim[35] = 11'h0c7;
    stim[36] = 11'h31c;
    stim[37] = 11'h3d6;
    stim[38] = 11'h216;
    stim[39] = 11'h0d8;
    stim[40] = 11'h0e3;
    stim[41] = 11'h362;
    stim[42] = 11'h12e;
    stim[43] = 11'h0df;
    stim[44] = 11'h3cd;
    stim[45] = 11'h20c;
    stim[46] = 11'h1dc;
    stim[47] = 11'h25f;
    stim[48] = 11'h0a0;
    stim[49] = 11'h0ba;
    stim[50] = 11'h242;
    stim[51] = 11'h17d;
    stim[52] = 11'h217;
    stim[53] = 11'h0b9;
    stim[54] = 11'h31b;
    stim[55] = 11'h317;
    stim[56] = 11'h2ff;
    stim[57] = 11'h2c5;
    stim[58] = 11'h154;
    stim[59] = 11'h0f3;
    stim[60] = 11'h393;
    stim[61] = 11'h151;
    stim[62] = 11'h335;
    stim[63] = 11'h1c1;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h200;
      expv[5] = 10'h21d;
      expv[6] = 10'h01c;
      expv[7] = 10'h21c;
      expv[8] = 10'h353;
      expv[9] = 10'h152;
      expv[10] = 10'h352;
      expv[11] = 10'h355;
      expv[12] = 10'h154;
      expv[13] = 10'h154;
      expv[14] = 10'h354;
      expv[15] = 10'h38d;
      expv[16] = 10'h18c;
      expv[17] = 10'h38c;
      expv[18] = 10'h313;
      expv[19] = 10'h112;
      expv[20] = 10'h112;
      expv[21] = 10'h112;
      expv[22] = 10'h312;
      expv[23] = 10'h355;
      expv[24] = 10'h154;
      expv[25] = 10'h154;
      expv[26] = 10'h154;
      expv[27] = 10'h354;
      expv[28] = 10'h355;
      expv[29] = 10'h154;
      expv[30] = 10'h354;
      expv[31] = 10'h2d5;
      expv[32] = 10'h0d4;
      expv[33] = 10'h2d4;
      expv[34] = 10'h3cd;
      expv[35] = 10'h1cc;
      expv[36] = 10'h1cc;
      expv[37] = 10'h3cc;
      expv[38] = 10'h3ad;
      expv[39] = 10'h1ac;
      expv[40] = 10'h1ac;
      expv[41] = 10'h1ac;
      expv[42] = 10'h3ac;
      expv[43] = 10'h25d;
      expv[44] = 10'h05c;
      expv[45] = 10'h25c;
      expv[46] = 10'h219;
      expv[47] = 10'h018;
      expv[48] = 10'h218;
      expv[49] = 10'h355;
      expv[50] = 10'h154;
      expv[51] = 10'h354;
      expv[52] = 10'h355;
      expv[53] = 10'h154;
      expv[54] = 10'h154;
      expv[55] = 10'h354;
      expv[56] = 10'h22f;
      expv[57] = 10'h02e;
      expv[58] = 10'h22e;
      expv[59] = 10'h355;
      expv[60] = 10'h154;
      expv[61] = 10'h354;
      expv[62] = 10'h2a3;
      expv[63] = 10'h0a2;
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
