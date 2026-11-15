// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07217 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .waitrequest(in_vec[32:32]),
    .readdata(in_vec[31:0]),
    .address(out_vec[41:34]),
    .write(out_vec[33:33]),
    .read(out_vec[32:32]),
    .writedata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h223e1964f;
    stim[1] = 34'h3acb0d3a7;
    stim[2] = 34'h038dfc6e7;
    stim[3] = 34'h0bdf07713;
    stim[4] = 34'h19570c835;
    stim[5] = 34'h12abfcf10;
    stim[6] = 34'h0a6c0878c;
    stim[7] = 34'h17a2b3807;
    stim[8] = 34'h057b3e4ba;
    stim[9] = 34'h1bbd2f119;
    stim[10] = 34'h102add1e4;
    stim[11] = 34'h1bc14f865;
    stim[12] = 34'h1efd25cfc;
    stim[13] = 34'h05e720fb8;
    stim[14] = 34'h171137127;
    stim[15] = 34'h330d35bf4;
    stim[16] = 34'h0a3bdb433;
    stim[17] = 34'h1538050a4;
    stim[18] = 34'h012277f4a;
    stim[19] = 34'h17847eeb9;
    stim[20] = 34'h1de693371;
    stim[21] = 34'h06ddf1f5e;
    stim[22] = 34'h15cc8aff3;
    stim[23] = 34'h0fd0d6c8e;
    stim[24] = 34'h09473a0d5;
    stim[25] = 34'h1a7c5bdfe;
    stim[26] = 34'h166fb41ef;
    stim[27] = 34'h0d7659c8b;
    stim[28] = 34'h0d27aa867;
    stim[29] = 34'h02a950d01;
    stim[30] = 34'h11e9abf0f;
    stim[31] = 34'h0b4993ffc;
    stim[32] = 34'h0996cb073;
    stim[33] = 34'h1bfa72de8;
    stim[34] = 34'h188c98664;
    stim[35] = 34'h07dea3acd;
    stim[36] = 34'h0e2938dbf;
    stim[37] = 34'h134150c9d;
    stim[38] = 34'h176dfe4ae;
    stim[39] = 34'h00fa3fecc;
    stim[40] = 34'h142dcdb14;
    stim[41] = 34'h150f729b9;
    stim[42] = 34'h08cc6a220;
    stim[43] = 34'h174a6e164;
    stim[44] = 34'h106dfef07;
    stim[45] = 34'h1c188fced;
    stim[46] = 34'h03d9a4593;
    stim[47] = 34'h10f4ffe58;
    stim[48] = 34'h167948585;
    stim[49] = 34'h00ef28130;
    stim[50] = 34'h0fc2d8eed;
    stim[51] = 34'h0bc5a7f9f;
    stim[52] = 34'h1ba7d1c45;
    stim[53] = 34'h0cf714c20;
    stim[54] = 34'h09faaea4e;
    stim[55] = 34'h1a745abc9;
    stim[56] = 34'h101b9c215;
    stim[57] = 34'h194d9d4fa;
    stim[58] = 34'h18f0bf567;
    stim[59] = 34'h0fe745737;
    stim[60] = 34'h1f5753f43;
    stim[61] = 34'h0e2113e7e;
    stim[62] = 34'h07a0725bf;
    stim[63] = 34'h11395dd30;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00000000000;
      expv[16] = 42'h00000000000;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h00000000000;
      expv[26] = 42'h00000000000;
      expv[27] = 42'h00000000000;
      expv[28] = 42'h00000000000;
      expv[29] = 42'h00000000000;
      expv[30] = 42'h00000000000;
      expv[31] = 42'h00000000000;
      expv[32] = 42'h00000000000;
      expv[33] = 42'h00000000000;
      expv[34] = 42'h00000000000;
      expv[35] = 42'h00000000000;
      expv[36] = 42'h00000000000;
      expv[37] = 42'h00000000000;
      expv[38] = 42'h00000000000;
      expv[39] = 42'h00000000000;
      expv[40] = 42'h00000000000;
      expv[41] = 42'h00000000000;
      expv[42] = 42'h00000000000;
      expv[43] = 42'h00000000000;
      expv[44] = 42'h00000000000;
      expv[45] = 42'h00000000000;
      expv[46] = 42'h00000000000;
      expv[47] = 42'h00000000000;
      expv[48] = 42'h00000000000;
      expv[49] = 42'h00000000000;
      expv[50] = 42'h00000000000;
      expv[51] = 42'h00000000000;
      expv[52] = 42'h00000000000;
      expv[53] = 42'h00000000000;
      expv[54] = 42'h00000000000;
      expv[55] = 42'h00000000000;
      expv[56] = 42'h00000000000;
      expv[57] = 42'h00000000000;
      expv[58] = 42'h00000000000;
      expv[59] = 42'h00000000000;
      expv[60] = 42'h00000000000;
      expv[61] = 42'h00000000000;
      expv[62] = 42'h00000000000;
      expv[63] = 42'h00000000000;
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
