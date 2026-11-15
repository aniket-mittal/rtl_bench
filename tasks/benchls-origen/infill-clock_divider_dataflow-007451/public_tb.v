// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007451 dut (
    .clock(clk),
    .extClock_mode(in_vec[58:58]),
    .config_data(in_vec[57:34]),
    .wrDivider(in_vec[33:33]),
    .dataIn(in_vec[32:1]),
    .validIn(in_vec[0:0]),
    .dataOut(out_vec[33:2]),
    .validOut(out_vec[1:1]),
    .ready50(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h7eeaea115a1e6c6;
    stim[1] = 59'h1bf0c101b15d4c2;
    stim[2] = 59'h438c0fc6f619756;
    stim[3] = 59'h7e25f5e6dc4f10c;
    stim[4] = 59'h1ee6c7cfa827e3c;
    stim[5] = 59'h7bead333e1ed56e;
    stim[6] = 59'h66277af2de5c1f5;
    stim[7] = 59'h39dfb53bebdbc22;
    stim[8] = 59'h6b3df4fa4d95ad0;
    stim[9] = 59'h5b216d169f1e298;
    stim[10] = 59'h5b594f94715bbba;
    stim[11] = 59'h68f0944f64eb101;
    stim[12] = 59'h7fe0b7c5662e84e;
    stim[13] = 59'h26d36b607c202b6;
    stim[14] = 59'h2f0daf5d90ff1cd;
    stim[15] = 59'h75ac8d3124a7d7b;
    stim[16] = 59'h3d7d1ccbc182f7a;
    stim[17] = 59'h04b70b0f217427e;
    stim[18] = 59'h0c08c33ea57b9d4;
    stim[19] = 59'h426817c8c9e8bb8;
    stim[20] = 59'h201d9dae67d4bb0;
    stim[21] = 59'h3b741f5eb2f6d00;
    stim[22] = 59'h46089ce853045e5;
    stim[23] = 59'h4f7522037fb9ef0;
    stim[24] = 59'h176d5c76a85e7a6;
    stim[25] = 59'h4d97bf51e1bd110;
    stim[26] = 59'h773477f17c949b2;
    stim[27] = 59'h30caecf7dd4e5da;
    stim[28] = 59'h3728966c3a626d9;
    stim[29] = 59'h39f6ac475c52fb6;
    stim[30] = 59'h5fd63fb124adc11;
    stim[31] = 59'h00719ebe0bebe7a;
    stim[32] = 59'h4857591c15b2dda;
    stim[33] = 59'h36797751eb0c514;
    stim[34] = 59'h7698edf1fa61d05;
    stim[35] = 59'h7e0fe205a6da753;
    stim[36] = 59'h6c3dcf3228faa80;
    stim[37] = 59'h4331681d61bbbe1;
    stim[38] = 59'h6310a0118c6545f;
    stim[39] = 59'h7db19385cf8f264;
    stim[40] = 59'h55da32b27e02ebc;
    stim[41] = 59'h71597b400d84cb2;
    stim[42] = 59'h773b4519396e240;
    stim[43] = 59'h51488fe7710f8ff;
    stim[44] = 59'h36961bb22a45807;
    stim[45] = 59'h4984afc2db78db1;
    stim[46] = 59'h14b825839f0733e;
    stim[47] = 59'h6862b0f258aed38;
    stim[48] = 59'h4d3e65edb1ac67d;
    stim[49] = 59'h47ebcc3d53371f7;
    stim[50] = 59'h0678d3f3713456c;
    stim[51] = 59'h0dc35e24800acec;
    stim[52] = 59'h0a45386dd7d8b07;
    stim[53] = 59'h2e967576a882ab2;
    stim[54] = 59'h4c88f2fcd078b8a;
    stim[55] = 59'h2da55fd375e5cd2;
    stim[56] = 59'h008e64cff87f821;
    stim[57] = 59'h60845d43e9950d1;
    stim[58] = 59'h1e6aa133f6fecf4;
    stim[59] = 59'h1571f996737031b;
    stim[60] = 59'h2a844000938c8ba;
    stim[61] = 59'h030aa73d2ce8df2;
    stim[62] = 59'h731caa7891d2423;
    stim[63] = 59'h4f45dea51acaad7;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h22b43cd8x;
      expv[2] = 34'h22b43cd8x;
      expv[3] = 34'h0dec32eax;
      expv[4] = 34'h0db89e21x;
      expv[5] = 34'h0db89e21x;
      expv[6] = 34'h27c3daadx;
      expv[7] = 34'h25bcb83ex;
      expv[8] = 34'h25bcb83ex;
      expv[9] = 34'h349b2b5ax;
      expv[10] = 34'h2d3e3c53x;
      expv[11] = 34'h28e2b777x;
      expv[12] = 34'h1ec9d620x;
      expv[13] = 34'h0acc5d09x;
      expv[14] = 34'h0acc5d09x;
      expv[15] = 34'h0acc5d09x;
      expv[16] = 34'h22494fafx;
      expv[17] = 34'h22494fafx;
      expv[18] = 34'h22494fafx;
      expv[19] = 34'h22494fafx;
      expv[20] = 34'h1193d177x;
      expv[21] = 34'h1193d177x;
      expv[22] = 34'h1193d177x;
      expv[23] = 34'h10a608bcx;
      expv[24] = 34'h06ff73dex;
      expv[25] = 34'h06ff73dex;
      expv[26] = 34'h23c37a22x;
      expv[27] = 34'h22f92936x;
      expv[28] = 34'h22f92936x;
      expv[29] = 34'h22f92936x;
      expv[30] = 34'h22f92936x;
      expv[31] = 34'h22495b82x;
      expv[32] = 34'h22495b82x;
      expv[33] = 34'h382b65bbx;
      expv[34] = 34'h382b65bbx;
      expv[35] = 34'h23f4c3a0x;
      expv[36] = 34'h0b4db4eax;
      expv[37] = 34'h2451f550x;
      expv[38] = 34'h3ac3777cx;
      expv[39] = 34'h2318ca8bx;
      expv[40] = 34'h0b9f1e4cx;
      expv[41] = 34'h24fc05d7x;
      expv[42] = 34'h001b0996x;
      expv[43] = 34'h3272dc48x;
      expv[44] = 34'h0ee21f1fx;
      expv[45] = 34'h0ee21f1fx;
      expv[46] = 34'h05b6f1b6x;
      expv[47] = 34'h05b6f1b6x;
      expv[48] = 34'h24b15da7x;
      expv[49] = 34'h1b6358cfx;
      expv[50] = 34'h3aa66e3ex;
      expv[51] = 34'h3aa66e3ex;
      expv[52] = 34'h3aa66e3ex;
      expv[53] = 34'h3aa66e3ex;
      expv[54] = 34'h3aa66e3ex;
      expv[55] = 34'h39a0f171x;
      expv[56] = 34'h39a0f171x;
      expv[57] = 34'h39a0f171x;
      expv[58] = 34'h07d32a1ax;
      expv[59] = 34'h07d32a1ax;
      expv[60] = 34'h07d32a1ax;
      expv[61] = 34'h07d32a1ax;
      expv[62] = 34'h07d32a1ax;
      expv[63] = 34'h3123a484x;
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
