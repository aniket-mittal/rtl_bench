// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05684 dut (
    .clk(clk),
    .hpix(in_vec[18:18]),
    .vpix(in_vec[17:17]),
    .hblank(in_vec[16:16]),
    .vblank(in_vec[15:15]),
    .pixels(in_vec[14:11]),
    .border(in_vec[10:7]),
    .atm_palwr(in_vec[6:6]),
    .atm_paldata(in_vec[5:0]),
    .palcolor(out_vec[11:6]),
    .color(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h397d1;
    stim[1] = 19'h09bef;
    stim[2] = 19'h26fd8;
    stim[3] = 19'h1e600;
    stim[4] = 19'h67814;
    stim[5] = 19'h11848;
    stim[6] = 19'h64e38;
    stim[7] = 19'h08027;
    stim[8] = 19'h17ee6;
    stim[9] = 19'h48a7f;
    stim[10] = 19'h769c1;
    stim[11] = 19'h04579;
    stim[12] = 19'h3c2bb;
    stim[13] = 19'h07253;
    stim[14] = 19'h19d84;
    stim[15] = 19'h7c5aa;
    stim[16] = 19'h5184b;
    stim[17] = 19'h35419;
    stim[18] = 19'h2b28f;
    stim[19] = 19'h6d9c2;
    stim[20] = 19'h14e14;
    stim[21] = 19'h31076;
    stim[22] = 19'h12cb7;
    stim[23] = 19'h2e9a6;
    stim[24] = 19'h7836a;
    stim[25] = 19'h457c7;
    stim[26] = 19'h2c4fd;
    stim[27] = 19'h698a8;
    stim[28] = 19'h1a05f;
    stim[29] = 19'h52517;
    stim[30] = 19'h54024;
    stim[31] = 19'h48c8b;
    stim[32] = 19'h28c2c;
    stim[33] = 19'h4137e;
    stim[34] = 19'h12816;
    stim[35] = 19'h0f0b1;
    stim[36] = 19'h15b0a;
    stim[37] = 19'h2d054;
    stim[38] = 19'h0e32d;
    stim[39] = 19'h369f3;
    stim[40] = 19'h51dfc;
    stim[41] = 19'h303a0;
    stim[42] = 19'h0c8fd;
    stim[43] = 19'h1d4ca;
    stim[44] = 19'h54dae;
    stim[45] = 19'h3dd69;
    stim[46] = 19'h5df2f;
    stim[47] = 19'h7d904;
    stim[48] = 19'h3488d;
    stim[49] = 19'h21b36;
    stim[50] = 19'h06b0f;
    stim[51] = 19'h07db7;
    stim[52] = 19'h316b5;
    stim[53] = 19'h2ce37;
    stim[54] = 19'h493b6;
    stim[55] = 19'h37fee;
    stim[56] = 19'h19782;
    stim[57] = 19'h6154f;
    stim[58] = 19'h478ea;
    stim[59] = 19'h0a0a5;
    stim[60] = 19'h4b5ed;
    stim[61] = 19'h2396d;
    stim[62] = 19'h095e9;
    stim[63] = 19'h12cd2;
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
      expv[0] = 12'hxx0;
      expv[1] = 12'hxx0;
      expv[2] = 12'hxxx;
      expv[3] = 12'h440;
      expv[4] = 12'hxxx;
      expv[5] = 12'h600;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxx0;
      expv[8] = 12'h200;
      expv[9] = 12'hxx0;
      expv[10] = 12'hxx0;
      expv[11] = 12'h9a6;
      expv[12] = 12'hxx0;
      expv[13] = 12'hxxx;
      expv[14] = 12'hfc0;
      expv[15] = 12'hxx0;
      expv[16] = 12'hxx0;
      expv[17] = 12'h200;
      expv[18] = 12'hxx0;
      expv[19] = 12'hxx0;
      expv[20] = 12'hxx0;
      expv[21] = 12'hxx0;
      expv[22] = 12'h2c0;
      expv[23] = 12'hxx0;
      expv[24] = 12'hxx0;
      expv[25] = 12'hdb6;
      expv[26] = 12'h600;
      expv[27] = 12'hxx0;
      expv[28] = 12'hxx0;
      expv[29] = 12'ha80;
      expv[30] = 12'he40;
      expv[31] = 12'h7c0;
      expv[32] = 12'hf40;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxx0;
      expv[35] = 12'h7c0;
      expv[36] = 12'hxx0;
      expv[37] = 12'hf80;
      expv[38] = 12'h7c0;
      expv[39] = 12'hf80;
      expv[40] = 12'hxx0;
      expv[41] = 12'h080;
      expv[42] = 12'hbc0;
      expv[43] = 12'hxx0;
      expv[44] = 12'hf40;
      expv[45] = 12'hf00;
      expv[46] = 12'he40;
      expv[47] = 12'hxx0;
      expv[48] = 12'hf00;
      expv[49] = 12'hf7d;
      expv[50] = 12'hfbe;
      expv[51] = 12'hfbe;
      expv[52] = 12'hf00;
      expv[53] = 12'h040;
      expv[54] = 12'hxx0;
      expv[55] = 12'hbc0;
      expv[56] = 12'h1c0;
      expv[57] = 12'hbae;
      expv[58] = 12'hxxx;
      expv[59] = 12'hf40;
      expv[60] = 12'ha80;
      expv[61] = 12'hf3c;
      expv[62] = 12'h3c0;
      expv[63] = 12'hb40;
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
