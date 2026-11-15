// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06266 dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .x(in_vec[43:33]),
    .y(in_vec[32:22]),
    .poX(in_vec[21:11]),
    .poY(in_vec[10:0]),
    .wing(out_vec[1:1]),
    .body(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h181104332716;
    stim[1] = 45'h172008f6cb9f;
    stim[2] = 45'h0e5a512eda61;
    stim[3] = 45'h0509c046b76a;
    stim[4] = 45'h09cd748e85c4;
    stim[5] = 45'h01f8d03b1130;
    stim[6] = 45'h0f70913c74b5;
    stim[7] = 45'h0eb7f8bf1fa7;
    stim[8] = 45'h08524ddfb7f5;
    stim[9] = 45'h0b9b2d93eabb;
    stim[10] = 45'h0cf9c419bf5b;
    stim[11] = 45'h0eacc280422a;
    stim[12] = 45'h0aa99290cefe;
    stim[13] = 45'h01b7d2d3b31a;
    stim[14] = 45'h058809833500;
    stim[15] = 45'h0eb95a2db96c;
    stim[16] = 45'h08a4d1a8e48a;
    stim[17] = 45'h07f86dc9480b;
    stim[18] = 45'h08d88abf0459;
    stim[19] = 45'h0b39f88eec15;
    stim[20] = 45'h0c0278889511;
    stim[21] = 45'h0286e8ee63d2;
    stim[22] = 45'h0b5c026b44bb;
    stim[23] = 45'h02e33d0f6b60;
    stim[24] = 45'h0aa8f9de9b2b;
    stim[25] = 45'h0046b6d4929a;
    stim[26] = 45'h0dfd32fed9d4;
    stim[27] = 45'h04bb4bcc458a;
    stim[28] = 45'h0f3bc3be0ac1;
    stim[29] = 45'h043c81bee66e;
    stim[30] = 45'h06b7451c3e02;
    stim[31] = 45'h0dd177fcdce8;
    stim[32] = 45'h016b117558c0;
    stim[33] = 45'h051e4243e2af;
    stim[34] = 45'h087fe3d63615;
    stim[35] = 45'h0d890b7cca78;
    stim[36] = 45'h05a46863eefa;
    stim[37] = 45'h05f157f4eec5;
    stim[38] = 45'h072324d48b25;
    stim[39] = 45'h05c33e506a94;
    stim[40] = 45'h01942d6b49b7;
    stim[41] = 45'h00217780569e;
    stim[42] = 45'h0bf3152080ad;
    stim[43] = 45'h091a4398a16f;
    stim[44] = 45'h0912ba488235;
    stim[45] = 45'h0b71f16cd412;
    stim[46] = 45'h0297fdb2b10d;
    stim[47] = 45'h0081a670a37c;
    stim[48] = 45'h0ed2abecd6a5;
    stim[49] = 45'h064b6a66b309;
    stim[50] = 45'h0e9080e977fb;
    stim[51] = 45'h079513b60a58;
    stim[52] = 45'h00146bd6941c;
    stim[53] = 45'h0144c1ab26ae;
    stim[54] = 45'h08c5eddf1483;
    stim[55] = 45'h0e212e81b813;
    stim[56] = 45'h0d71ad24436a;
    stim[57] = 45'h0e16173d7b3e;
    stim[58] = 45'h0d7bf7ea771f;
    stim[59] = 45'h08bb9a8cdf64;
    stim[60] = 45'h0546bb10b046;
    stim[61] = 45'h00946ca8fa35;
    stim[62] = 45'h06a4ff65f86d;
    stim[63] = 45'h04598d35c20f;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
