// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10019 dut (
    .clk(clk),
    .reset(in_vec[19:19]),
    .sync(in_vec[18:18]),
    .len(in_vec[17:2]),
    .start(in_vec[1:1]),
    .stop(in_vec[0:0]),
    .size(out_vec[16:1]),
    .running(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hbd119;
    stim[1] = 20'hf7a86;
    stim[2] = 20'h2091c;
    stim[3] = 20'hb6fbd;
    stim[4] = 20'h71949;
    stim[5] = 20'h0881d;
    stim[6] = 20'h43271;
    stim[7] = 20'h4aea8;
    stim[8] = 20'h3b9a0;
    stim[9] = 20'h7550c;
    stim[10] = 20'h15b7e;
    stim[11] = 20'h698fa;
    stim[12] = 20'h2f59b;
    stim[13] = 20'h4bee8;
    stim[14] = 20'h1bf58;
    stim[15] = 20'h157c2;
    stim[16] = 20'h711ad;
    stim[17] = 20'h48f65;
    stim[18] = 20'h43c81;
    stim[19] = 20'h7f960;
    stim[20] = 20'h4bb00;
    stim[21] = 20'h296a2;
    stim[22] = 20'h7717c;
    stim[23] = 20'h51f6b;
    stim[24] = 20'h4f02f;
    stim[25] = 20'h52eda;
    stim[26] = 20'h0698d;
    stim[27] = 20'h3f5a1;
    stim[28] = 20'h04854;
    stim[29] = 20'h08788;
    stim[30] = 20'h18ea8;
    stim[31] = 20'h15fb5;
    stim[32] = 20'h4da9c;
    stim[33] = 20'h7edb0;
    stim[34] = 20'h40619;
    stim[35] = 20'h30156;
    stim[36] = 20'h0b0f8;
    stim[37] = 20'h22905;
    stim[38] = 20'h7751e;
    stim[39] = 20'h13cd7;
    stim[40] = 20'h54c13;
    stim[41] = 20'h2e6ad;
    stim[42] = 20'h6dd18;
    stim[43] = 20'h66d47;
    stim[44] = 20'h42320;
    stim[45] = 20'h591f5;
    stim[46] = 20'h1dc79;
    stim[47] = 20'h4aab5;
    stim[48] = 20'h0af88;
    stim[49] = 20'h67b93;
    stim[50] = 20'h25cdb;
    stim[51] = 20'h669db;
    stim[52] = 20'h3b383;
    stim[53] = 20'h74980;
    stim[54] = 20'h639c4;
    stim[55] = 20'h2d54d;
    stim[56] = 20'h35768;
    stim[57] = 20'h3e8ea;
    stim[58] = 20'h5f380;
    stim[59] = 20'h686ea;
    stim[60] = 20'h42be4;
    stim[61] = 20'h2dc01;
    stim[62] = 20'h37a0d;
    stim[63] = 20'h2d50b;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00001;
      expv[13] = 17'h00001;
      expv[14] = 17'h00003;
      expv[15] = 17'h00003;
      expv[16] = 17'h00003;
      expv[17] = 17'h00004;
      expv[18] = 17'h00004;
      expv[19] = 17'h00004;
      expv[20] = 17'h00004;
      expv[21] = 17'h00004;
      expv[22] = 17'h00004;
      expv[23] = 17'h00004;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00001;
      expv[27] = 17'h00001;
      expv[28] = 17'h00001;
      expv[29] = 17'h00001;
      expv[30] = 17'h00001;
      expv[31] = 17'h00001;
      expv[32] = 17'h00001;
      expv[33] = 17'h00003;
      expv[34] = 17'h00005;
      expv[35] = 17'h00006;
      expv[36] = 17'h00006;
      expv[37] = 17'h00006;
      expv[38] = 17'h00006;
      expv[39] = 17'h00001;
      expv[40] = 17'h00001;
      expv[41] = 17'h00002;
      expv[42] = 17'h00002;
      expv[43] = 17'h00002;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00001;
      expv[61] = 17'h00003;
      expv[62] = 17'h00003;
      expv[63] = 17'h00003;
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
