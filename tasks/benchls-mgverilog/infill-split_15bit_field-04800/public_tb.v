// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04800 dut (
    .i(in_vec[14:0]),
    .o1(out_vec[14:10]),
    .o0(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h6cd7;
    stim[1] = 15'h7089;
    stim[2] = 15'h3362;
    stim[3] = 15'h75e2;
    stim[4] = 15'h56fd;
    stim[5] = 15'h21fa;
    stim[6] = 15'h464d;
    stim[7] = 15'h73c8;
    stim[8] = 15'h48db;
    stim[9] = 15'h191f;
    stim[10] = 15'h5d82;
    stim[11] = 15'h1a86;
    stim[12] = 15'h33ea;
    stim[13] = 15'h6637;
    stim[14] = 15'h6efb;
    stim[15] = 15'h3118;
    stim[16] = 15'h1bcb;
    stim[17] = 15'h2a5e;
    stim[18] = 15'h4d58;
    stim[19] = 15'h4ce1;
    stim[20] = 15'h2cca;
    stim[21] = 15'h0307;
    stim[22] = 15'h5cd4;
    stim[23] = 15'h03a0;
    stim[24] = 15'h0aba;
    stim[25] = 15'h59fe;
    stim[26] = 15'h0405;
    stim[27] = 15'h58a3;
    stim[28] = 15'h2e67;
    stim[29] = 15'h4c5c;
    stim[30] = 15'h3457;
    stim[31] = 15'h1c9e;
    stim[32] = 15'h5fa1;
    stim[33] = 15'h1001;
    stim[34] = 15'h489f;
    stim[35] = 15'h58de;
    stim[36] = 15'h408c;
    stim[37] = 15'h04df;
    stim[38] = 15'h01b4;
    stim[39] = 15'h608b;
    stim[40] = 15'h225a;
    stim[41] = 15'h0238;
    stim[42] = 15'h53d1;
    stim[43] = 15'h0bcb;
    stim[44] = 15'h18b5;
    stim[45] = 15'h37e2;
    stim[46] = 15'h2589;
    stim[47] = 15'h2d33;
    stim[48] = 15'h4134;
    stim[49] = 15'h2d2d;
    stim[50] = 15'h25fb;
    stim[51] = 15'h665f;
    stim[52] = 15'h5a93;
    stim[53] = 15'h7248;
    stim[54] = 15'h47b4;
    stim[55] = 15'h49a2;
    stim[56] = 15'h4b7a;
    stim[57] = 15'h1eb4;
    stim[58] = 15'h1e20;
    stim[59] = 15'h36d8;
    stim[60] = 15'h0089;
    stim[61] = 15'h38a7;
    stim[62] = 15'h3a26;
    stim[63] = 15'h7aec;
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
      expv[0] = 15'h6cd7;
      expv[1] = 15'h7089;
      expv[2] = 15'h3362;
      expv[3] = 15'h75e2;
      expv[4] = 15'h56fd;
      expv[5] = 15'h21fa;
      expv[6] = 15'h464d;
      expv[7] = 15'h73c8;
      expv[8] = 15'h48db;
      expv[9] = 15'h191f;
      expv[10] = 15'h5d82;
      expv[11] = 15'h1a86;
      expv[12] = 15'h33ea;
      expv[13] = 15'h6637;
      expv[14] = 15'h6efb;
      expv[15] = 15'h3118;
      expv[16] = 15'h1bcb;
      expv[17] = 15'h2a5e;
      expv[18] = 15'h4d58;
      expv[19] = 15'h4ce1;
      expv[20] = 15'h2cca;
      expv[21] = 15'h0307;
      expv[22] = 15'h5cd4;
      expv[23] = 15'h03a0;
      expv[24] = 15'h0aba;
      expv[25] = 15'h59fe;
      expv[26] = 15'h0405;
      expv[27] = 15'h58a3;
      expv[28] = 15'h2e67;
      expv[29] = 15'h4c5c;
      expv[30] = 15'h3457;
      expv[31] = 15'h1c9e;
      expv[32] = 15'h5fa1;
      expv[33] = 15'h1001;
      expv[34] = 15'h489f;
      expv[35] = 15'h58de;
      expv[36] = 15'h408c;
      expv[37] = 15'h04df;
      expv[38] = 15'h01b4;
      expv[39] = 15'h608b;
      expv[40] = 15'h225a;
      expv[41] = 15'h0238;
      expv[42] = 15'h53d1;
      expv[43] = 15'h0bcb;
      expv[44] = 15'h18b5;
      expv[45] = 15'h37e2;
      expv[46] = 15'h2589;
      expv[47] = 15'h2d33;
      expv[48] = 15'h4134;
      expv[49] = 15'h2d2d;
      expv[50] = 15'h25fb;
      expv[51] = 15'h665f;
      expv[52] = 15'h5a93;
      expv[53] = 15'h7248;
      expv[54] = 15'h47b4;
      expv[55] = 15'h49a2;
      expv[56] = 15'h4b7a;
      expv[57] = 15'h1eb4;
      expv[58] = 15'h1e20;
      expv[59] = 15'h36d8;
      expv[60] = 15'h0089;
      expv[61] = 15'h38a7;
      expv[62] = 15'h3a26;
      expv[63] = 15'h7aec;
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
