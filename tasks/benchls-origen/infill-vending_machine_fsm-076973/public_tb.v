// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_076973 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .enable_i(in_vec[8:8]),
    .money_i(in_vec[7:2]),
    .drinktype_i(in_vec[1:0]),
    .ready_o(out_vec[9:9]),
    .enable_o(out_vec[8:8]),
    .change_o(out_vec[7:2]),
    .drink_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h246;
    stim[1] = 10'h20c;
    stim[2] = 10'h03c;
    stim[3] = 10'h0b7;
    stim[4] = 10'h055;
    stim[5] = 10'h13a;
    stim[6] = 10'h058;
    stim[7] = 10'h127;
    stim[8] = 10'h1ab;
    stim[9] = 10'h061;
    stim[10] = 10'h18b;
    stim[11] = 10'h011;
    stim[12] = 10'h073;
    stim[13] = 10'h193;
    stim[14] = 10'h091;
    stim[15] = 10'h03d;
    stim[16] = 10'h175;
    stim[17] = 10'h085;
    stim[18] = 10'h05e;
    stim[19] = 10'h06f;
    stim[20] = 10'h06a;
    stim[21] = 10'h105;
    stim[22] = 10'h09a;
    stim[23] = 10'h188;
    stim[24] = 10'h0e8;
    stim[25] = 10'h191;
    stim[26] = 10'h172;
    stim[27] = 10'h19d;
    stim[28] = 10'h085;
    stim[29] = 10'h020;
    stim[30] = 10'h10e;
    stim[31] = 10'h003;
    stim[32] = 10'h13b;
    stim[33] = 10'h041;
    stim[34] = 10'h15e;
    stim[35] = 10'h033;
    stim[36] = 10'h081;
    stim[37] = 10'h199;
    stim[38] = 10'h1a9;
    stim[39] = 10'h003;
    stim[40] = 10'h10b;
    stim[41] = 10'h17c;
    stim[42] = 10'h0bc;
    stim[43] = 10'h1c2;
    stim[44] = 10'h007;
    stim[45] = 10'h04b;
    stim[46] = 10'h32b;
    stim[47] = 10'h098;
    stim[48] = 10'h1ab;
    stim[49] = 10'h0e1;
    stim[50] = 10'h114;
    stim[51] = 10'h0a1;
    stim[52] = 10'h156;
    stim[53] = 10'h189;
    stim[54] = 10'h09a;
    stim[55] = 10'h0d6;
    stim[56] = 10'h1c6;
    stim[57] = 10'h12d;
    stim[58] = 10'h0ad;
    stim[59] = 10'h05b;
    stim[60] = 10'h0fd;
    stim[61] = 10'h1b3;
    stim[62] = 10'h03d;
    stim[63] = 10'h170;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h200;
      expv[5] = 10'h200;
      expv[6] = 10'h200;
      expv[7] = 10'h000;
      expv[8] = 10'h138;
      expv[9] = 10'h200;
      expv[10] = 10'h000;
      expv[11] = 10'h147;
      expv[12] = 10'h200;
      expv[13] = 10'h200;
      expv[14] = 10'h200;
      expv[15] = 10'h000;
      expv[16] = 10'h12f;
      expv[17] = 10'h200;
      expv[18] = 10'h000;
      expv[19] = 10'h139;
      expv[20] = 10'h200;
      expv[21] = 10'h200;
      expv[22] = 10'h200;
      expv[23] = 10'h000;
      expv[24] = 10'h104;
      expv[25] = 10'h200;
      expv[26] = 10'h200;
      expv[27] = 10'h000;
      expv[28] = 10'h155;
      expv[29] = 10'h200;
      expv[30] = 10'h200;
      expv[31] = 10'h200;
      expv[32] = 10'h000;
      expv[33] = 10'h10c;
      expv[34] = 10'h200;
      expv[35] = 10'h200;
      expv[36] = 10'h000;
      expv[37] = 10'h10e;
      expv[38] = 10'h200;
      expv[39] = 10'h000;
      expv[40] = 10'h15d;
      expv[41] = 10'h200;
      expv[42] = 10'h000;
      expv[43] = 10'h108;
      expv[44] = 10'h200;
      expv[45] = 10'h000;
      expv[46] = 10'h200;
      expv[47] = 10'h200;
      expv[48] = 10'h200;
      expv[49] = 10'h200;
      expv[50] = 10'h000;
      expv[51] = 10'h147;
      expv[52] = 10'h200;
      expv[53] = 10'h200;
      expv[54] = 10'h000;
      expv[55] = 10'h106;
      expv[56] = 10'h200;
      expv[57] = 10'h200;
      expv[58] = 10'h000;
      expv[59] = 10'h176;
      expv[60] = 10'h200;
      expv[61] = 10'h200;
      expv[62] = 10'h200;
      expv[63] = 10'h000;
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
