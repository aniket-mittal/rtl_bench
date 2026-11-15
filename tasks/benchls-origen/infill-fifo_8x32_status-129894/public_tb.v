// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129894 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .Data_in(in_vec[33:2]),
    .write_to_stack(in_vec[1:1]),
    .read_from_stack(in_vec[0:0]),
    .Data_out(out_vec[36:5]),
    .stack_full(out_vec[4:4]),
    .stack_almost_full(out_vec[3:3]),
    .stack_half_full(out_vec[2:2]),
    .stack_almost_empty(out_vec[1:1]),
    .stack_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6d6990cf0;
    stim[1] = 35'h775c24964;
    stim[2] = 35'h1bb692a44;
    stim[3] = 35'h3446dd45e;
    stim[4] = 35'h3dd8c9ab7;
    stim[5] = 35'h1ad05e6bf;
    stim[6] = 35'h3f23d638c;
    stim[7] = 35'h3e61abddb;
    stim[8] = 35'h19abb25e6;
    stim[9] = 35'h1fff876fa;
    stim[10] = 35'h2d638a43c;
    stim[11] = 35'h38592f74b;
    stim[12] = 35'h2874e8bad;
    stim[13] = 35'h104aa3b28;
    stim[14] = 35'h2506016ba;
    stim[15] = 35'h28d4dab7d;
    stim[16] = 35'h016e289ed;
    stim[17] = 35'h2abf3cb8c;
    stim[18] = 35'h0f0ccc3b3;
    stim[19] = 35'h386099030;
    stim[20] = 35'h391db17d5;
    stim[21] = 35'h0bc205577;
    stim[22] = 35'h126414bcc;
    stim[23] = 35'h033a1cfcc;
    stim[24] = 35'h3631302c9;
    stim[25] = 35'h373daa5c2;
    stim[26] = 35'h1b5dff829;
    stim[27] = 35'h2ec7a54b9;
    stim[28] = 35'h3f9ba1f0b;
    stim[29] = 35'h26306d701;
    stim[30] = 35'h3877e668f;
    stim[31] = 35'h220db0423;
    stim[32] = 35'h003137a9d;
    stim[33] = 35'h20604b556;
    stim[34] = 35'h3f569afa3;
    stim[35] = 35'h38474aa2e;
    stim[36] = 35'h13742dd75;
    stim[37] = 35'h12e62320d;
    stim[38] = 35'h2012151fc;
    stim[39] = 35'h0a9150db4;
    stim[40] = 35'h270a731b1;
    stim[41] = 35'h2859ca73d;
    stim[42] = 35'h277d64dee;
    stim[43] = 35'h3a7ea9842;
    stim[44] = 35'h0e7573398;
    stim[45] = 35'h1ac2347d7;
    stim[46] = 35'h27f12612f;
    stim[47] = 35'h389cf568a;
    stim[48] = 35'h17b42fc28;
    stim[49] = 35'h1f3ee3f93;
    stim[50] = 35'h3c5c24650;
    stim[51] = 35'h17092cdf7;
    stim[52] = 35'h1a784f7b1;
    stim[53] = 35'h15dd8d83f;
    stim[54] = 35'h20c345c23;
    stim[55] = 35'h354d66666;
    stim[56] = 35'h1ab607d63;
    stim[57] = 35'h317e181cd;
    stim[58] = 35'h0ccb79b14;
    stim[59] = 35'h22b5abc93;
    stim[60] = 35'h3592c1869;
    stim[61] = 35'h27bcebdd7;
    stim[62] = 35'h3e9679228;
    stim[63] = 35'h259aece77;
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
      expv[0] = 37'h0000000003;
      expv[1] = 37'h0000000003;
      expv[2] = 37'h0000000003;
      expv[3] = 37'h0000000003;
      expv[4] = 37'h0000000002;
      expv[5] = 37'h1a236ea2e3;
      expv[6] = 37'h1a236ea2e2;
      expv[7] = 37'h1a236ea2e2;
      expv[8] = 37'h1eec64d5a3;
      expv[9] = 37'h1eec64d5a2;
      expv[10] = 37'h1eec64d5a2;
      expv[11] = 37'h1eec64d5a2;
      expv[12] = 37'h0d682f35e2;
      expv[13] = 37'h1f30d5eec3;
      expv[14] = 37'h1f30d5eec3;
      expv[15] = 37'h1f30d5eec2;
      expv[16] = 37'h0cd5d92f23;
      expv[17] = 37'h0cd5d92f23;
      expv[18] = 37'h0cd5d92f23;
      expv[19] = 37'h0cd5d92f22;
      expv[20] = 37'h0cd5d92f22;
      expv[21] = 37'h0fffc3b7c3;
      expv[22] = 37'h0fffc3b7c2;
      expv[23] = 37'h0fffc3b7c2;
      expv[24] = 37'h0fffc3b7c2;
      expv[25] = 37'h1c2c97ba43;
      expv[26] = 37'h1c2c97ba42;
      expv[27] = 37'h128300b5c3;
      expv[28] = 37'h128300b5c3;
      expv[29] = 37'h128300b5c2;
      expv[30] = 37'h0786661d83;
      expv[31] = 37'h0786661d82;
      expv[32] = 37'h05e102aba3;
      expv[33] = 37'h05e102aba3;
      expv[34] = 37'h05e102aba2;
      expv[35] = 37'h1b9ed52e03;
      expv[36] = 37'h1b9ed52e02;
      expv[37] = 37'h1fcdd0f843;
      expv[38] = 37'h1fcdd0f843;
      expv[39] = 37'h1fcdd0f843;
      expv[40] = 37'h1fcdd0f843;
      expv[41] = 37'h1fcdd0f843;
      expv[42] = 37'h1fcdd0f843;
      expv[43] = 37'h1fcdd0f842;
      expv[44] = 37'h1fcdd0f842;
      expv[45] = 37'h1fcdd0f842;
      expv[46] = 37'h1c3bf33462;
      expv[47] = 37'h1106d82103;
      expv[48] = 37'h1106d82102;
      expv[49] = 37'h1106d82102;
      expv[50] = 37'h103025aaa3;
      expv[51] = 37'h103025aaa3;
      expv[52] = 37'h103025aaa2;
      expv[53] = 37'h0b84966fa3;
      expv[54] = 37'h0b84966fa2;
      expv[55] = 37'h0aeec6c1e3;
      expv[56] = 37'h0aeec6c1e2;
      expv[57] = 37'h1061a2e103;
      expv[58] = 37'h1061a2e103;
      expv[59] = 37'h1061a2e103;
      expv[60] = 37'h1061a2e102;
      expv[61] = 37'h1aa6b33323;
      expv[62] = 37'h1aa6b33322;
      expv[63] = 37'h1aa6b33322;
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
