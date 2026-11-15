// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099553 dut (
    .regwrite_WB(in_vec[15:15]),
    .wa_WB(in_vec[14:10]),
    .ra1_EX(in_vec[9:5]),
    .ra2_EX(in_vec[4:0]),
    .forwardA(out_vec[1:1]),
    .forwardB(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h3acc;
    stim[1] = 16'hc510;
    stim[2] = 16'hab6d;
    stim[3] = 16'h0af2;
    stim[4] = 16'h01f0;
    stim[5] = 16'h9648;
    stim[6] = 16'hc054;
    stim[7] = 16'h6284;
    stim[8] = 16'h3f15;
    stim[9] = 16'h8e70;
    stim[10] = 16'h3dde;
    stim[11] = 16'ha389;
    stim[12] = 16'h7158;
    stim[13] = 16'h0716;
    stim[14] = 16'h59ed;
    stim[15] = 16'h0dcf;
    stim[16] = 16'h9ec0;
    stim[17] = 16'h27c3;
    stim[18] = 16'had51;
    stim[19] = 16'hc229;
    stim[20] = 16'hb6fa;
    stim[21] = 16'ha5ad;
    stim[22] = 16'h20e6;
    stim[23] = 16'h6be2;
    stim[24] = 16'h4eb0;
    stim[25] = 16'h539f;
    stim[26] = 16'h1f15;
    stim[27] = 16'h2c1a;
    stim[28] = 16'h28a3;
    stim[29] = 16'hd8ab;
    stim[30] = 16'h87c0;
    stim[31] = 16'h31da;
    stim[32] = 16'h6e8c;
    stim[33] = 16'h9346;
    stim[34] = 16'h1cde;
    stim[35] = 16'h88dc;
    stim[36] = 16'h3f24;
    stim[37] = 16'h524d;
    stim[38] = 16'h4289;
    stim[39] = 16'hd14b;
    stim[40] = 16'hcd2a;
    stim[41] = 16'h1d66;
    stim[42] = 16'h607a;
    stim[43] = 16'hc4a3;
    stim[44] = 16'hc518;
    stim[45] = 16'h6dc6;
    stim[46] = 16'h847f;
    stim[47] = 16'h20e9;
    stim[48] = 16'h7cfb;
    stim[49] = 16'h05e7;
    stim[50] = 16'hce0b;
    stim[51] = 16'hc2aa;
    stim[52] = 16'h86d2;
    stim[53] = 16'hf48b;
    stim[54] = 16'hec74;
    stim[55] = 16'h5c10;
    stim[56] = 16'h96ed;
    stim[57] = 16'h7bce;
    stim[58] = 16'hd55b;
    stim[59] = 16'h0226;
    stim[60] = 16'h759c;
    stim[61] = 16'h00ce;
    stim[62] = 16'h2b7f;
    stim[63] = 16'h32bd;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
