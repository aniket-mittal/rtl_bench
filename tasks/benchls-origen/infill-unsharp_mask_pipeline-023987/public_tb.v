// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023987 dut (
    .pixel_clk(clk),
    .vsync_in(in_vec[40:40]),
    .href_in(in_vec[39:39]),
    .shrap_en(in_vec[38:38]),
    .sharp_threlode_in(in_vec[37:28]),
    .sharp_factor_in(in_vec[27:20]),
    .data_raw_in(in_vec[19:10]),
    .data_gaus_in(in_vec[9:0]),
    .vsync_out(out_vec[11:11]),
    .href_out(out_vec[10:10]),
    .data_out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h17c88ccf8b9;
    stim[1] = 41'h1776631c553;
    stim[2] = 41'h0773d6ab916;
    stim[3] = 41'h1b8f65f8621;
    stim[4] = 41'h01135b37cbd;
    stim[5] = 41'h10fea7f4d61;
    stim[6] = 41'h0e6a7d3bd6e;
    stim[7] = 41'h1bfca40e641;
    stim[8] = 41'h0def63fe905;
    stim[9] = 41'h1bda104868e;
    stim[10] = 41'h00dd9b4f8cb;
    stim[11] = 41'h11f298608c5;
    stim[12] = 41'h1f7eeb6b808;
    stim[13] = 41'h122b2d38974;
    stim[14] = 41'h15c593d2a98;
    stim[15] = 41'h1493a2176c8;
    stim[16] = 41'h04738add32d;
    stim[17] = 41'h06a63c21606;
    stim[18] = 41'h08d9249c479;
    stim[19] = 41'h1d9f6247b9c;
    stim[20] = 41'h02fa68eae9b;
    stim[21] = 41'h05ae4892b1e;
    stim[22] = 41'h13f724107ae;
    stim[23] = 41'h1428a769621;
    stim[24] = 41'h1e30a5450b8;
    stim[25] = 41'h1c25cbbc6ab;
    stim[26] = 41'h129bf88bd58;
    stim[27] = 41'h133f10b0cae;
    stim[28] = 41'h0f1bc241723;
    stim[29] = 41'h131fe0b360f;
    stim[30] = 41'h137d0ccc403;
    stim[31] = 41'h1a64fc34194;
    stim[32] = 41'h00dafcc244d;
    stim[33] = 41'h1f27e6ae245;
    stim[34] = 41'h061bf6d7493;
    stim[35] = 41'h1479832c48f;
    stim[36] = 41'h042d08c5638;
    stim[37] = 41'h1d73e99c469;
    stim[38] = 41'h0ab3a0fd899;
    stim[39] = 41'h178c03285e2;
    stim[40] = 41'h15dc5d3c61f;
    stim[41] = 41'h10b197b2be0;
    stim[42] = 41'h1f94c2f0fce;
    stim[43] = 41'h0f54663d91e;
    stim[44] = 41'h08ac93d8bc5;
    stim[45] = 41'h0686fcdc9ce;
    stim[46] = 41'h08ff7f69606;
    stim[47] = 41'h097f9311b5b;
    stim[48] = 41'h0670b1991ea;
    stim[49] = 41'h0a43faa54fe;
    stim[50] = 41'h19e644abdcf;
    stim[51] = 41'h13ad7c92167;
    stim[52] = 41'h159f4abb409;
    stim[53] = 41'h152f51a5848;
    stim[54] = 41'h1339dce6293;
    stim[55] = 41'h06bfe7ccd31;
    stim[56] = 41'h15a1ce22926;
    stim[57] = 41'h1b0b773de64;
    stim[58] = 41'h0d44820bb3b;
    stim[59] = 41'h13702993289;
    stim[60] = 41'h18d87a03727;
    stim[61] = 41'h09b6c4b4a7d;
    stim[62] = 41'h013208199b0;
    stim[63] = 41'h15c51f1903b;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'h8b9;
      expv[7] = 12'h153;
      expv[8] = 12'heae;
      expv[9] = 12'h221;
      expv[10] = 12'h8df;
      expv[11] = 12'h561;
      expv[12] = 12'hd6e;
      expv[13] = 12'h641;
      expv[14] = 12'hffa;
      expv[15] = 12'h28e;
      expv[16] = 12'h93e;
      expv[17] = 12'hd82;
      expv[18] = 12'ha53;
      expv[19] = 12'h8e2;
      expv[20] = 12'ha98;
      expv[21] = 12'h05d;
      expv[22] = 12'h32d;
      expv[23] = 12'h485;
      expv[24] = 12'hc79;
      expv[25] = 12'h284;
      expv[26] = 12'h154;
      expv[27] = 12'h8f3;
      expv[28] = 12'hbae;
      expv[29] = 12'he21;
      expv[30] = 12'hd14;
      expv[31] = 12'haab;
      expv[32] = 12'h958;
      expv[33] = 12'h4ae;
      expv[34] = 12'hb23;
      expv[35] = 12'hacd;
      expv[36] = 12'hf31;
      expv[37] = 12'h117;
      expv[38] = 12'hd86;
      expv[39] = 12'h0a9;
      expv[40] = 12'h893;
      expv[41] = 12'h0b1;
      expv[42] = 12'hf15;
      expv[43] = 12'h469;
      expv[44] = 12'hbf6;
      expv[45] = 12'h878;
      expv[46] = 12'ha1f;
      expv[47] = 12'heca;
      expv[48] = 12'h7ce;
      expv[49] = 12'h51e;
      expv[50] = 12'h362;
      expv[51] = 12'h5ce;
      expv[52] = 12'h606;
      expv[53] = 12'h35b;
      expv[54] = 12'h4b5;
      expv[55] = 12'he95;
      expv[56] = 12'h9cf;
      expv[57] = 12'ha48;
      expv[58] = 12'haed;
      expv[59] = 12'h848;
      expv[60] = 12'h34b;
      expv[61] = 12'h931;
      expv[62] = 12'hd26;
      expv[63] = 12'h664;
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
