// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04230 dut (
    .clk(clk),
    .A(in_vec[64:33]),
    .Amax(in_vec[32:1]),
    .CE(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h01897ac4b5266cb1c;
    stim[1] = 65'h088290f6ee4f7e405;
    stim[2] = 65'h15048ac8e5c6facc8;
    stim[3] = 65'h093738986b1459e31;
    stim[4] = 65'h05bc3a1a9d4d864ab;
    stim[5] = 65'h11b1ef2a2c4046f62;
    stim[6] = 65'h04714d5441fe25902;
    stim[7] = 65'h0f9ce741292041a70;
    stim[8] = 65'h0470364deff7721be;
    stim[9] = 65'h0f335a10df17daab3;
    stim[10] = 65'h196f5fbcebb357a6e;
    stim[11] = 65'h0f8b6b0afe2335822;
    stim[12] = 65'h1cc9ac05e603c8b28;
    stim[13] = 65'h181840ce3d38c00cb;
    stim[14] = 65'h196426ca460207e37;
    stim[15] = 65'h07e0e531fd05a9f53;
    stim[16] = 65'h0f0f9ab4044b9a98f;
    stim[17] = 65'h0fa2561b000667600;
    stim[18] = 65'h091950e06dfb9cf3f;
    stim[19] = 65'h0d67b8c19eca0862f;
    stim[20] = 65'h0f5ee5988991e6cb5;
    stim[21] = 65'h053dc55f3095f1679;
    stim[22] = 65'h164bd5e28d1cfa3af;
    stim[23] = 65'h00a3c5c9b8994611c;
    stim[24] = 65'h0d3b1dd73e9dbe08d;
    stim[25] = 65'h00a2327d9864b4ff5;
    stim[26] = 65'h03597e876a8d663f4;
    stim[27] = 65'h1c0949461d074241c;
    stim[28] = 65'h0e90f87ca22e6f5c0;
    stim[29] = 65'h18f69743e4a25373c;
    stim[30] = 65'h00e0924a6ae99f56d;
    stim[31] = 65'h188f0a0fb57807fc7;
    stim[32] = 65'h0b11d74d3ab2aafa0;
    stim[33] = 65'h0d07401d50bfd23e8;
    stim[34] = 65'h1ff20c3e30c3619cd;
    stim[35] = 65'h1fb9cf2fba65c9095;
    stim[36] = 65'h1b128dbed3762e29b;
    stim[37] = 65'h1a70c3dfdb6443b7b;
    stim[38] = 65'h106c73a9955633b92;
    stim[39] = 65'h1a4e310c76a8fd942;
    stim[40] = 65'h1b0c2c49a80d698aa;
    stim[41] = 65'h19698dad9fa69ea1b;
    stim[42] = 65'h0e8b9cc62c9bb0463;
    stim[43] = 65'h037e7406d7aecd47a;
    stim[44] = 65'h1862c32e840730c8c;
    stim[45] = 65'h1393ad3e8cf102dde;
    stim[46] = 65'h1325ce1292f4cc4af;
    stim[47] = 65'h18388a2c45090397d;
    stim[48] = 65'h0f008431dfc4fe3c2;
    stim[49] = 65'h149e4139fd6202451;
    stim[50] = 65'h1fe82f913f1bc4e41;
    stim[51] = 65'h1eac12052169ecaf0;
    stim[52] = 65'h17f33c70db22f982c;
    stim[53] = 65'h0d8ebd94c1d50fbaa;
    stim[54] = 65'h058dae7af62c0d1cd;
    stim[55] = 65'h122015b311af966b2;
    stim[56] = 65'h0d89c82e81a2cc0be;
    stim[57] = 65'h0cc511330bb73c4ad;
    stim[58] = 65'h1873a14da4caaa983;
    stim[59] = 65'h1c2ee898b2744e25c;
    stim[60] = 65'h034192bfc27494ae4;
    stim[61] = 65'h1e42c2c068650edc8;
    stim[62] = 65'h06111d5e06b6ac08a;
    stim[63] = 65'h0b2139af66f345c6e;
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
      expv[4] = 32'h0c4bd624;
      expv[5] = 32'h441487b6;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h238a6aa1;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'hcb7afde6;
      expv[15] = 32'h7c5b5856;
      expv[16] = 32'he64d602e;
      expv[17] = 32'hc0c20670;
      expv[18] = 32'h00000000;
      expv[19] = 32'h3f07298e;
      expv[20] = 32'h787cd59f;
      expv[21] = 32'h7d12b0d7;
      expv[22] = 32'h48ca8702;
      expv[23] = 32'h6b3dc60b;
      expv[24] = 32'h00000000;
      expv[25] = 32'h29ee2af8;
      expv[26] = 32'hb25eaf13;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'he04a4a2f;
      expv[32] = 32'h7487c3e4;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'hc478507c;
      expv[36] = 32'h588eba68;
      expv[37] = 32'h683a00e9;
      expv[38] = 32'hff9061f0;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h83639d4b;
      expv[43] = 32'hd2718862;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h1bf3a035;
      expv[48] = 32'hc3161973;
      expv[49] = 32'h00000000;
      expv[50] = 32'h992e7093;
      expv[51] = 32'hc1c45161;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'hf5609028;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h2c6d73d6;
      expv[59] = 32'h9100ad97;
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
