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

  origen_089881 dut (
    .clk(clk),
    .done(in_vec[10:10]),
    .input_x(in_vec[9:0]),
    .output_y(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h18d;
    stim[1] = 11'h7da;
    stim[2] = 11'h3ae;
    stim[3] = 11'h793;
    stim[4] = 11'h0ce;
    stim[5] = 11'h64b;
    stim[6] = 11'h5dc;
    stim[7] = 11'h680;
    stim[8] = 11'h5a0;
    stim[9] = 11'h429;
    stim[10] = 11'h204;
    stim[11] = 11'h489;
    stim[12] = 11'h625;
    stim[13] = 11'h68f;
    stim[14] = 11'h57c;
    stim[15] = 11'h673;
    stim[16] = 11'h435;
    stim[17] = 11'h60b;
    stim[18] = 11'h44f;
    stim[19] = 11'h1d2;
    stim[20] = 11'h7f6;
    stim[21] = 11'h63f;
    stim[22] = 11'h415;
    stim[23] = 11'h733;
    stim[24] = 11'h6b8;
    stim[25] = 11'h129;
    stim[26] = 11'h7b7;
    stim[27] = 11'h22c;
    stim[28] = 11'h234;
    stim[29] = 11'h772;
    stim[30] = 11'h6d9;
    stim[31] = 11'h28c;
    stim[32] = 11'h122;
    stim[33] = 11'h75c;
    stim[34] = 11'h2b1;
    stim[35] = 11'h67c;
    stim[36] = 11'h16a;
    stim[37] = 11'h14a;
    stim[38] = 11'h174;
    stim[39] = 11'h18f;
    stim[40] = 11'h443;
    stim[41] = 11'h3b7;
    stim[42] = 11'h2a1;
    stim[43] = 11'h3d1;
    stim[44] = 11'h482;
    stim[45] = 11'h779;
    stim[46] = 11'h670;
    stim[47] = 11'h0bf;
    stim[48] = 11'h3d9;
    stim[49] = 11'h072;
    stim[50] = 11'h243;
    stim[51] = 11'h458;
    stim[52] = 11'h0b5;
    stim[53] = 11'h7db;
    stim[54] = 11'h07f;
    stim[55] = 11'h072;
    stim[56] = 11'h198;
    stim[57] = 11'h6e5;
    stim[58] = 11'h788;
    stim[59] = 11'h5a6;
    stim[60] = 11'h7fc;
    stim[61] = 11'h2f6;
    stim[62] = 11'h1f5;
    stim[63] = 11'h7d1;
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
      expv[1] = 10'h3e3;
      expv[2] = 10'h3e3;
      expv[3] = 10'h3d8;
      expv[4] = 10'h3d8;
      expv[5] = 10'h3de;
      expv[6] = 10'h3de;
      expv[7] = 10'h3de;
      expv[8] = 10'h3de;
      expv[9] = 10'h3de;
      expv[10] = 10'h3de;
      expv[11] = 10'h047;
      expv[12] = 10'h047;
      expv[13] = 10'h047;
      expv[14] = 10'h047;
      expv[15] = 10'h047;
      expv[16] = 10'h047;
      expv[17] = 10'h047;
      expv[18] = 10'h047;
      expv[19] = 10'h047;
      expv[20] = 10'h3f6;
      expv[21] = 10'h3f6;
      expv[22] = 10'h3f6;
      expv[23] = 10'h3f6;
      expv[24] = 10'h3f6;
      expv[25] = 10'h3f6;
      expv[26] = 10'h3db;
      expv[27] = 10'h3db;
      expv[28] = 10'h3db;
      expv[29] = 10'h3d9;
      expv[30] = 10'h3d9;
      expv[31] = 10'h3d9;
      expv[32] = 10'h3d9;
      expv[33] = 10'h3dc;
      expv[34] = 10'h3dc;
      expv[35] = 10'h3de;
      expv[36] = 10'h3de;
      expv[37] = 10'h3de;
      expv[38] = 10'h3de;
      expv[39] = 10'h3de;
      expv[40] = 10'h043;
      expv[41] = 10'h043;
      expv[42] = 10'h043;
      expv[43] = 10'h043;
      expv[44] = 10'h047;
      expv[45] = 10'h047;
      expv[46] = 10'h047;
      expv[47] = 10'h047;
      expv[48] = 10'h047;
      expv[49] = 10'h047;
      expv[50] = 10'h047;
      expv[51] = 10'h049;
      expv[52] = 10'h049;
      expv[53] = 10'h3e4;
      expv[54] = 10'h3e4;
      expv[55] = 10'h3e4;
      expv[56] = 10'h3e4;
      expv[57] = 10'h3de;
      expv[58] = 10'h3de;
      expv[59] = 10'h3de;
      expv[60] = 10'h3de;
      expv[61] = 10'h3de;
      expv[62] = 10'h3de;
      expv[63] = 10'h3df;
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
