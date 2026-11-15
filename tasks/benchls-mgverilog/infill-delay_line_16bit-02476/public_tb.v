// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02476 dut (
    .clock(clk),
    .indata(in_vec[31:16]),
    .indata180(in_vec[15:0]),
    .outdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h63b04b6f;
    stim[1] = 32'h2a9a1e8f;
    stim[2] = 32'hf12ebe7a;
    stim[3] = 32'h96f85175;
    stim[4] = 32'h8854b861;
    stim[5] = 32'h028e076f;
    stim[6] = 32'he196efef;
    stim[7] = 32'h7e27da38;
    stim[8] = 32'h128f5da8;
    stim[9] = 32'h20ffd83c;
    stim[10] = 32'h621e2e2e;
    stim[11] = 32'hec709cc7;
    stim[12] = 32'hd10795e0;
    stim[13] = 32'h271b5fce;
    stim[14] = 32'h8792a339;
    stim[15] = 32'hb32c19e3;
    stim[16] = 32'h0c0a0ba5;
    stim[17] = 32'hcf715452;
    stim[18] = 32'h089a86df;
    stim[19] = 32'hfcec5d01;
    stim[20] = 32'h5767c653;
    stim[21] = 32'ha64b5c4e;
    stim[22] = 32'hbc98b3da;
    stim[23] = 32'h4294d351;
    stim[24] = 32'hb9583f5e;
    stim[25] = 32'hcec6074d;
    stim[26] = 32'h40b77263;
    stim[27] = 32'h5b463adf;
    stim[28] = 32'h654a9466;
    stim[29] = 32'hf8f71304;
    stim[30] = 32'hc53ed0d7;
    stim[31] = 32'hf4a46e81;
    stim[32] = 32'h80eaacbe;
    stim[33] = 32'hf24c4b69;
    stim[34] = 32'hf15d3226;
    stim[35] = 32'h3352d293;
    stim[36] = 32'h4bbaf59c;
    stim[37] = 32'ha08e7f5f;
    stim[38] = 32'h60ed4635;
    stim[39] = 32'h1b9d0265;
    stim[40] = 32'h41d70779;
    stim[41] = 32'haafedc5a;
    stim[42] = 32'h66d8268b;
    stim[43] = 32'hd7a21bd5;
    stim[44] = 32'ha5003a3f;
    stim[45] = 32'he11c9fa7;
    stim[46] = 32'h975962da;
    stim[47] = 32'h1da580e5;
    stim[48] = 32'hd9fe4b12;
    stim[49] = 32'h43173bc4;
    stim[50] = 32'h3ce89019;
    stim[51] = 32'h8a564894;
    stim[52] = 32'h92a43696;
    stim[53] = 32'hfa28f329;
    stim[54] = 32'h66491844;
    stim[55] = 32'h62ced09e;
    stim[56] = 32'hb3a3f151;
    stim[57] = 32'h231b89dc;
    stim[58] = 32'h2ba79b4e;
    stim[59] = 32'hcfacaec0;
    stim[60] = 32'h2aab693b;
    stim[61] = 32'h62f71217;
    stim[62] = 32'hb67c9c88;
    stim[63] = 32'h647bd8b0;
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
      expv[0] = 32'hxxxx63b0;
      expv[1] = 32'h4b6f2a9a;
      expv[2] = 32'h1e8ff12e;
      expv[3] = 32'hbe7a96f8;
      expv[4] = 32'h51758854;
      expv[5] = 32'hb861028e;
      expv[6] = 32'h076fe196;
      expv[7] = 32'hefef7e27;
      expv[8] = 32'hda38128f;
      expv[9] = 32'h5da820ff;
      expv[10] = 32'hd83c621e;
      expv[11] = 32'h2e2eec70;
      expv[12] = 32'h9cc7d107;
      expv[13] = 32'h95e0271b;
      expv[14] = 32'h5fce8792;
      expv[15] = 32'ha339b32c;
      expv[16] = 32'h19e30c0a;
      expv[17] = 32'h0ba5cf71;
      expv[18] = 32'h5452089a;
      expv[19] = 32'h86dffcec;
      expv[20] = 32'h5d015767;
      expv[21] = 32'hc653a64b;
      expv[22] = 32'h5c4ebc98;
      expv[23] = 32'hb3da4294;
      expv[24] = 32'hd351b958;
      expv[25] = 32'h3f5ecec6;
      expv[26] = 32'h074d40b7;
      expv[27] = 32'h72635b46;
      expv[28] = 32'h3adf654a;
      expv[29] = 32'h9466f8f7;
      expv[30] = 32'h1304c53e;
      expv[31] = 32'hd0d7f4a4;
      expv[32] = 32'h6e8180ea;
      expv[33] = 32'hacbef24c;
      expv[34] = 32'h4b69f15d;
      expv[35] = 32'h32263352;
      expv[36] = 32'hd2934bba;
      expv[37] = 32'hf59ca08e;
      expv[38] = 32'h7f5f60ed;
      expv[39] = 32'h46351b9d;
      expv[40] = 32'h026541d7;
      expv[41] = 32'h0779aafe;
      expv[42] = 32'hdc5a66d8;
      expv[43] = 32'h268bd7a2;
      expv[44] = 32'h1bd5a500;
      expv[45] = 32'h3a3fe11c;
      expv[46] = 32'h9fa79759;
      expv[47] = 32'h62da1da5;
      expv[48] = 32'h80e5d9fe;
      expv[49] = 32'h4b124317;
      expv[50] = 32'h3bc43ce8;
      expv[51] = 32'h90198a56;
      expv[52] = 32'h489492a4;
      expv[53] = 32'h3696fa28;
      expv[54] = 32'hf3296649;
      expv[55] = 32'h184462ce;
      expv[56] = 32'hd09eb3a3;
      expv[57] = 32'hf151231b;
      expv[58] = 32'h89dc2ba7;
      expv[59] = 32'h9b4ecfac;
      expv[60] = 32'haec02aab;
      expv[61] = 32'h693b62f7;
      expv[62] = 32'h1217b67c;
      expv[63] = 32'h9c88647b;
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
