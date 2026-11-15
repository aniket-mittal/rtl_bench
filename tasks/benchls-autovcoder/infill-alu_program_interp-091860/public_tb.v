// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 142;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091860 dut (
    .clk(clk),
    .instruction(in_vec[141:96]),
    .x_coord(in_vec[95:64]),
    .y_coord(in_vec[63:32]),
    .f_number(in_vec[31:0]),
    .output_value(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 142'h16f7db8db5252d9981ca1a99652301387efd;
    stim[1] = 142'h198456ef55a0ce4572d98f5ba3ca6f0e66d2;
    stim[2] = 142'h39f7e3608975075ee28d399456f8b62c66e5;
    stim[3] = 142'h2115a6cc7b01d4d66f703acc468abef2bdf4;
    stim[4] = 142'h12bbfad9c81815f68fa74ada836271b61c0a;
    stim[5] = 142'h103cf4fc4fdf53b57afabb4d580a40c46f66;
    stim[6] = 142'h1073267dbad6c0ba8186114f522610094406;
    stim[7] = 142'h07b7dd53801be7f7307b024e85e053736ad5;
    stim[8] = 142'h379fe7847e83d19bf2d39b78763241eb8826;
    stim[9] = 142'h27d4d3c1acd4dac95ce96dcbf3ef88834251;
    stim[10] = 142'h1cb1e66426115365739fd28abfadf1b9a24b;
    stim[11] = 142'h14cc94109ab9ff4bcf2a341b5e169ada25fd;
    stim[12] = 142'h0308b264e72d5319cf93dc3d26d23e401b55;
    stim[13] = 142'h1a28347ec47c966093b2e72515201795f65c;
    stim[14] = 142'h36ad201fd021809dbb2942e0563a86071865;
    stim[15] = 142'h12369ddd0e1ba59ebe117a3db3edf29121e4;
    stim[16] = 142'h2e01c29f2e0f62e3ed5b195163eb4abbf696;
    stim[17] = 142'h330dce2ece5532f9e7d4fe9bdcf012d1001a;
    stim[18] = 142'h13defab3e7487506f9df79605209e40e4221;
    stim[19] = 142'h23913e68a6f6ad43806dbaacce938ac5b631;
    stim[20] = 142'h37cd6b122f9ac15f8c92bd6b6644f2499847;
    stim[21] = 142'h1d09b8a771a28de919893997d984b58f4154;
    stim[22] = 142'h2bb6b2f3a223e7f608d6761310412743cf0e;
    stim[23] = 142'h3edd22cc93f3af09a13a23d3fbe4cb6f4dc0;
    stim[24] = 142'h1bd7da67f19edf04e40ceb295359a42270fd;
    stim[25] = 142'h1aadd8d6253748437128dcb68caf2359ce65;
    stim[26] = 142'h2a954d16919453b64f9a3af3630694f08f86;
    stim[27] = 142'h38e0e5c1d219a0d486cd93fabb3c2739c98d;
    stim[28] = 142'h08a39d289392866995870a5b79ac0a9d0ecb;
    stim[29] = 142'h3418be6dacef12779816852a7ac0a18ee9e5;
    stim[30] = 142'h1e7760c7e2fb7fb520d3b13a30fa576c684a;
    stim[31] = 142'h0b8132f40d6fd82d0447e913fa6c6afcb6b0;
    stim[32] = 142'h0ceddc73f6a4ab9a0ec0ee71f12b034866ef;
    stim[33] = 142'h0ceb05ec3449b0cebe36f8d71fbc93ca5f58;
    stim[34] = 142'h2aea79e642dc004dce6e34dbc5f5f5216cec;
    stim[35] = 142'h05e8c44941f77c4501919782b70cb44a0e1c;
    stim[36] = 142'h2d1ca839e9f9e1041128bf78ac6663ad648f;
    stim[37] = 142'h06b279dece9a03d76c66f630732dc2b1c2b4;
    stim[38] = 142'h076dd4d129a402c88f35b25dac6eda8e7881;
    stim[39] = 142'h0853a2b19d9cd06dd0117b7354533c440364;
    stim[40] = 142'h0a8a313481ef5c8da6683f5d50450e967504;
    stim[41] = 142'h08c8c5d615a1687b90b362b8b3469db59202;
    stim[42] = 142'h2aebd1603ae6f5666f75413a0fbb3c13344a;
    stim[43] = 142'h0e3cddce70dcb837623859b51f1a175db709;
    stim[44] = 142'h12373315de2725018528dbc5bb9585575d16;
    stim[45] = 142'h15457c503c85ae3db4b28cef0294f9ca4666;
    stim[46] = 142'h3eba30a437af1c04a9e541fc1b5c7e367a9c;
    stim[47] = 142'h3fe90ad311d57f812f38faa053944cde191c;
    stim[48] = 142'h3836ffed6fe1c33fbcde6a46c1674ce419ae;
    stim[49] = 142'h21281f95dcbc182d17b22fb2b38b80997ee9;
    stim[50] = 142'h1bf4615e18097234130b2ad1585dce05df05;
    stim[51] = 142'h349c57f5561cad570628a2c986a6291b024b;
    stim[52] = 142'h3e86f9d82b37e1c8bc39bb24e0271a962d23;
    stim[53] = 142'h138686c59040c991d321024aeba2467151d4;
    stim[54] = 142'h24704468bee5f73ddb4b4e74b12c68b1a96b;
    stim[55] = 142'h37b55e33174db8d42dc7050dc6c412e4cad8;
    stim[56] = 142'h19a7cae0a6007b4ff4a08ac008e5f5c7376f;
    stim[57] = 142'h09208fce6a83aee5925ede76431a464591a3;
    stim[58] = 142'h25c36e0bf6372be6a3b7eab83fdecd58dffd;
    stim[59] = 142'h16de3593d7477b7a5831031cc284da3591db;
    stim[60] = 142'h174ce66817d36ab9fd5642b3b420ae0574e9;
    stim[61] = 142'h12e5549fd28b1a9c206f18f4933b70ef4269;
    stim[62] = 142'h3876b415fe1f86d906562b14dd81ff177ad7;
    stim[63] = 142'h2e6ed611228427e7909b69550f6268cf8190;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'h000;
      expv[48] = 12'hxxx;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h5e5;
      expv[54] = 12'h5e5;
      expv[55] = 12'h5e5;
      expv[56] = 12'h5e5;
      expv[57] = 12'h5e5;
      expv[58] = 12'h5e5;
      expv[59] = 12'h5e5;
      expv[60] = 12'h5e5;
      expv[61] = 12'h5e5;
      expv[62] = 12'h5e5;
      expv[63] = 12'h000;
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
