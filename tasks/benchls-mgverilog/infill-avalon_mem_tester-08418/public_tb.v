// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 175;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08418 dut (
    .clock(clk),
    .reset_n(in_vec[66:66]),
    .waitrequest(in_vec[65:65]),
    .readdata(in_vec[64:1]),
    .readdatavalid(in_vec[0:0]),
    .address(out_vec[174:146]),
    .burstcount(out_vec[145:138]),
    .read(out_vec[137:137]),
    .writedata(out_vec[136:73]),
    .byteenable(out_vec[72:65]),
    .write(out_vec[64:64]),
    .debug_value0(out_vec[63:32]),
    .debug_value1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h1d12069ee743b97b3;
    stim[1] = 67'h115207e2deba38a0e;
    stim[2] = 67'h781b8d0b9d82e5c7d;
    stim[3] = 67'h4701b550df36226a9;
    stim[4] = 67'h571b283c7f9ab617c;
    stim[5] = 67'h589866497fc7881b8;
    stim[6] = 67'h7f12a5380164b171f;
    stim[7] = 67'h4a4989a288c9cedba;
    stim[8] = 67'h6231622f00c448d35;
    stim[9] = 67'h5544748e684a6e364;
    stim[10] = 67'h4c451815c356f722d;
    stim[11] = 67'h66aa7498fbe840220;
    stim[12] = 67'h648563eeb21c81fe6;
    stim[13] = 67'h6ea98cd66f8c7441c;
    stim[14] = 67'h49a4c57423210eac0;
    stim[15] = 67'h476231c0c66c199ca;
    stim[16] = 67'h7503f0bf8b42173d7;
    stim[17] = 67'h5574953244c738f2d;
    stim[18] = 67'h5e6ac7f2bcd775c50;
    stim[19] = 67'h7faf75694b7a795e8;
    stim[20] = 67'h736edb311a7577652;
    stim[21] = 67'h7d6cba1cc521e4283;
    stim[22] = 67'h65c5fced8682c6848;
    stim[23] = 67'h5d7a245553afe2d31;
    stim[24] = 67'h79d70d9c503eb848d;
    stim[25] = 67'h4d3bd5f5a2add57bb;
    stim[26] = 67'h7af4acc5d03ab078e;
    stim[27] = 67'h7183a0c8d5c30c9ff;
    stim[28] = 67'h46222b130a7678650;
    stim[29] = 67'h700b845e89896ad27;
    stim[30] = 67'h65ab9b07fba97a812;
    stim[31] = 67'h7a81eaa8c7b6e7d63;
    stim[32] = 67'h4766a4a946f2e9284;
    stim[33] = 67'h5c34eb8937b218dc0;
    stim[34] = 67'h6ae41016bf9408888;
    stim[35] = 67'h67ad4e21421354b0a;
    stim[36] = 67'h7cdbcf76acec72e72;
    stim[37] = 67'h740103aa82bf177e3;
    stim[38] = 67'h79ab45e38ff1f0580;
    stim[39] = 67'h6b414b55cefaa0ba3;
    stim[40] = 67'h4ce5838fded35bde7;
    stim[41] = 67'h748318b7e70ea463b;
    stim[42] = 67'h7eec395abeef66792;
    stim[43] = 67'h645b42585123dd2c6;
    stim[44] = 67'h7f7f28f5126e98a2f;
    stim[45] = 67'h53d7fbc7706e68d5d;
    stim[46] = 67'h489bb53c8b3da7c65;
    stim[47] = 67'h5d717f96424b2e110;
    stim[48] = 67'h451eeaebc400add2d;
    stim[49] = 67'h7a13ff9c7524a2186;
    stim[50] = 67'h7fe302da2b09627c7;
    stim[51] = 67'h45fa5400ec96c309c;
    stim[52] = 67'h5aa0315ebb9cf2d0c;
    stim[53] = 67'h5779265b7bbbdc9c5;
    stim[54] = 67'h7b9b6ab6f86de65ba;
    stim[55] = 67'h7e1ae326bfbbb5b0b;
    stim[56] = 67'h48ffa64052abf4145;
    stim[57] = 67'h6ffbaf7cce8a1cb2b;
    stim[58] = 67'h622f71bf6d319bfd3;
    stim[59] = 67'h414be806227966e3b;
    stim[60] = 67'h54ad3574601c4e806;
    stim[61] = 67'h50d6847a7ad9f5425;
    stim[62] = 67'h42cf438f08729cbb7;
    stim[63] = 67'h451dacb9d3a8f1b5c;
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
      expv[0] = 175'h00000000040000000000000001fe01000000xxxxxxxx;
      expv[1] = 175'h00000000040000000000000001fe00000000xxxxxxxx;
      expv[2] = 175'h00000000040000000000000001fe11000000xxxxxxxx;
      expv[3] = 175'h00000000040000000000000001fe0100000111131719;
      expv[4] = 175'h1c00000005bd5b7ddf95fd757dff0001000211131719;
      expv[5] = 175'h00000000040000000000000001fe0000000311131719;
      expv[6] = 175'h1c000000060000000000000001fe1110000411131719;
      expv[7] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[8] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[9] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[10] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[11] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[12] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[13] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[14] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[15] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[16] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[17] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[18] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[19] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[20] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[21] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[22] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[23] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[24] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[25] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[26] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[27] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[28] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[29] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[30] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[31] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[32] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[33] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[34] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[35] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[36] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[37] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[38] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[39] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[40] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[41] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[42] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[43] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[44] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[45] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[46] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[47] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[48] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[49] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[50] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[51] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[52] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[53] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[54] = 175'h1c000000060000000000000001fe1010000529c00b25;
      expv[55] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[56] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[57] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[58] = 175'h1c000000060000000000000001fe1110000529c00b25;
      expv[59] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[60] = 175'h1c000000060000000000000001fe0010000529c00b25;
      expv[61] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[62] = 175'h1c000000060000000000000001fe0110000529c00b25;
      expv[63] = 175'h1c000000060000000000000001fe0010000529c00b25;
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
