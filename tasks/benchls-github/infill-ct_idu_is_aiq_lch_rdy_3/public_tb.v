// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_idu_is_aiq_lch_rdy_3 dut (
    .y_clk(clk),
    .cpurst_b(in_vec[15:15]),
    .vld(in_vec[14:14]),
    .x_create_dp_en(in_vec[13:13]),
    .x_create_entry(in_vec[12:11]),
    .x_create_lch_rdy(in_vec[10:8]),
    .y_create0_dp_en(in_vec[7:7]),
    .y_create0_src_match(in_vec[6:4]),
    .y_create1_dp_en(in_vec[3:3]),
    .y_create1_src_match(in_vec[2:0]),
    .x_read_lch_rdy(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h7789;
    stim[1] = 16'h2bdf;
    stim[2] = 16'h99f9;
    stim[3] = 16'hc2a0;
    stim[4] = 16'ha14e;
    stim[5] = 16'hdceb;
    stim[6] = 16'hbaaf;
    stim[7] = 16'h9c8d;
    stim[8] = 16'h9b5d;
    stim[9] = 16'h931c;
    stim[10] = 16'hee23;
    stim[11] = 16'hd361;
    stim[12] = 16'hd8ff;
    stim[13] = 16'he134;
    stim[14] = 16'hc3d7;
    stim[15] = 16'h93d7;
    stim[16] = 16'hcdcd;
    stim[17] = 16'hd8ee;
    stim[18] = 16'hb616;
    stim[19] = 16'hd741;
    stim[20] = 16'habcb;
    stim[21] = 16'hf2fe;
    stim[22] = 16'hde85;
    stim[23] = 16'hc416;
    stim[24] = 16'h839c;
    stim[25] = 16'hdcdd;
    stim[26] = 16'h808a;
    stim[27] = 16'h9430;
    stim[28] = 16'he247;
    stim[29] = 16'h82a1;
    stim[30] = 16'h9c79;
    stim[31] = 16'hfc3c;
    stim[32] = 16'hc651;
    stim[33] = 16'hfa84;
    stim[34] = 16'he5f3;
    stim[35] = 16'hb3d8;
    stim[36] = 16'h8ad4;
    stim[37] = 16'h8f2b;
    stim[38] = 16'hdd90;
    stim[39] = 16'hcd49;
    stim[40] = 16'hcffa;
    stim[41] = 16'he751;
    stim[42] = 16'hed4b;
    stim[43] = 16'h995a;
    stim[44] = 16'hfdd4;
    stim[45] = 16'hf0ee;
    stim[46] = 16'hecd0;
    stim[47] = 16'hb1ee;
    stim[48] = 16'ha8a2;
    stim[49] = 16'hbc55;
    stim[50] = 16'hd860;
    stim[51] = 16'haf0d;
    stim[52] = 16'h94b1;
    stim[53] = 16'h9515;
    stim[54] = 16'ha624;
    stim[55] = 16'hdde9;
    stim[56] = 16'hca1d;
    stim[57] = 16'hd3ad;
    stim[58] = 16'hb0e0;
    stim[59] = 16'h63a8;
    stim[60] = 16'hff59;
    stim[61] = 16'had5f;
    stim[62] = 16'hee2f;
    stim[63] = 16'ha273;
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
      expv[0] = 3'h1;
      expv[1] = 3'h5;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h1;
      expv[6] = 3'h6;
      expv[7] = 3'h2;
      expv[8] = 3'h5;
      expv[9] = 3'h4;
      expv[10] = 3'h2;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h7;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h6;
      expv[19] = 3'h6;
      expv[20] = 3'h4;
      expv[21] = 3'h6;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h5;
      expv[27] = 3'h5;
      expv[28] = 3'h5;
      expv[29] = 3'h2;
      expv[30] = 3'h1;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h0;
      expv[34] = 3'h2;
      expv[35] = 3'h0;
      expv[36] = 3'h5;
      expv[37] = 3'h3;
      expv[38] = 3'h1;
      expv[39] = 3'h1;
      expv[40] = 3'h7;
      expv[41] = 3'h7;
      expv[42] = 3'h7;
      expv[43] = 3'h2;
      expv[44] = 3'h5;
      expv[45] = 3'h6;
      expv[46] = 3'h5;
      expv[47] = 3'h6;
      expv[48] = 3'h2;
      expv[49] = 3'h0;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h7;
      expv[53] = 3'h7;
      expv[54] = 3'h7;
      expv[55] = 3'h6;
      expv[56] = 3'h6;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h0;
      expv[60] = 3'h1;
      expv[61] = 3'h7;
      expv[62] = 3'h5;
      expv[63] = 3'h6;
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
