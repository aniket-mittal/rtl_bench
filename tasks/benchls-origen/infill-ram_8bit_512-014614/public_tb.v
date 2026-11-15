// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014614 dut (
    .clk(clk),
    .address(in_vec[43:28]),
    .write16(in_vec[27:12]),
    .write8(in_vec[11:4]),
    .R_WR(in_vec[3:3]),
    .enable(in_vec[2:2]),
    .eightbit(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .read16(out_vec[23:8]),
    .read8(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h27f48a17ba3;
    stim[1] = 44'h3fdcc9c144f;
    stim[2] = 44'h3e5059a6fde;
    stim[3] = 44'h50d22802f08;
    stim[4] = 44'hec13b13ef66;
    stim[5] = 44'hae4d0777f28;
    stim[6] = 44'h3227bf71a68;
    stim[7] = 44'h0040d007bba;
    stim[8] = 44'he80a8add530;
    stim[9] = 44'hf51c45f0686;
    stim[10] = 44'h90860cf3fe4;
    stim[11] = 44'h7d93c74b65c;
    stim[12] = 44'h3a26cbf0a32;
    stim[13] = 44'h6d41b41c690;
    stim[14] = 44'hfad2e4e3d84;
    stim[15] = 44'h3df852347d0;
    stim[16] = 44'h6acc54d15c0;
    stim[17] = 44'haf99cf1b8fc;
    stim[18] = 44'h741957aca7c;
    stim[19] = 44'h6a088fb0ce0;
    stim[20] = 44'ha57a285d434;
    stim[21] = 44'h5d5c356cbe2;
    stim[22] = 44'h9897911216e;
    stim[23] = 44'h793fb793186;
    stim[24] = 44'h4807ed93726;
    stim[25] = 44'hfd14969ef52;
    stim[26] = 44'hb206e1b9b96;
    stim[27] = 44'h767e6de9864;
    stim[28] = 44'h2cd85cab938;
    stim[29] = 44'h373bc6b285c;
    stim[30] = 44'h5c9f98a2e84;
    stim[31] = 44'h4e415245c9e;
    stim[32] = 44'h9c1da4bb15c;
    stim[33] = 44'hba0e5c19ca0;
    stim[34] = 44'h914594fb310;
    stim[35] = 44'h501d3f93c8a;
    stim[36] = 44'ha2c57287122;
    stim[37] = 44'h4a2c775f3c8;
    stim[38] = 44'h8755a69879c;
    stim[39] = 44'he1f4362af94;
    stim[40] = 44'h50b594074ea;
    stim[41] = 44'h3b7313b67d2;
    stim[42] = 44'h3bd9bfa7480;
    stim[43] = 44'hbbfc308048c;
    stim[44] = 44'hf6bf42d63c2;
    stim[45] = 44'hd0106582964;
    stim[46] = 44'h0fd587baff6;
    stim[47] = 44'hd7a07396578;
    stim[48] = 44'hcae25be3e58;
    stim[49] = 44'h29a932416e8;
    stim[50] = 44'h4cbaa5845a6;
    stim[51] = 44'hb3f60df0d18;
    stim[52] = 44'h96f836d8a94;
    stim[53] = 44'h0bb9cfc027c;
    stim[54] = 44'h56c4876f9d0;
    stim[55] = 44'h204b4a4ef2e;
    stim[56] = 44'hb955b472160;
    stim[57] = 44'h3a2b73e02d2;
    stim[58] = 44'h024bbe607e4;
    stim[59] = 44'h00658711a80;
    stim[60] = 44'h564f51bc3f0;
    stim[61] = 44'h3624669d0bc;
    stim[62] = 44'h8c6e43052d4;
    stim[63] = 44'h866bb34f660;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
