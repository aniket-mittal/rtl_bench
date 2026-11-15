// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ImmGen dut (
    .ImmSel(in_vec[34:32]),
    .inst_field(in_vec[31:0]),
    .Imm_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h2be76bfc2;
    stim[1] = 35'h0f3e2b587;
    stim[2] = 35'h3066bd7dd;
    stim[3] = 35'h1eb067a5e;
    stim[4] = 35'h6948cc21f;
    stim[5] = 35'h781e2823e;
    stim[6] = 35'h0fcd4d707;
    stim[7] = 35'h462007bc0;
    stim[8] = 35'h1d723558b;
    stim[9] = 35'h7fcf77b23;
    stim[10] = 35'h5789d0832;
    stim[11] = 35'h2e5703f04;
    stim[12] = 35'h6e676348e;
    stim[13] = 35'h60385c014;
    stim[14] = 35'h454aad43b;
    stim[15] = 35'h6ad40299e;
    stim[16] = 35'h66f63191b;
    stim[17] = 35'h590c3b209;
    stim[18] = 35'h23058b80e;
    stim[19] = 35'h2cd3498cd;
    stim[20] = 35'h7f6a78af4;
    stim[21] = 35'h3e79b1351;
    stim[22] = 35'h260595224;
    stim[23] = 35'h4cbb18cb0;
    stim[24] = 35'h2c0f3ef28;
    stim[25] = 35'h1b026d689;
    stim[26] = 35'h4b565fb14;
    stim[27] = 35'h6b1c5d94f;
    stim[28] = 35'h7365a5c40;
    stim[29] = 35'h5c72d27ab;
    stim[30] = 35'h2dd548bd2;
    stim[31] = 35'h2c7677736;
    stim[32] = 35'h665815ddf;
    stim[33] = 35'h1ad9d6151;
    stim[34] = 35'h5ca19d7c5;
    stim[35] = 35'h4de9d09bf;
    stim[36] = 35'h1eb8ec250;
    stim[37] = 35'h3e834e761;
    stim[38] = 35'h7006f6b87;
    stim[39] = 35'h3fb4e8cee;
    stim[40] = 35'h3a24f383f;
    stim[41] = 35'h56ad1187a;
    stim[42] = 35'h0b18942f4;
    stim[43] = 35'h74b5235b0;
    stim[44] = 35'h0c5d3bdcb;
    stim[45] = 35'h1fdf13060;
    stim[46] = 35'h74f142f0c;
    stim[47] = 35'h3034cf7aa;
    stim[48] = 35'h7fe80161f;
    stim[49] = 35'h00a01cada;
    stim[50] = 35'h350903945;
    stim[51] = 35'h5bfe896aa;
    stim[52] = 35'h47d0441da;
    stim[53] = 35'h4566b3c52;
    stim[54] = 35'h4a11beb09;
    stim[55] = 35'h44de55c55;
    stim[56] = 35'h0b6363087;
    stim[57] = 35'h368faf0ea;
    stim[58] = 35'h5e21b6b4b;
    stim[59] = 35'h2d6d3caf3;
    stim[60] = 35'h715dd0963;
    stim[61] = 35'h101a85b47;
    stim[62] = 35'h7236d58af;
    stim[63] = 35'h54ffacebc;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
