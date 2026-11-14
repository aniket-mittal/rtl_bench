// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .y(in_vec[6:1]),
    .w(in_vec[0:0]),
    .Y1(out_vec[1:1]),
    .Y3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h2c;
    stim[1] = 7'h34;
    stim[2] = 7'h47;
    stim[3] = 7'h54;
    stim[4] = 7'h58;
    stim[5] = 7'h74;
    stim[6] = 7'h22;
    stim[7] = 7'h4a;
    stim[8] = 7'h78;
    stim[9] = 7'h05;
    stim[10] = 7'h44;
    stim[11] = 7'h5e;
    stim[12] = 7'h42;
    stim[13] = 7'h58;
    stim[14] = 7'h4d;
    stim[15] = 7'h4a;
    stim[16] = 7'h7d;
    stim[17] = 7'h0f;
    stim[18] = 7'h76;
    stim[19] = 7'h44;
    stim[20] = 7'h25;
    stim[21] = 7'h77;
    stim[22] = 7'h2a;
    stim[23] = 7'h78;
    stim[24] = 7'h2b;
    stim[25] = 7'h54;
    stim[26] = 7'h66;
    stim[27] = 7'h30;
    stim[28] = 7'h11;
    stim[29] = 7'h1a;
    stim[30] = 7'h49;
    stim[31] = 7'h07;
    stim[32] = 7'h61;
    stim[33] = 7'h2d;
    stim[34] = 7'h6f;
    stim[35] = 7'h52;
    stim[36] = 7'h47;
    stim[37] = 7'h1e;
    stim[38] = 7'h3d;
    stim[39] = 7'h3c;
    stim[40] = 7'h75;
    stim[41] = 7'h3d;
    stim[42] = 7'h39;
    stim[43] = 7'h2f;
    stim[44] = 7'h2a;
    stim[45] = 7'h77;
    stim[46] = 7'h4d;
    stim[47] = 7'h35;
    stim[48] = 7'h62;
    stim[49] = 7'h39;
    stim[50] = 7'h51;
    stim[51] = 7'h5c;
    stim[52] = 7'h2e;
    stim[53] = 7'h26;
    stim[54] = 7'h3c;
    stim[55] = 7'h6a;
    stim[56] = 7'h25;
    stim[57] = 7'h5b;
    stim[58] = 7'h01;
    stim[59] = 7'h17;
    stim[60] = 7'h2d;
    stim[61] = 7'h4e;
    stim[62] = 7'h00;
    stim[63] = 7'h34;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h2;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h0;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h2;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h2;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h0;
      expv[31] = 2'h2;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h2;
      expv[35] = 2'h1;
      expv[36] = 2'h2;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h2;
      expv[44] = 2'h0;
      expv[45] = 2'h2;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h0;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h0;
      expv[57] = 2'h2;
      expv[58] = 2'h0;
      expv[59] = 2'h2;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
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
