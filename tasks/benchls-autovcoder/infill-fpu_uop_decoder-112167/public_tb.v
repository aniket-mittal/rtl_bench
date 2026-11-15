// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112167 dut (
    .io_uopc(in_vec[8:0]),
    .io_cmd(out_vec[32:31]),
    .io_covSum(out_vec[30:1]),
    .metaAssert(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h03d;
    stim[1] = 9'h056;
    stim[2] = 9'h0ae;
    stim[3] = 9'h16a;
    stim[4] = 9'h1f6;
    stim[5] = 9'h026;
    stim[6] = 9'h1eb;
    stim[7] = 9'h13b;
    stim[8] = 9'h134;
    stim[9] = 9'h01b;
    stim[10] = 9'h004;
    stim[11] = 9'h1bc;
    stim[12] = 9'h102;
    stim[13] = 9'h1d5;
    stim[14] = 9'h09f;
    stim[15] = 9'h153;
    stim[16] = 9'h179;
    stim[17] = 9'h17e;
    stim[18] = 9'h05a;
    stim[19] = 9'h0f8;
    stim[20] = 9'h123;
    stim[21] = 9'h053;
    stim[22] = 9'h0db;
    stim[23] = 9'h169;
    stim[24] = 9'h11e;
    stim[25] = 9'h01e;
    stim[26] = 9'h127;
    stim[27] = 9'h11b;
    stim[28] = 9'h08e;
    stim[29] = 9'h157;
    stim[30] = 9'h04b;
    stim[31] = 9'h0e7;
    stim[32] = 9'h0da;
    stim[33] = 9'h10c;
    stim[34] = 9'h152;
    stim[35] = 9'h05f;
    stim[36] = 9'h14a;
    stim[37] = 9'h134;
    stim[38] = 9'h165;
    stim[39] = 9'h012;
    stim[40] = 9'h143;
    stim[41] = 9'h1ad;
    stim[42] = 9'h146;
    stim[43] = 9'h1b8;
    stim[44] = 9'h1e8;
    stim[45] = 9'h0a9;
    stim[46] = 9'h093;
    stim[47] = 9'h024;
    stim[48] = 9'h0f3;
    stim[49] = 9'h14d;
    stim[50] = 9'h023;
    stim[51] = 9'h1cf;
    stim[52] = 9'h086;
    stim[53] = 9'h0a0;
    stim[54] = 9'h04f;
    stim[55] = 9'h109;
    stim[56] = 9'h1d5;
    stim[57] = 9'h1b5;
    stim[58] = 9'h1bf;
    stim[59] = 9'h18c;
    stim[60] = 9'h153;
    stim[61] = 9'h08c;
    stim[62] = 9'h0aa;
    stim[63] = 9'h1aa;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h080000000;
      expv[3] = 33'h080000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h080000000;
      expv[6] = 33'h180000000;
      expv[7] = 33'h080000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h080000000;
      expv[10] = 33'h100000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h080000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h180000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h080000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h180000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h080000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h080000000;
      expv[25] = 33'h080000000;
      expv[26] = 33'h180000000;
      expv[27] = 33'h080000000;
      expv[28] = 33'h080000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h180000000;
      expv[31] = 33'h180000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h100000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h180000000;
      expv[36] = 33'h080000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h180000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h080000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h180000000;
      expv[51] = 33'h180000000;
      expv[52] = 33'h080000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h180000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h180000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h080000000;
      expv[63] = 33'h080000000;
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
