// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034148 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h03dc;
    stim[1] = 15'h00b6;
    stim[2] = 15'h4772;
    stim[3] = 15'h0496;
    stim[4] = 15'h5732;
    stim[5] = 15'h2502;
    stim[6] = 15'h6fad;
    stim[7] = 15'h048d;
    stim[8] = 15'h5054;
    stim[9] = 15'h3e59;
    stim[10] = 15'h5ef3;
    stim[11] = 15'h5481;
    stim[12] = 15'h305f;
    stim[13] = 15'h622d;
    stim[14] = 15'h41c4;
    stim[15] = 15'h0a6e;
    stim[16] = 15'h5248;
    stim[17] = 15'h41dc;
    stim[18] = 15'h5cba;
    stim[19] = 15'h4e80;
    stim[20] = 15'h18b3;
    stim[21] = 15'h552f;
    stim[22] = 15'h38f6;
    stim[23] = 15'h7edd;
    stim[24] = 15'h1eca;
    stim[25] = 15'h6fab;
    stim[26] = 15'h563a;
    stim[27] = 15'h3133;
    stim[28] = 15'h443c;
    stim[29] = 15'h5c86;
    stim[30] = 15'h6732;
    stim[31] = 15'h132d;
    stim[32] = 15'h685c;
    stim[33] = 15'h14bf;
    stim[34] = 15'h2805;
    stim[35] = 15'h3638;
    stim[36] = 15'h210d;
    stim[37] = 15'h557a;
    stim[38] = 15'h62b5;
    stim[39] = 15'h2781;
    stim[40] = 15'h149b;
    stim[41] = 15'h603e;
    stim[42] = 15'h4100;
    stim[43] = 15'h148d;
    stim[44] = 15'h221b;
    stim[45] = 15'h693c;
    stim[46] = 15'h37d7;
    stim[47] = 15'h29a5;
    stim[48] = 15'h5254;
    stim[49] = 15'h6b20;
    stim[50] = 15'h165b;
    stim[51] = 15'h6d21;
    stim[52] = 15'h548e;
    stim[53] = 15'h3c05;
    stim[54] = 15'h17fa;
    stim[55] = 15'h7d46;
    stim[56] = 15'h5aab;
    stim[57] = 15'h5a32;
    stim[58] = 15'h4739;
    stim[59] = 15'h27c0;
    stim[60] = 15'h2e51;
    stim[61] = 15'h365a;
    stim[62] = 15'h7652;
    stim[63] = 15'h67ae;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h03dc;
      expv[2] = 15'h00b6;
      expv[3] = 15'h4772;
      expv[4] = 15'h0496;
      expv[5] = 15'h5732;
      expv[6] = 15'h2502;
      expv[7] = 15'h6fad;
      expv[8] = 15'h048d;
      expv[9] = 15'h5054;
      expv[10] = 15'h3e59;
      expv[11] = 15'h5ef3;
      expv[12] = 15'h5481;
      expv[13] = 15'h305f;
      expv[14] = 15'h622d;
      expv[15] = 15'h41c4;
      expv[16] = 15'h0a6e;
      expv[17] = 15'h5248;
      expv[18] = 15'h41dc;
      expv[19] = 15'h5cba;
      expv[20] = 15'h4e80;
      expv[21] = 15'h18b3;
      expv[22] = 15'h552f;
      expv[23] = 15'h38f6;
      expv[24] = 15'h7edd;
      expv[25] = 15'h1eca;
      expv[26] = 15'h6fab;
      expv[27] = 15'h563a;
      expv[28] = 15'h3133;
      expv[29] = 15'h443c;
      expv[30] = 15'h5c86;
      expv[31] = 15'h6732;
      expv[32] = 15'h132d;
      expv[33] = 15'h685c;
      expv[34] = 15'h14bf;
      expv[35] = 15'h2805;
      expv[36] = 15'h3638;
      expv[37] = 15'h210d;
      expv[38] = 15'h557a;
      expv[39] = 15'h62b5;
      expv[40] = 15'h2781;
      expv[41] = 15'h149b;
      expv[42] = 15'h603e;
      expv[43] = 15'h4100;
      expv[44] = 15'h148d;
      expv[45] = 15'h221b;
      expv[46] = 15'h693c;
      expv[47] = 15'h37d7;
      expv[48] = 15'h29a5;
      expv[49] = 15'h5254;
      expv[50] = 15'h6b20;
      expv[51] = 15'h165b;
      expv[52] = 15'h6d21;
      expv[53] = 15'h548e;
      expv[54] = 15'h3c05;
      expv[55] = 15'h17fa;
      expv[56] = 15'h7d46;
      expv[57] = 15'h5aab;
      expv[58] = 15'h5a32;
      expv[59] = 15'h4739;
      expv[60] = 15'h27c0;
      expv[61] = 15'h2e51;
      expv[62] = 15'h365a;
      expv[63] = 15'h7652;
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
