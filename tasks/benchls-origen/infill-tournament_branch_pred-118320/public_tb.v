// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118320 dut (
    .clk(clk),
    .rst(in_vec[70:70]),
    .is_branch_ex(in_vec[69:69]),
    .cmp_out_ex(in_vec[68:68]),
    .loc_predict_taken_if(in_vec[67:67]),
    .glob_predict_taken_if(in_vec[66:66]),
    .loc_predict_taken_ex(in_vec[65:65]),
    .glob_predict_taken_ex(in_vec[64:64]),
    .pc_if(in_vec[63:32]),
    .pc_ex(in_vec[31:0]),
    .valid_branch(out_vec[1:1]),
    .predict_taken(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h700e6922173053ccba;
    stim[1] = 71'h6faa0e14992ab079aa;
    stim[2] = 71'h01ea333443b4ae1745;
    stim[3] = 71'h0cda834f708544d60e;
    stim[4] = 71'h26071554dfb8960676;
    stim[5] = 71'h17cf4b0aabcb3a9bc8;
    stim[6] = 71'h1002e39c04020163fc;
    stim[7] = 71'h0973a26bcea8583fdc;
    stim[8] = 71'h2640df4fa3bdb15636;
    stim[9] = 71'h04a6f9f3f046ecb68a;
    stim[10] = 71'h17bf7813b6b60bc2d7;
    stim[11] = 71'h062306096209997b2d;
    stim[12] = 71'h33a50ab315835c4c1d;
    stim[13] = 71'h1d357edbc7f7d8f9ca;
    stim[14] = 71'h0db1a84b6e84638d28;
    stim[15] = 71'h20dac9402a5f4a0095;
    stim[16] = 71'h087b335bcb4937b1c7;
    stim[17] = 71'h2c216e9519c2f9f3eb;
    stim[18] = 71'h10108ef12263889e7e;
    stim[19] = 71'h329d2807289dcfd90b;
    stim[20] = 71'h2e742286b2784738d2;
    stim[21] = 71'h0eea9b7e742b5e7866;
    stim[22] = 71'h2790ad04c25f6a5ea0;
    stim[23] = 71'h1030e064e2704c7ab2;
    stim[24] = 71'h2a0c6ab390facd751d;
    stim[25] = 71'h0b55c5a2547737557c;
    stim[26] = 71'h385a54b745969713dd;
    stim[27] = 71'h0776f3b4044a9c6ef2;
    stim[28] = 71'h03b32a98ff01d07f44;
    stim[29] = 71'h1ea576d5b25c9d736e;
    stim[30] = 71'h363966649bd563c048;
    stim[31] = 71'h2264940276f8e10a76;
    stim[32] = 71'h216d4fd8182f4419a1;
    stim[33] = 71'h36228b9328518d087d;
    stim[34] = 71'h1200dcc34faff42aed;
    stim[35] = 71'h151344eb063c03d674;
    stim[36] = 71'h1ee7ac2dc8ba2bbdef;
    stim[37] = 71'h1a3d527910a2ec560d;
    stim[38] = 71'h0a9ece69e556954dc9;
    stim[39] = 71'h3d8194630c06f2c961;
    stim[40] = 71'h2739d3a0e85a10bc35;
    stim[41] = 71'h20a36808db815804e4;
    stim[42] = 71'h33c0fbc19d3af6c91f;
    stim[43] = 71'h2749bd7531a28175a0;
    stim[44] = 71'h07eee732cf3bedde0b;
    stim[45] = 71'h2eadd2e7f0e8a79b65;
    stim[46] = 71'h1d1eff1f92d52918fd;
    stim[47] = 71'h1fc3706640fdc759c9;
    stim[48] = 71'h18de83851f2db3b8de;
    stim[49] = 71'h2b73062eb852bea321;
    stim[50] = 71'h32f3ff14045293114c;
    stim[51] = 71'h284f3d018c959fb626;
    stim[52] = 71'h1da2a407b04abf88a5;
    stim[53] = 71'h0c9b92fb4c3a0523c7;
    stim[54] = 71'h238c91b77d0034b667;
    stim[55] = 71'h33cb47d24b9c8aa067;
    stim[56] = 71'h2eb87a6b14d2df096e;
    stim[57] = 71'h27d7e5eb6aadb53ccd;
    stim[58] = 71'h13739a8349228321f4;
    stim[59] = 71'h32af3717b267250316;
    stim[60] = 71'h254b25639b0cbfabdb;
    stim[61] = 71'h32f45d4ff6cc05bb85;
    stim[62] = 71'h38631d85a41777d0a9;
    stim[63] = 71'h0a28e02da54f15dff9;
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
      expv[0] = 2'h0;
      expv[1] = 2'h1;
      expv[2] = 2'h0;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h1;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
