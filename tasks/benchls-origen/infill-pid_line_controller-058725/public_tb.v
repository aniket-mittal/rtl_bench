// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058725 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .LineLocation(in_vec[31:0]),
    .ConMsg(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h138846983;
    stim[1] = 33'h1943939bd;
    stim[2] = 33'h0ec7bc3c7;
    stim[3] = 33'h08b3e6127;
    stim[4] = 33'h0215170b6;
    stim[5] = 33'h093751b83;
    stim[6] = 33'h06be9919c;
    stim[7] = 33'h082541099;
    stim[8] = 33'h0c7479279;
    stim[9] = 33'h067cc9f47;
    stim[10] = 33'h0f704f5f7;
    stim[11] = 33'h0c48d9605;
    stim[12] = 33'h012dc829f;
    stim[13] = 33'h08a3e35b4;
    stim[14] = 33'h06eb7ce19;
    stim[15] = 33'h0aba4896d;
    stim[16] = 33'h0af617248;
    stim[17] = 33'h05a9c28af;
    stim[18] = 33'h10c304b56;
    stim[19] = 33'h07114bc41;
    stim[20] = 33'h0ed2838e4;
    stim[21] = 33'h04aee9021;
    stim[22] = 33'h0c5a3b71a;
    stim[23] = 33'h0c708f744;
    stim[24] = 33'h08c5ac30e;
    stim[25] = 33'h078f834f8;
    stim[26] = 33'h1e525bdb5;
    stim[27] = 33'h0894ad042;
    stim[28] = 33'h0f7d4a359;
    stim[29] = 33'h0b6351f29;
    stim[30] = 33'h0b60445e1;
    stim[31] = 33'h0ccf70711;
    stim[32] = 33'h0d241832a;
    stim[33] = 33'h0d94cd64d;
    stim[34] = 33'h04951f4a7;
    stim[35] = 33'h0024eb8d7;
    stim[36] = 33'h079330cdb;
    stim[37] = 33'h07945d658;
    stim[38] = 33'h0fa30ecd7;
    stim[39] = 33'h0d11fc4c8;
    stim[40] = 33'h0d73c1214;
    stim[41] = 33'h0eab3db8f;
    stim[42] = 33'h099bea3bf;
    stim[43] = 33'h0bd41b6e6;
    stim[44] = 33'h0dd75f8c3;
    stim[45] = 33'h0c14d4dc0;
    stim[46] = 33'h0df2ac7eb;
    stim[47] = 33'h084982c51;
    stim[48] = 33'h0a37e43b4;
    stim[49] = 33'h0d3ca0f9a;
    stim[50] = 33'h0415a5fff;
    stim[51] = 33'h07cde4a33;
    stim[52] = 33'h0060330b1;
    stim[53] = 33'h1da3c2d8f;
    stim[54] = 33'h076f7fc04;
    stim[55] = 33'h058db2805;
    stim[56] = 33'h0fee32a01;
    stim[57] = 33'h0afce40a9;
    stim[58] = 33'h07028e2a9;
    stim[59] = 33'h00f360742;
    stim[60] = 33'h0c6d31b21;
    stim[61] = 33'h07e028ec2;
    stim[62] = 33'h0c056f1e5;
    stim[63] = 33'h01507df4f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
