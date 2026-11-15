// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01688 dut (
    .clk(clk),
    .din(in_vec[36:5]),
    .wr_en(in_vec[4:4]),
    .rd_en(in_vec[3:3]),
    .delete_en(in_vec[2:2]),
    .undo(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .dout(out_vec[33:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1fa4f4c9bf;
    stim[1] = 37'h1a1232b361;
    stim[2] = 37'h140f7a7620;
    stim[3] = 37'h10d721fec4;
    stim[4] = 37'h0457bc7df4;
    stim[5] = 37'h18ab339112;
    stim[6] = 37'h102d05d0c4;
    stim[7] = 37'h038ead7af0;
    stim[8] = 37'h19e9937c2a;
    stim[9] = 37'h0feff5138e;
    stim[10] = 37'h1c0c016ebc;
    stim[11] = 37'h19a2ba650a;
    stim[12] = 37'h0012d13b18;
    stim[13] = 37'h1eff08b282;
    stim[14] = 37'h06ca9fe988;
    stim[15] = 37'h1932c09cc8;
    stim[16] = 37'h12d8032cfc;
    stim[17] = 37'h1d55c9ce0c;
    stim[18] = 37'h15073af226;
    stim[19] = 37'h12c8954b1a;
    stim[20] = 37'h06ed4c07c4;
    stim[21] = 37'h10f27132fe;
    stim[22] = 37'h082bc28634;
    stim[23] = 37'h034d138fac;
    stim[24] = 37'h07f3b4b62e;
    stim[25] = 37'h07db6431d4;
    stim[26] = 37'h0fdea1081e;
    stim[27] = 37'h0a2642f916;
    stim[28] = 37'h047803bd0a;
    stim[29] = 37'h0778e879f4;
    stim[30] = 37'h1f2546e3be;
    stim[31] = 37'h0288083672;
    stim[32] = 37'h191f7457a2;
    stim[33] = 37'h17c0a0fb5a;
    stim[34] = 37'h0d9bdd6e9a;
    stim[35] = 37'h0c08769828;
    stim[36] = 37'h06c5bbbc34;
    stim[37] = 37'h010bb122e2;
    stim[38] = 37'h034b71cdd2;
    stim[39] = 37'h1df190e704;
    stim[40] = 37'h0a28ebe750;
    stim[41] = 37'h0c8f25971e;
    stim[42] = 37'h1995dac0be;
    stim[43] = 37'h16c49cc0ec;
    stim[44] = 37'h11476d0bde;
    stim[45] = 37'h16effb364b;
    stim[46] = 37'h00ff760500;
    stim[47] = 37'h072a9ccac8;
    stim[48] = 37'h10aab63d58;
    stim[49] = 37'h1a874d824a;
    stim[50] = 37'h01ada6d8e2;
    stim[51] = 37'h18300ac29c;
    stim[52] = 37'h0b9626c1a2;
    stim[53] = 37'h1a24bf4470;
    stim[54] = 37'h1f2e29be08;
    stim[55] = 37'h1bd90991de;
    stim[56] = 37'h058b2ef6b2;
    stim[57] = 37'h12633d3b2a;
    stim[58] = 37'h01acaddf00;
    stim[59] = 37'h1a5b0f57fc;
    stim[60] = 37'h0dcd6aa150;
    stim[61] = 37'h02b270f940;
    stim[62] = 37'h10a3bdd88a;
    stim[63] = 37'h141612575e;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'h08af78fbc;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'h071d5af5d;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'h08af78fbc;
      expv[12] = 34'h315667220;
      expv[13] = 34'h071d5af5d;
      expv[14] = 34'h315667221;
      expv[15] = 34'h071d5af5d;
      expv[16] = 34'h381802dd5;
      expv[17] = 34'h0025a2761;
      expv[18] = 34'h25b00659c;
      expv[19] = 34'h381802dd4;
      expv[20] = 34'h0025a2760;
      expv[21] = 34'h0025a2760;
      expv[22] = 34'h25b00659c;
      expv[23] = 34'h25b00659c;
      expv[24] = 34'h25912a960;
      expv[25] = 34'h1057850c6;
      expv[26] = 34'h1057850c6;
      expv[27] = 34'h1fbd42102;
      expv[28] = 34'h144c85f22;
      expv[29] = 34'h1057850c6;
      expv[30] = 34'h0ef1d0f3e;
      expv[31] = 34'h3e4a8dc76;
      expv[32] = 34'h0510106cc;
      expv[33] = 34'h0510106cc;
      expv[34] = 34'h0510106cc;
      expv[35] = 34'h0510106cc;
      expv[36] = 34'h2f8141f68;
      expv[37] = 34'h2f8141f68;
      expv[38] = 34'h2f8141f68;
      expv[39] = 34'h2f8141f69;
      expv[40] = 34'h2f8141f68;
      expv[41] = 34'h1451d7ce9;
      expv[42] = 34'h191e4b2e1;
      expv[43] = 34'h332bb5815;
      expv[44] = 34'h0696e39b8;
      expv[45] = 34'h1451d7ce8;
      expv[46] = 34'h191e4b2e1;
      expv[47] = 34'h191e4b2e1;
      expv[48] = 34'h332bb5815;
      expv[49] = 34'h228eda178;
      expv[50] = 34'h21556c7a8;
      expv[51] = 34'h21556c7a8;
      expv[52] = 34'h306015850;
      expv[53] = 34'h306015850;
      expv[54] = 34'h306015850;
      expv[55] = 34'h34497e88c;
      expv[56] = 34'h306015850;
      expv[57] = 34'h34497e88c;
      expv[58] = 34'h34497e88c;
      expv[59] = 34'h34497e88c;
      expv[60] = 34'h37b213238;
      expv[61] = 34'h37b21323a;
      expv[62] = 34'h37b21323a;
      expv[63] = 34'h37b21323a;
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
