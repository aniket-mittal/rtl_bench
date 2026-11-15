// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123933 dut (
    .sys_clk_i(clk),
    .sys_reset_i(in_vec[11:11]),
    .d_i(in_vec[10:3]),
    .we_i(in_vec[2:2]),
    .wp_inc_i(in_vec[1:1]),
    .rp_inc_i(in_vec[0:0]),
    .q_o(out_vec[9:2]),
    .full_o(out_vec[1:1]),
    .empty_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb01;
    stim[1] = 12'hc93;
    stim[2] = 12'h068;
    stim[3] = 12'h01a;
    stim[4] = 12'h449;
    stim[5] = 12'h470;
    stim[6] = 12'h343;
    stim[7] = 12'h3b1;
    stim[8] = 12'h70f;
    stim[9] = 12'h780;
    stim[10] = 12'h360;
    stim[11] = 12'h22a;
    stim[12] = 12'h14f;
    stim[13] = 12'h773;
    stim[14] = 12'h4a7;
    stim[15] = 12'h061;
    stim[16] = 12'h6a6;
    stim[17] = 12'h3cf;
    stim[18] = 12'h6ed;
    stim[19] = 12'h225;
    stim[20] = 12'h1d0;
    stim[21] = 12'h41a;
    stim[22] = 12'h171;
    stim[23] = 12'h278;
    stim[24] = 12'h6fc;
    stim[25] = 12'h4c1;
    stim[26] = 12'h291;
    stim[27] = 12'h351;
    stim[28] = 12'h41a;
    stim[29] = 12'h16a;
    stim[30] = 12'h69d;
    stim[31] = 12'h1f1;
    stim[32] = 12'h452;
    stim[33] = 12'h1dd;
    stim[34] = 12'h5d1;
    stim[35] = 12'h6ef;
    stim[36] = 12'h760;
    stim[37] = 12'h44e;
    stim[38] = 12'h26b;
    stim[39] = 12'h700;
    stim[40] = 12'h24d;
    stim[41] = 12'h5ec;
    stim[42] = 12'h4aa;
    stim[43] = 12'h108;
    stim[44] = 12'h7d0;
    stim[45] = 12'h73f;
    stim[46] = 12'h0ee;
    stim[47] = 12'h21c;
    stim[48] = 12'h102;
    stim[49] = 12'h78b;
    stim[50] = 12'ha2f;
    stim[51] = 12'h51c;
    stim[52] = 12'h11b;
    stim[53] = 12'h4b3;
    stim[54] = 12'h3eb;
    stim[55] = 12'h171;
    stim[56] = 12'h424;
    stim[57] = 12'h744;
    stim[58] = 12'h71c;
    stim[59] = 12'h75c;
    stim[60] = 12'h344;
    stim[61] = 12'h6ed;
    stim[62] = 12'h656;
    stim[63] = 12'h177;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'h384;
      expv[11] = 10'h384;
      expv[12] = 10'h384;
      expv[13] = 10'h384;
      expv[14] = 10'hxxx;
      expv[15] = 10'h0a4;
      expv[16] = 10'hxxx;
      expv[17] = 10'h250;
      expv[18] = 10'h250;
      expv[19] = 10'h350;
      expv[20] = 10'h1e4;
      expv[21] = 10'h374;
      expv[22] = 10'h374;
      expv[23] = 10'h374;
      expv[24] = 10'h110;
      expv[25] = 10'h110;
      expv[26] = 10'h110;
      expv[27] = 10'hxxx;
      expv[28] = 10'h37c;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'h250;
      expv[33] = 10'h34c;
      expv[34] = 10'h34c;
      expv[35] = 10'h1e4;
      expv[36] = 10'h0ec;
      expv[37] = 10'h374;
      expv[38] = 10'h374;
      expv[39] = 10'h374;
      expv[40] = 10'h224;
      expv[41] = 10'h224;
      expv[42] = 10'h37c;
      expv[43] = 10'h37c;
      expv[44] = 10'h37c;
      expv[45] = 10'h37c;
      expv[46] = 10'h37c;
      expv[47] = 10'h124;
      expv[48] = 10'h126;
      expv[49] = 10'h126;
      expv[50] = 10'h125;
      expv[51] = 10'h125;
      expv[52] = 10'h124;
      expv[53] = 10'h28c;
      expv[54] = 10'h074;
      expv[55] = 10'h10c;
      expv[56] = 10'h224;
      expv[57] = 10'h37c;
      expv[58] = 10'h210;
      expv[59] = 10'h210;
      expv[60] = 10'h210;
      expv[61] = 10'h212;
      expv[62] = 10'h210;
      expv[63] = 10'h3a2;
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
