// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103359 dut (
    .clk_sys(clk),
    .clk_vid(in_vec[49:49]),
    .ce_pix(in_vec[48:48]),
    .gamma_en(in_vec[47:47]),
    .gamma_wr(in_vec[46:46]),
    .gamma_wr_addr(in_vec[45:36]),
    .gamma_value(in_vec[35:28]),
    .RGB_in(in_vec[27:4]),
    .HSync(in_vec[3:3]),
    .VSync(in_vec[2:2]),
    .DE(in_vec[1:1]),
    .Blanking(in_vec[0:0]),
    .RGB_out(out_vec[27:4]),
    .HSync_out(out_vec[3:3]),
    .VSync_out(out_vec[2:2]),
    .DE_out(out_vec[1:1]),
    .Blanking_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h005b70bbee738;
    stim[1] = 50'h1a4c4cefd433b;
    stim[2] = 50'h37f52fb2e17eb;
    stim[3] = 50'h3ea43fb0e6688;
    stim[4] = 50'h2412a52912ff1;
    stim[5] = 50'h3b3996f0a388d;
    stim[6] = 50'h194cddf87fcd1;
    stim[7] = 50'h2726547fd9ae2;
    stim[8] = 50'h23bbb0e1b8f7f;
    stim[9] = 50'h239b34cbebf45;
    stim[10] = 50'h3512075e9ba52;
    stim[11] = 50'h2ab160fb4beb4;
    stim[12] = 50'h0abf74aa17dbc;
    stim[13] = 50'h0d820f538bb66;
    stim[14] = 50'h3d6571746258c;
    stim[15] = 50'h025ed87033371;
    stim[16] = 50'h2e24316f968af;
    stim[17] = 50'h3dcb96b87aa60;
    stim[18] = 50'h379a343f6da57;
    stim[19] = 50'h0a6e9e56818f0;
    stim[20] = 50'h3ab5998a9784e;
    stim[21] = 50'h383ef2de89af2;
    stim[22] = 50'h07002c0d6063b;
    stim[23] = 50'h19cd7e266a66e;
    stim[24] = 50'h26deab0daeb5c;
    stim[25] = 50'h34608987780ca;
    stim[26] = 50'h2be98daee703a;
    stim[27] = 50'h164aa9c4d9533;
    stim[28] = 50'h064260a4e5b59;
    stim[29] = 50'h081c59cc8b91d;
    stim[30] = 50'h237503e18dc40;
    stim[31] = 50'h102b13b5616b4;
    stim[32] = 50'h2f5355b3e3bb7;
    stim[33] = 50'h2b5ea01f20538;
    stim[34] = 50'h0cb0fe2226aae;
    stim[35] = 50'h22f35712dfcb6;
    stim[36] = 50'h34b1ac0b9aa57;
    stim[37] = 50'h29b8a60615c77;
    stim[38] = 50'h21de19d741487;
    stim[39] = 50'h1f600b9d8bb23;
    stim[40] = 50'h280b330eca9f0;
    stim[41] = 50'h26e88b6753869;
    stim[42] = 50'h3f1ce44173db0;
    stim[43] = 50'h01be49c74c212;
    stim[44] = 50'h2684efc03f00f;
    stim[45] = 50'h2f767165de914;
    stim[46] = 50'h23c565a54fccc;
    stim[47] = 50'h14977fdb1becd;
    stim[48] = 50'h1b1a5e362da9b;
    stim[49] = 50'h2aee6f0701678;
    stim[50] = 50'h2c92f64109848;
    stim[51] = 50'h0d1d749974350;
    stim[52] = 50'h2f359c8f9ef93;
    stim[53] = 50'h0e2d66339549b;
    stim[54] = 50'h3ab28163bff4f;
    stim[55] = 50'h140eb1ad41790;
    stim[56] = 50'h2ce264d852609;
    stim[57] = 50'h37985255ce119;
    stim[58] = 50'h25f984daa95d5;
    stim[59] = 50'h112f57f8c45bf;
    stim[60] = 50'h3fc7d4dad8ecd;
    stim[61] = 50'h18c362ea4b2dd;
    stim[62] = 50'h2348e69ab86ee;
    stim[63] = 50'h1ff5418d0b2a9;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'hxxxxxxx;
      expv[2] = 28'hxxxxxxx;
      expv[3] = 28'hxxxxxxx;
      expv[4] = 28'hxxxxxxx;
      expv[5] = 28'hxxxxxxx;
      expv[6] = 28'hxxxxxxx;
      expv[7] = 28'hxxxxxxx;
      expv[8] = 28'hxxxxxxx;
      expv[9] = 28'hxxxxxxx;
      expv[10] = 28'hxxxxxxx;
      expv[11] = 28'hxxxxxxx;
      expv[12] = 28'hxxxxxxx;
      expv[13] = 28'hxxxxxxx;
      expv[14] = 28'hxxxxxxx;
      expv[15] = 28'hxxxxxxx;
      expv[16] = 28'hxxxxxxx;
      expv[17] = 28'hxxxxxxx;
      expv[18] = 28'hxxxxxxx;
      expv[19] = 28'hxxxxxxx;
      expv[20] = 28'hxxe17eb;
      expv[21] = 28'hxxe17eb;
      expv[22] = 28'hxxe17eb;
      expv[23] = 28'hxxe17eb;
      expv[24] = 28'hxxe17eb;
      expv[25] = 28'hxxe17eb;
      expv[26] = 28'hxxe17eb;
      expv[27] = 28'hxxe17eb;
      expv[28] = 28'hxxe17eb;
      expv[29] = 28'hxxe17eb;
      expv[30] = 28'hxxe17eb;
      expv[31] = 28'hxxe17eb;
      expv[32] = 28'hxxe17eb;
      expv[33] = 28'hxxe17eb;
      expv[34] = 28'hxxe17eb;
      expv[35] = 28'hxxe17eb;
      expv[36] = 28'hxxe17eb;
      expv[37] = 28'hxxe17eb;
      expv[38] = 28'hxxe17eb;
      expv[39] = 28'hxxe17eb;
      expv[40] = 28'hxxe17eb;
      expv[41] = 28'hxxe17eb;
      expv[42] = 28'hxxe17eb;
      expv[43] = 28'hxxe17eb;
      expv[44] = 28'hxxe17eb;
      expv[45] = 28'hxxe17eb;
      expv[46] = 28'hxxe17eb;
      expv[47] = 28'hxxe17eb;
      expv[48] = 28'hxxe17eb;
      expv[49] = 28'hxxe17eb;
      expv[50] = 28'hxxe17eb;
      expv[51] = 28'hxxe17eb;
      expv[52] = 28'hxxe17eb;
      expv[53] = 28'hxxe17eb;
      expv[54] = 28'hxx6258c;
      expv[55] = 28'hxx6258c;
      expv[56] = 28'hxx6258c;
      expv[57] = 28'hxx6258c;
      expv[58] = 28'hxx6258c;
      expv[59] = 28'hxx6258c;
      expv[60] = 28'hxx9784e;
      expv[61] = 28'hxx9784e;
      expv[62] = 28'hxx9784e;
      expv[63] = 28'hxx9784e;
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
