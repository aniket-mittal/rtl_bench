// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_162738 dut (
    .clock(clk),
    .reset(in_vec[105:105]),
    .mem_m0_oper(in_vec[104:104]),
    .mem_m0_readmem(in_vec[103:103]),
    .mem_m0_writemem(in_vec[102:102]),
    .mem_m0_rega(in_vec[101:70]),
    .mem_m0_imedext(in_vec[69:38]),
    .mem_m0_regb(in_vec[37:6]),
    .mem_m0_regdest(in_vec[5:1]),
    .mem_m0_writereg(in_vec[0:0]),
    .m0_m1_oper(out_vec[72:72]),
    .m0_m1_readmem(out_vec[71:71]),
    .m0_m1_writemem(out_vec[70:70]),
    .m0_m1_data_addr(out_vec[69:38]),
    .m0_m1_regb(out_vec[37:6]),
    .m0_m1_regdest(out_vec[5:1]),
    .m0_m1_writereg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h291cc0543573fa90838643c32e1;
    stim[1] = 106'h2aee85bb8a63eed2a727398be27;
    stim[2] = 106'h1a8fb6188a1cc3af0a2cde17686;
    stim[3] = 106'h1b70c01e8e11cc589379234399f;
    stim[4] = 106'h1cc4406aec91adc21fcced0870d;
    stim[5] = 106'h02e587e7dd6f93b58f060fdc759;
    stim[6] = 106'h0acd032e688de8b714867acad57;
    stim[7] = 106'h072410ec0ef18bac88c66364234;
    stim[8] = 106'h1622802d480c28a280501513f39;
    stim[9] = 106'h0a1b39e697035dfbb979b54f23f;
    stim[10] = 106'h04b731e926b11261c400e53569a;
    stim[11] = 106'h110bd5cb79f981d96dc9b6244b3;
    stim[12] = 106'h19794be76ecef832ea550f92cc5;
    stim[13] = 106'h162e778c50abcba60f83877b9ec;
    stim[14] = 106'h0644e4ca1ed5457458c4ad21468;
    stim[15] = 106'h1fd2f4d027388d4ab345b4c9563;
    stim[16] = 106'h16dd7c57d28641b17288afe8b95;
    stim[17] = 106'h10e4d807c1039296d672bb2d5bb;
    stim[18] = 106'h0159eb304a52d342d3b96c323f0;
    stim[19] = 106'h187962aa8adcbf32a9c1c76a9f9;
    stim[20] = 106'h074dd470b957a97910e63b6c312;
    stim[21] = 106'h1a552f4a622a5054f086a73abe0;
    stim[22] = 106'h18e786b6771b253c25f167277fc;
    stim[23] = 106'h0858d4cea26a68b1ba8ab00414b;
    stim[24] = 106'h14fa701dad6d2d0ddd1f18e0d97;
    stim[25] = 106'h0ed7f7e43c08af82dd4a165add5;
    stim[26] = 106'h0a7dd4e589044b9e3c7aea96e4b;
    stim[27] = 106'h1afb78d9a766cd7e331c756cff7;
    stim[28] = 106'h0581705bc6fc8f7aefea0731c29;
    stim[29] = 106'h1826879917e9b2232fb5a9c4f9a;
    stim[30] = 106'h13e29cd2b63d5c2ef87804457d1;
    stim[31] = 106'h14843bd1ee71eebca34c84429ca;
    stim[32] = 106'h09a64b08637980e00ea22a9de1f;
    stim[33] = 106'h18fc83dcabd221bf2833411b4c9;
    stim[34] = 106'h11f1f60f8b2bbe5786fbb181a87;
    stim[35] = 106'h1f4089fc6c12cc6d28191650d99;
    stim[36] = 106'h1a60ab42591e8f0c01559c798a8;
    stim[37] = 106'h063fd3689b515a7ea16db1d024c;
    stim[38] = 106'h1bd6bf19a7073c1298c4ddf1057;
    stim[39] = 106'h0d2940b395e68bbb8aebdb8e50a;
    stim[40] = 106'h1cf834588f1cbc37bcc4f26d653;
    stim[41] = 106'h104f582c304b1eee585c68cea9f;
    stim[42] = 106'h03d55bd5b0e72ef9bca298090b6;
    stim[43] = 106'h1633695bd386f817893305568fb;
    stim[44] = 106'h038e5e63b49e16201e5381bf696;
    stim[45] = 106'h1c78899dcb999df88530d9b64d8;
    stim[46] = 106'h05de1d652498b1088fbb4bf9eb4;
    stim[47] = 106'h1def348a489704e4af9dd3f8139;
    stim[48] = 106'h0f89552d012e342c0499a2e7a87;
    stim[49] = 106'h1f5490a418cd1657c1526ae4a73;
    stim[50] = 106'h2e2d83dd6ebba768816c893659f;
    stim[51] = 106'h0ba01b6e4aaab7fe89306e309c1;
    stim[52] = 106'h1f268ab0d451b740e8679e8c23c;
    stim[53] = 106'h1d1aa01b949d397c514ef43e68a;
    stim[54] = 106'h13eab5e32152250643cff0853bd;
    stim[55] = 106'h09c1cbd94b93df7780460212def;
    stim[56] = 106'h0e4c0a58fcd30570ea3a75e39e5;
    stim[57] = 106'h0e112dcd97d18c9de7708dfed9a;
    stim[58] = 106'h05f6198deac7ce04d2b7351c706;
    stim[59] = 106'h064302a7d0995b474d04394d2d8;
    stim[60] = 106'h09f5cb1de29539865c2eada0ac6;
    stim[61] = 106'h0e13ba6f13d5de504024d4eaac6;
    stim[62] = 106'h01ccf62ce239c3434c10fbcb8f3;
    stim[63] = 106'h01603549c0040c51a897c8d19a4;
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
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h0000000000000000000;
      expv[4] = 73'h0000000000000000000;
      expv[5] = 73'h0000000000000000000;
      expv[6] = 73'h0000000000000000000;
      expv[7] = 73'h0000000000000000000;
      expv[8] = 73'h0000000000000000000;
      expv[9] = 73'h0000000000000000000;
      expv[10] = 73'h0000000000000000000;
      expv[11] = 73'h0000000000000000000;
      expv[12] = 73'h0000000000000000000;
      expv[13] = 73'h0000000000000000000;
      expv[14] = 73'h0000000000000000000;
      expv[15] = 73'h0000000000000000000;
      expv[16] = 73'h0000000000000000000;
      expv[17] = 73'h0000000000000000000;
      expv[18] = 73'h0000000000000000000;
      expv[19] = 73'h0000000000000000000;
      expv[20] = 73'h0000000000000000000;
      expv[21] = 73'h0000000000000000000;
      expv[22] = 73'h0000000000000000000;
      expv[23] = 73'h0000000000000000000;
      expv[24] = 73'h0000000000000000000;
      expv[25] = 73'h0000000000000000000;
      expv[26] = 73'h0000000000000000000;
      expv[27] = 73'h0000000000000000000;
      expv[28] = 73'h0000000000000000000;
      expv[29] = 73'h0000000000000000000;
      expv[30] = 73'h0000000000000000000;
      expv[31] = 73'h0000000000000000000;
      expv[32] = 73'h0000000000000000000;
      expv[33] = 73'h0000000000000000000;
      expv[34] = 73'h0000000000000000000;
      expv[35] = 73'h0000000000000000000;
      expv[36] = 73'h0000000000000000000;
      expv[37] = 73'h0000000000000000000;
      expv[38] = 73'h0000000000000000000;
      expv[39] = 73'h0000000000000000000;
      expv[40] = 73'h0000000000000000000;
      expv[41] = 73'h0000000000000000000;
      expv[42] = 73'h0000000000000000000;
      expv[43] = 73'h0000000000000000000;
      expv[44] = 73'h0000000000000000000;
      expv[45] = 73'h0000000000000000000;
      expv[46] = 73'h0000000000000000000;
      expv[47] = 73'h0000000000000000000;
      expv[48] = 73'h0000000000000000000;
      expv[49] = 73'h0000000000000000000;
      expv[50] = 73'h0000000000000000000;
      expv[51] = 73'h0000000000000000000;
      expv[52] = 73'h0000000000000000000;
      expv[53] = 73'h0000000000000000000;
      expv[54] = 73'h0000000000000000000;
      expv[55] = 73'h0000000000000000000;
      expv[56] = 73'h0000000000000000000;
      expv[57] = 73'h0000000000000000000;
      expv[58] = 73'h0000000000000000000;
      expv[59] = 73'h0000000000000000000;
      expv[60] = 73'h0000000000000000000;
      expv[61] = 73'h0000000000000000000;
      expv[62] = 73'h0000000000000000000;
      expv[63] = 73'h0000000000000000000;
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
