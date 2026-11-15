// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071564 dut (
    .clk(clk),
    .data_in(in_vec[63:0]),
    .data_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h88356b3906ce5b9d;
    stim[1] = 64'h96aec5cb6636c9d1;
    stim[2] = 64'h4e00fee14583752d;
    stim[3] = 64'h5d4cfcf22b3edc02;
    stim[4] = 64'h3006e2203e68ec16;
    stim[5] = 64'h43cbad7a810b3cd9;
    stim[6] = 64'hbdb03bfd3a998b8c;
    stim[7] = 64'h157503503c8179c5;
    stim[8] = 64'he881f78ca71c11fc;
    stim[9] = 64'h3327f48236c0922a;
    stim[10] = 64'h7dc537abbe559a48;
    stim[11] = 64'h48cb0ee08a0ebe28;
    stim[12] = 64'h7d93d5ace235cb3b;
    stim[13] = 64'h9acb35469eed3ad7;
    stim[14] = 64'hdcdcfc4762db6642;
    stim[15] = 64'hacd15deb4f43f9cd;
    stim[16] = 64'hd1394204d8d37f17;
    stim[17] = 64'h17bc9d197fd34322;
    stim[18] = 64'h313a0e63cc2e929a;
    stim[19] = 64'h4d13eb24a74f061e;
    stim[20] = 64'ha4fe5c3c94c6400f;
    stim[21] = 64'h581e8e51f30454a2;
    stim[22] = 64'habea471e76d8f6cb;
    stim[23] = 64'hd4a936107f799ba7;
    stim[24] = 64'h095a08b810c2ad80;
    stim[25] = 64'h3ad982e6d1ffc7cf;
    stim[26] = 64'hce0f255b7c0c7942;
    stim[27] = 64'hfd6e0f7de080c791;
    stim[28] = 64'h10bb28ccb869c2a6;
    stim[29] = 64'he83e2b0853e7ffe3;
    stim[30] = 64'h0cb98a5cb2b0b0ed;
    stim[31] = 64'hc865cb2bdfce9fa2;
    stim[32] = 64'h79003d76214a80fc;
    stim[33] = 64'he2942e404ec7e48b;
    stim[34] = 64'h05eb5697b8ba4eab;
    stim[35] = 64'hbdd643dc2e317ac4;
    stim[36] = 64'he3443ccbd1daf49c;
    stim[37] = 64'he2bf44248e7370a5;
    stim[38] = 64'hf1e89cbf80a521cd;
    stim[39] = 64'hda7512c8880c4a23;
    stim[40] = 64'hc5c3e6579ca6b58f;
    stim[41] = 64'hb7ac316e4d0b1809;
    stim[42] = 64'hf881d4edd58cd029;
    stim[43] = 64'hccfe7e35b6e941fb;
    stim[44] = 64'h22c2959c22a4b606;
    stim[45] = 64'h0aa326a8a32b6b5b;
    stim[46] = 64'hc7a94d2bacf7f453;
    stim[47] = 64'h157eae49c76c9dc1;
    stim[48] = 64'h25def7c7d7c5d905;
    stim[49] = 64'h622b1922a7c7bcdd;
    stim[50] = 64'h8198bd3fce8c1129;
    stim[51] = 64'ha557dbf78837b6f1;
    stim[52] = 64'h72e7b0ce91bc1c07;
    stim[53] = 64'h2b08e17e4ec92f85;
    stim[54] = 64'h5f50ba956cc1be87;
    stim[55] = 64'h99bd3ef03b5ed419;
    stim[56] = 64'hb2c1446cba64d284;
    stim[57] = 64'h26142cde89716d5f;
    stim[58] = 64'h0032c6a08c52b0cf;
    stim[59] = 64'h9fc9dfae2b1f80c6;
    stim[60] = 64'h21d8fce9303cb631;
    stim[61] = 64'h75ca207e71c28098;
    stim[62] = 64'h73d157a799e35e32;
    stim[63] = 64'hba918d511c76500c;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h88356b3906ce5b9d;
      expv[2] = 64'h96aec5cb6636c9d1;
      expv[3] = 64'h4e00fee14583752d;
      expv[4] = 64'h5d4cfcf22b3edc02;
      expv[5] = 64'h3006e2203e68ec16;
      expv[6] = 64'h43cbad7a810b3cd9;
      expv[7] = 64'hbdb03bfd3a998b8c;
      expv[8] = 64'h157503503c8179c5;
      expv[9] = 64'he881f78ca71c11fc;
      expv[10] = 64'h3327f48236c0922a;
      expv[11] = 64'h7dc537abbe559a48;
      expv[12] = 64'h48cb0ee08a0ebe28;
      expv[13] = 64'h7d93d5ace235cb3b;
      expv[14] = 64'h9acb35469eed3ad7;
      expv[15] = 64'hdcdcfc4762db6642;
      expv[16] = 64'hacd15deb4f43f9cd;
      expv[17] = 64'hd1394204d8d37f17;
      expv[18] = 64'h17bc9d197fd34322;
      expv[19] = 64'h313a0e63cc2e929a;
      expv[20] = 64'h4d13eb24a74f061e;
      expv[21] = 64'ha4fe5c3c94c6400f;
      expv[22] = 64'h581e8e51f30454a2;
      expv[23] = 64'habea471e76d8f6cb;
      expv[24] = 64'hd4a936107f799ba7;
      expv[25] = 64'h095a08b810c2ad80;
      expv[26] = 64'h3ad982e6d1ffc7cf;
      expv[27] = 64'hce0f255b7c0c7942;
      expv[28] = 64'hfd6e0f7de080c791;
      expv[29] = 64'h10bb28ccb869c2a6;
      expv[30] = 64'he83e2b0853e7ffe3;
      expv[31] = 64'h0cb98a5cb2b0b0ed;
      expv[32] = 64'hc865cb2bdfce9fa2;
      expv[33] = 64'h79003d76214a80fc;
      expv[34] = 64'he2942e404ec7e48b;
      expv[35] = 64'h05eb5697b8ba4eab;
      expv[36] = 64'hbdd643dc2e317ac4;
      expv[37] = 64'he3443ccbd1daf49c;
      expv[38] = 64'he2bf44248e7370a5;
      expv[39] = 64'hf1e89cbf80a521cd;
      expv[40] = 64'hda7512c8880c4a23;
      expv[41] = 64'hc5c3e6579ca6b58f;
      expv[42] = 64'hb7ac316e4d0b1809;
      expv[43] = 64'hf881d4edd58cd029;
      expv[44] = 64'hccfe7e35b6e941fb;
      expv[45] = 64'h22c2959c22a4b606;
      expv[46] = 64'h0aa326a8a32b6b5b;
      expv[47] = 64'hc7a94d2bacf7f453;
      expv[48] = 64'h157eae49c76c9dc1;
      expv[49] = 64'h25def7c7d7c5d905;
      expv[50] = 64'h622b1922a7c7bcdd;
      expv[51] = 64'h8198bd3fce8c1129;
      expv[52] = 64'ha557dbf78837b6f1;
      expv[53] = 64'h72e7b0ce91bc1c07;
      expv[54] = 64'h2b08e17e4ec92f85;
      expv[55] = 64'h5f50ba956cc1be87;
      expv[56] = 64'h99bd3ef03b5ed419;
      expv[57] = 64'hb2c1446cba64d284;
      expv[58] = 64'h26142cde89716d5f;
      expv[59] = 64'h0032c6a08c52b0cf;
      expv[60] = 64'h9fc9dfae2b1f80c6;
      expv[61] = 64'h21d8fce9303cb631;
      expv[62] = 64'h75ca207e71c28098;
      expv[63] = 64'h73d157a799e35e32;
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
