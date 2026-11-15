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

  mg_10652 dut (
    .clk(clk),
    .in(in_vec[32:1]),
    .reset(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h088fc14eb;
    stim[1] = 33'h163735389;
    stim[2] = 33'h07f532514;
    stim[3] = 33'h12e673e6c;
    stim[4] = 33'h08638bcae;
    stim[5] = 33'h0097843c2;
    stim[6] = 33'h1a3e44d4e;
    stim[7] = 33'h145e45d50;
    stim[8] = 33'h01da11b8c;
    stim[9] = 33'h0ee18ec44;
    stim[10] = 33'h0a04ec5ca;
    stim[11] = 33'h1f2d92dea;
    stim[12] = 33'h0311b35a6;
    stim[13] = 33'h137f2609e;
    stim[14] = 33'h04fc42d1c;
    stim[15] = 33'h0892f982c;
    stim[16] = 33'h1393d6e5e;
    stim[17] = 33'h17478560e;
    stim[18] = 33'h077a0479a;
    stim[19] = 33'h1e77e51c6;
    stim[20] = 33'h0a3b58214;
    stim[21] = 33'h02c633f44;
    stim[22] = 33'h0e511a31a;
    stim[23] = 33'h1cb680e72;
    stim[24] = 33'h0d762dec0;
    stim[25] = 33'h06c623052;
    stim[26] = 33'h0eabef12c;
    stim[27] = 33'h0f0192b42;
    stim[28] = 33'h0c7963984;
    stim[29] = 33'h0fe69895e;
    stim[30] = 33'h079661428;
    stim[31] = 33'h1a46061ee;
    stim[32] = 33'h13ef9bb50;
    stim[33] = 33'h080bf99d4;
    stim[34] = 33'h1a02bed62;
    stim[35] = 33'h05f5b4fe0;
    stim[36] = 33'h0987f6638;
    stim[37] = 33'h1d60a95e2;
    stim[38] = 33'h04752961e;
    stim[39] = 33'h1d694a042;
    stim[40] = 33'h0100a6b3c;
    stim[41] = 33'h10959fe2e;
    stim[42] = 33'h0ea1b45c4;
    stim[43] = 33'h0ab7931de;
    stim[44] = 33'h0af38b48e;
    stim[45] = 33'h0c6cedab6;
    stim[46] = 33'h16b715d60;
    stim[47] = 33'h10cd1b7ba;
    stim[48] = 33'h0a4a27d8a;
    stim[49] = 33'h08ad62232;
    stim[50] = 33'h13c09866e;
    stim[51] = 33'h0e04a8efe;
    stim[52] = 33'h142edba4a;
    stim[53] = 33'h0f25f5e30;
    stim[54] = 33'h0deaeb6fe;
    stim[55] = 33'h19b7692ca;
    stim[56] = 33'h0e0b843da;
    stim[57] = 33'h1e671b5e2;
    stim[58] = 33'h06914cc60;
    stim[59] = 33'h14878168e;
    stim[60] = 33'h1a693ccce;
    stim[61] = 33'h0f285f62e;
    stim[62] = 33'h14a51a78e;
    stim[63] = 33'h0c1ad6292;
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
      expv[4] = 32'h3fa9928a;
      expv[5] = 32'h97339f36;
      expv[6] = 32'h431c5e57;
      expv[7] = 32'h04bc21e1;
      expv[8] = 32'hd1f226a7;
      expv[9] = 32'ha2f22ea8;
      expv[10] = 32'h0ed08dc6;
      expv[11] = 32'h770c7622;
      expv[12] = 32'h502762e5;
      expv[13] = 32'hf96c96f5;
      expv[14] = 32'h188d9ad3;
      expv[15] = 32'h9bf9304f;
      expv[16] = 32'h27e2168e;
      expv[17] = 32'h4497cc16;
      expv[18] = 32'h9c9eb72f;
      expv[19] = 32'hba3c2b07;
      expv[20] = 32'h3bd023cd;
      expv[21] = 32'hf3bf28e3;
      expv[22] = 32'h51dac10a;
      expv[23] = 32'h16319fa2;
      expv[24] = 32'h7288d18d;
      expv[25] = 32'he5b40739;
      expv[26] = 32'h6bb16f60;
      expv[27] = 32'h36311829;
      expv[28] = 32'h755f7896;
      expv[29] = 32'h780c95a1;
      expv[30] = 32'h63cb1cc2;
      expv[31] = 32'h7f34c4af;
      expv[32] = 32'h3cb30a14;
      expv[33] = 32'hd23030f7;
      expv[34] = 32'h9f7cdda8;
      expv[35] = 32'h405fccea;
      expv[36] = 32'hd015f6b1;
      expv[37] = 32'h2fada7f0;
      expv[38] = 32'h4c3fb31c;
      expv[39] = 32'heb054af1;
      expv[40] = 32'h23a94b0f;
      expv[41] = 32'heb4a5021;
      expv[42] = 32'h0805359e;
      expv[43] = 32'h84acff17;
      expv[44] = 32'h750da2e2;
      expv[45] = 32'h55bc98ef;
      expv[46] = 32'h579c5a47;
      expv[47] = 32'h63676d5b;
      expv[48] = 32'hb5b8aeb0;
      expv[49] = 32'h8668dbdd;
      expv[50] = 32'h52513ec5;
      expv[51] = 32'h456b1119;
      expv[52] = 32'h9e04c337;
      expv[53] = 32'h7025477f;
      expv[54] = 32'ha176dd25;
      expv[55] = 32'h792faf18;
      expv[56] = 32'h6f575b7f;
      expv[57] = 32'hcdbb4965;
      expv[58] = 32'h705c21ed;
      expv[59] = 32'hf338daf1;
      expv[60] = 32'h348a6630;
      expv[61] = 32'ha43c0b47;
      expv[62] = 32'hd349e667;
      expv[63] = 32'h7942fb17;
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
