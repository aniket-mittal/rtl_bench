// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09515 dut (
    .clk(clk),
    .input_port(in_vec[17:2]),
    .ce(in_vec[1:1]),
    .clr(in_vec[0:0]),
    .output_port(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3e2a9;
    stim[1] = 18'h23dde;
    stim[2] = 18'h20acc;
    stim[3] = 18'h2eb3b;
    stim[4] = 18'h34979;
    stim[5] = 18'h3b296;
    stim[6] = 18'h1d64d;
    stim[7] = 18'h1767b;
    stim[8] = 18'h3df9f;
    stim[9] = 18'h1abeb;
    stim[10] = 18'h29996;
    stim[11] = 18'h16341;
    stim[12] = 18'h21ab9;
    stim[13] = 18'h22356;
    stim[14] = 18'h32a26;
    stim[15] = 18'h1c607;
    stim[16] = 18'h03e1d;
    stim[17] = 18'h1163e;
    stim[18] = 18'h22ea9;
    stim[19] = 18'h022be;
    stim[20] = 18'h38505;
    stim[21] = 18'h239fc;
    stim[22] = 18'h3479b;
    stim[23] = 18'h22ea5;
    stim[24] = 18'h37ff9;
    stim[25] = 18'h2c1b4;
    stim[26] = 18'h050f9;
    stim[27] = 18'h07f2f;
    stim[28] = 18'h29933;
    stim[29] = 18'h1525e;
    stim[30] = 18'h2fb0b;
    stim[31] = 18'h0430d;
    stim[32] = 18'h1a52c;
    stim[33] = 18'h2ae09;
    stim[34] = 18'h3bdb0;
    stim[35] = 18'h348dc;
    stim[36] = 18'h2fdf9;
    stim[37] = 18'h14dc1;
    stim[38] = 18'h20d04;
    stim[39] = 18'h1eba4;
    stim[40] = 18'h0e117;
    stim[41] = 18'h0e058;
    stim[42] = 18'h37b75;
    stim[43] = 18'h28d53;
    stim[44] = 18'h1278d;
    stim[45] = 18'h173d9;
    stim[46] = 18'h39a0a;
    stim[47] = 18'h3b88c;
    stim[48] = 18'h2735d;
    stim[49] = 18'h176af;
    stim[50] = 18'h38ffa;
    stim[51] = 18'h1b5c4;
    stim[52] = 18'h1c6cb;
    stim[53] = 18'h3ff1b;
    stim[54] = 18'h3a3cc;
    stim[55] = 18'h1e13a;
    stim[56] = 18'h272ab;
    stim[57] = 18'h0885a;
    stim[58] = 18'h36f94;
    stim[59] = 18'h360ef;
    stim[60] = 18'h2235b;
    stim[61] = 18'h1e2b9;
    stim[62] = 18'h0f1a4;
    stim[63] = 18'h231a1;
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
      expv[0] = 16'hf8aa;
      expv[1] = 16'h8f77;
      expv[2] = 16'h82b3;
      expv[3] = 16'hbace;
      expv[4] = 16'hd25e;
      expv[5] = 16'heca5;
      expv[6] = 16'h7593;
      expv[7] = 16'h5d9e;
      expv[8] = 16'hf7e7;
      expv[9] = 16'h6afa;
      expv[10] = 16'ha665;
      expv[11] = 16'h58d0;
      expv[12] = 16'h86ae;
      expv[13] = 16'h88d5;
      expv[14] = 16'hca89;
      expv[15] = 16'h7181;
      expv[16] = 16'h0f87;
      expv[17] = 16'h458f;
      expv[18] = 16'h8baa;
      expv[19] = 16'h08af;
      expv[20] = 16'he141;
      expv[21] = 16'h8e7f;
      expv[22] = 16'hd1e6;
      expv[23] = 16'h8ba9;
      expv[24] = 16'hdffe;
      expv[25] = 16'hb06d;
      expv[26] = 16'h143e;
      expv[27] = 16'h1fcb;
      expv[28] = 16'ha64c;
      expv[29] = 16'h5497;
      expv[30] = 16'hbec2;
      expv[31] = 16'h10c3;
      expv[32] = 16'h694b;
      expv[33] = 16'hab82;
      expv[34] = 16'hef6c;
      expv[35] = 16'hd237;
      expv[36] = 16'hbf7e;
      expv[37] = 16'h5370;
      expv[38] = 16'h8341;
      expv[39] = 16'h7ae9;
      expv[40] = 16'h3845;
      expv[41] = 16'h3816;
      expv[42] = 16'hdedd;
      expv[43] = 16'ha354;
      expv[44] = 16'h49e3;
      expv[45] = 16'h5cf6;
      expv[46] = 16'he682;
      expv[47] = 16'hee23;
      expv[48] = 16'h9cd7;
      expv[49] = 16'h5dab;
      expv[50] = 16'he3fe;
      expv[51] = 16'h6d71;
      expv[52] = 16'h71b2;
      expv[53] = 16'hffc6;
      expv[54] = 16'he8f3;
      expv[55] = 16'h784e;
      expv[56] = 16'h9caa;
      expv[57] = 16'h2216;
      expv[58] = 16'hdbe5;
      expv[59] = 16'hd83b;
      expv[60] = 16'h88d6;
      expv[61] = 16'h78ae;
      expv[62] = 16'h3c69;
      expv[63] = 16'h8c68;
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
