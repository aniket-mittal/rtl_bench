// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_077090 dut (
    .clk(clk),
    .data_in(in_vec[20:6]),
    .lz_pos(in_vec[5:0]),
    .data_out(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0f642a;
    stim[1] = 21'h0655af;
    stim[2] = 21'h1c9150;
    stim[3] = 21'h0e8f10;
    stim[4] = 21'h1afb18;
    stim[5] = 21'h0ab6e2;
    stim[6] = 21'h1131a3;
    stim[7] = 21'h075efb;
    stim[8] = 21'h00985f;
    stim[9] = 21'h018dc5;
    stim[10] = 21'h02743c;
    stim[11] = 21'h01012b;
    stim[12] = 21'h0cb874;
    stim[13] = 21'h1d04de;
    stim[14] = 21'h0ca100;
    stim[15] = 21'h0759fb;
    stim[16] = 21'h1d72d4;
    stim[17] = 21'h08fb1f;
    stim[18] = 21'h0de861;
    stim[19] = 21'h0014d4;
    stim[20] = 21'h099a30;
    stim[21] = 21'h030ae4;
    stim[22] = 21'h1b75ae;
    stim[23] = 21'h17aca3;
    stim[24] = 21'h19d586;
    stim[25] = 21'h0b5356;
    stim[26] = 21'h043b34;
    stim[27] = 21'h039e67;
    stim[28] = 21'h158b4e;
    stim[29] = 21'h13c0bc;
    stim[30] = 21'h08bd2e;
    stim[31] = 21'h1b9de6;
    stim[32] = 21'h0b747c;
    stim[33] = 21'h1798ce;
    stim[34] = 21'h13d188;
    stim[35] = 21'h000cc6;
    stim[36] = 21'h1b2b85;
    stim[37] = 21'h18c0b2;
    stim[38] = 21'h06170f;
    stim[39] = 21'h1cccdb;
    stim[40] = 21'h0813e1;
    stim[41] = 21'h1d322b;
    stim[42] = 21'h0cb17f;
    stim[43] = 21'h10a3ef;
    stim[44] = 21'h1aa001;
    stim[45] = 21'h0ee61e;
    stim[46] = 21'h16361d;
    stim[47] = 21'h188766;
    stim[48] = 21'h02ef1f;
    stim[49] = 21'h0be7bc;
    stim[50] = 21'h147227;
    stim[51] = 21'h1a522a;
    stim[52] = 21'h1701ed;
    stim[53] = 21'h12d28b;
    stim[54] = 21'h1ff6bc;
    stim[55] = 21'h076522;
    stim[56] = 21'h0a6359;
    stim[57] = 21'h0c43bf;
    stim[58] = 21'h0e48a8;
    stim[59] = 21'h1eb0b4;
    stim[60] = 21'h194c35;
    stim[61] = 21'h0eccc3;
    stim[62] = 21'h1de62e;
    stim[63] = 21'h03e2c6;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h04dc;
      expv[3] = 15'h354c;
      expv[4] = 15'h5127;
      expv[5] = 15'h1e2e;
      expv[6] = 15'h1beb;
      expv[7] = 15'h6daa;
      expv[8] = 15'h1191;
      expv[9] = 15'h6f5c;
      expv[10] = 15'h4320;
      expv[11] = 15'h3630;
      expv[12] = 15'h05c8;
      expv[13] = 15'h1010;
      expv[14] = 15'h43a6;
      expv[15] = 15'h6417;
      expv[16] = 15'h10a6;
      expv[17] = 15'h735c;
      expv[18] = 15'h69d7;
      expv[19] = 15'h1be2;
      expv[20] = 15'h42f6;
      expv[21] = 15'h6500;
      expv[22] = 15'h0b32;
      expv[23] = 15'h6a18;
      expv[24] = 15'h35db;
      expv[25] = 15'h26bd;
      expv[26] = 15'h3573;
      expv[27] = 15'h591a;
      expv[28] = 15'h1b84;
      expv[29] = 15'h4f38;
      expv[30] = 15'h1a35;
      expv[31] = 15'h2078;
      expv[32] = 15'h17a2;
      expv[33] = 15'h373b;
      expv[34] = 15'h45da;
      expv[35] = 15'h633d;
      expv[36] = 15'h3179;
      expv[37] = 15'h6600;
      expv[38] = 15'h3a8b;
      expv[39] = 15'h2063;
      expv[40] = 15'h1d0c;
      expv[41] = 15'h6667;
      expv[42] = 15'h7902;
      expv[43] = 15'h0997;
      expv[44] = 15'h51a4;
      expv[45] = 15'h78a1;
      expv[46] = 15'h00ab;
      expv[47] = 15'h0cee;
      expv[48] = 15'h0d8d;
      expv[49] = 15'h5c23;
      expv[50] = 15'h1ee8;
      expv[51] = 15'h3cfa;
      expv[52] = 15'h09c5;
      expv[53] = 15'h094b;
      expv[54] = 15'h701d;
      expv[55] = 15'h2969;
      expv[56] = 15'h2dff;
      expv[57] = 15'h14dc;
      expv[58] = 15'h58ca;
      expv[59] = 15'h3846;
      expv[60] = 15'h220e;
      expv[61] = 15'h212f;
      expv[62] = 15'h0653;
      expv[63] = 15'h666e;
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
