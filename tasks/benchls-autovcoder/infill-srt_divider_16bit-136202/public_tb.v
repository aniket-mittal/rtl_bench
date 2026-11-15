// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_136202 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .start(in_vec[32:32]),
    .dividend(in_vec[31:16]),
    .divisor(in_vec[15:0]),
    .quotient(out_vec[32:17]),
    .remainder(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h318f91d5d;
    stim[1] = 34'h3c8585f5b;
    stim[2] = 34'h12e382c2a;
    stim[3] = 34'h058e1ee52;
    stim[4] = 34'h049b33c16;
    stim[5] = 34'h1689f3bc1;
    stim[6] = 34'h1ae455e39;
    stim[7] = 34'h130e397a7;
    stim[8] = 34'h0a9fe88ca;
    stim[9] = 34'h0c13f2d73;
    stim[10] = 34'h04e8af6c7;
    stim[11] = 34'h026e84098;
    stim[12] = 34'h1702b1da5;
    stim[13] = 34'h0856b87ea;
    stim[14] = 34'h0489e2a56;
    stim[15] = 34'h103405cc3;
    stim[16] = 34'h1d696a97b;
    stim[17] = 34'h0a8d8313a;
    stim[18] = 34'h03bfe40ab;
    stim[19] = 34'h045a794ab;
    stim[20] = 34'h16bd3c3bc;
    stim[21] = 34'h07fd69043;
    stim[22] = 34'h08e8703a3;
    stim[23] = 34'h175a62451;
    stim[24] = 34'h1be4eeeac;
    stim[25] = 34'h10e9ad5c0;
    stim[26] = 34'h0a9d35fdc;
    stim[27] = 34'h1e974ecd6;
    stim[28] = 34'h101393258;
    stim[29] = 34'h120b3f362;
    stim[30] = 34'h02663ac41;
    stim[31] = 34'h10efe7d2f;
    stim[32] = 34'h1cca9b89b;
    stim[33] = 34'h0e214c680;
    stim[34] = 34'h1dec00ff3;
    stim[35] = 34'h1b5bc42d7;
    stim[36] = 34'h1bb6851fe;
    stim[37] = 34'h148d1e417;
    stim[38] = 34'h0536c5952;
    stim[39] = 34'h1fffe8577;
    stim[40] = 34'h000771b6a;
    stim[41] = 34'h1eaa5ba6f;
    stim[42] = 34'h06dcfc89f;
    stim[43] = 34'h0a8124510;
    stim[44] = 34'h1a6f91597;
    stim[45] = 34'h1a5335398;
    stim[46] = 34'h086d4b4ec;
    stim[47] = 34'h105199b98;
    stim[48] = 34'h1287a7818;
    stim[49] = 34'h1ad408579;
    stim[50] = 34'h1cceb81c8;
    stim[51] = 34'h0dc5a57d3;
    stim[52] = 34'h047372184;
    stim[53] = 34'h08bdc7581;
    stim[54] = 34'h151989a62;
    stim[55] = 34'h0d812aaf8;
    stim[56] = 34'h0fc620239;
    stim[57] = 34'h088877cca;
    stim[58] = 34'h239958aa4;
    stim[59] = 34'h05a0f80a0;
    stim[60] = 34'h176f1c61a;
    stim[61] = 34'h259f6dbd1;
    stim[62] = 34'h12d68c21e;
    stim[63] = 34'h0012f4e3b;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
