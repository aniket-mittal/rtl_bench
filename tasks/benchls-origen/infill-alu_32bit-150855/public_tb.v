// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150855 dut (
    .X(in_vec[68:37]),
    .Y(in_vec[36:5]),
    .S(in_vec[4:0]),
    .result1(out_vec[66:35]),
    .result2(out_vec[34:3]),
    .OF(out_vec[2:2]),
    .UOF(out_vec[1:1]),
    .Equal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h03eeffad03706a2341;
    stim[1] = 69'h0b156e5d3ddbe67e9f;
    stim[2] = 69'h0ed7c5a6a448fe38ce;
    stim[3] = 69'h157061d61d8d815006;
    stim[4] = 69'h1deb52e3ae3caa6cc3;
    stim[5] = 69'h0f4303f70fa5f2913c;
    stim[6] = 69'h0c819a24f1b3d4f18c;
    stim[7] = 69'h1aa618cc497ad49866;
    stim[8] = 69'h04c8352e1844c1ecd7;
    stim[9] = 69'h05b36569bb5e2291d4;
    stim[10] = 69'h1f3cded86bdfba3234;
    stim[11] = 69'h0618de764783a64337;
    stim[12] = 69'h052bbe4676a3b2dcf9;
    stim[13] = 69'h117e225c70ce9e58c0;
    stim[14] = 69'h075b77f94e35d4e540;
    stim[15] = 69'h121d52205e71f27ec0;
    stim[16] = 69'h0798ce5f96cf238dff;
    stim[17] = 69'h0af80b5e4e6ab20260;
    stim[18] = 69'h063e68f8938b90553a;
    stim[19] = 69'h084155237f5d0db471;
    stim[20] = 69'h10bcc00749382f778b;
    stim[21] = 69'h1b392d39d7d3cca70a;
    stim[22] = 69'h05640ddd1e3d1ea085;
    stim[23] = 69'h0cc6f7723f7a1fbb00;
    stim[24] = 69'h1118050ea8d4031dae;
    stim[25] = 69'h1edfb6449c4bd63dbd;
    stim[26] = 69'h08ea651db080ca4c3b;
    stim[27] = 69'h1dc747015d0998ef83;
    stim[28] = 69'h116911ca3f327e5fa9;
    stim[29] = 69'h02d4ef96bb228a8ba9;
    stim[30] = 69'h103917e723ca758e8a;
    stim[31] = 69'h1635854357db65396f;
    stim[32] = 69'h1f68aabd93caeed060;
    stim[33] = 69'h0bbe28a4d320d9d64b;
    stim[34] = 69'h16303b124a7ae8c007;
    stim[35] = 69'h0f1e75800926129ec1;
    stim[36] = 69'h156662b8bc6cc602f2;
    stim[37] = 69'h0444d178c594cc6574;
    stim[38] = 69'h01c0da17c5054d7198;
    stim[39] = 69'h1a4aa07e126592bd35;
    stim[40] = 69'h115ce6324a6e68930f;
    stim[41] = 69'h18d25602a5997e11f6;
    stim[42] = 69'h13ba3202331686a517;
    stim[43] = 69'h185b8b86c454933e96;
    stim[44] = 69'h1cd0d004b413f97531;
    stim[45] = 69'h0d28fdf7d2c4a408bd;
    stim[46] = 69'h0b2c00d0f86f6293c1;
    stim[47] = 69'h1f8bc9de9afb28db96;
    stim[48] = 69'h180307ec529edc46a7;
    stim[49] = 69'h178dd36b0da6f37e94;
    stim[50] = 69'h073be26f96ea323aff;
    stim[51] = 69'h1a0a84e7159dcbb661;
    stim[52] = 69'h1cb28e094be469c157;
    stim[53] = 69'h13c7aa3c98bd8ea149;
    stim[54] = 69'h05662b885bd8812567;
    stim[55] = 69'h19d180fcd09243bb02;
    stim[56] = 69'h12f1ca77d01aaa88f7;
    stim[57] = 69'h1c50db75e2eb85151a;
    stim[58] = 69'h031c306d2f21e1df9e;
    stim[59] = 69'h1cbe05054b013c72af;
    stim[60] = 69'h1b1a0f6f1698e1f602;
    stim[61] = 69'h1be180155edd11ad02;
    stim[62] = 69'h02e9d21975a2cc843a;
    stim[63] = 69'h19f3bbb5164f00ab4c;
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
      expv[0] = 67'h00000003800000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h5f8b8218000000006;
      expv[4] = 67'h5b83ce477c4c09a80;
      expv[5] = 67'h00000000000000000;
      expv[6] = 67'h00000000800000000;
      expv[7] = 67'h44ad10cf800000006;
      expv[8] = 67'h00000000000000000;
      expv[9] = 67'h00000000000000000;
      expv[10] = 67'h00000000000000000;
      expv[11] = 67'h00000000000000000;
      expv[12] = 67'h00000000000000000;
      expv[13] = 67'h7e225c60000000000;
      expv[14] = 67'h377f9400000000000;
      expv[15] = 67'h20400000000000000;
      expv[16] = 67'h00000000000000000;
      expv[17] = 67'h6bc80000000000000;
      expv[18] = 67'h00000000000000000;
      expv[19] = 67'h00000000000000000;
      expv[20] = 67'h00000000800000000;
      expv[21] = 67'h00104900800000000;
      expv[22] = 67'h0e84b1f6000000000;
      expv[23] = 67'h48800000000000000;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h00000000000000000;
      expv[26] = 67'h00000000000000000;
      expv[27] = 67'h2c5d756c00d29b170;
      expv[28] = 67'h396dbe56000000000;
      expv[29] = 67'h67d99474000000000;
      expv[30] = 67'h30122041000000000;
      expv[31] = 67'h00000000000000000;
      expv[32] = 67'h6d1557b0000000000;
      expv[33] = 67'h00000000000000000;
      expv[34] = 67'h08c0a000000000000;
      expv[35] = 67'h000000f1800000000;
      expv[36] = 67'h00000000000000000;
      expv[37] = 67'h00000000000000000;
      expv[38] = 67'h00000000000000000;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h00000000000000000;
      expv[41] = 67'h00000000000000000;
      expv[42] = 67'h00000000000000000;
      expv[43] = 67'h00000000000000000;
      expv[44] = 67'h00000000000000000;
      expv[45] = 67'h00000000000000000;
      expv[46] = 67'h00000000800000000;
      expv[47] = 67'h00000000000000000;
      expv[48] = 67'h40081110000000000;
      expv[49] = 67'h00000000000000000;
      expv[50] = 67'h00000000000000000;
      expv[51] = 67'h00000d05000000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h2de89277000000000;
      expv[54] = 67'h05000401000000000;
      expv[55] = 67'h7fffffe7000000000;
      expv[56] = 67'h00000000000000000;
      expv[57] = 67'h00000000000000000;
      expv[58] = 67'h00000000000000000;
      expv[59] = 67'h00000000000000000;
      expv[60] = 67'h7fffec68000000000;
      expv[61] = 67'h7fef8600000000000;
      expv[62] = 67'h00000000000000000;
      expv[63] = 67'h00000000000000000;
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
