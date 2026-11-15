// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072450 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h49f;
    stim[1] = 11'h778;
    stim[2] = 11'h2c1;
    stim[3] = 11'h37b;
    stim[4] = 11'h187;
    stim[5] = 11'h1c4;
    stim[6] = 11'h192;
    stim[7] = 11'h3ef;
    stim[8] = 11'h0fc;
    stim[9] = 11'h362;
    stim[10] = 11'h2df;
    stim[11] = 11'h02d;
    stim[12] = 11'h111;
    stim[13] = 11'h2cc;
    stim[14] = 11'h1f4;
    stim[15] = 11'h25f;
    stim[16] = 11'h0aa;
    stim[17] = 11'h07d;
    stim[18] = 11'h26b;
    stim[19] = 11'h13b;
    stim[20] = 11'h4f3;
    stim[21] = 11'h1a2;
    stim[22] = 11'h0f9;
    stim[23] = 11'h285;
    stim[24] = 11'h3e4;
    stim[25] = 11'h3cf;
    stim[26] = 11'h05f;
    stim[27] = 11'h0bc;
    stim[28] = 11'h09e;
    stim[29] = 11'h068;
    stim[30] = 11'h0d1;
    stim[31] = 11'h55c;
    stim[32] = 11'h3d3;
    stim[33] = 11'h1f4;
    stim[34] = 11'h0d4;
    stim[35] = 11'h20d;
    stim[36] = 11'h229;
    stim[37] = 11'h2d1;
    stim[38] = 11'h294;
    stim[39] = 11'h211;
    stim[40] = 11'h067;
    stim[41] = 11'h75f;
    stim[42] = 11'h210;
    stim[43] = 11'h2b5;
    stim[44] = 11'h1bc;
    stim[45] = 11'h230;
    stim[46] = 11'h131;
    stim[47] = 11'h2ea;
    stim[48] = 11'h2c7;
    stim[49] = 11'h193;
    stim[50] = 11'h00d;
    stim[51] = 11'h161;
    stim[52] = 11'h1c0;
    stim[53] = 11'h00c;
    stim[54] = 11'h16e;
    stim[55] = 11'h226;
    stim[56] = 11'h2d0;
    stim[57] = 11'h17f;
    stim[58] = 11'h077;
    stim[59] = 11'h1b2;
    stim[60] = 11'h2b8;
    stim[61] = 11'h08b;
    stim[62] = 11'h0c0;
    stim[63] = 11'h32d;
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
      expv[4] = 12'hef5;
      expv[5] = 12'hb0d;
      expv[6] = 12'hb0d;
      expv[7] = 12'h30e;
      expv[8] = 12'hb25;
      expv[9] = 12'hb25;
      expv[10] = 12'h326;
      expv[11] = 12'hec5;
      expv[12] = 12'hec0;
      expv[13] = 12'hec0;
      expv[14] = 12'hec0;
      expv[15] = 12'hec0;
      expv[16] = 12'hcbd;
      expv[17] = 12'h4be;
      expv[18] = 12'h955;
      expv[19] = 12'hcd5;
      expv[20] = 12'ha75;
      expv[21] = 12'h1e0;
      expv[22] = 12'hb40;
      expv[23] = 12'hb40;
      expv[24] = 12'hb40;
      expv[25] = 12'hb40;
      expv[26] = 12'hf9d;
      expv[27] = 12'h8bd;
      expv[28] = 12'h8bd;
      expv[29] = 12'h0be;
      expv[30] = 12'h0be;
      expv[31] = 12'h93d;
      expv[32] = 12'h138;
      expv[33] = 12'hfa0;
      expv[34] = 12'hfa0;
      expv[35] = 12'hfa0;
      expv[36] = 12'hfa0;
      expv[37] = 12'hfa0;
      expv[38] = 12'hfa0;
      expv[39] = 12'hfa0;
      expv[40] = 12'hfa0;
      expv[41] = 12'h8cd;
      expv[42] = 12'h6b8;
      expv[43] = 12'heb8;
      expv[44] = 12'heb8;
      expv[45] = 12'heb8;
      expv[46] = 12'heb8;
      expv[47] = 12'heb8;
      expv[48] = 12'hdd5;
      expv[49] = 12'hd8d;
      expv[50] = 12'hb25;
      expv[51] = 12'hb20;
      expv[52] = 12'hb20;
      expv[53] = 12'hb20;
      expv[54] = 12'hb20;
      expv[55] = 12'hadd;
      expv[56] = 12'h2de;
      expv[57] = 12'h2de;
      expv[58] = 12'hc4d;
      expv[59] = 12'h8ed;
      expv[60] = 12'h0ee;
      expv[61] = 12'h0ee;
      expv[62] = 12'hb65;
      expv[63] = 12'hb65;
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
