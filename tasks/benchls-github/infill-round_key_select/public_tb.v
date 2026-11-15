// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  round_key_select dut (
    .in(in_vec[55:0]),
    .out(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h2f4e38a754e970;
    stim[1] = 56'hbf13b99b161a49;
    stim[2] = 56'hdc04fbfc3e3f94;
    stim[3] = 56'h0ffc250d3d0775;
    stim[4] = 56'he57bcb40c2174a;
    stim[5] = 56'h650999346ef8bc;
    stim[6] = 56'h67363d611de65c;
    stim[7] = 56'hdd3c5d03facaa2;
    stim[8] = 56'hb406cb0bd2d511;
    stim[9] = 56'hf3f9a2b92d2cc1;
    stim[10] = 56'h2e8bb6a6fba58d;
    stim[11] = 56'hd3f2c265380e2b;
    stim[12] = 56'h45b58aa7334684;
    stim[13] = 56'h573ede7b21a89f;
    stim[14] = 56'hbdb2c8c5cbf872;
    stim[15] = 56'h0e9d90574e9aa9;
    stim[16] = 56'h11ffde0b26003a;
    stim[17] = 56'h823e0e98edf72f;
    stim[18] = 56'hb55a5c7e187a48;
    stim[19] = 56'hf732be5c2b5a73;
    stim[20] = 56'h197e6c62ec13d1;
    stim[21] = 56'h2a3a2585aa07e6;
    stim[22] = 56'ha04ab747bc2925;
    stim[23] = 56'h0ddb9ea33b0b44;
    stim[24] = 56'h2cf0cbb7508a57;
    stim[25] = 56'h1a2bb0f1722ebc;
    stim[26] = 56'ha884a064478b27;
    stim[27] = 56'h0058a568571a0d;
    stim[28] = 56'hb23aa0266d7b01;
    stim[29] = 56'he1e0192479f32d;
    stim[30] = 56'ha53381681c1ac4;
    stim[31] = 56'hd4a5839d62a447;
    stim[32] = 56'h5e81ed551d07d8;
    stim[33] = 56'h555c63f97e2830;
    stim[34] = 56'h1d447fe3499791;
    stim[35] = 56'hf8d6aa7b6cf00b;
    stim[36] = 56'h784ec596a50274;
    stim[37] = 56'h45b3459e6836e2;
    stim[38] = 56'hdd9ce3248365ee;
    stim[39] = 56'h7a2b4f34942115;
    stim[40] = 56'h663082a9dc51f0;
    stim[41] = 56'h3d493168ba1996;
    stim[42] = 56'h35b220a9aa31e2;
    stim[43] = 56'hd128dc01e9f444;
    stim[44] = 56'h0e0942137cb414;
    stim[45] = 56'h80b757491cc1f3;
    stim[46] = 56'h9c4d6bb1017ad2;
    stim[47] = 56'h6df56767539239;
    stim[48] = 56'hac26efec753e46;
    stim[49] = 56'h98966b7994049d;
    stim[50] = 56'hf98fad4bfd076a;
    stim[51] = 56'h4a1aa28749b742;
    stim[52] = 56'h76816313e61aa3;
    stim[53] = 56'h3619f5fbdd4501;
    stim[54] = 56'h78b47d4282a7a3;
    stim[55] = 56'hc14dfd3a371d18;
    stim[56] = 56'h057798186c3c71;
    stim[57] = 56'h12e164427df93a;
    stim[58] = 56'hf1be164b3a3ba3;
    stim[59] = 56'h53d97890cf5e87;
    stim[60] = 56'hd3745b16d64ba5;
    stim[61] = 56'hf7a6af7bd1e139;
    stim[62] = 56'he23f18fae62723;
    stim[63] = 56'hc92b9a45df877d;
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
      expv[0] = 48'h86f45ee2d09d;
      expv[1] = 48'h5fe774284b4f;
      expv[2] = 48'hdd6d8d5a5e26;
      expv[3] = 48'hb456525b912f;
      expv[4] = 48'h7afae30c3ae8;
      expv[5] = 48'h53606fd2ced0;
      expv[6] = 48'hb2e6ddd9007d;
      expv[7] = 48'hbc6347bce695;
      expv[8] = 48'hdae900e03bb7;
      expv[9] = 48'h6b1f7b11452b;
      expv[10] = 48'h46cc3eb337e4;
      expv[11] = 48'h689bd91ec165;
      expv[12] = 48'he06a692b0635;
      expv[13] = 48'he1ebdfe54543;
      expv[14] = 48'h6ee3c0d7ea99;
      expv[15] = 48'hc542b6bacfc1;
      expv[16] = 48'he0bb66648243;
      expv[17] = 48'ha9aa129db9f2;
      expv[18] = 48'h0bf3ce3a485e;
      expv[19] = 48'h6befd55fcb1a;
      expv[20] = 48'ha4b7ca783d88;
      expv[21] = 48'h3686121eb629;
      expv[22] = 48'h5a9c8632f105;
      expv[23] = 48'h44fa6e39520d;
      expv[24] = 48'h777a08ee418d;
      expv[25] = 48'h6585be48c6e5;
      expv[26] = 48'hce04888fd380;
      expv[27] = 48'h50168a094bc6;
      expv[28] = 48'h6a871a3b5990;
      expv[29] = 48'h3a304d9b99d4;
      expv[30] = 48'h7ac2e8184c0e;
      expv[31] = 48'hf949218603ab;
      expv[32] = 48'h5565b15b146d;
      expv[33] = 48'h915fcb50c287;
      expv[34] = 48'h947dccf91da1;
      expv[35] = 48'hcfbf89b409d3;
      expv[36] = 48'hd791036ba008;
      expv[37] = 48'h31c2613e8caa;
      expv[38] = 48'hdc4f4b07b678;
      expv[39] = 48'h37a93b423104;
      expv[40] = 48'h624a1950bc9f;
      expv[41] = 48'h1655ee547e06;
      expv[42] = 48'h22c74814be0b;
      expv[43] = 48'h6821479128b9;
      expv[44] = 48'h054832f008a5;
      expv[45] = 48'hb88aa4d4951f;
      expv[46] = 48'h9d7d2a4d4c19;
      expv[47] = 48'hb65ee9eb8bc5;
      expv[48] = 48'hfeec880f48ae;
      expv[49] = 48'h9daf88402567;
      expv[50] = 48'hdea5e33db0ef;
      expv[51] = 48'h448e13bf18a9;
      expv[52] = 48'h134d312cef81;
      expv[53] = 48'h5347be3131b7;
      expv[54] = 48'hb62785acb720;
      expv[55] = 48'hd9346f615a66;
      expv[56] = 48'he1f26450c9aa;
      expv[57] = 48'h2015b0f5d8d4;
      expv[58] = 48'haa8bc73cdf07;
      expv[59] = 48'h0137771d6fb0;
      expv[60] = 48'hb93b552af794;
      expv[61] = 48'hfbedd9e1b1d7;
      expv[62] = 48'haba2bf2cb3a2;
      expv[63] = 48'h6ca8e7dbb3ed;
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
