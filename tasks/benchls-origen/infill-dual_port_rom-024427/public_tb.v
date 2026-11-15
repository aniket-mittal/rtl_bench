// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024427 dut (
    .clk(clk),
    .addr1(in_vec[5:3]),
    .addr2(in_vec[2:0]),
    .dout1(out_vec[127:64]),
    .dout2(out_vec[63:0])
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
    stim[1] = 6'h3b;
    stim[2] = 6'h09;
    stim[3] = 6'h24;
    stim[4] = 6'h01;
    stim[5] = 6'h34;
    stim[6] = 6'h16;
    stim[7] = 6'h39;
    stim[8] = 6'h17;
    stim[9] = 6'h32;
    stim[10] = 6'h03;
    stim[11] = 6'h11;
    stim[12] = 6'h36;
    stim[13] = 6'h27;
    stim[14] = 6'h1f;
    stim[15] = 6'h06;
    stim[16] = 6'h26;
    stim[17] = 6'h22;
    stim[18] = 6'h03;
    stim[19] = 6'h38;
    stim[20] = 6'h20;
    stim[21] = 6'h3d;
    stim[22] = 6'h33;
    stim[23] = 6'h26;
    stim[24] = 6'h04;
    stim[25] = 6'h2f;
    stim[26] = 6'h0f;
    stim[27] = 6'h30;
    stim[28] = 6'h27;
    stim[29] = 6'h14;
    stim[30] = 6'h36;
    stim[31] = 6'h28;
    stim[32] = 6'h1b;
    stim[33] = 6'h16;
    stim[34] = 6'h04;
    stim[35] = 6'h14;
    stim[36] = 6'h09;
    stim[37] = 6'h3b;
    stim[38] = 6'h3b;
    stim[39] = 6'h0d;
    stim[40] = 6'h09;
    stim[41] = 6'h05;
    stim[42] = 6'h20;
    stim[43] = 6'h18;
    stim[44] = 6'h22;
    stim[45] = 6'h1d;
    stim[46] = 6'h28;
    stim[47] = 6'h3c;
    stim[48] = 6'h22;
    stim[49] = 6'h39;
    stim[50] = 6'h06;
    stim[51] = 6'h24;
    stim[52] = 6'h25;
    stim[53] = 6'h3f;
    stim[54] = 6'h3a;
    stim[55] = 6'h1a;
    stim[56] = 6'h1f;
    stim[57] = 6'h36;
    stim[58] = 6'h24;
    stim[59] = 6'h09;
    stim[60] = 6'h32;
    stim[61] = 6'h17;
    stim[62] = 6'h2b;
    stim[63] = 6'h05;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'haaaaaaaa55555555f0f0f0f00f0f0f0f;
      expv[3] = 128'h00ffff0000ffff005555555aaaaaaaaa;
      expv[4] = 128'hfedcba9876543210fedcba9876543210;
      expv[5] = 128'hf0f0f0f00f0f0f0ff0f0f0f00f0f0f0f;
      expv[6] = 128'h0123456789abcdeffedcba9876543210;
      expv[7] = 128'hffff0000ffff0000f0f0f0f00f0f0f0f;
      expv[8] = 128'haaaaaaaa55555555ffff0000ffff0000;
      expv[9] = 128'h00ffff0000ffff00fedcba9876543210;
      expv[10] = 128'haaaaaaaa5555555500ffff0000ffff00;
      expv[11] = 128'hffff0000ffff0000aaaaaaaa55555555;
      expv[12] = 128'h0123456789abcdef5555555aaaaaaaaa;
      expv[13] = 128'haaaaaaaa55555555fedcba9876543210;
      expv[14] = 128'hffff0000ffff0000ffff0000ffff0000;
      expv[15] = 128'hf0f0f0f00f0f0f0f00ffff0000ffff00;
      expv[16] = 128'h5555555aaaaaaaaa00ffff0000ffff00;
      expv[17] = 128'h0123456789abcdefffff0000ffff0000;
      expv[18] = 128'hf0f0f0f00f0f0f0fffff0000ffff0000;
      expv[19] = 128'hf0f0f0f00f0f0f0faaaaaaaa55555555;
      expv[20] = 128'h0123456789abcdef5555555aaaaaaaaa;
      expv[21] = 128'h00ffff0000ffff000123456789abcdef;
      expv[22] = 128'hf0f0f0f00f0f0f0f0123456789abcdef;
      expv[23] = 128'h00ffff0000ffff000f0f0f0ff0f0f0f0;
      expv[24] = 128'hffff0000ffff00005555555aaaaaaaaa;
      expv[25] = 128'hf0f0f0f00f0f0f0fffff0000ffff0000;
      expv[26] = 128'h0123456789abcdeff0f0f0f00f0f0f0f;
      expv[27] = 128'h0f0f0f0ff0f0f0f000ffff0000ffff00;
      expv[28] = 128'hfedcba987654321000ffff0000ffff00;
      expv[29] = 128'hffff0000ffff00000123456789abcdef;
      expv[30] = 128'hf0f0f0f00f0f0f0f00ffff0000ffff00;
      expv[31] = 128'haaaaaaaa55555555f0f0f0f00f0f0f0f;
      expv[32] = 128'hffff0000ffff0000ffff0000ffff0000;
      expv[33] = 128'h0f0f0f0ff0f0f0f00123456789abcdef;
      expv[34] = 128'h5555555aaaaaaaaa5555555aaaaaaaaa;
      expv[35] = 128'haaaaaaaa55555555ffff0000ffff0000;
      expv[36] = 128'h0123456789abcdeff0f0f0f00f0f0f0f;
      expv[37] = 128'haaaaaaaa55555555f0f0f0f00f0f0f0f;
      expv[38] = 128'hfedcba9876543210fedcba9876543210;
      expv[39] = 128'h00ffff0000ffff005555555aaaaaaaaa;
      expv[40] = 128'h00ffff0000ffff005555555aaaaaaaaa;
      expv[41] = 128'hfedcba98765432100f0f0f0ff0f0f0f0;
      expv[42] = 128'hfedcba9876543210fedcba9876543210;
      expv[43] = 128'h0123456789abcdef0f0f0f0ff0f0f0f0;
      expv[44] = 128'hf0f0f0f00f0f0f0f0123456789abcdef;
      expv[45] = 128'h5555555aaaaaaaaa0123456789abcdef;
      expv[46] = 128'hf0f0f0f00f0f0f0faaaaaaaa55555555;
      expv[47] = 128'h5555555aaaaaaaaa0f0f0f0ff0f0f0f0;
      expv[48] = 128'h0f0f0f0ff0f0f0f00123456789abcdef;
      expv[49] = 128'h00ffff0000ffff00f0f0f0f00f0f0f0f;
      expv[50] = 128'hf0f0f0f00f0f0f0faaaaaaaa55555555;
      expv[51] = 128'h00ffff0000ffff00fedcba9876543210;
      expv[52] = 128'h0123456789abcdefffff0000ffff0000;
      expv[53] = 128'hf0f0f0f00f0f0f0ff0f0f0f00f0f0f0f;
      expv[54] = 128'hf0f0f0f00f0f0f0f0f0f0f0ff0f0f0f0;
      expv[55] = 128'h00ffff0000ffff0000ffff0000ffff00;
      expv[56] = 128'h00ffff0000ffff00aaaaaaaa55555555;
      expv[57] = 128'h5555555aaaaaaaaaaaaaaaaa55555555;
      expv[58] = 128'h5555555aaaaaaaaa00ffff0000ffff00;
      expv[59] = 128'hffff0000ffff0000ffff0000ffff0000;
      expv[60] = 128'hf0f0f0f00f0f0f0ff0f0f0f00f0f0f0f;
      expv[61] = 128'hfedcba9876543210fedcba9876543210;
      expv[62] = 128'hffff0000ffff0000aaaaaaaa55555555;
      expv[63] = 128'haaaaaaaa5555555500ffff0000ffff00;
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
