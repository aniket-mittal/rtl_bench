// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117258 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sample_data(in_vec[17:2]),
    .sample_valid(in_vec[1:1]),
    .fifo_ready(in_vec[0:0]),
    .fifo_data(out_vec[17:2]),
    .fifo_overflow(out_vec[1:1]),
    .fifo_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4d177;
    stim[1] = 19'h60bb8;
    stim[2] = 19'h1df47;
    stim[3] = 19'h08e08;
    stim[4] = 19'h30ad2;
    stim[5] = 19'h1ade2;
    stim[6] = 19'h33bea;
    stim[7] = 19'h19ce9;
    stim[8] = 19'h0b2ee;
    stim[9] = 19'h00f6f;
    stim[10] = 19'h02569;
    stim[11] = 19'h2f983;
    stim[12] = 19'h22963;
    stim[13] = 19'h1b6a6;
    stim[14] = 19'h068a4;
    stim[15] = 19'h01b6b;
    stim[16] = 19'h2787f;
    stim[17] = 19'h20084;
    stim[18] = 19'h3420d;
    stim[19] = 19'h3f642;
    stim[20] = 19'h3c7cb;
    stim[21] = 19'h1fccc;
    stim[22] = 19'h16e81;
    stim[23] = 19'h00626;
    stim[24] = 19'h20433;
    stim[25] = 19'h33fd2;
    stim[26] = 19'h23e1d;
    stim[27] = 19'h0a60f;
    stim[28] = 19'h1ab04;
    stim[29] = 19'h02588;
    stim[30] = 19'h03714;
    stim[31] = 19'h0d7b0;
    stim[32] = 19'h16f5d;
    stim[33] = 19'h3e412;
    stim[34] = 19'h00ca7;
    stim[35] = 19'h11994;
    stim[36] = 19'h197a1;
    stim[37] = 19'h1f9c8;
    stim[38] = 19'h75b58;
    stim[39] = 19'h437eb;
    stim[40] = 19'h0b912;
    stim[41] = 19'h1bdd7;
    stim[42] = 19'h1fa11;
    stim[43] = 19'h05880;
    stim[44] = 19'h35220;
    stim[45] = 19'h06636;
    stim[46] = 19'h3c2cf;
    stim[47] = 19'h185d9;
    stim[48] = 19'h3d238;
    stim[49] = 19'h3d561;
    stim[50] = 19'h12018;
    stim[51] = 19'h12c47;
    stim[52] = 19'h3e7e1;
    stim[53] = 19'h09c34;
    stim[54] = 19'h22573;
    stim[55] = 19'h17a3a;
    stim[56] = 19'h2346f;
    stim[57] = 19'h32fe1;
    stim[58] = 19'h30a80;
    stim[59] = 19'h1b0b3;
    stim[60] = 19'h37bee;
    stim[61] = 19'h26745;
    stim[62] = 19'h2a37c;
    stim[63] = 19'h0d961;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h1df45;
      expv[4] = 18'h08e08;
      expv[5] = 18'h30ad1;
      expv[6] = 18'h00007;
      expv[7] = 18'h0000b;
      expv[8] = 18'h0000f;
      expv[9] = 18'h0b2ed;
      expv[10] = 18'h00007;
      expv[11] = 18'h02568;
      expv[12] = 18'h2f981;
      expv[13] = 18'h22961;
      expv[14] = 18'h1b6a5;
      expv[15] = 18'h00007;
      expv[16] = 18'h00007;
      expv[17] = 18'h2787d;
      expv[18] = 18'h20084;
      expv[19] = 18'h3420c;
      expv[20] = 18'h3f641;
      expv[21] = 18'h00007;
      expv[22] = 18'h1fccc;
      expv[23] = 18'h16e80;
      expv[24] = 18'h00625;
      expv[25] = 18'h00007;
      expv[26] = 18'h33fd1;
      expv[27] = 18'h00007;
      expv[28] = 18'h0a60d;
      expv[29] = 18'h1ab04;
      expv[30] = 18'h02588;
      expv[31] = 18'h03714;
      expv[32] = 18'h0d7b0;
      expv[33] = 18'h16f5c;
      expv[34] = 18'h3e411;
      expv[35] = 18'h00007;
      expv[36] = 18'h11994;
      expv[37] = 18'h197a0;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h0b911;
      expv[42] = 18'h00007;
      expv[43] = 18'h1fa10;
      expv[44] = 18'h05880;
      expv[45] = 18'h35220;
      expv[46] = 18'h06635;
      expv[47] = 18'h00007;
      expv[48] = 18'h185d8;
      expv[49] = 18'h3d238;
      expv[50] = 18'h3d560;
      expv[51] = 18'h12018;
      expv[52] = 18'h12c45;
      expv[53] = 18'h3e7e0;
      expv[54] = 18'h09c34;
      expv[55] = 18'h22571;
      expv[56] = 18'h17a39;
      expv[57] = 18'h00007;
      expv[58] = 18'h32fe0;
      expv[59] = 18'h30a80;
      expv[60] = 18'h1b0b1;
      expv[61] = 18'h37bed;
      expv[62] = 18'h00007;
      expv[63] = 18'h2a37c;
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
