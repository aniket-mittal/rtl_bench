// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_132817 dut (
    .clk(clk),
    .rst(in_vec[96:96]),
    .plaintext(in_vec[95:64]),
    .e(in_vec[63:32]),
    .n(in_vec[31:0]),
    .ciphertext(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h137fbe94bd4f54d5be3cf7241;
    stim[1] = 97'h1c30c12a099eff5a347f1f45d;
    stim[2] = 97'h077eb5190e017b787025a1e3a;
    stim[3] = 97'h0c6e27b0cbd691844f4388d9e;
    stim[4] = 97'h03b0430600f9039607ba36dcb;
    stim[5] = 97'h0614287289b7963d5d2769424;
    stim[6] = 97'h0c464c7b573dae2cf30a6ee0f;
    stim[7] = 97'h0adf6a3ab4dba14d5d9aa59e4;
    stim[8] = 97'h08dc97a35763e5b3f42b2a2fa;
    stim[9] = 97'h0ad24c8ed7bcbe53307b129e4;
    stim[10] = 97'h065bde410dd44d2912b1f604f;
    stim[11] = 97'h09457bcf026e74d91797025d4;
    stim[12] = 97'h08aad5d3b0aa40caf0adb7e4a;
    stim[13] = 97'h080be3a8ff43779a78a0c8dc0;
    stim[14] = 97'h0e6ab9ba8273ad905d3c477e6;
    stim[15] = 97'h0de4060ebe5b53942c7d672cc;
    stim[16] = 97'h0284afd42ffdbea3cca9b31f9;
    stim[17] = 97'h0137b55d2930c46e7e5835f6e;
    stim[18] = 97'h0bb777263001e01d9883481f1;
    stim[19] = 97'h0ab57e0024eee8841ba922f89;
    stim[20] = 97'h02e6618e6174abf633ff3df01;
    stim[21] = 97'h0c8db042e9b6e180514d92956;
    stim[22] = 97'h001d65391e73770b73b23ec4b;
    stim[23] = 97'h0fe1ffa652315657cc66a95c4;
    stim[24] = 97'h0d800011e349ce2aa21b71c90;
    stim[25] = 97'h023a05a3adb0d77b5554614af;
    stim[26] = 97'h0ad3ece094d10306e8ab8a08c;
    stim[27] = 97'h01d1019bb3edfa960a28da1fb;
    stim[28] = 97'h011d74d7e68b9df8b6cdbbbed;
    stim[29] = 97'h0bc7d5e634a0d053f45fa78c9;
    stim[30] = 97'h06200dc01f5b62000450d8419;
    stim[31] = 97'h0c965a0425d48e548a3169404;
    stim[32] = 97'h023ccbe245f7da73a2a9d1c16;
    stim[33] = 97'h09713cf044ae2d37b84f57b87;
    stim[34] = 97'h028223790ebdd7e23d4bf0934;
    stim[35] = 97'h0da465f0a0b6feae52c62dee2;
    stim[36] = 97'h0aec747148346b1248388cd8e;
    stim[37] = 97'h08db425d5e0eea788e6620de6;
    stim[38] = 97'h0c490f2020697f7f5ef3431c8;
    stim[39] = 97'h0550989b60c52795aa2e19f8f;
    stim[40] = 97'h03a23f2207b908fbc7cb62be6;
    stim[41] = 97'h014014a1dc097ae5f1b00f80b;
    stim[42] = 97'h120ef2efd9b126ec22761cb92;
    stim[43] = 97'h028a9199cc5d59d6970275abc;
    stim[44] = 97'h0a1c0067934866a3deea51ed7;
    stim[45] = 97'h077fc9f88eb3c8bd2b099f791;
    stim[46] = 97'h028660aa6d9c83dff04842f10;
    stim[47] = 97'h0ca0d6f78c472416fe1c5eb53;
    stim[48] = 97'h05d0c5cfea6c67a5e94537bfb;
    stim[49] = 97'h0eab5a0e6c328d8e2b0376438;
    stim[50] = 97'h009a980da8746099eed54e649;
    stim[51] = 97'h0d53a6d510aed74d3f7344644;
    stim[52] = 97'h0725dfbbe3f0129098215b176;
    stim[53] = 97'h0cf2e37a20b2fa496357b1e5a;
    stim[54] = 97'h0d27a681c90953523338e1449;
    stim[55] = 97'h0f66f4e8cf5340957b3436255;
    stim[56] = 97'h0afb29dc2966bfafcd5fb113a;
    stim[57] = 97'h05218f96ffe43142818a04d72;
    stim[58] = 97'h0912c4cf4083d445e77500ab0;
    stim[59] = 97'h0e97f8b4a2db867695191ef39;
    stim[60] = 97'h078fb592814f043339f486298;
    stim[61] = 97'h0338073cbaebb48c159d8a2e8;
    stim[62] = 97'h05c83d2c1a6ca6a5eac8e8c20;
    stim[63] = 97'h043a5a1bb09ae532f990e23a5;
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
      expv[37] = 32'h308f46e8;
      expv[38] = 32'h00000000;
      expv[39] = 32'h308f46e8;
      expv[40] = 32'h00000000;
      expv[41] = 32'h308f46e8;
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
