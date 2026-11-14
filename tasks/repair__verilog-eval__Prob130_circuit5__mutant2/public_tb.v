// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[19:16]),
    .b(in_vec[15:12]),
    .c(in_vec[11:8]),
    .d(in_vec[7:4]),
    .e(in_vec[3:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hcb9f4;
    stim[1] = 20'ha386b;
    stim[2] = 20'he69f1;
    stim[3] = 20'h8d642;
    stim[4] = 20'haf489;
    stim[5] = 20'h36f86;
    stim[6] = 20'h23bf6;
    stim[7] = 20'h4babb;
    stim[8] = 20'h9c29b;
    stim[9] = 20'haf200;
    stim[10] = 20'hd7572;
    stim[11] = 20'h7c61d;
    stim[12] = 20'ha51b2;
    stim[13] = 20'h83736;
    stim[14] = 20'h2678c;
    stim[15] = 20'h7f0b6;
    stim[16] = 20'hff81b;
    stim[17] = 20'h5d69e;
    stim[18] = 20'h962d7;
    stim[19] = 20'hb62a4;
    stim[20] = 20'h197cc;
    stim[21] = 20'h11797;
    stim[22] = 20'hd8878;
    stim[23] = 20'hf7c93;
    stim[24] = 20'h0c008;
    stim[25] = 20'h16d1b;
    stim[26] = 20'hd0c57;
    stim[27] = 20'h07c1b;
    stim[28] = 20'h46e35;
    stim[29] = 20'hc7ecb;
    stim[30] = 20'h59bfc;
    stim[31] = 20'h25a6e;
    stim[32] = 20'hfbf7e;
    stim[33] = 20'hb0bd8;
    stim[34] = 20'h40386;
    stim[35] = 20'h5ea2c;
    stim[36] = 20'h7add2;
    stim[37] = 20'h0ffa6;
    stim[38] = 20'h26aca;
    stim[39] = 20'ha1585;
    stim[40] = 20'h88c4e;
    stim[41] = 20'h25a36;
    stim[42] = 20'hd09bb;
    stim[43] = 20'h9ade9;
    stim[44] = 20'h2c37f;
    stim[45] = 20'h59e2b;
    stim[46] = 20'ha723f;
    stim[47] = 20'h99a74;
    stim[48] = 20'h74f8e;
    stim[49] = 20'h39b93;
    stim[50] = 20'h56f14;
    stim[51] = 20'hc56c8;
    stim[52] = 20'h7dac6;
    stim[53] = 20'h19035;
    stim[54] = 20'h60cf9;
    stim[55] = 20'h4e388;
    stim[56] = 20'hf6a2b;
    stim[57] = 20'h5b74d;
    stim[58] = 20'h8e37f;
    stim[59] = 20'h24a7d;
    stim[60] = 20'hd9801;
    stim[61] = 20'h2f3fb;
    stim[62] = 20'ha819c;
    stim[63] = 20'hb1b92;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'h9;
      expv[9] = 4'ha;
      expv[10] = 4'hf;
      expv[11] = 4'hf;
      expv[12] = 4'h2;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'h9;
      expv[19] = 4'hb;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hc;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'ha;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'hf;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'h9;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hc;
      expv[63] = 4'hf;
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
