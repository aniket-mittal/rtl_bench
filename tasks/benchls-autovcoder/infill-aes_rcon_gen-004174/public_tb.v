// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004174 dut (
    .clk(clk),
    .kld(in_vec[0:0]),
    .out(out_vec[63:32]),
    .out_n(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h1;
    stim[24] = 1'h0;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h0;
    stim[28] = 1'h1;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h0;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h1;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h0;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h0;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h0;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h1;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h00000000ffffffff;
      expv[2] = 64'h00000000ffffffff;
      expv[3] = 64'h00000000ffffffff;
      expv[4] = 64'h01000000feffffff;
      expv[5] = 64'h01000000feffffff;
      expv[6] = 64'h01000000feffffff;
      expv[7] = 64'h02000000fdffffff;
      expv[8] = 64'h04000000fbffffff;
      expv[9] = 64'h01000000feffffff;
      expv[10] = 64'h01000000feffffff;
      expv[11] = 64'h01000000feffffff;
      expv[12] = 64'h01000000feffffff;
      expv[13] = 64'h02000000fdffffff;
      expv[14] = 64'h04000000fbffffff;
      expv[15] = 64'h08000000f7ffffff;
      expv[16] = 64'h10000000efffffff;
      expv[17] = 64'h20000000dfffffff;
      expv[18] = 64'h01000000feffffff;
      expv[19] = 64'h01000000feffffff;
      expv[20] = 64'h01000000feffffff;
      expv[21] = 64'h02000000fdffffff;
      expv[22] = 64'h04000000fbffffff;
      expv[23] = 64'h08000000f7ffffff;
      expv[24] = 64'h01000000feffffff;
      expv[25] = 64'h02000000fdffffff;
      expv[26] = 64'h01000000feffffff;
      expv[27] = 64'h01000000feffffff;
      expv[28] = 64'h02000000fdffffff;
      expv[29] = 64'h01000000feffffff;
      expv[30] = 64'h02000000fdffffff;
      expv[31] = 64'h04000000fbffffff;
      expv[32] = 64'h08000000f7ffffff;
      expv[33] = 64'h01000000feffffff;
      expv[34] = 64'h01000000feffffff;
      expv[35] = 64'h01000000feffffff;
      expv[36] = 64'h02000000fdffffff;
      expv[37] = 64'h01000000feffffff;
      expv[38] = 64'h01000000feffffff;
      expv[39] = 64'h02000000fdffffff;
      expv[40] = 64'h01000000feffffff;
      expv[41] = 64'h02000000fdffffff;
      expv[42] = 64'h04000000fbffffff;
      expv[43] = 64'h01000000feffffff;
      expv[44] = 64'h02000000fdffffff;
      expv[45] = 64'h01000000feffffff;
      expv[46] = 64'h01000000feffffff;
      expv[47] = 64'h01000000feffffff;
      expv[48] = 64'h01000000feffffff;
      expv[49] = 64'h01000000feffffff;
      expv[50] = 64'h02000000fdffffff;
      expv[51] = 64'h01000000feffffff;
      expv[52] = 64'h01000000feffffff;
      expv[53] = 64'h02000000fdffffff;
      expv[54] = 64'h01000000feffffff;
      expv[55] = 64'h01000000feffffff;
      expv[56] = 64'h02000000fdffffff;
      expv[57] = 64'h01000000feffffff;
      expv[58] = 64'h01000000feffffff;
      expv[59] = 64'h01000000feffffff;
      expv[60] = 64'h02000000fdffffff;
      expv[61] = 64'h04000000fbffffff;
      expv[62] = 64'h08000000f7ffffff;
      expv[63] = 64'h10000000efffffff;
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
