// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052723 dut (
    .A(in_vec[32:17]),
    .B(in_vec[16:1]),
    .C_in(in_vec[0:0]),
    .S(out_vec[17:2]),
    .C_out(out_vec[1:1]),
    .OF(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h09d6dd1c8;
    stim[1] = 33'h186377ad3;
    stim[2] = 33'h01279b01b;
    stim[3] = 33'h10595ed0d;
    stim[4] = 33'h15fc4639d;
    stim[5] = 33'h181d46161;
    stim[6] = 33'h02bed860e;
    stim[7] = 33'h01156b5c5;
    stim[8] = 33'h101a78c87;
    stim[9] = 33'h0d88b18f8;
    stim[10] = 33'h0a30f2a8c;
    stim[11] = 33'h1a90b75ca;
    stim[12] = 33'h16b2ee006;
    stim[13] = 33'h194909393;
    stim[14] = 33'h0adfda24c;
    stim[15] = 33'h0d6d785af;
    stim[16] = 33'h071a1cd4a;
    stim[17] = 33'h12eb468d1;
    stim[18] = 33'h15bfd4774;
    stim[19] = 33'h1c87b151a;
    stim[20] = 33'h1cfa36cb5;
    stim[21] = 33'h19335f31b;
    stim[22] = 33'h03497d2a4;
    stim[23] = 33'h0a1e297d5;
    stim[24] = 33'h0b12054cc;
    stim[25] = 33'h0ce58d4ef;
    stim[26] = 33'h189a6c028;
    stim[27] = 33'h1c61731ff;
    stim[28] = 33'h0950e391d;
    stim[29] = 33'h1ed733142;
    stim[30] = 33'h1b9e40b65;
    stim[31] = 33'h14db3b87e;
    stim[32] = 33'h0de39677d;
    stim[33] = 33'h0e2808c20;
    stim[34] = 33'h042b7368b;
    stim[35] = 33'h061028293;
    stim[36] = 33'h0636286c3;
    stim[37] = 33'h121a37a3d;
    stim[38] = 33'h0a0e4fc33;
    stim[39] = 33'h0511548d7;
    stim[40] = 33'h1cbeeb23d;
    stim[41] = 33'h0178b8e7a;
    stim[42] = 33'h00e7a8e24;
    stim[43] = 33'h09c489eab;
    stim[44] = 33'h1534fe1cd;
    stim[45] = 33'h15a551d8c;
    stim[46] = 33'h0b5fa2f2b;
    stim[47] = 33'h1b59eaeca;
    stim[48] = 33'h0d2a270ff;
    stim[49] = 33'h09d40712b;
    stim[50] = 33'h1be3aaa91;
    stim[51] = 33'h0cfd9f8a5;
    stim[52] = 33'h05c615c12;
    stim[53] = 33'h12993c303;
    stim[54] = 33'h0957b2975;
    stim[55] = 33'h0f0af9bbe;
    stim[56] = 33'h16c8595da;
    stim[57] = 33'h024ee69fc;
    stim[58] = 33'h12f140972;
    stim[59] = 33'h06acc5e12;
    stim[60] = 33'h15b1b300b;
    stim[61] = 33'h05611d182;
    stim[62] = 33'h0402dd454;
    stim[63] = 33'h101bc22f3;
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
      expv[0] = 18'h0de6b;
      expv[1] = 18'h3e93b;
      expv[2] = 18'h33b44;
      expv[3] = 18'h1cef0;
      expv[4] = 18'h207b2;
      expv[5] = 18'h1bf1b;
      expv[6] = 18'h363f4;
      expv[7] = 18'h148dc;
      expv[8] = 18'h115c0;
      expv[9] = 18'h3e304;
      expv[10] = 18'h39b34;
      expv[11] = 18'h23daa;
      expv[12] = 18'h0966a;
      expv[13] = 18'h1fe06;
      expv[14] = 18'h0a093;
      expv[15] = 18'h15db0;
      expv[16] = 18'h07dd6;
      expv[17] = 18'h2743a;
      expv[18] = 18'h146e3;
      expv[19] = 18'h1bb2a;
      expv[20] = 18'h33a27;
      expv[21] = 18'h0bfcc;
      expv[22] = 18'h00e76;
      expv[23] = 18'h3ebe6;
      expv[24] = 18'h20bd8;
      expv[25] = 18'h00d2c;
      expv[26] = 18'h0939f;
      expv[27] = 18'h2d7d2;
      expv[28] = 18'h3481f;
      expv[29] = 18'h23d6a;
      expv[30] = 18'h0a302;
      expv[31] = 18'h20c62;
      expv[32] = 18'h11289;
      expv[33] = 18'h2dd41;
      expv[34] = 18'h1e7a8;
      expv[35] = 18'h04321;
      expv[36] = 18'h046c1;
      expv[37] = 18'h0b134;
      expv[38] = 18'h0b69c;
      expv[39] = 18'h1ef84;
      expv[40] = 18'h1cc9e;
      expv[41] = 18'h34c08;
      expv[42] = 18'h1393c;
      expv[43] = 18'h004c4;
      expv[44] = 18'h11cfc;
      expv[45] = 18'h0efc2;
      expv[46] = 18'h2f262;
      expv[47] = 18'h0c8d3;
      expv[48] = 18'h33cbb;
      expv[49] = 18'h3a7d7;
      expv[50] = 18'h1d8ae;
      expv[51] = 18'h25198;
      expv[52] = 18'h370e5;
      expv[53] = 18'h132e0;
      expv[54] = 18'h127f5;
      expv[55] = 18'h118da;
      expv[56] = 18'h204be;
      expv[57] = 18'h11dd5;
      expv[58] = 18'h2710c;
      expv[59] = 18'h191bd;
      expv[60] = 18'h3a9e2;
      expv[61] = 18'h04f26;
      expv[62] = 18'h02902;
      expv[63] = 18'h2426e;
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
