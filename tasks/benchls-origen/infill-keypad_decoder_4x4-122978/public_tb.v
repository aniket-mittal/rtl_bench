// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122978 dut (
    .kpr(in_vec[7:4]),
    .kpc(in_vec[3:0]),
    .buttons(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hbf;
    stim[1] = 8'hb7;
    stim[2] = 8'h0f;
    stim[3] = 8'h5c;
    stim[4] = 8'h27;
    stim[5] = 8'ha2;
    stim[6] = 8'h47;
    stim[7] = 8'hb1;
    stim[8] = 8'h8a;
    stim[9] = 8'hc2;
    stim[10] = 8'hd0;
    stim[11] = 8'h3b;
    stim[12] = 8'h4c;
    stim[13] = 8'h2e;
    stim[14] = 8'he3;
    stim[15] = 8'h9f;
    stim[16] = 8'hc6;
    stim[17] = 8'ha5;
    stim[18] = 8'h10;
    stim[19] = 8'h9b;
    stim[20] = 8'hf8;
    stim[21] = 8'h0c;
    stim[22] = 8'hf5;
    stim[23] = 8'hb6;
    stim[24] = 8'h65;
    stim[25] = 8'h8f;
    stim[26] = 8'hdb;
    stim[27] = 8'h87;
    stim[28] = 8'ha6;
    stim[29] = 8'h6f;
    stim[30] = 8'h53;
    stim[31] = 8'h70;
    stim[32] = 8'h59;
    stim[33] = 8'h8f;
    stim[34] = 8'ha5;
    stim[35] = 8'h17;
    stim[36] = 8'h19;
    stim[37] = 8'h84;
    stim[38] = 8'h83;
    stim[39] = 8'hc6;
    stim[40] = 8'h39;
    stim[41] = 8'h16;
    stim[42] = 8'hc9;
    stim[43] = 8'h5b;
    stim[44] = 8'h8f;
    stim[45] = 8'haf;
    stim[46] = 8'h73;
    stim[47] = 8'h14;
    stim[48] = 8'hbd;
    stim[49] = 8'hee;
    stim[50] = 8'h15;
    stim[51] = 8'h71;
    stim[52] = 8'h71;
    stim[53] = 8'h51;
    stim[54] = 8'h24;
    stim[55] = 8'h5c;
    stim[56] = 8'h30;
    stim[57] = 8'hf0;
    stim[58] = 8'hdd;
    stim[59] = 8'hb1;
    stim[60] = 8'ha3;
    stim[61] = 8'h8e;
    stim[62] = 8'h32;
    stim[63] = 8'h9f;
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
      expv[0] = 4'h0;
      expv[1] = 4'hb;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h6;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h9;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h5;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
