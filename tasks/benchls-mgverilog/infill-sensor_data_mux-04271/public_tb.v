// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04271 dut (
    .x_axis(in_vec[57:42]),
    .y_axis(in_vec[41:26]),
    .z_axis(in_vec[25:10]),
    .temp_data(in_vec[9:2]),
    .sel(in_vec[1:0]),
    .data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h2455924a42648f1;
    stim[1] = 58'h04a441ae9fafc77;
    stim[2] = 58'h3bb89a4b693903d;
    stim[3] = 58'h37e4018822f200d;
    stim[4] = 58'h007293e489d2f4f;
    stim[5] = 58'h1c4816ea81a89f4;
    stim[6] = 58'h06598ab82abcce5;
    stim[7] = 58'h3b8c0699e5dce74;
    stim[8] = 58'h3ee17579014cb34;
    stim[9] = 58'h1a9ace76e87ec8c;
    stim[10] = 58'h001194622dff3eb;
    stim[11] = 58'h2c825a88dab6841;
    stim[12] = 58'h0772da7d3ac6528;
    stim[13] = 58'h1a4f741620102e9;
    stim[14] = 58'h0ea2fbfd2764583;
    stim[15] = 58'h228c566fb41200b;
    stim[16] = 58'h3101b8e8249d20e;
    stim[17] = 58'h0366621d709e0ee;
    stim[18] = 58'h2a429baa2fc4f51;
    stim[19] = 58'h302fdeb7455cdcf;
    stim[20] = 58'h3903c87c4c77f03;
    stim[21] = 58'h3d255a410677234;
    stim[22] = 58'h1acc448391edd50;
    stim[23] = 58'h1673f9a10a2abdc;
    stim[24] = 58'h05428fa269ef7b9;
    stim[25] = 58'h00d7d412f5d03c2;
    stim[26] = 58'h2d9e4eed3f3c4b7;
    stim[27] = 58'h271c5c002c0ea0d;
    stim[28] = 58'h1e319016aa526b8;
    stim[29] = 58'h1f421c37eb2abd3;
    stim[30] = 58'h3051aff261406c4;
    stim[31] = 58'h32a711e8965ecad;
    stim[32] = 58'h323d7e1ad526002;
    stim[33] = 58'h24d14c1cc57a519;
    stim[34] = 58'h268d18187ad9023;
    stim[35] = 58'h071e1b7a0993400;
    stim[36] = 58'h1e747aa89e29f02;
    stim[37] = 58'h2f801c3bd85677d;
    stim[38] = 58'h02ea5bd8ae0ef53;
    stim[39] = 58'h0b2a61f1afa9e61;
    stim[40] = 58'h3fe04baf510e408;
    stim[41] = 58'h1724bec23714796;
    stim[42] = 58'h1276cfce1791ce8;
    stim[43] = 58'h3c45cbf3dd5c725;
    stim[44] = 58'h021edf74043612f;
    stim[45] = 58'h29729e709cea5f6;
    stim[46] = 58'h32412892053e1b6;
    stim[47] = 58'h0fca2eea76b237f;
    stim[48] = 58'h34d6d3a7adb2052;
    stim[49] = 58'h0f83006460fbe60;
    stim[50] = 58'h0183bf7b85250de;
    stim[51] = 58'h0b982ebe65ed8ef;
    stim[52] = 58'h166936a4053dbea;
    stim[53] = 58'h3baae452a28ac33;
    stim[54] = 58'h304206644e14c94;
    stim[55] = 58'h24b9262314fcb52;
    stim[56] = 58'h28f73f65aa76d0e;
    stim[57] = 58'h0cd37b77ddf23ed;
    stim[58] = 58'h18ecd94c186c3d4;
    stim[59] = 58'h1f40076ba9b6c4d;
    stim[60] = 58'h14f30a83a280a38;
    stim[61] = 58'h107675b7478b875;
    stim[62] = 58'h3235cd0ca285323;
    stim[63] = 58'h113bcbabdd93d17;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'h4929;
      expv[1] = 16'h001d;
      expv[2] = 16'h692d;
      expv[3] = 16'h0620;
      expv[4] = 16'h00d3;
      expv[5] = 16'h7120;
      expv[6] = 16'h2ae0;
      expv[7] = 16'hee30;
      expv[8] = 16'hfb85;
      expv[9] = 16'h6a6b;
      expv[10] = 16'h00fa;
      expv[11] = 16'h6a23;
      expv[12] = 16'h1dcb;
      expv[13] = 16'hd058;
      expv[14] = 16'h0060;
      expv[15] = 16'h0002;
      expv[16] = 16'h9274;
      expv[17] = 16'hc278;
      expv[18] = 16'h6ea8;
      expv[19] = 16'h0073;
      expv[20] = 16'h00c0;
      expv[21] = 16'hf495;
      expv[22] = 16'h6b31;
      expv[23] = 16'h59cf;
      expv[24] = 16'h3e89;
      expv[25] = 16'hd740;
      expv[26] = 16'h002d;
      expv[27] = 16'h7000;
      expv[28] = 16'h78c6;
      expv[29] = 16'h00f4;
      expv[30] = 16'hc146;
      expv[31] = 16'h47a2;
      expv[32] = 16'h5498;
      expv[33] = 16'h3073;
      expv[34] = 16'h0008;
      expv[35] = 16'h1c78;
      expv[36] = 16'h78a7;
      expv[37] = 16'h70ef;
      expv[38] = 16'h00d4;
      expv[39] = 16'h87c6;
      expv[40] = 16'hff81;
      expv[41] = 16'hdc51;
      expv[42] = 16'h49db;
      expv[43] = 16'h2fcf;
      expv[44] = 16'h004b;
      expv[45] = 16'h73a9;
      expv[46] = 16'h14f8;
      expv[47] = 16'h00df;
      expv[48] = 16'hb6c8;
      expv[49] = 16'h3e0c;
      expv[50] = 16'h1494;
      expv[51] = 16'h003b;
      expv[52] = 16'h14f6;
      expv[53] = 16'h000c;
      expv[54] = 16'hc108;
      expv[55] = 16'h53f2;
      expv[56] = 16'ha9db;
      expv[57] = 16'heddf;
      expv[58] = 16'h63b3;
      expv[59] = 16'h1dae;
      expv[60] = 16'h53cc;
      expv[61] = 16'hd6dd;
      expv[62] = 16'h00c8;
      expv[63] = 16'h0045;
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
