// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05739 dut (
    .TABLE_B1_ADDR(in_vec[6:3]),
    .TABLE_B2_ADDR(in_vec[2:0]),
    .TABLE_B1_OUT(out_vec[12:8]),
    .TABLE_B2_OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h5e;
    stim[1] = 7'h7c;
    stim[2] = 7'h48;
    stim[3] = 7'h39;
    stim[4] = 7'h36;
    stim[5] = 7'h72;
    stim[6] = 7'h7b;
    stim[7] = 7'h50;
    stim[8] = 7'h3c;
    stim[9] = 7'h4b;
    stim[10] = 7'h17;
    stim[11] = 7'h66;
    stim[12] = 7'h10;
    stim[13] = 7'h61;
    stim[14] = 7'h53;
    stim[15] = 7'h4b;
    stim[16] = 7'h4e;
    stim[17] = 7'h12;
    stim[18] = 7'h28;
    stim[19] = 7'h00;
    stim[20] = 7'h28;
    stim[21] = 7'h05;
    stim[22] = 7'h46;
    stim[23] = 7'h4d;
    stim[24] = 7'h56;
    stim[25] = 7'h4e;
    stim[26] = 7'h44;
    stim[27] = 7'h58;
    stim[28] = 7'h09;
    stim[29] = 7'h02;
    stim[30] = 7'h02;
    stim[31] = 7'h74;
    stim[32] = 7'h41;
    stim[33] = 7'h35;
    stim[34] = 7'h40;
    stim[35] = 7'h44;
    stim[36] = 7'h5c;
    stim[37] = 7'h63;
    stim[38] = 7'h7a;
    stim[39] = 7'h5f;
    stim[40] = 7'h50;
    stim[41] = 7'h61;
    stim[42] = 7'h3f;
    stim[43] = 7'h19;
    stim[44] = 7'h6d;
    stim[45] = 7'h22;
    stim[46] = 7'h2e;
    stim[47] = 7'h34;
    stim[48] = 7'h52;
    stim[49] = 7'h7e;
    stim[50] = 7'h74;
    stim[51] = 7'h12;
    stim[52] = 7'h49;
    stim[53] = 7'h62;
    stim[54] = 7'h4e;
    stim[55] = 7'h1e;
    stim[56] = 7'h25;
    stim[57] = 7'h61;
    stim[58] = 7'h1a;
    stim[59] = 7'h2d;
    stim[60] = 7'h32;
    stim[61] = 7'h2b;
    stim[62] = 7'h5d;
    stim[63] = 7'h3f;
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
      expv[0] = 13'h1980;
      expv[1] = 13'h114d;
      expv[2] = 13'h1d39;
      expv[3] = 13'h0f39;
      expv[4] = 13'h0d80;
      expv[5] = 13'h1339;
      expv[6] = 13'h1139;
      expv[7] = 13'h1b39;
      expv[8] = 13'h0f4d;
      expv[9] = 13'h1d39;
      expv[10] = 13'h0599;
      expv[11] = 13'h1780;
      expv[12] = 13'h0539;
      expv[13] = 13'h1739;
      expv[14] = 13'h1b39;
      expv[15] = 13'h1d39;
      expv[16] = 13'h1d80;
      expv[17] = 13'h0539;
      expv[18] = 13'h0b39;
      expv[19] = 13'h0139;
      expv[20] = 13'h0b39;
      expv[21] = 13'h0166;
      expv[22] = 13'h1f80;
      expv[23] = 13'h1d66;
      expv[24] = 13'h1b80;
      expv[25] = 13'h1d80;
      expv[26] = 13'h1f4d;
      expv[27] = 13'h1939;
      expv[28] = 13'h0339;
      expv[29] = 13'h0139;
      expv[30] = 13'h0139;
      expv[31] = 13'h134d;
      expv[32] = 13'h1f39;
      expv[33] = 13'h0d66;
      expv[34] = 13'h1f39;
      expv[35] = 13'h1f4d;
      expv[36] = 13'h194d;
      expv[37] = 13'h1739;
      expv[38] = 13'h1139;
      expv[39] = 13'h1999;
      expv[40] = 13'h1b39;
      expv[41] = 13'h1739;
      expv[42] = 13'h0f99;
      expv[43] = 13'h0739;
      expv[44] = 13'h1566;
      expv[45] = 13'h0939;
      expv[46] = 13'h0b80;
      expv[47] = 13'h0d4d;
      expv[48] = 13'h1b39;
      expv[49] = 13'h1180;
      expv[50] = 13'h134d;
      expv[51] = 13'h0539;
      expv[52] = 13'h1d39;
      expv[53] = 13'h1739;
      expv[54] = 13'h1d80;
      expv[55] = 13'h0780;
      expv[56] = 13'h0966;
      expv[57] = 13'h1739;
      expv[58] = 13'h0739;
      expv[59] = 13'h0b66;
      expv[60] = 13'h0d39;
      expv[61] = 13'h0b39;
      expv[62] = 13'h1966;
      expv[63] = 13'h0f99;
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
