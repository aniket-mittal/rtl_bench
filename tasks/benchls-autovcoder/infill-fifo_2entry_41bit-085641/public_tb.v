// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085641 dut (
    .clk(clk),
    .rd(in_vec[43:43]),
    .reset_n(in_vec[42:42]),
    .wr(in_vec[41:41]),
    .wr_data(in_vec[40:0]),
    .almost_empty(out_vec[44:44]),
    .almost_full(out_vec[43:43]),
    .empty(out_vec[42:42]),
    .full(out_vec[41:41]),
    .rd_data(out_vec[40:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h0e0cf717567;
    stim[1] = 44'ha0a7ed98edb;
    stim[2] = 44'h68837750ec3;
    stim[3] = 44'h7123736b020;
    stim[4] = 44'h6d1850666ab;
    stim[5] = 44'h6d49a8c9435;
    stim[6] = 44'h42a7d095d62;
    stim[7] = 44'h637327448e1;
    stim[8] = 44'h7c660fa4491;
    stim[9] = 44'h47fd5192e11;
    stim[10] = 44'h56850f8236f;
    stim[11] = 44'h413fca96ba6;
    stim[12] = 44'hee9275b85ca;
    stim[13] = 44'he5b3ef49cd6;
    stim[14] = 44'hda8a235b667;
    stim[15] = 44'he41e5ec69f3;
    stim[16] = 44'h51cc649d298;
    stim[17] = 44'h6ea244142e2;
    stim[18] = 44'hce7455a2d62;
    stim[19] = 44'hcfbc5524415;
    stim[20] = 44'hc28747107e1;
    stim[21] = 44'h659e16da27b;
    stim[22] = 44'he12248dd5b2;
    stim[23] = 44'h790a9eff5fc;
    stim[24] = 44'hfa9622ea389;
    stim[25] = 44'heca12ef48de;
    stim[26] = 44'h617454c9a5b;
    stim[27] = 44'h67bbf17b281;
    stim[28] = 44'hf0031579694;
    stim[29] = 44'h6d19cb398bf;
    stim[30] = 44'h464c2f98794;
    stim[31] = 44'h6c2463b7f3d;
    stim[32] = 44'h52a5dadc6cf;
    stim[33] = 44'h4af6c81a5a1;
    stim[34] = 44'hf7634f9f1ba;
    stim[35] = 44'h56e21ab34ab;
    stim[36] = 44'hd289aae2e3a;
    stim[37] = 44'h74695e30611;
    stim[38] = 44'h60e4390b366;
    stim[39] = 44'h613660bc625;
    stim[40] = 44'h619832df6fa;
    stim[41] = 44'hffedca4682e;
    stim[42] = 44'h44b05095cbe;
    stim[43] = 44'hebcef32f4a5;
    stim[44] = 44'h44242af805b;
    stim[45] = 44'h4055b588f3a;
    stim[46] = 44'hfb85639f277;
    stim[47] = 44'hea07fff3706;
    stim[48] = 44'hc46f543b48c;
    stim[49] = 44'h734dc0a6a96;
    stim[50] = 44'hc6426f1091d;
    stim[51] = 44'he9cf4efa06a;
    stim[52] = 44'he6bd32b64fb;
    stim[53] = 44'h7db85d6ba34;
    stim[54] = 44'h7875f4c1f10;
    stim[55] = 44'h65103c5d479;
    stim[56] = 44'hf6350dadb91;
    stim[57] = 44'h71bef12216d;
    stim[58] = 44'hd7d364770b8;
    stim[59] = 44'h7fd8b39defe;
    stim[60] = 44'h54fdc369e2b;
    stim[61] = 44'he1ed25271e4;
    stim[62] = 44'hf525309b85d;
    stim[63] = 44'hcc47bc5f641;
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
      expv[0] = 45'h1xxxxxxxxxxx;
      expv[1] = 45'h1xxxxxxxxxxx;
      expv[2] = 45'h140a7ed98edb;
      expv[3] = 45'h188837750ec3;
      expv[4] = 45'h0a8837750ec3;
      expv[5] = 45'h0a8837750ec3;
      expv[6] = 45'h0a8837750ec3;
      expv[7] = 45'h0a8837750ec3;
      expv[8] = 45'h0a8837750ec3;
      expv[9] = 45'h0a8837750ec3;
      expv[10] = 45'h0a8837750ec3;
      expv[11] = 45'h0a8837750ec3;
      expv[12] = 45'h0a8837750ec3;
      expv[13] = 45'h0b123736b020;
      expv[14] = 45'h0a8837750ec3;
      expv[15] = 45'h19123736b020;
      expv[16] = 45'h1841e5ec69f3;
      expv[17] = 45'h1841e5ec69f3;
      expv[18] = 45'h0a41e5ec69f3;
      expv[19] = 45'h18ea244142e2;
      expv[20] = 45'h1441e5ec69f3;
      expv[21] = 45'h1441e5ec69f3;
      expv[22] = 45'h1859e16da27b;
      expv[23] = 45'h1812248dd5b2;
      expv[24] = 45'h0a12248dd5b2;
      expv[25] = 45'h0b90a9eff5fc;
      expv[26] = 45'h0a12248dd5b2;
      expv[27] = 45'h0a12248dd5b2;
      expv[28] = 45'h0a12248dd5b2;
      expv[29] = 45'h0b90a9eff5fc;
      expv[30] = 45'h0b90a9eff5fc;
      expv[31] = 45'h0b90a9eff5fc;
      expv[32] = 45'h0b90a9eff5fc;
      expv[33] = 45'h0b90a9eff5fc;
      expv[34] = 45'h0b90a9eff5fc;
      expv[35] = 45'h0a12248dd5b2;
      expv[36] = 45'h0a12248dd5b2;
      expv[37] = 45'h1990a9eff5fc;
      expv[38] = 45'h0b90a9eff5fc;
      expv[39] = 45'h0b90a9eff5fc;
      expv[40] = 45'h0b90a9eff5fc;
      expv[41] = 45'h0b90a9eff5fc;
      expv[42] = 45'h0b4695e30611;
      expv[43] = 45'h0b4695e30611;
      expv[44] = 45'h0b90a9eff5fc;
      expv[45] = 45'h0b90a9eff5fc;
      expv[46] = 45'h0b90a9eff5fc;
      expv[47] = 45'h0b4695e30611;
      expv[48] = 45'h0b90a9eff5fc;
      expv[49] = 45'h194695e30611;
      expv[50] = 45'h0b4695e30611;
      expv[51] = 45'h1934dc0a6a96;
      expv[52] = 45'h189cf4efa06a;
      expv[53] = 45'h186bd32b64fb;
      expv[54] = 45'h0a6bd32b64fb;
      expv[55] = 45'h0a6bd32b64fb;
      expv[56] = 45'h0a6bd32b64fb;
      expv[57] = 45'h0bdb85d6ba34;
      expv[58] = 45'h0bdb85d6ba34;
      expv[59] = 45'h186bd32b64fb;
      expv[60] = 45'h0a6bd32b64fb;
      expv[61] = 45'h0a6bd32b64fb;
      expv[62] = 45'h0bfd8b39defe;
      expv[63] = 45'h0a6bd32b64fb;
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
