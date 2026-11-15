// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00543 dut (
    .ramp(in_vec[5:0]),
    .music_o(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h14;
    stim[1] = 6'h1b;
    stim[2] = 6'h29;
    stim[3] = 6'h15;
    stim[4] = 6'h0b;
    stim[5] = 6'h2b;
    stim[6] = 6'h29;
    stim[7] = 6'h13;
    stim[8] = 6'h2d;
    stim[9] = 6'h27;
    stim[10] = 6'h3d;
    stim[11] = 6'h37;
    stim[12] = 6'h07;
    stim[13] = 6'h23;
    stim[14] = 6'h3c;
    stim[15] = 6'h00;
    stim[16] = 6'h24;
    stim[17] = 6'h3b;
    stim[18] = 6'h01;
    stim[19] = 6'h1d;
    stim[20] = 6'h25;
    stim[21] = 6'h17;
    stim[22] = 6'h38;
    stim[23] = 6'h1b;
    stim[24] = 6'h14;
    stim[25] = 6'h2c;
    stim[26] = 6'h07;
    stim[27] = 6'h07;
    stim[28] = 6'h2f;
    stim[29] = 6'h2d;
    stim[30] = 6'h14;
    stim[31] = 6'h1f;
    stim[32] = 6'h26;
    stim[33] = 6'h3d;
    stim[34] = 6'h33;
    stim[35] = 6'h12;
    stim[36] = 6'h2e;
    stim[37] = 6'h09;
    stim[38] = 6'h07;
    stim[39] = 6'h18;
    stim[40] = 6'h16;
    stim[41] = 6'h1a;
    stim[42] = 6'h16;
    stim[43] = 6'h07;
    stim[44] = 6'h20;
    stim[45] = 6'h12;
    stim[46] = 6'h2a;
    stim[47] = 6'h10;
    stim[48] = 6'h39;
    stim[49] = 6'h21;
    stim[50] = 6'h14;
    stim[51] = 6'h38;
    stim[52] = 6'h16;
    stim[53] = 6'h15;
    stim[54] = 6'h14;
    stim[55] = 6'h24;
    stim[56] = 6'h2a;
    stim[57] = 6'h37;
    stim[58] = 6'h19;
    stim[59] = 6'h2f;
    stim[60] = 6'h24;
    stim[61] = 6'h0e;
    stim[62] = 6'h38;
    stim[63] = 6'h14;
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
      expv[0] = 16'h2316;
      expv[1] = 16'h1e4b;
      expv[2] = 16'h0d34;
      expv[3] = 16'h2825;
      expv[4] = 16'h0aa0;
      expv[5] = 16'hfcf5;
      expv[6] = 16'h0d34;
      expv[7] = 16'h19d4;
      expv[8] = 16'hf9b0;
      expv[9] = 16'h1b5d;
      expv[10] = 16'hf899;
      expv[11] = 16'he507;
      expv[12] = 16'h0c36;
      expv[13] = 16'h0f84;
      expv[14] = 16'hf2b2;
      expv[15] = 16'h0000;
      expv[16] = 16'h16d8;
      expv[17] = 16'hed46;
      expv[18] = 16'h0000;
      expv[19] = 16'h1e0a;
      expv[20] = 16'h1b1d;
      expv[21] = 16'h1d2e;
      expv[22] = 16'he4c4;
      expv[23] = 16'h1e4b;
      expv[24] = 16'h2316;
      expv[25] = 16'hfac0;
      expv[26] = 16'h0c36;
      expv[27] = 16'h0c36;
      expv[28] = 16'hf103;
      expv[29] = 16'hf9b0;
      expv[30] = 16'h2316;
      expv[31] = 16'h037f;
      expv[32] = 16'h1b6c;
      expv[33] = 16'hf899;
      expv[34] = 16'hd7d4;
      expv[35] = 16'h115a;
      expv[36] = 16'hf3fe;
      expv[37] = 16'h0c17;
      expv[38] = 16'h0c36;
      expv[39] = 16'h143b;
      expv[40] = 16'h24ba;
      expv[41] = 16'h1345;
      expv[42] = 16'h24ba;
      expv[43] = 16'h0c36;
      expv[44] = 16'h01e0;
      expv[45] = 16'h115a;
      expv[46] = 16'h033a;
      expv[47] = 16'h0789;
      expv[48] = 16'he68e;
      expv[49] = 16'h0560;
      expv[50] = 16'h2316;
      expv[51] = 16'he4c4;
      expv[52] = 16'h24ba;
      expv[53] = 16'h2825;
      expv[54] = 16'h2316;
      expv[55] = 16'h16d8;
      expv[56] = 16'h033a;
      expv[57] = 16'he507;
      expv[58] = 16'h0e10;
      expv[59] = 16'hf103;
      expv[60] = 16'h16d8;
      expv[61] = 16'h09e4;
      expv[62] = 16'he4c4;
      expv[63] = 16'h2316;
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
