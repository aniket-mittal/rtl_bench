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

  autovcoder_072381 dut (
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
    stim[0] = 12'h814;
    stim[1] = 12'he55;
    stim[2] = 12'h138;
    stim[3] = 12'h40c;
    stim[4] = 12'h290;
    stim[5] = 12'h0f0;
    stim[6] = 12'h480;
    stim[7] = 12'h4e7;
    stim[8] = 12'h7d0;
    stim[9] = 12'h0f6;
    stim[10] = 12'h6a7;
    stim[11] = 12'hef3;
    stim[12] = 12'h563;
    stim[13] = 12'h30b;
    stim[14] = 12'h4dd;
    stim[15] = 12'h618;
    stim[16] = 12'h645;
    stim[17] = 12'h375;
    stim[18] = 12'h048;
    stim[19] = 12'h150;
    stim[20] = 12'h4a1;
    stim[21] = 12'h417;
    stim[22] = 12'h58a;
    stim[23] = 12'h4cd;
    stim[24] = 12'h7ae;
    stim[25] = 12'h3f3;
    stim[26] = 12'h668;
    stim[27] = 12'h46a;
    stim[28] = 12'h0db;
    stim[29] = 12'h14f;
    stim[30] = 12'h1ea;
    stim[31] = 12'h768;
    stim[32] = 12'h2d5;
    stim[33] = 12'h7f3;
    stim[34] = 12'h03f;
    stim[35] = 12'h692;
    stim[36] = 12'h239;
    stim[37] = 12'h111;
    stim[38] = 12'h780;
    stim[39] = 12'h6f6;
    stim[40] = 12'h508;
    stim[41] = 12'h349;
    stim[42] = 12'h056;
    stim[43] = 12'h560;
    stim[44] = 12'h295;
    stim[45] = 12'h0f1;
    stim[46] = 12'h4db;
    stim[47] = 12'h79d;
    stim[48] = 12'h806;
    stim[49] = 12'h1b2;
    stim[50] = 12'h112;
    stim[51] = 12'h75d;
    stim[52] = 12'h1fa;
    stim[53] = 12'h29c;
    stim[54] = 12'h468;
    stim[55] = 12'h671;
    stim[56] = 12'h1ee;
    stim[57] = 12'h749;
    stim[58] = 12'h620;
    stim[59] = 12'h30c;
    stim[60] = 12'h75b;
    stim[61] = 12'h1f9;
    stim[62] = 12'h20b;
    stim[63] = 12'h53a;
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
      expv[4] = 10'h1xx;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h1xx;
      expv[9] = 10'h1xx;
      expv[10] = 10'h1xx;
      expv[11] = 10'h3d0;
      expv[12] = 10'h100;
      expv[13] = 10'h1d0;
      expv[14] = 10'h1d0;
      expv[15] = 10'h363;
      expv[16] = 10'h163;
      expv[17] = 10'h163;
      expv[18] = 10'h163;
      expv[19] = 10'h163;
      expv[20] = 10'h163;
      expv[21] = 10'h163;
      expv[22] = 10'h163;
      expv[23] = 10'h163;
      expv[24] = 10'h38a;
      expv[25] = 10'h18a;
      expv[26] = 10'h18a;
      expv[27] = 10'h3ae;
      expv[28] = 10'h3ae;
      expv[29] = 10'h3ae;
      expv[30] = 10'h3ae;
      expv[31] = 10'h3ae;
      expv[32] = 10'h1ae;
      expv[33] = 10'h1ae;
      expv[34] = 10'h368;
      expv[35] = 10'h368;
      expv[36] = 10'h3f3;
      expv[37] = 10'h3f3;
      expv[38] = 10'h3f3;
      expv[39] = 10'h1f3;
      expv[40] = 10'h380;
      expv[41] = 10'h380;
      expv[42] = 10'h380;
      expv[43] = 10'h380;
      expv[44] = 10'h380;
      expv[45] = 10'h380;
      expv[46] = 10'h380;
      expv[47] = 10'h380;
      expv[48] = 10'h308;
      expv[49] = 10'h100;
      expv[50] = 10'h100;
      expv[51] = 10'h100;
      expv[52] = 10'h19d;
      expv[53] = 10'h19d;
      expv[54] = 10'h19d;
      expv[55] = 10'h35d;
      expv[56] = 10'h15d;
      expv[57] = 10'h15d;
      expv[58] = 10'h15d;
      expv[59] = 10'h349;
      expv[60] = 10'h349;
      expv[61] = 10'h149;
      expv[62] = 10'h149;
      expv[63] = 10'h149;
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
