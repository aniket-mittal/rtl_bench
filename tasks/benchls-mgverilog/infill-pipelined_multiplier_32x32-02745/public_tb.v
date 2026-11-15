// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02745 dut (
    .clk(clk),
    .rst(in_vec[68:68]),
    .input_a(in_vec[67:36]),
    .input_b(in_vec[35:4]),
    .signed_operation(in_vec[3:3]),
    .enable_op(in_vec[2:2]),
    .stall(in_vec[1:1]),
    .flush(in_vec[0:0]),
    .mult_result(out_vec[65:2]),
    .active(out_vec[1:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h17a105837cf5030c6b;
    stim[1] = 69'h1bca20cd39777ddddd;
    stim[2] = 69'h07a3b6ff552c7f7617;
    stim[3] = 69'h0a866e771c5874e8f6;
    stim[4] = 69'h050df30322de781afa;
    stim[5] = 69'h0175212eccc2cf223a;
    stim[6] = 69'h038e32610f36993dc0;
    stim[7] = 69'h0ab38dc6dbdc0c12ee;
    stim[8] = 69'h0c08452d1fbb799f0e;
    stim[9] = 69'h061baa3000c495631b;
    stim[10] = 69'h0f9a2792d5f9eaf10d;
    stim[11] = 69'h024330afa2117ec9dc;
    stim[12] = 69'h0eedb196ca4dbe7926;
    stim[13] = 69'h0ee0b76aa9d3df6ba7;
    stim[14] = 69'h04c274cc020b815b98;
    stim[15] = 69'h04b1a82cd6de0b2256;
    stim[16] = 69'h02c3b26fdd1c566063;
    stim[17] = 69'h0a81513f991e20a3a0;
    stim[18] = 69'h0192278d506c574d98;
    stim[19] = 69'h07290ef2fc3fcbc9a5;
    stim[20] = 69'h06344430b54a934a6c;
    stim[21] = 69'h0f5146e683405679c3;
    stim[22] = 69'h06e76bd45406c7556a;
    stim[23] = 69'h033c9692f756c3e95a;
    stim[24] = 69'h00037c33bc119ba27c;
    stim[25] = 69'h027b0ef15f82309322;
    stim[26] = 69'h038a8cba367261ff7c;
    stim[27] = 69'h07032b40186d595c9a;
    stim[28] = 69'h035c444adac94e3c93;
    stim[29] = 69'h0302086b4869a9a7cb;
    stim[30] = 69'h06c44da520e0235678;
    stim[31] = 69'h0b7afb3a7aebad486a;
    stim[32] = 69'h0d721fa28945344194;
    stim[33] = 69'h05e61cd9e11bed316a;
    stim[34] = 69'h0d06834d06492213d7;
    stim[35] = 69'h0b1b39a67fcd3faa5d;
    stim[36] = 69'h063409a5bd1e460935;
    stim[37] = 69'h0844e576125ec1f8fb;
    stim[38] = 69'h0000b373e755d69899;
    stim[39] = 69'h0339ea20033d73e3e3;
    stim[40] = 69'h0576af6efaf05c743b;
    stim[41] = 69'h085328a638b01f39a1;
    stim[42] = 69'h0efd70e357a2ad9dd8;
    stim[43] = 69'h040934743d480110bb;
    stim[44] = 69'h042bf7d01695ba1c16;
    stim[45] = 69'h00cf43b1102da4a5d7;
    stim[46] = 69'h0c1d8be98f5df6c944;
    stim[47] = 69'h06427eb9619e55e7b2;
    stim[48] = 69'h08b0119b15067a7009;
    stim[49] = 69'h01b312bca8f6c50bd4;
    stim[50] = 69'h0fbbd6c47bce8e7ecc;
    stim[51] = 69'h04a669405768d2e949;
    stim[52] = 69'h0cf38cd8b66fde3f76;
    stim[53] = 69'h0a00802dfe31b3d6ff;
    stim[54] = 69'h035dd4aefcb73381bf;
    stim[55] = 69'h00d20e8b395d6004f3;
    stim[56] = 69'h06e199354c437772e2;
    stim[57] = 69'h0d1bd3d21db9fbcbd7;
    stim[58] = 69'h03e9c92e9b7a73dbb5;
    stim[59] = 69'h0a395e70b077f18098;
    stim[60] = 69'h0c1f683f4f4f91a6e3;
    stim[61] = 69'h0cc67ffad6ccf0d60f;
    stim[62] = 69'h00b5f2c4eea76232d7;
    stim[63] = 69'h05abddc7188b5b19b4;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'hxxxxxxxxxxxxxxxxx;
      expv[8] = 66'hxxxxxxxxxxxxxxxxx;
      expv[9] = 66'hxxxxxxxxxxxxxxxxx;
      expv[10] = 66'hxxxxxxxxxxxxxxxxx;
      expv[11] = 66'hxxxxxxxxxxxxxxxxx;
      expv[12] = 66'hxxxxxxxxxxxxxxxxx;
      expv[13] = 66'hxxxxxxxxxxxxxxxxx;
      expv[14] = 66'hxxxxxxxxxxxxxxxxx;
      expv[15] = 66'hxxxxxxxxxxxxxxxxx;
      expv[16] = 66'hxxxxxxxxxxxxxxxxx;
      expv[17] = 66'hxxxxxxxxxxxxxxxxx;
      expv[18] = 66'h0d85c4c9c7a7f9700;
      expv[19] = 66'h012b7d9d5df88cd48;
      expv[20] = 66'h012b7d9d5df88cd48;
      expv[21] = 66'h026eeb135aec8db02;
      expv[22] = 66'h026eeb135aec8db00;
      expv[23] = 66'h026eeb135aec8db00;
      expv[24] = 66'h026eeb135aec8db00;
      expv[25] = 66'h17f21668a498101aa;
      expv[26] = 66'h17f21668a498101aa;
      expv[27] = 66'h002a8c7539b87c236;
      expv[28] = 66'h002a8c7539b87c236;
      expv[29] = 66'h002a8c7539b87c234;
      expv[30] = 66'h002a8c7539b87c234;
      expv[31] = 66'h0835009e86892d488;
      expv[32] = 66'h0835009e86892d488;
      expv[33] = 66'h00036cdc39f95900e;
      expv[34] = 66'h00036cdc39f95900e;
      expv[35] = 66'h00036cdc39f95900c;
      expv[36] = 66'h00036cdc39f95900c;
      expv[37] = 66'h00036cdc39f95900c;
      expv[38] = 66'h00036cdc39f95900c;
      expv[39] = 66'h00036cdc39f95900c;
      expv[40] = 66'h00036cdc39f95900c;
      expv[41] = 66'h00036cdc39f95900c;
      expv[42] = 66'h00036cdc39f95900c;
      expv[43] = 66'h05b51683faadcdd14;
      expv[44] = 66'h05b51683faadcdd14;
      expv[45] = 66'h05b51683faadcdd14;
      expv[46] = 66'h05b51683faadcdd14;
      expv[47] = 66'h017b2cc40062b43fa;
      expv[48] = 66'h017b2cc40062b43fa;
      expv[49] = 66'h017b2cc40062b43f8;
      expv[50] = 66'h1f29677750ef037a2;
      expv[51] = 66'h01ed8decc466f3cfe;
      expv[52] = 66'h01ed8decc466f3cfc;
      expv[53] = 66'h01ed8decc466f3cfc;
      expv[54] = 66'h01ed8decc466f3cfc;
      expv[55] = 66'h01ed8decc466f3cfc;
      expv[56] = 66'h01ed8decc466f3cfc;
      expv[57] = 66'h01ed8decc466f3cfc;
      expv[58] = 66'h01ed8decc466f3cfc;
      expv[59] = 66'h01ed8decc466f3cfc;
      expv[60] = 66'h2e8b671b400793f80;
      expv[61] = 66'h2e8b671b400793f80;
      expv[62] = 66'h2e8b671b400793f80;
      expv[63] = 66'h2e8b671b400793f80;
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
