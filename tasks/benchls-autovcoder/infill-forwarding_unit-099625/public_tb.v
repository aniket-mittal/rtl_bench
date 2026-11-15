// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099625 dut (
    .regwrite_WB(in_vec[15:15]),
    .wa_WB(in_vec[14:10]),
    .ra1_EX(in_vec[9:5]),
    .ra2_EX(in_vec[4:0]),
    .forwardA(out_vec[1:1]),
    .forwardB(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h50ed;
    stim[1] = 16'hc9ef;
    stim[2] = 16'ha95a;
    stim[3] = 16'hd695;
    stim[4] = 16'h5171;
    stim[5] = 16'hd260;
    stim[6] = 16'h100a;
    stim[7] = 16'h19a2;
    stim[8] = 16'hab05;
    stim[9] = 16'hf5ff;
    stim[10] = 16'h8aea;
    stim[11] = 16'h48f1;
    stim[12] = 16'h8a5c;
    stim[13] = 16'h6976;
    stim[14] = 16'h36cc;
    stim[15] = 16'hf1dd;
    stim[16] = 16'h14d1;
    stim[17] = 16'hb85b;
    stim[18] = 16'h6fb4;
    stim[19] = 16'h3812;
    stim[20] = 16'h2237;
    stim[21] = 16'h49ac;
    stim[22] = 16'h71ad;
    stim[23] = 16'haf3c;
    stim[24] = 16'hdea9;
    stim[25] = 16'hb262;
    stim[26] = 16'h9545;
    stim[27] = 16'h083b;
    stim[28] = 16'h4b87;
    stim[29] = 16'h3c8f;
    stim[30] = 16'hddb7;
    stim[31] = 16'h6e41;
    stim[32] = 16'hcae2;
    stim[33] = 16'h689f;
    stim[34] = 16'h69b6;
    stim[35] = 16'h2dee;
    stim[36] = 16'h5a12;
    stim[37] = 16'h547d;
    stim[38] = 16'hfd56;
    stim[39] = 16'hc42e;
    stim[40] = 16'h5baf;
    stim[41] = 16'hdbc4;
    stim[42] = 16'h3731;
    stim[43] = 16'h0045;
    stim[44] = 16'h8cb0;
    stim[45] = 16'h9a07;
    stim[46] = 16'h1702;
    stim[47] = 16'h2047;
    stim[48] = 16'hffb0;
    stim[49] = 16'hea9e;
    stim[50] = 16'hf3a3;
    stim[51] = 16'hba67;
    stim[52] = 16'ha146;
    stim[53] = 16'h5343;
    stim[54] = 16'h99d0;
    stim[55] = 16'h6fec;
    stim[56] = 16'h6da0;
    stim[57] = 16'hcf14;
    stim[58] = 16'hc651;
    stim[59] = 16'h4544;
    stim[60] = 16'hde75;
    stim[61] = 16'h120d;
    stim[62] = 16'h985e;
    stim[63] = 16'h6172;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h2;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h1;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
