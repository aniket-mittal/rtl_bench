// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079769 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha7a3793e;
    stim[1] = 32'hd5484c7c;
    stim[2] = 32'h290bbfb1;
    stim[3] = 32'h6c73da62;
    stim[4] = 32'h7871eb00;
    stim[5] = 32'h95de7783;
    stim[6] = 32'had4af0aa;
    stim[7] = 32'hb257ec3b;
    stim[8] = 32'hf1016897;
    stim[9] = 32'he407d0dd;
    stim[10] = 32'hbb81cfdc;
    stim[11] = 32'h451629e7;
    stim[12] = 32'h6a68851e;
    stim[13] = 32'h3baec97a;
    stim[14] = 32'hc6ee8272;
    stim[15] = 32'h31d71e8c;
    stim[16] = 32'h7ed6c5bc;
    stim[17] = 32'h0110087d;
    stim[18] = 32'h2ef4466a;
    stim[19] = 32'h2e4eb30b;
    stim[20] = 32'h4cf0f37f;
    stim[21] = 32'hc34ef395;
    stim[22] = 32'h92f7c812;
    stim[23] = 32'h985b508c;
    stim[24] = 32'h40f49701;
    stim[25] = 32'h0f8d690c;
    stim[26] = 32'h8cf02f02;
    stim[27] = 32'h5ef6983c;
    stim[28] = 32'h2d0733d9;
    stim[29] = 32'hba1bc4ea;
    stim[30] = 32'h7640227e;
    stim[31] = 32'h0ce81082;
    stim[32] = 32'hc394332f;
    stim[33] = 32'h58da41b0;
    stim[34] = 32'hee550cd9;
    stim[35] = 32'hf4918303;
    stim[36] = 32'he51b17d5;
    stim[37] = 32'h247a16e0;
    stim[38] = 32'ha1b157be;
    stim[39] = 32'he20656c3;
    stim[40] = 32'h53be4b41;
    stim[41] = 32'h63a5f721;
    stim[42] = 32'h7aa901cd;
    stim[43] = 32'h350490a4;
    stim[44] = 32'hcaa88bb9;
    stim[45] = 32'heaf15731;
    stim[46] = 32'h96bbbc15;
    stim[47] = 32'h01c6f48c;
    stim[48] = 32'h0b7777a4;
    stim[49] = 32'h156a3431;
    stim[50] = 32'h69fb900a;
    stim[51] = 32'h422d147e;
    stim[52] = 32'hd675c500;
    stim[53] = 32'hf10fba88;
    stim[54] = 32'h3f6dc4a2;
    stim[55] = 32'h4dbae477;
    stim[56] = 32'h31117236;
    stim[57] = 32'hb01cf2c8;
    stim[58] = 32'hf1faf802;
    stim[59] = 32'he3d57ea5;
    stim[60] = 32'h7f900022;
    stim[61] = 32'h60209c98;
    stim[62] = 32'h23628029;
    stim[63] = 32'h3872c204;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h2;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h2;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h2;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h2;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h2;
      expv[47] = 3'h0;
      expv[48] = 3'h2;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h2;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h2;
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
