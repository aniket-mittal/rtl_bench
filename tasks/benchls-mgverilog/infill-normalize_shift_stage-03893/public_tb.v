// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03893 dut (
    .clk(clk),
    .rst(in_vec[28:28]),
    .arg_0(in_vec[27:12]),
    .arg_1(in_vec[11:11]),
    .arg_2(in_vec[10:10]),
    .arg_3(in_vec[9:2]),
    .arg_4(in_vec[1:1]),
    .arg_5(in_vec[0:0]),
    .ret_0(out_vec[27:13]),
    .ret_1(out_vec[12:12]),
    .ret_2(out_vec[11:11]),
    .ret_3(out_vec[10:3]),
    .ret_4(out_vec[2:2]),
    .ret_5(out_vec[1:1]),
    .ret_6(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1a445c4f;
    stim[1] = 29'h1500722b;
    stim[2] = 29'h05f52b8c;
    stim[3] = 29'h00711426;
    stim[4] = 29'h09a72a9f;
    stim[5] = 29'h00eec58b;
    stim[6] = 29'h04aa7786;
    stim[7] = 29'h0e4971c9;
    stim[8] = 29'h0b59a063;
    stim[9] = 29'h01080e1d;
    stim[10] = 29'h0bbf0b2a;
    stim[11] = 29'h0537971f;
    stim[12] = 29'h0b604c70;
    stim[13] = 29'h0f224bd7;
    stim[14] = 29'h01b3d300;
    stim[15] = 29'h05f151b0;
    stim[16] = 29'h0f38c62a;
    stim[17] = 29'h002da529;
    stim[18] = 29'h0da1f14d;
    stim[19] = 29'h092282ae;
    stim[20] = 29'h0e4e02ed;
    stim[21] = 29'h0d4ec41a;
    stim[22] = 29'h0e456c15;
    stim[23] = 29'h045a2749;
    stim[24] = 29'h0fe9e7df;
    stim[25] = 29'h0beff8f2;
    stim[26] = 29'h0e356ca9;
    stim[27] = 29'h0c1d48c2;
    stim[28] = 29'h09346dd0;
    stim[29] = 29'h08d6bdcc;
    stim[30] = 29'h09ac2078;
    stim[31] = 29'h09f5a8ed;
    stim[32] = 29'h079c8fd5;
    stim[33] = 29'h09c01d5a;
    stim[34] = 29'h094ffc18;
    stim[35] = 29'h061f4427;
    stim[36] = 29'h05be8333;
    stim[37] = 29'h06ae76da;
    stim[38] = 29'h0f2bb3f4;
    stim[39] = 29'h04dea145;
    stim[40] = 29'h0527a546;
    stim[41] = 29'h05a2b510;
    stim[42] = 29'h0a1785a6;
    stim[43] = 29'h07a619f1;
    stim[44] = 29'h017db075;
    stim[45] = 29'h0cdbed34;
    stim[46] = 29'h012acd3e;
    stim[47] = 29'h07aaff34;
    stim[48] = 29'h0d3d711a;
    stim[49] = 29'h074dd67b;
    stim[50] = 29'h03ce0135;
    stim[51] = 29'h088b8801;
    stim[52] = 29'h004c93d0;
    stim[53] = 29'h03e44db0;
    stim[54] = 29'h0d606628;
    stim[55] = 29'h0c14cd6f;
    stim[56] = 29'h0f4decac;
    stim[57] = 29'h0e5f2bbd;
    stim[58] = 29'h0a8b1e43;
    stim[59] = 29'h083cdb5b;
    stim[60] = 29'h021e2328;
    stim[61] = 29'h068089cd;
    stim[62] = 29'h03ade49d;
    stim[63] = 29'h0e7dbb5b;
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
      expv[0] = 28'ha4458a3;
      expv[1] = 28'ha00e453;
      expv[2] = 28'hbea5718;
      expv[3] = 28'hf1de84e;
      expv[4] = 28'h9a73543;
      expv[5] = 28'h1dd8b13;
      expv[6] = 28'h6ab2f0e;
      expv[7] = 28'hc92e391;
      expv[8] = 28'hb59a0cb;
      expv[9] = 28'hdf01c3d;
      expv[10] = 28'h77e1652;
      expv[11] = 28'ha6f2e3b;
      expv[12] = 28'hb6058e8;
      expv[13] = 28'hf2257b3;
      expv[14] = 28'h367a600;
      expv[15] = 28'hbe2a360;
      expv[16] = 28'he718c52;
      expv[17] = 28'hfa4ca55;
      expv[18] = 28'hb43e299;
      expv[19] = 28'h245055a;
      expv[20] = 28'hc9c05d9;
      expv[21] = 28'ha9d8832;
      expv[22] = 28'hc8ad829;
      expv[23] = 28'h74bce95;
      expv[24] = 28'hfe9efc3;
      expv[25] = 28'h7dff1e2;
      expv[26] = 28'hc6ad951;
      expv[27] = 28'h83a9182;
      expv[28] = 28'h9347ba8;
      expv[29] = 28'h8d6bba0;
      expv[30] = 28'h9ac20f8;
      expv[31] = 28'h3eb51d9;
      expv[32] = 28'h0c71fad;
      expv[33] = 28'h3803ab2;
      expv[34] = 28'h94ff838;
      expv[35] = 28'hc3e884b;
      expv[36] = 28'hb7d0663;
      expv[37] = 28'h2a32db6;
      expv[38] = 28'hf2ba7f0;
      expv[39] = 28'h642c28d;
      expv[40] = 28'h5b0ca8e;
      expv[41] = 28'hb456a20;
      expv[42] = 28'h42f0b4a;
      expv[43] = 28'h0b3f3e5;
      expv[44] = 28'hd04a0ed;
      expv[45] = 28'hcdbfa70;
      expv[46] = 28'hdaa9a7e;
      expv[47] = 28'hf55fe68;
      expv[48] = 28'ha7ae232;
      expv[49] = 28'he9bacf3;
      expv[50] = 28'h864026d;
      expv[51] = 28'h1171001;
      expv[52] = 28'h09927a0;
      expv[53] = 28'h7c89b60;
      expv[54] = 28'hd606c58;
      expv[55] = 28'hc14dae3;
      expv[56] = 28'hf4df960;
      expv[57] = 28'hcbe5779;
      expv[58] = 28'ha8b1c8b;
      expv[59] = 28'h83cd6bb;
      expv[60] = 28'h43c4650;
      expv[61] = 28'h2ff139d;
      expv[62] = 28'h8a4493d;
      expv[63] = 28'he7db6bb;
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
