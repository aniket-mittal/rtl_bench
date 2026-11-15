// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  prbs_gen_chk dut (
    .clk(clk),
    .nrst(in_vec[33:33]),
    .en(in_vec[32:32]),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2862b4214;
    stim[1] = 34'h234f25883;
    stim[2] = 34'h1e06770fc;
    stim[3] = 34'h145d89ac4;
    stim[4] = 34'h0ba90852e;
    stim[5] = 34'h198823b78;
    stim[6] = 34'h1d7ce72a8;
    stim[7] = 34'h016e844e6;
    stim[8] = 34'h012f1bc4f;
    stim[9] = 34'h0cd8f71b6;
    stim[10] = 34'h196b0927a;
    stim[11] = 34'h1bc6ab0ce;
    stim[12] = 34'h09806723e;
    stim[13] = 34'h0809c49ed;
    stim[14] = 34'h012a83e91;
    stim[15] = 34'h1e2dbdc3f;
    stim[16] = 34'h084fb7a1b;
    stim[17] = 34'h1d8a18618;
    stim[18] = 34'h079706123;
    stim[19] = 34'h1fc603489;
    stim[20] = 34'h118a6aa48;
    stim[21] = 34'h184a8a810;
    stim[22] = 34'h0920c0789;
    stim[23] = 34'h136f3424f;
    stim[24] = 34'h199427dc8;
    stim[25] = 34'h076585e5b;
    stim[26] = 34'h08cb02b4c;
    stim[27] = 34'h17de8ea5e;
    stim[28] = 34'h1fa63601f;
    stim[29] = 34'h06423b547;
    stim[30] = 34'h1b0f819b5;
    stim[31] = 34'h12c808cb2;
    stim[32] = 34'h0c75fe0e0;
    stim[33] = 34'h232edb910;
    stim[34] = 34'h0388314cc;
    stim[35] = 34'h152bc4a49;
    stim[36] = 34'h08bb564b6;
    stim[37] = 34'h18d6370b4;
    stim[38] = 34'h09a1c1087;
    stim[39] = 34'h11ce8b3ca;
    stim[40] = 34'h08db91aea;
    stim[41] = 34'h08a3306e7;
    stim[42] = 34'h1a0d5ceee;
    stim[43] = 34'h1594e32ee;
    stim[44] = 34'h1d40ff810;
    stim[45] = 34'h1feffa5fa;
    stim[46] = 34'h02e1a14fe;
    stim[47] = 34'h124d665ed;
    stim[48] = 34'h1c5974acd;
    stim[49] = 34'h166b6c578;
    stim[50] = 34'h117598804;
    stim[51] = 34'h06e6e62e3;
    stim[52] = 34'h1eab89cfb;
    stim[53] = 34'h05ed35147;
    stim[54] = 34'h13030c677;
    stim[55] = 34'h08d33b46c;
    stim[56] = 34'h1f8d5e9e1;
    stim[57] = 34'h1f8c9e3d5;
    stim[58] = 34'h1b92011eb;
    stim[59] = 34'h0c039a0ca;
    stim[60] = 34'h02c41bf04;
    stim[61] = 34'h06d6be2d1;
    stim[62] = 34'h101cfe2b4;
    stim[63] = 34'h091d12aba;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hffffffff;
      expv[4] = 32'hffffffff;
      expv[5] = 32'hffffffff;
      expv[6] = 32'hffffffff;
      expv[7] = 32'hffffffff;
      expv[8] = 32'hffffffff;
      expv[9] = 32'hffffffff;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffffffff;
      expv[16] = 32'hffffffff;
      expv[17] = 32'hffffffff;
      expv[18] = 32'hffffffff;
      expv[19] = 32'hffffffff;
      expv[20] = 32'hffffffff;
      expv[21] = 32'hffffffff;
      expv[22] = 32'hffffffff;
      expv[23] = 32'hffffffff;
      expv[24] = 32'hffffffff;
      expv[25] = 32'hffffffff;
      expv[26] = 32'hffffffff;
      expv[27] = 32'hffffffff;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'hffffffff;
      expv[31] = 32'hffffffff;
      expv[32] = 32'hffffffff;
      expv[33] = 32'hffffffff;
      expv[34] = 32'hffffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'hffffffff;
      expv[37] = 32'hffffffff;
      expv[38] = 32'hffffffff;
      expv[39] = 32'hffffffff;
      expv[40] = 32'hffffffff;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'hffffffff;
      expv[44] = 32'hffffffff;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hffffffff;
      expv[47] = 32'hffffffff;
      expv[48] = 32'hffffffff;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffffffff;
      expv[53] = 32'hffffffff;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffffffff;
      expv[57] = 32'hffffffff;
      expv[58] = 32'hffffffff;
      expv[59] = 32'hffffffff;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hffffffff;
      expv[62] = 32'hffffffff;
      expv[63] = 32'hffffffff;
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
