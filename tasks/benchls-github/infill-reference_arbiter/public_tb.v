// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  reference_arbiter dut (
    .req(in_vec[19:4]),
    .base(in_vec[3:0]),
    .grant(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h4d566;
    stim[1] = 20'hf2cc7;
    stim[2] = 20'h7365c;
    stim[3] = 20'h9f199;
    stim[4] = 20'h6709e;
    stim[5] = 20'h4baa4;
    stim[6] = 20'h580c2;
    stim[7] = 20'h17198;
    stim[8] = 20'h1eff4;
    stim[9] = 20'h0288b;
    stim[10] = 20'h67a98;
    stim[11] = 20'hb9182;
    stim[12] = 20'h3afdb;
    stim[13] = 20'h9d993;
    stim[14] = 20'h4bd12;
    stim[15] = 20'h02985;
    stim[16] = 20'hafc44;
    stim[17] = 20'hfad4b;
    stim[18] = 20'h9051c;
    stim[19] = 20'h7fdc6;
    stim[20] = 20'h0ea03;
    stim[21] = 20'h882b2;
    stim[22] = 20'h5bc6e;
    stim[23] = 20'h40b99;
    stim[24] = 20'he9115;
    stim[25] = 20'h879a6;
    stim[26] = 20'he9bd7;
    stim[27] = 20'h8aa77;
    stim[28] = 20'h1ccf7;
    stim[29] = 20'h9ae14;
    stim[30] = 20'h30f6e;
    stim[31] = 20'hd32e4;
    stim[32] = 20'hf947f;
    stim[33] = 20'he94dd;
    stim[34] = 20'hd04b6;
    stim[35] = 20'h3ba35;
    stim[36] = 20'hc04ec;
    stim[37] = 20'h6c6bb;
    stim[38] = 20'hd0289;
    stim[39] = 20'h79f77;
    stim[40] = 20'h8cec4;
    stim[41] = 20'h0d5e9;
    stim[42] = 20'h178a1;
    stim[43] = 20'ha4827;
    stim[44] = 20'h5b98a;
    stim[45] = 20'h2987d;
    stim[46] = 20'h4d99e;
    stim[47] = 20'h49b29;
    stim[48] = 20'h1e2a0;
    stim[49] = 20'h88d5d;
    stim[50] = 20'hff2f1;
    stim[51] = 20'hf5a24;
    stim[52] = 20'h4eb3b;
    stim[53] = 20'h5062b;
    stim[54] = 20'h4d0c2;
    stim[55] = 20'h5f2c3;
    stim[56] = 20'h97dd3;
    stim[57] = 20'h4e5ce;
    stim[58] = 20'h2ab63;
    stim[59] = 20'h9f18b;
    stim[60] = 20'h98338;
    stim[61] = 20'h597b6;
    stim[62] = 20'h6bf27;
    stim[63] = 20'hfa8b0;
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
      expv[0] = 16'h0040;
      expv[1] = 16'h0080;
      expv[2] = 16'h1000;
      expv[3] = 16'h0200;
      expv[4] = 16'h4000;
      expv[5] = 16'h0020;
      expv[6] = 16'h0004;
      expv[7] = 16'h0100;
      expv[8] = 16'h0010;
      expv[9] = 16'h0008;
      expv[10] = 16'h0100;
      expv[11] = 16'h0008;
      expv[12] = 16'h0800;
      expv[13] = 16'h0008;
      expv[14] = 16'h0010;
      expv[15] = 16'h0080;
      expv[16] = 16'h0040;
      expv[17] = 16'h0800;
      expv[18] = 16'h1000;
      expv[19] = 16'h0040;
      expv[20] = 16'h0020;
      expv[21] = 16'h0008;
      expv[22] = 16'h4000;
      expv[23] = 16'h4000;
      expv[24] = 16'h0100;
      expv[25] = 16'h0080;
      expv[26] = 16'h0080;
      expv[27] = 16'h0080;
      expv[28] = 16'h0080;
      expv[29] = 16'h0020;
      expv[30] = 16'h0002;
      expv[31] = 16'h0020;
      expv[32] = 16'h8000;
      expv[33] = 16'h2000;
      expv[34] = 16'h0040;
      expv[35] = 16'h0020;
      expv[36] = 16'h4000;
      expv[37] = 16'h0800;
      expv[38] = 16'h1000;
      expv[39] = 16'h0080;
      expv[40] = 16'h0020;
      expv[41] = 16'h0400;
      expv[42] = 16'h0002;
      expv[43] = 16'h0080;
      expv[44] = 16'h0800;
      expv[45] = 16'h2000;
      expv[46] = 16'h4000;
      expv[47] = 16'h0800;
      expv[48] = 16'h0002;
      expv[49] = 16'h8000;
      expv[50] = 16'h0002;
      expv[51] = 16'h0020;
      expv[52] = 16'h0800;
      expv[53] = 16'h1000;
      expv[54] = 16'h0004;
      expv[55] = 16'h0008;
      expv[56] = 16'h0008;
      expv[57] = 16'h4000;
      expv[58] = 16'h0010;
      expv[59] = 16'h0800;
      expv[60] = 16'h0800;
      expv[61] = 16'h0040;
      expv[62] = 16'h0080;
      expv[63] = 16'h0001;
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
