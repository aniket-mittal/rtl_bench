// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04676 dut (
    .addr_in(in_vec[6:1]),
    .en(in_vec[0:0]),
    .out(out_vec[39:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h36;
    stim[1] = 7'h05;
    stim[2] = 7'h34;
    stim[3] = 7'h35;
    stim[4] = 7'h76;
    stim[5] = 7'h4a;
    stim[6] = 7'h7f;
    stim[7] = 7'h65;
    stim[8] = 7'h28;
    stim[9] = 7'h6e;
    stim[10] = 7'h20;
    stim[11] = 7'h6b;
    stim[12] = 7'h52;
    stim[13] = 7'h30;
    stim[14] = 7'h46;
    stim[15] = 7'h7d;
    stim[16] = 7'h10;
    stim[17] = 7'h21;
    stim[18] = 7'h64;
    stim[19] = 7'h1a;
    stim[20] = 7'h0d;
    stim[21] = 7'h36;
    stim[22] = 7'h70;
    stim[23] = 7'h7a;
    stim[24] = 7'h3f;
    stim[25] = 7'h00;
    stim[26] = 7'h75;
    stim[27] = 7'h13;
    stim[28] = 7'h43;
    stim[29] = 7'h23;
    stim[30] = 7'h5b;
    stim[31] = 7'h68;
    stim[32] = 7'h77;
    stim[33] = 7'h15;
    stim[34] = 7'h12;
    stim[35] = 7'h06;
    stim[36] = 7'h14;
    stim[37] = 7'h14;
    stim[38] = 7'h23;
    stim[39] = 7'h5d;
    stim[40] = 7'h41;
    stim[41] = 7'h20;
    stim[42] = 7'h7b;
    stim[43] = 7'h7f;
    stim[44] = 7'h15;
    stim[45] = 7'h0a;
    stim[46] = 7'h5c;
    stim[47] = 7'h1d;
    stim[48] = 7'h00;
    stim[49] = 7'h70;
    stim[50] = 7'h49;
    stim[51] = 7'h47;
    stim[52] = 7'h32;
    stim[53] = 7'h37;
    stim[54] = 7'h69;
    stim[55] = 7'h5e;
    stim[56] = 7'h61;
    stim[57] = 7'h2f;
    stim[58] = 7'h75;
    stim[59] = 7'h59;
    stim[60] = 7'h28;
    stim[61] = 7'h1f;
    stim[62] = 7'h5a;
    stim[63] = 7'h68;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000004;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0004000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000010000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000040;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0080000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000200;
      expv[28] = 40'h0200000000;
      expv[29] = 40'h0000020000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000400;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000020000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0100000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000400;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000004000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h1000000000;
      expv[51] = 40'h0800000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0008000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000800000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000008000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
