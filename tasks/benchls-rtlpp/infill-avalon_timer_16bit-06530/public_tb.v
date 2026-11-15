// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06530 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h051911;
    stim[1] = 22'h249207;
    stim[2] = 22'h3fbdb1;
    stim[3] = 22'h1785af;
    stim[4] = 22'h072ce3;
    stim[5] = 22'h12c3df;
    stim[6] = 22'h073938;
    stim[7] = 22'h276787;
    stim[8] = 22'h1e4b52;
    stim[9] = 22'h169ed6;
    stim[10] = 22'h3fb036;
    stim[11] = 22'h32a9b5;
    stim[12] = 22'h33bd2e;
    stim[13] = 22'h064583;
    stim[14] = 22'h27cf95;
    stim[15] = 22'h0e18e1;
    stim[16] = 22'h2bdfe6;
    stim[17] = 22'h3e693e;
    stim[18] = 22'h1f37c4;
    stim[19] = 22'h3a6a57;
    stim[20] = 22'h07275b;
    stim[21] = 22'h0b7ad1;
    stim[22] = 22'h0a1199;
    stim[23] = 22'h1e884c;
    stim[24] = 22'h3afccb;
    stim[25] = 22'h167ce6;
    stim[26] = 22'h0a00d0;
    stim[27] = 22'h3bc9aa;
    stim[28] = 22'h0a0eba;
    stim[29] = 22'h266b43;
    stim[30] = 22'h3ae5c3;
    stim[31] = 22'h0b76f9;
    stim[32] = 22'h0b2081;
    stim[33] = 22'h07f143;
    stim[34] = 22'h2f7a4b;
    stim[35] = 22'h078f9f;
    stim[36] = 22'h2ffa84;
    stim[37] = 22'h2726e0;
    stim[38] = 22'h0b1437;
    stim[39] = 22'h1b420c;
    stim[40] = 22'h1e52f4;
    stim[41] = 22'h072652;
    stim[42] = 22'h0aa6a6;
    stim[43] = 22'h0f32af;
    stim[44] = 22'h07f147;
    stim[45] = 22'h24e24e;
    stim[46] = 22'h1e9a44;
    stim[47] = 22'h1766fa;
    stim[48] = 22'h1634ae;
    stim[49] = 22'h0a6633;
    stim[50] = 22'h0b40db;
    stim[51] = 22'h1780a4;
    stim[52] = 22'h3e08d7;
    stim[53] = 22'h02ab70;
    stim[54] = 22'h16f92a;
    stim[55] = 22'h1e402a;
    stim[56] = 22'h2b6e5a;
    stim[57] = 22'h1e4b51;
    stim[58] = 22'h1e0f73;
    stim[59] = 22'h1fbe92;
    stim[60] = 22'h167255;
    stim[61] = 22'h23843b;
    stim[62] = 22'h02a709;
    stim[63] = 22'h11885f;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0f07f;
      expv[5] = 17'h00000;
      expv[6] = 17'h0f07f;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h002fa;
      expv[10] = 17'h0f07f;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h04b52;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00001;
      expv[23] = 17'h00001;
      expv[24] = 17'h04b52;
      expv[25] = 17'h00000;
      expv[26] = 17'h09ed6;
      expv[27] = 17'h00001;
      expv[28] = 17'h00000;
      expv[29] = 17'h00001;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00001;
      expv[33] = 17'h00001;
      expv[34] = 17'h00000;
      expv[35] = 17'h0884c;
      expv[36] = 17'h00000;
      expv[37] = 17'h0884c;
      expv[38] = 17'h07ce6;
      expv[39] = 17'h00001;
      expv[40] = 17'h0884c;
      expv[41] = 17'h0884c;
      expv[42] = 17'h00000;
      expv[43] = 17'h00001;
      expv[44] = 17'h00001;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h002fa;
      expv[48] = 17'h0f07f;
      expv[49] = 17'h0f07f;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h034ae;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h034ae;
      expv[56] = 17'h09a44;
      expv[57] = 17'h00000;
      expv[58] = 17'h0402a;
      expv[59] = 17'h04b51;
      expv[60] = 17'h00f73;
      expv[61] = 17'h0f92a;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
