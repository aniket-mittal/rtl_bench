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

  autovcoder_075367 dut (
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
    stim[0] = 12'hf9f;
    stim[1] = 12'hf08;
    stim[2] = 12'h551;
    stim[3] = 12'h585;
    stim[4] = 12'h7bf;
    stim[5] = 12'h279;
    stim[6] = 12'hb30;
    stim[7] = 12'h5a2;
    stim[8] = 12'h189;
    stim[9] = 12'h45e;
    stim[10] = 12'h098;
    stim[11] = 12'h1c3;
    stim[12] = 12'h058;
    stim[13] = 12'h2e8;
    stim[14] = 12'h53a;
    stim[15] = 12'h751;
    stim[16] = 12'h70c;
    stim[17] = 12'h29c;
    stim[18] = 12'h684;
    stim[19] = 12'h607;
    stim[20] = 12'h2f8;
    stim[21] = 12'h72e;
    stim[22] = 12'h028;
    stim[23] = 12'h580;
    stim[24] = 12'h45e;
    stim[25] = 12'h277;
    stim[26] = 12'h58d;
    stim[27] = 12'h9d0;
    stim[28] = 12'h576;
    stim[29] = 12'hfa6;
    stim[30] = 12'h6e7;
    stim[31] = 12'h5c4;
    stim[32] = 12'h18a;
    stim[33] = 12'h0d7;
    stim[34] = 12'h445;
    stim[35] = 12'h7a8;
    stim[36] = 12'h52d;
    stim[37] = 12'h5ad;
    stim[38] = 12'h5ab;
    stim[39] = 12'h5e0;
    stim[40] = 12'h427;
    stim[41] = 12'h222;
    stim[42] = 12'h496;
    stim[43] = 12'h5cb;
    stim[44] = 12'h39e;
    stim[45] = 12'h2f6;
    stim[46] = 12'h52e;
    stim[47] = 12'h103;
    stim[48] = 12'h17c;
    stim[49] = 12'h1e7;
    stim[50] = 12'h57c;
    stim[51] = 12'h293;
    stim[52] = 12'h243;
    stim[53] = 12'h461;
    stim[54] = 12'h56f;
    stim[55] = 12'h68e;
    stim[56] = 12'h244;
    stim[57] = 12'h36f;
    stim[58] = 12'h529;
    stim[59] = 12'h736;
    stim[60] = 12'h645;
    stim[61] = 12'h737;
    stim[62] = 12'h6b5;
    stim[63] = 12'h714;
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
      expv[3] = 10'h108;
      expv[4] = 10'h351;
      expv[5] = 10'h385;
      expv[6] = 10'h385;
      expv[7] = 10'h100;
      expv[8] = 10'h1bf;
      expv[9] = 10'h1bf;
      expv[10] = 10'h3a2;
      expv[11] = 10'h3a2;
      expv[12] = 10'h3a2;
      expv[13] = 10'h3a2;
      expv[14] = 10'h3a2;
      expv[15] = 10'h3a2;
      expv[16] = 10'h33a;
      expv[17] = 10'h351;
      expv[18] = 10'h351;
      expv[19] = 10'h30c;
      expv[20] = 10'h10c;
      expv[21] = 10'h10c;
      expv[22] = 10'h10c;
      expv[23] = 10'h10c;
      expv[24] = 10'h32e;
      expv[25] = 10'h32e;
      expv[26] = 10'h32e;
      expv[27] = 10'h32e;
      expv[28] = 10'h100;
      expv[29] = 10'h18d;
      expv[30] = 10'h100;
      expv[31] = 10'h1a6;
      expv[32] = 10'h1a6;
      expv[33] = 10'h1a6;
      expv[34] = 10'h1a6;
      expv[35] = 10'h3c4;
      expv[36] = 10'h1c4;
      expv[37] = 10'h3a8;
      expv[38] = 10'h3a8;
      expv[39] = 10'h3a8;
      expv[40] = 10'h3a8;
      expv[41] = 10'h3a8;
      expv[42] = 10'h3a8;
      expv[43] = 10'h3a8;
      expv[44] = 10'h3a8;
      expv[45] = 10'h3a8;
      expv[46] = 10'h3a8;
      expv[47] = 10'h3a8;
      expv[48] = 10'h3a8;
      expv[49] = 10'h3a8;
      expv[50] = 10'h3a8;
      expv[51] = 10'h3a8;
      expv[52] = 10'h3a8;
      expv[53] = 10'h3a8;
      expv[54] = 10'h3a8;
      expv[55] = 10'h3a8;
      expv[56] = 10'h32d;
      expv[57] = 10'h32d;
      expv[58] = 10'h32d;
      expv[59] = 10'h32d;
      expv[60] = 10'h3ad;
      expv[61] = 10'h3ab;
      expv[62] = 10'h3e0;
      expv[63] = 10'h3cb;
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
