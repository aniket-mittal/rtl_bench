// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063196 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h5205b5dc17b757;
    stim[1] = 55'h2fabe3fb298ed8;
    stim[2] = 55'h651e21f2008d50;
    stim[3] = 55'h7c8d05e28ea21e;
    stim[4] = 55'h767b099ae9fa8f;
    stim[5] = 55'h2febffe204842c;
    stim[6] = 55'h203ab391162ea8;
    stim[7] = 55'h464d02ae0ee2fb;
    stim[8] = 55'h3c8766c5f60350;
    stim[9] = 55'h04f3a888e5d130;
    stim[10] = 55'h618544de6c24ca;
    stim[11] = 55'h0e38a09f181f82;
    stim[12] = 55'h348cba27819467;
    stim[13] = 55'h7cb9fea81a149a;
    stim[14] = 55'h76093da7901904;
    stim[15] = 55'h433df5122d8740;
    stim[16] = 55'h100683ac5707c8;
    stim[17] = 55'h5eb2da54547c0a;
    stim[18] = 55'h454d1c0ba62cce;
    stim[19] = 55'h0fd2d8fb11dd34;
    stim[20] = 55'h0057e556d8f9b7;
    stim[21] = 55'h00129740c63f0a;
    stim[22] = 55'h046e964c6c2227;
    stim[23] = 55'h1ddb85106b6012;
    stim[24] = 55'h0256b44d1096c0;
    stim[25] = 55'h6d869b979bb3d5;
    stim[26] = 55'h6e7a45f4ec3011;
    stim[27] = 55'h10fef653ae5980;
    stim[28] = 55'h6e62fda170f7b3;
    stim[29] = 55'h1cb87e9c529435;
    stim[30] = 55'h631b8eea5b8362;
    stim[31] = 55'h56bf1f8806b74d;
    stim[32] = 55'h0236f885a71c87;
    stim[33] = 55'h4cfa0de8008a2f;
    stim[34] = 55'h1a194f54fa380e;
    stim[35] = 55'h76027ad20d8616;
    stim[36] = 55'h695666fd612e95;
    stim[37] = 55'h01750a9148662a;
    stim[38] = 55'h6fe0aba533a6e8;
    stim[39] = 55'h00af2b897523de;
    stim[40] = 55'h264d3ba9a6b714;
    stim[41] = 55'h7a958bf806e707;
    stim[42] = 55'h2f84edc1ecbc97;
    stim[43] = 55'h20a24e7ac390fc;
    stim[44] = 55'h535159bd430148;
    stim[45] = 55'h36edd4dea7edf6;
    stim[46] = 55'h39d92327d5a8d9;
    stim[47] = 55'h67efb5570c7035;
    stim[48] = 55'h3135a01ad1da9c;
    stim[49] = 55'h52872a0994c8c8;
    stim[50] = 55'h20f49edd1b2df6;
    stim[51] = 55'h7ca95e57a6c998;
    stim[52] = 55'h2ef4fbfe0dd58f;
    stim[53] = 55'h04a0247f1eb9b8;
    stim[54] = 55'h49c28da63bc172;
    stim[55] = 55'h5ba20568f54b3a;
    stim[56] = 55'h275953cd441e88;
    stim[57] = 55'h39ad758884e6c6;
    stim[58] = 55'h46818b3c0fc278;
    stim[59] = 55'h30dc7acdfb18d1;
    stim[60] = 55'h2d7757a1eec5d8;
    stim[61] = 55'h598566618f61e5;
    stim[62] = 55'h22c08acdcbc86e;
    stim[63] = 55'h186466609554b7;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h5205b5dc17b757;
      expv[2] = 55'h2fabe3fb298ed8;
      expv[3] = 55'h651e21f2008d50;
      expv[4] = 55'h7c8d05e28ea21e;
      expv[5] = 55'h767b099ae9fa8f;
      expv[6] = 55'h2febffe204842c;
      expv[7] = 55'h203ab391162ea8;
      expv[8] = 55'h464d02ae0ee2fb;
      expv[9] = 55'h3c8766c5f60350;
      expv[10] = 55'h04f3a888e5d130;
      expv[11] = 55'h618544de6c24ca;
      expv[12] = 55'h0e38a09f181f82;
      expv[13] = 55'h348cba27819467;
      expv[14] = 55'h7cb9fea81a149a;
      expv[15] = 55'h76093da7901904;
      expv[16] = 55'h433df5122d8740;
      expv[17] = 55'h100683ac5707c8;
      expv[18] = 55'h5eb2da54547c0a;
      expv[19] = 55'h454d1c0ba62cce;
      expv[20] = 55'h0fd2d8fb11dd34;
      expv[21] = 55'h0057e556d8f9b7;
      expv[22] = 55'h00129740c63f0a;
      expv[23] = 55'h046e964c6c2227;
      expv[24] = 55'h1ddb85106b6012;
      expv[25] = 55'h0256b44d1096c0;
      expv[26] = 55'h6d869b979bb3d5;
      expv[27] = 55'h6e7a45f4ec3011;
      expv[28] = 55'h10fef653ae5980;
      expv[29] = 55'h6e62fda170f7b3;
      expv[30] = 55'h1cb87e9c529435;
      expv[31] = 55'h631b8eea5b8362;
      expv[32] = 55'h56bf1f8806b74d;
      expv[33] = 55'h0236f885a71c87;
      expv[34] = 55'h4cfa0de8008a2f;
      expv[35] = 55'h1a194f54fa380e;
      expv[36] = 55'h76027ad20d8616;
      expv[37] = 55'h695666fd612e95;
      expv[38] = 55'h01750a9148662a;
      expv[39] = 55'h6fe0aba533a6e8;
      expv[40] = 55'h00af2b897523de;
      expv[41] = 55'h264d3ba9a6b714;
      expv[42] = 55'h7a958bf806e707;
      expv[43] = 55'h2f84edc1ecbc97;
      expv[44] = 55'h20a24e7ac390fc;
      expv[45] = 55'h535159bd430148;
      expv[46] = 55'h36edd4dea7edf6;
      expv[47] = 55'h39d92327d5a8d9;
      expv[48] = 55'h67efb5570c7035;
      expv[49] = 55'h3135a01ad1da9c;
      expv[50] = 55'h52872a0994c8c8;
      expv[51] = 55'h20f49edd1b2df6;
      expv[52] = 55'h7ca95e57a6c998;
      expv[53] = 55'h2ef4fbfe0dd58f;
      expv[54] = 55'h04a0247f1eb9b8;
      expv[55] = 55'h49c28da63bc172;
      expv[56] = 55'h5ba20568f54b3a;
      expv[57] = 55'h275953cd441e88;
      expv[58] = 55'h39ad758884e6c6;
      expv[59] = 55'h46818b3c0fc278;
      expv[60] = 55'h30dc7acdfb18d1;
      expv[61] = 55'h2d7757a1eec5d8;
      expv[62] = 55'h598566618f61e5;
      expv[63] = 55'h22c08acdcbc86e;
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
