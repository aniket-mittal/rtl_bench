// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136848 dut (
    .A(in_vec[38:23]),
    .B(in_vec[22:7]),
    .Cin(in_vec[6:6]),
    .data(in_vec[5:2]),
    .shift(in_vec[1:0]),
    .final_output(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h2974e1160a;
    stim[1] = 39'h76ae027ba5;
    stim[2] = 39'h4bb1c6fffb;
    stim[3] = 39'h019bdcd121;
    stim[4] = 39'h14f31276c4;
    stim[5] = 39'h077ff6c025;
    stim[6] = 39'h076647b42a;
    stim[7] = 39'h020b80afb9;
    stim[8] = 39'h036058cbdd;
    stim[9] = 39'h1bef2b0976;
    stim[10] = 39'h488f92424e;
    stim[11] = 39'h33146cb63e;
    stim[12] = 39'h3ce2655d98;
    stim[13] = 39'h1a8a3a20da;
    stim[14] = 39'h31d5af5c93;
    stim[15] = 39'h1e1cbbd3e4;
    stim[16] = 39'h191e0fdb3a;
    stim[17] = 39'h4abefb5cb3;
    stim[18] = 39'h0abdcfe788;
    stim[19] = 39'h61d4bbdc1c;
    stim[20] = 39'h25f8958bba;
    stim[21] = 39'h3d60399358;
    stim[22] = 39'h37600a1dc1;
    stim[23] = 39'h4936fb01bc;
    stim[24] = 39'h7ca2605ee3;
    stim[25] = 39'h73fa2ebd6d;
    stim[26] = 39'h5ca9caecb1;
    stim[27] = 39'h5e00126c10;
    stim[28] = 39'h212bfa09d5;
    stim[29] = 39'h51f0d2124a;
    stim[30] = 39'h21421f4eba;
    stim[31] = 39'h7ed56542ef;
    stim[32] = 39'h29fbb99c93;
    stim[33] = 39'h6b641c04ed;
    stim[34] = 39'h47013baee6;
    stim[35] = 39'h2b8371834c;
    stim[36] = 39'h0c41c1e92c;
    stim[37] = 39'h038e903e77;
    stim[38] = 39'h2351bf852b;
    stim[39] = 39'h53fd563356;
    stim[40] = 39'h15b1de230c;
    stim[41] = 39'h679ea95d81;
    stim[42] = 39'h091c2e342f;
    stim[43] = 39'h5c9cc3ffd8;
    stim[44] = 39'h22075ffb62;
    stim[45] = 39'h07df7a9970;
    stim[46] = 39'h35a677426f;
    stim[47] = 39'h5a0bedca35;
    stim[48] = 39'h3f40d24e81;
    stim[49] = 39'h2302bc791c;
    stim[50] = 39'h7f67b44a85;
    stim[51] = 39'h6bbb37c7c0;
    stim[52] = 39'h659fe2d39d;
    stim[53] = 39'h4c07ab08c8;
    stim[54] = 39'h778410d4b3;
    stim[55] = 39'h476c53e431;
    stim[56] = 39'h58d0d359df;
    stim[57] = 39'h62ce2df4eb;
    stim[58] = 39'h5becc05c43;
    stim[59] = 39'h1dc129f6ef;
    stim[60] = 39'h2a2e2ffa42;
    stim[61] = 39'h308a60ebca;
    stim[62] = 39'h1c896ba75d;
    stim[63] = 39'h18b9f442f4;
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
      expv[0] = 4'h8;
      expv[1] = 4'h4;
      expv[2] = 4'hd;
      expv[3] = 4'hc;
      expv[4] = 4'h1;
      expv[5] = 4'h4;
      expv[6] = 4'h6;
      expv[7] = 4'h7;
      expv[8] = 4'h5;
      expv[9] = 4'h9;
      expv[10] = 4'h4;
      expv[11] = 4'hf;
      expv[12] = 4'h6;
      expv[13] = 4'h7;
      expv[14] = 4'h8;
      expv[15] = 4'h7;
      expv[16] = 4'hb;
      expv[17] = 4'h7;
      expv[18] = 4'he;
      expv[19] = 4'h7;
      expv[20] = 4'hb;
      expv[21] = 4'ha;
      expv[22] = 4'h0;
      expv[23] = 4'h1;
      expv[24] = 4'hf;
      expv[25] = 4'hd;
      expv[26] = 4'h6;
      expv[27] = 4'hc;
      expv[28] = 4'ha;
      expv[29] = 4'h8;
      expv[30] = 4'h5;
      expv[31] = 4'h9;
      expv[32] = 4'h8;
      expv[33] = 4'hd;
      expv[34] = 4'h6;
      expv[35] = 4'h3;
      expv[36] = 4'h5;
      expv[37] = 4'hb;
      expv[38] = 4'hb;
      expv[39] = 4'h5;
      expv[40] = 4'hd;
      expv[41] = 4'h0;
      expv[42] = 4'h7;
      expv[43] = 4'h6;
      expv[44] = 4'h2;
      expv[45] = 4'hc;
      expv[46] = 4'h7;
      expv[47] = 4'h2;
      expv[48] = 4'h0;
      expv[49] = 4'h9;
      expv[50] = 4'h8;
      expv[51] = 4'h0;
      expv[52] = 4'h5;
      expv[53] = 4'he;
      expv[54] = 4'h9;
      expv[55] = 4'h6;
      expv[56] = 4'he;
      expv[57] = 4'h5;
      expv[58] = 4'h0;
      expv[59] = 4'h9;
      expv[60] = 4'h0;
      expv[61] = 4'h8;
      expv[62] = 4'hb;
      expv[63] = 4'hd;
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
