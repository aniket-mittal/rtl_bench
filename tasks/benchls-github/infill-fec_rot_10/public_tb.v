// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_10 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9b3e7e0c;
    stim[1] = 32'hb626be62;
    stim[2] = 32'hd07d4f5f;
    stim[3] = 32'ha9efbde3;
    stim[4] = 32'h366731a7;
    stim[5] = 32'h663c760f;
    stim[6] = 32'h58ca9366;
    stim[7] = 32'h6377f154;
    stim[8] = 32'h6082be50;
    stim[9] = 32'he08917d5;
    stim[10] = 32'hd0df954d;
    stim[11] = 32'hce30c1a3;
    stim[12] = 32'h0a2d969d;
    stim[13] = 32'h0fa05e8d;
    stim[14] = 32'h01aec93d;
    stim[15] = 32'hb3bd8c5a;
    stim[16] = 32'h9678cacc;
    stim[17] = 32'hf4dc12c7;
    stim[18] = 32'hc2b07fde;
    stim[19] = 32'h0a9bf763;
    stim[20] = 32'hd1ba0d73;
    stim[21] = 32'h15780569;
    stim[22] = 32'hf956c689;
    stim[23] = 32'hda318c45;
    stim[24] = 32'h3fb1f906;
    stim[25] = 32'hae23099a;
    stim[26] = 32'h0ac60db7;
    stim[27] = 32'h1a95b604;
    stim[28] = 32'h60f18fee;
    stim[29] = 32'haae8cda4;
    stim[30] = 32'h33471ba7;
    stim[31] = 32'h440c6bca;
    stim[32] = 32'hc7808160;
    stim[33] = 32'h5d9cdc53;
    stim[34] = 32'h2ade3c21;
    stim[35] = 32'h8aebd682;
    stim[36] = 32'h470f7dce;
    stim[37] = 32'ha26321f2;
    stim[38] = 32'h941c0c3e;
    stim[39] = 32'hf45d1af1;
    stim[40] = 32'h54773808;
    stim[41] = 32'h03c40573;
    stim[42] = 32'h2d908f05;
    stim[43] = 32'h57540106;
    stim[44] = 32'he002663d;
    stim[45] = 32'he4e2c88c;
    stim[46] = 32'h82fdccf1;
    stim[47] = 32'h22ca786c;
    stim[48] = 32'h53ef3ddb;
    stim[49] = 32'hfa246557;
    stim[50] = 32'h46e07e70;
    stim[51] = 32'h1df940ca;
    stim[52] = 32'h4190c335;
    stim[53] = 32'he892d4aa;
    stim[54] = 32'h5c5e983d;
    stim[55] = 32'h5d368339;
    stim[56] = 32'ha7811f09;
    stim[57] = 32'h6fe967a6;
    stim[58] = 32'hfec135f5;
    stim[59] = 32'h99a500ac;
    stim[60] = 32'h5a2deeca;
    stim[61] = 32'hc67cef38;
    stim[62] = 32'h69747042;
    stim[63] = 32'h52b31f02;
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
      expv[0] = 32'h82cb53d9;
      expv[1] = 32'had4f49bd;
      expv[2] = 32'h3d277240;
      expv[3] = 32'hb922b43e;
      expv[4] = 32'heb6057bd;
      expv[5] = 32'h0ed4fbf8;
      expv[6] = 32'hb7a684ef;
      expv[7] = 32'h28e93fb9;
      expv[8] = 32'hfbb5578a;
      expv[9] = 32'h95a3418f;
      expv[10] = 32'hb70f2a4a;
      expv[11] = 32'h38bf4bdd;
      expv[12] = 32'ha75b3488;
      expv[13] = 32'h99bbc4c6;
      expv[14] = 32'hb8e4c41e;
      expv[15] = 32'hc84719f3;
      expv[16] = 32'h8439fb38;
      expv[17] = 32'he315809a;
      expv[18] = 32'h25072f27;
      expv[19] = 32'h7f9cdc82;
      expv[20] = 32'h234ffa5b;
      expv[21] = 32'hc0370d01;
      expv[22] = 32'hd5850874;
      expv[23] = 32'h1f8a52cd;
      expv[24] = 32'ha723eb06;
      expv[25] = 32'h8793a85d;
      expv[26] = 32'h08d78487;
      expv[27] = 32'h6e9b41c2;
      expv[28] = 32'h37d3a78f;
      expv[29] = 32'ha363c802;
      expv[30] = 32'h6348f7f9;
      expv[31] = 32'h9ba7ad50;
      expv[32] = 32'hee7d7763;
      expv[33] = 32'he6baf8ae;
      expv[34] = 32'h3815de07;
      expv[35] = 32'hff0b5282;
      expv[36] = 32'h907fdd6c;
      expv[37] = 32'h999380a8;
      expv[38] = 32'h12827b15;
      expv[39] = 32'he6754890;
      expv[40] = 32'h5e4aac15;
      expv[41] = 32'h1675b433;
      expv[42] = 32'h0ff9a66e;
      expv[43] = 32'hd52ef429;
      expv[44] = 32'hb924f185;
      expv[45] = 32'h307eadda;
      expv[46] = 32'hb3639e22;
      expv[47] = 32'h7d05eaa7;
      expv[48] = 32'h329d1073;
      expv[49] = 32'h182a184d;
      expv[50] = 32'h2f111d77;
      expv[51] = 32'hd06091ab;
      expv[52] = 32'he0c4e11e;
      expv[53] = 32'heeafbd2f;
      expv[54] = 32'heccb78b5;
      expv[55] = 32'h4e8740a4;
      expv[56] = 32'h1808d4e3;
      expv[57] = 32'h4df36743;
      expv[58] = 32'h86880812;
      expv[59] = 32'heb7183fb;
      expv[60] = 32'h2eb06cc8;
      expv[61] = 32'h1ca42f78;
      expv[62] = 32'h37ec2731;
      expv[63] = 32'h40365c62;
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
