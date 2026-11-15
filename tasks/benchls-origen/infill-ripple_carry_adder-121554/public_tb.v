// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121554 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .s(out_vec[32:1]),
    .c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hb324fc956aee177f;
    stim[1] = 64'h324002406b7537eb;
    stim[2] = 64'hd539e4b8454a597c;
    stim[3] = 64'hec9aae897e93bd9c;
    stim[4] = 64'hd8cb14b33c194516;
    stim[5] = 64'hd2f890d4dfd45767;
    stim[6] = 64'hfaddd86b4e09f821;
    stim[7] = 64'h5cddb11b7c48821a;
    stim[8] = 64'h32d876554610b16f;
    stim[9] = 64'h37df107eaa7931aa;
    stim[10] = 64'h237a558ad172f759;
    stim[11] = 64'hec45de8e1e968245;
    stim[12] = 64'hd4ae0c377ec55013;
    stim[13] = 64'h13971919655a9d39;
    stim[14] = 64'h22ca6027578ee2a3;
    stim[15] = 64'h6008192650b40dca;
    stim[16] = 64'h94229cc644b9c2da;
    stim[17] = 64'hc6fbc955f150a9e4;
    stim[18] = 64'h3cb81041b8918b5c;
    stim[19] = 64'hc5464bfe61af135c;
    stim[20] = 64'h98e683e961d3c00c;
    stim[21] = 64'he35641024304e3a9;
    stim[22] = 64'hb0e74946cfa008a6;
    stim[23] = 64'h1287d814c7edadcb;
    stim[24] = 64'h371e3e385bbca021;
    stim[25] = 64'h773e9cf466e874bf;
    stim[26] = 64'h7bbe41ce64e23595;
    stim[27] = 64'h3592dc977d655b0e;
    stim[28] = 64'h235107589d87b527;
    stim[29] = 64'he51112e2f9a8379a;
    stim[30] = 64'hb8eaa2f92ad5029c;
    stim[31] = 64'hd08a9469b84df589;
    stim[32] = 64'h6d74154dec307571;
    stim[33] = 64'ha90ade6f8d724c18;
    stim[34] = 64'ha68b14e5db5e5500;
    stim[35] = 64'h7730d3d953f053ea;
    stim[36] = 64'heda7ff0b50fbf06b;
    stim[37] = 64'h1c0c8209c0a20cd8;
    stim[38] = 64'hacac8deb3c8b5216;
    stim[39] = 64'he82687dbb6bd8e3d;
    stim[40] = 64'h2c7fa0e80ef8787a;
    stim[41] = 64'hf7d85a2188ee1660;
    stim[42] = 64'h28d51f4669a0a66f;
    stim[43] = 64'h28b420036c95f0f5;
    stim[44] = 64'h134ca795ff704440;
    stim[45] = 64'h3ebafba884c2b408;
    stim[46] = 64'h0ca64cd57eea49f5;
    stim[47] = 64'h730b2473a056297a;
    stim[48] = 64'h5c9123cf65e720b5;
    stim[49] = 64'h170bc48eb2461e75;
    stim[50] = 64'h29fed9d0da6ddc5e;
    stim[51] = 64'h7af3061d4d135f47;
    stim[52] = 64'h62f84f1b6b2a0bb2;
    stim[53] = 64'h00b69de67829a373;
    stim[54] = 64'hc21a76944512e78e;
    stim[55] = 64'hf91c7aa1ed74716c;
    stim[56] = 64'ha93591c8ec35b2a5;
    stim[57] = 64'h080e0b8e8b6a4276;
    stim[58] = 64'hd6adf862db65fc42;
    stim[59] = 64'h62074710d1aad318;
    stim[60] = 64'hede300c0fe2cffb2;
    stim[61] = 64'ha63bbae41111961d;
    stim[62] = 64'h196bc76b0d60e0fc;
    stim[63] = 64'h5f09a86433ce3878;
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
      expv[0] = 33'h03c262829;
      expv[1] = 33'h13b6a7456;
      expv[2] = 33'h035087c69;
      expv[3] = 33'h0d65cd84b;
      expv[4] = 33'h029c8b393;
      expv[5] = 33'h16599d077;
      expv[6] = 33'h091cfa119;
      expv[7] = 33'h1b24c666a;
      expv[8] = 33'h0f1d24f88;
      expv[9] = 33'h1c4b08450;
      expv[10] = 33'h1e9da99c6;
      expv[11] = 33'h015b8c1a7;
      expv[12] = 33'h0a6e6b895;
      expv[13] = 33'h0f1e36ca4;
      expv[14] = 33'h0f4b28594;
      expv[15] = 33'h161784de0;
      expv[16] = 33'h1b1b8bf40;
      expv[17] = 33'h17098e673;
      expv[18] = 33'h1ea93373a;
      expv[19] = 33'h04deabeb5;
      expv[20] = 33'h1f57487ea;
      expv[21] = 33'h04cb64957;
      expv[22] = 33'h1010ea3d9;
      expv[23] = 33'h1b4eb0bbe;
      expv[24] = 33'h125b5bcb2;
      expv[25] = 33'h1bc4e2366;
      expv[26] = 33'h1c140eec6;
      expv[27] = 33'h165f06f4a;
      expv[28] = 33'h181b178fe;
      expv[29] = 33'h1bd7294f9;
      expv[30] = 33'h1c77f4b2a;
      expv[31] = 33'h111b113e5;
      expv[32] = 33'h0b349157d;
      expv[33] = 33'h06cfa550f;
      expv[34] = 33'h103d2d3cb;
      expv[35] = 33'h196424f86;
      expv[36] = 33'h07d47deed;
      expv[37] = 33'h1b95d1dc2;
      expv[38] = 33'h1d26fc002;
      expv[39] = 33'h13dc82c31;
      expv[40] = 33'h076f032c4;
      expv[41] = 33'h1018ce103;
      expv[42] = 33'h124eb8b6a;
      expv[43] = 33'h12a9421f0;
      expv[44] = 33'h02579d7ab;
      expv[45] = 33'h186fb5f60;
      expv[46] = 33'h117212d94;
      expv[47] = 33'h026c29bdb;
      expv[48] = 33'h184f08908;
      expv[49] = 33'h192a3c606;
      expv[50] = 33'h008d96c5d;
      expv[51] = 33'h1900ccac8;
      expv[52] = 33'h19c44b59a;
      expv[53] = 33'h0f1c082b2;
      expv[54] = 33'h00e5abc45;
      expv[55] = 33'h1cd21d81b;
      expv[56] = 33'h12ad688db;
      expv[57] = 33'h126f09c08;
      expv[58] = 33'h16427e949;
      expv[59] = 33'h067643451;
      expv[60] = 33'h1d82000e5;
      expv[61] = 33'h16e9aa202;
      expv[62] = 33'h04d9950ce;
      expv[63] = 33'h125afc1b8;
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
