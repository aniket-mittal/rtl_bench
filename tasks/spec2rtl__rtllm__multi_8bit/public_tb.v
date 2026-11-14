// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  multi_8bit dut (
    .A(in_vec[15:8]),
    .B(in_vec[7:0]),
    .product(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h728b;
    stim[1] = 16'h556a;
    stim[2] = 16'hd0cc;
    stim[3] = 16'he534;
    stim[4] = 16'hea7d;
    stim[5] = 16'h0ecf;
    stim[6] = 16'h4e75;
    stim[7] = 16'h455d;
    stim[8] = 16'h6a5a;
    stim[9] = 16'hb3d3;
    stim[10] = 16'h9384;
    stim[11] = 16'hf43c;
    stim[12] = 16'hd8ec;
    stim[13] = 16'hf5ec;
    stim[14] = 16'h4966;
    stim[15] = 16'h129e;
    stim[16] = 16'h92c6;
    stim[17] = 16'h86d1;
    stim[18] = 16'h3b41;
    stim[19] = 16'ha155;
    stim[20] = 16'hf20e;
    stim[21] = 16'h5497;
    stim[22] = 16'h6be0;
    stim[23] = 16'h7b2a;
    stim[24] = 16'ha2e2;
    stim[25] = 16'hbde3;
    stim[26] = 16'h6616;
    stim[27] = 16'hd7a9;
    stim[28] = 16'h9da2;
    stim[29] = 16'hde99;
    stim[30] = 16'hbbd0;
    stim[31] = 16'h3f2e;
    stim[32] = 16'h5aa4;
    stim[33] = 16'hd392;
    stim[34] = 16'h3e7f;
    stim[35] = 16'h94fd;
    stim[36] = 16'h89fb;
    stim[37] = 16'h9166;
    stim[38] = 16'h5ac6;
    stim[39] = 16'hfcd7;
    stim[40] = 16'hb434;
    stim[41] = 16'he5f3;
    stim[42] = 16'h5fa1;
    stim[43] = 16'hab8b;
    stim[44] = 16'h0172;
    stim[45] = 16'he3c1;
    stim[46] = 16'h376a;
    stim[47] = 16'hc2b9;
    stim[48] = 16'h168a;
    stim[49] = 16'h1279;
    stim[50] = 16'hfda5;
    stim[51] = 16'h5837;
    stim[52] = 16'h0857;
    stim[53] = 16'h4c4e;
    stim[54] = 16'h536c;
    stim[55] = 16'hf427;
    stim[56] = 16'h0ea2;
    stim[57] = 16'hdc33;
    stim[58] = 16'h80dc;
    stim[59] = 16'h9f31;
    stim[60] = 16'h787f;
    stim[61] = 16'h0aac;
    stim[62] = 16'hb9b9;
    stim[63] = 16'hfe02;
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
      expv[0] = 16'h3de6;
      expv[1] = 16'h2332;
      expv[2] = 16'ha5c0;
      expv[3] = 16'h2e84;
      expv[4] = 16'h7242;
      expv[5] = 16'h0b52;
      expv[6] = 16'h23a6;
      expv[7] = 16'h1911;
      expv[8] = 16'h2544;
      expv[9] = 16'h9389;
      expv[10] = 16'h4bcc;
      expv[11] = 16'h3930;
      expv[12] = 16'hc720;
      expv[13] = 16'he1dc;
      expv[14] = 16'h1d16;
      expv[15] = 16'h0b1c;
      expv[16] = 16'h70ec;
      expv[17] = 16'h6d66;
      expv[18] = 16'h0efb;
      expv[19] = 16'h3575;
      expv[20] = 16'h0d3c;
      expv[21] = 16'h318c;
      expv[22] = 16'h5da0;
      expv[23] = 16'h142e;
      expv[24] = 16'h8f04;
      expv[25] = 16'ha797;
      expv[26] = 16'h08c4;
      expv[27] = 16'h8def;
      expv[28] = 16'h635a;
      expv[29] = 16'h84ae;
      expv[30] = 16'h97f0;
      expv[31] = 16'h0b52;
      expv[32] = 16'h39a8;
      expv[33] = 16'h7856;
      expv[34] = 16'h1ec2;
      expv[35] = 16'h9244;
      expv[36] = 16'h8653;
      expv[37] = 16'h39c6;
      expv[38] = 16'h459c;
      expv[39] = 16'hd3a4;
      expv[40] = 16'h2490;
      expv[41] = 16'hd95f;
      expv[42] = 16'h3bbf;
      expv[43] = 16'h5cd9;
      expv[44] = 16'h0072;
      expv[45] = 16'hab23;
      expv[46] = 16'h16c6;
      expv[47] = 16'h8c32;
      expv[48] = 16'h0bdc;
      expv[49] = 16'h0882;
      expv[50] = 16'ha311;
      expv[51] = 16'h12e8;
      expv[52] = 16'h02b8;
      expv[53] = 16'h1728;
      expv[54] = 16'h2304;
      expv[55] = 16'h252c;
      expv[56] = 16'h08dc;
      expv[57] = 16'h2bd4;
      expv[58] = 16'h6e00;
      expv[59] = 16'h1e6f;
      expv[60] = 16'h3b88;
      expv[61] = 16'h06b8;
      expv[62] = 16'h85b1;
      expv[63] = 16'h01fc;
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
