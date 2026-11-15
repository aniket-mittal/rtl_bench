// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_007469 dut (
    .rd_data(in_vec[8:0]),
    .ascii(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h163;
    stim[1] = 9'h0e5;
    stim[2] = 9'h041;
    stim[3] = 9'h0e8;
    stim[4] = 9'h0f4;
    stim[5] = 9'h024;
    stim[6] = 9'h18a;
    stim[7] = 9'h0ac;
    stim[8] = 9'h01a;
    stim[9] = 9'h105;
    stim[10] = 9'h1bc;
    stim[11] = 9'h1e0;
    stim[12] = 9'h164;
    stim[13] = 9'h0f1;
    stim[14] = 9'h1c6;
    stim[15] = 9'h13b;
    stim[16] = 9'h1a7;
    stim[17] = 9'h1e0;
    stim[18] = 9'h0bb;
    stim[19] = 9'h0b9;
    stim[20] = 9'h0c2;
    stim[21] = 9'h0a4;
    stim[22] = 9'h1d9;
    stim[23] = 9'h0cc;
    stim[24] = 9'h147;
    stim[25] = 9'h1a1;
    stim[26] = 9'h019;
    stim[27] = 9'h041;
    stim[28] = 9'h10f;
    stim[29] = 9'h10f;
    stim[30] = 9'h1ab;
    stim[31] = 9'h0e9;
    stim[32] = 9'h182;
    stim[33] = 9'h146;
    stim[34] = 9'h160;
    stim[35] = 9'h0cf;
    stim[36] = 9'h16a;
    stim[37] = 9'h17c;
    stim[38] = 9'h14a;
    stim[39] = 9'h11b;
    stim[40] = 9'h0dc;
    stim[41] = 9'h0e6;
    stim[42] = 9'h0ae;
    stim[43] = 9'h056;
    stim[44] = 9'h0fb;
    stim[45] = 9'h060;
    stim[46] = 9'h1a0;
    stim[47] = 9'h1a3;
    stim[48] = 9'h013;
    stim[49] = 9'h1fd;
    stim[50] = 9'h1b9;
    stim[51] = 9'h035;
    stim[52] = 9'h03e;
    stim[53] = 9'h054;
    stim[54] = 9'h0ff;
    stim[55] = 9'h176;
    stim[56] = 9'h060;
    stim[57] = 9'h0ab;
    stim[58] = 9'h17a;
    stim[59] = 9'h001;
    stim[60] = 9'h12a;
    stim[61] = 9'h007;
    stim[62] = 9'h05c;
    stim[63] = 9'h112;
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
      expv[0] = 8'h2a;
      expv[1] = 8'h2a;
      expv[2] = 8'h2c;
      expv[3] = 8'h2a;
      expv[4] = 8'h2a;
      expv[5] = 8'h65;
      expv[6] = 8'h2a;
      expv[7] = 8'h2a;
      expv[8] = 8'h7a;
      expv[9] = 8'h2a;
      expv[10] = 8'h2a;
      expv[11] = 8'h2a;
      expv[12] = 8'h2a;
      expv[13] = 8'h2a;
      expv[14] = 8'h2a;
      expv[15] = 8'h4a;
      expv[16] = 8'h2a;
      expv[17] = 8'h2a;
      expv[18] = 8'h2a;
      expv[19] = 8'h2a;
      expv[20] = 8'h2a;
      expv[21] = 8'h2a;
      expv[22] = 8'h2a;
      expv[23] = 8'h2a;
      expv[24] = 8'h2a;
      expv[25] = 8'h2a;
      expv[26] = 8'h2a;
      expv[27] = 8'h2c;
      expv[28] = 8'h2a;
      expv[29] = 8'h2a;
      expv[30] = 8'h2a;
      expv[31] = 8'h2a;
      expv[32] = 8'h2a;
      expv[33] = 8'h2a;
      expv[34] = 8'h2a;
      expv[35] = 8'h2a;
      expv[36] = 8'h2a;
      expv[37] = 8'h2a;
      expv[38] = 8'h2a;
      expv[39] = 8'h53;
      expv[40] = 8'h2a;
      expv[41] = 8'h2a;
      expv[42] = 8'h2a;
      expv[43] = 8'h2a;
      expv[44] = 8'h2a;
      expv[45] = 8'h2a;
      expv[46] = 8'h2a;
      expv[47] = 8'h2a;
      expv[48] = 8'h2a;
      expv[49] = 8'h2a;
      expv[50] = 8'h2a;
      expv[51] = 8'h79;
      expv[52] = 8'h38;
      expv[53] = 8'h5b;
      expv[54] = 8'h2a;
      expv[55] = 8'h2a;
      expv[56] = 8'h2a;
      expv[57] = 8'h2a;
      expv[58] = 8'h2a;
      expv[59] = 8'h2a;
      expv[60] = 8'h56;
      expv[61] = 8'h2a;
      expv[62] = 8'h2a;
      expv[63] = 8'h2a;
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
