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

  autovcoder_072182 dut (
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
    stim[0] = 12'h995;
    stim[1] = 12'hdfe;
    stim[2] = 12'h139;
    stim[3] = 12'h732;
    stim[4] = 12'h3de;
    stim[5] = 12'h100;
    stim[6] = 12'h0e6;
    stim[7] = 12'h412;
    stim[8] = 12'h789;
    stim[9] = 12'h064;
    stim[10] = 12'h661;
    stim[11] = 12'h21a;
    stim[12] = 12'h27c;
    stim[13] = 12'h61f;
    stim[14] = 12'h313;
    stim[15] = 12'h07d;
    stim[16] = 12'h289;
    stim[17] = 12'h49b;
    stim[18] = 12'h046;
    stim[19] = 12'h3ed;
    stim[20] = 12'h72f;
    stim[21] = 12'h339;
    stim[22] = 12'h37a;
    stim[23] = 12'h781;
    stim[24] = 12'h7e6;
    stim[25] = 12'h6e6;
    stim[26] = 12'h08f;
    stim[27] = 12'h409;
    stim[28] = 12'h5d2;
    stim[29] = 12'h6a7;
    stim[30] = 12'h683;
    stim[31] = 12'h42e;
    stim[32] = 12'hf4b;
    stim[33] = 12'h6d8;
    stim[34] = 12'h714;
    stim[35] = 12'h40b;
    stim[36] = 12'h46d;
    stim[37] = 12'h748;
    stim[38] = 12'h28b;
    stim[39] = 12'h48f;
    stim[40] = 12'h255;
    stim[41] = 12'h07f;
    stim[42] = 12'h40e;
    stim[43] = 12'h7a1;
    stim[44] = 12'h487;
    stim[45] = 12'h2a2;
    stim[46] = 12'h48f;
    stim[47] = 12'h1de;
    stim[48] = 12'h74b;
    stim[49] = 12'h7a8;
    stim[50] = 12'h04c;
    stim[51] = 12'h51e;
    stim[52] = 12'h002;
    stim[53] = 12'h6f2;
    stim[54] = 12'h157;
    stim[55] = 12'h757;
    stim[56] = 12'h78e;
    stim[57] = 12'h7a8;
    stim[58] = 12'h5d7;
    stim[59] = 12'h393;
    stim[60] = 12'h379;
    stim[61] = 12'h2f0;
    stim[62] = 12'h0c5;
    stim[63] = 12'h6a2;
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
      expv[4] = 10'h1fe;
      expv[5] = 10'h1fe;
      expv[6] = 10'h1fe;
      expv[7] = 10'h1fe;
      expv[8] = 10'h332;
      expv[9] = 10'h132;
      expv[10] = 10'h132;
      expv[11] = 10'h389;
      expv[12] = 10'h389;
      expv[13] = 10'h389;
      expv[14] = 10'h189;
      expv[15] = 10'h189;
      expv[16] = 10'h189;
      expv[17] = 10'h189;
      expv[18] = 10'h189;
      expv[19] = 10'h189;
      expv[20] = 10'h189;
      expv[21] = 10'h189;
      expv[22] = 10'h189;
      expv[23] = 10'h189;
      expv[24] = 10'h32f;
      expv[25] = 10'h381;
      expv[26] = 10'h3e6;
      expv[27] = 10'h3e6;
      expv[28] = 10'h3e6;
      expv[29] = 10'h3e6;
      expv[30] = 10'h3d2;
      expv[31] = 10'h1d2;
      expv[32] = 10'h1d2;
      expv[33] = 10'h100;
      expv[34] = 10'h14b;
      expv[35] = 10'h14b;
      expv[36] = 10'h314;
      expv[37] = 10'h314;
      expv[38] = 10'h114;
      expv[39] = 10'h114;
      expv[40] = 10'h348;
      expv[41] = 10'h348;
      expv[42] = 10'h348;
      expv[43] = 10'h348;
      expv[44] = 10'h148;
      expv[45] = 10'h3a1;
      expv[46] = 10'h3a1;
      expv[47] = 10'h3a1;
      expv[48] = 10'h3a1;
      expv[49] = 10'h1a1;
      expv[50] = 10'h34b;
      expv[51] = 10'h34b;
      expv[52] = 10'h34b;
      expv[53] = 10'h34b;
      expv[54] = 10'h3a8;
      expv[55] = 10'h3a8;
      expv[56] = 10'h31e;
      expv[57] = 10'h357;
      expv[58] = 10'h38e;
      expv[59] = 10'h38e;
      expv[60] = 10'h38e;
      expv[61] = 10'h38e;
      expv[62] = 10'h38e;
      expv[63] = 10'h38e;
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
