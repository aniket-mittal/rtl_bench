// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071638 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hccc;
    stim[1] = 12'hd21;
    stim[2] = 12'h33d;
    stim[3] = 12'h056;
    stim[4] = 12'h1d7;
    stim[5] = 12'h6a1;
    stim[6] = 12'h6ac;
    stim[7] = 12'h71e;
    stim[8] = 12'h534;
    stim[9] = 12'h436;
    stim[10] = 12'h440;
    stim[11] = 12'h5c7;
    stim[12] = 12'hd95;
    stim[13] = 12'h641;
    stim[14] = 12'h123;
    stim[15] = 12'h07a;
    stim[16] = 12'h70e;
    stim[17] = 12'h3be;
    stim[18] = 12'h02b;
    stim[19] = 12'h749;
    stim[20] = 12'h5c1;
    stim[21] = 12'h138;
    stim[22] = 12'h424;
    stim[23] = 12'h60f;
    stim[24] = 12'h4cf;
    stim[25] = 12'h5db;
    stim[26] = 12'h0ef;
    stim[27] = 12'h0ea;
    stim[28] = 12'h07e;
    stim[29] = 12'h5e2;
    stim[30] = 12'h754;
    stim[31] = 12'h36b;
    stim[32] = 12'h3c3;
    stim[33] = 12'h72b;
    stim[34] = 12'h7d8;
    stim[35] = 12'h32b;
    stim[36] = 12'h65c;
    stim[37] = 12'hdae;
    stim[38] = 12'h338;
    stim[39] = 12'h7b8;
    stim[40] = 12'h396;
    stim[41] = 12'h3f6;
    stim[42] = 12'h2c3;
    stim[43] = 12'h3f9;
    stim[44] = 12'h3ff;
    stim[45] = 12'h2dc;
    stim[46] = 12'h420;
    stim[47] = 12'h1b9;
    stim[48] = 12'h543;
    stim[49] = 12'h5cd;
    stim[50] = 12'h70f;
    stim[51] = 12'h72d;
    stim[52] = 12'h799;
    stim[53] = 12'h479;
    stim[54] = 12'h7cd;
    stim[55] = 12'h303;
    stim[56] = 12'h428;
    stim[57] = 12'h620;
    stim[58] = 12'h154;
    stim[59] = 12'h3a7;
    stim[60] = 12'h524;
    stim[61] = 12'h5b3;
    stim[62] = 12'h014;
    stim[63] = 12'h57b;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h121;
      expv[7] = 10'h121;
      expv[8] = 10'h121;
      expv[9] = 10'h31e;
      expv[10] = 10'h31e;
      expv[11] = 10'h31e;
      expv[12] = 10'h31e;
      expv[13] = 10'h100;
      expv[14] = 10'h195;
      expv[15] = 10'h195;
      expv[16] = 10'h195;
      expv[17] = 10'h195;
      expv[18] = 10'h195;
      expv[19] = 10'h195;
      expv[20] = 10'h30e;
      expv[21] = 10'h30e;
      expv[22] = 10'h30e;
      expv[23] = 10'h30e;
      expv[24] = 10'h349;
      expv[25] = 10'h349;
      expv[26] = 10'h349;
      expv[27] = 10'h349;
      expv[28] = 10'h349;
      expv[29] = 10'h349;
      expv[30] = 10'h349;
      expv[31] = 10'h3c1;
      expv[32] = 10'h3c1;
      expv[33] = 10'h3c1;
      expv[34] = 10'h3db;
      expv[35] = 10'h3e2;
      expv[36] = 10'h3e2;
      expv[37] = 10'h354;
      expv[38] = 10'h100;
      expv[39] = 10'h100;
      expv[40] = 10'h1ae;
      expv[41] = 10'h1ae;
      expv[42] = 10'h1ae;
      expv[43] = 10'h1ae;
      expv[44] = 10'h1ae;
      expv[45] = 10'h1ae;
      expv[46] = 10'h1ae;
      expv[47] = 10'h3b8;
      expv[48] = 10'h3b8;
      expv[49] = 10'h3b8;
      expv[50] = 10'h3b8;
      expv[51] = 10'h343;
      expv[52] = 10'h3cd;
      expv[53] = 10'h30f;
      expv[54] = 10'h30f;
      expv[55] = 10'h32d;
      expv[56] = 10'h32d;
      expv[57] = 10'h32d;
      expv[58] = 10'h399;
      expv[59] = 10'h399;
      expv[60] = 10'h399;
      expv[61] = 10'h399;
      expv[62] = 10'h399;
      expv[63] = 10'h399;
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
