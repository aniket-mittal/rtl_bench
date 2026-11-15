// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158625 dut (
    .fx2_ifclk(clk),
    .reset_n(in_vec[3:3]),
    .fx2_flagb(in_vec[2:2]),
    .fx2_flagc(in_vec[1:1]),
    .tx_trigger(in_vec[0:0]),
    .fx2_fdata(out_vec[21:6]),
    .fx2_faddr(out_vec[5:4]),
    .fx2_slrd(out_vec[3:3]),
    .fx2_slwr(out_vec[2:2]),
    .fx2_sloe(out_vec[1:1]),
    .fx2_pkt_end(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h6;
    stim[1] = 4'h6;
    stim[2] = 4'hd;
    stim[3] = 4'hd;
    stim[4] = 4'hb;
    stim[5] = 4'h9;
    stim[6] = 4'ha;
    stim[7] = 4'hf;
    stim[8] = 4'ha;
    stim[9] = 4'hf;
    stim[10] = 4'h8;
    stim[11] = 4'h8;
    stim[12] = 4'he;
    stim[13] = 4'h8;
    stim[14] = 4'hf;
    stim[15] = 4'hc;
    stim[16] = 4'he;
    stim[17] = 4'he;
    stim[18] = 4'he;
    stim[19] = 4'ha;
    stim[20] = 4'hd;
    stim[21] = 4'hf;
    stim[22] = 4'ha;
    stim[23] = 4'hb;
    stim[24] = 4'hb;
    stim[25] = 4'hd;
    stim[26] = 4'ha;
    stim[27] = 4'hd;
    stim[28] = 4'hc;
    stim[29] = 4'ha;
    stim[30] = 4'hc;
    stim[31] = 4'hc;
    stim[32] = 4'hf;
    stim[33] = 4'hc;
    stim[34] = 4'h7;
    stim[35] = 4'h9;
    stim[36] = 4'hc;
    stim[37] = 4'h8;
    stim[38] = 4'h8;
    stim[39] = 4'ha;
    stim[40] = 4'ha;
    stim[41] = 4'hd;
    stim[42] = 4'h9;
    stim[43] = 4'h8;
    stim[44] = 4'h9;
    stim[45] = 4'hf;
    stim[46] = 4'hf;
    stim[47] = 4'he;
    stim[48] = 4'hb;
    stim[49] = 4'h8;
    stim[50] = 4'ha;
    stim[51] = 4'h9;
    stim[52] = 4'h5;
    stim[53] = 4'ha;
    stim[54] = 4'hf;
    stim[55] = 4'ha;
    stim[56] = 4'h9;
    stim[57] = 4'h8;
    stim[58] = 4'h8;
    stim[59] = 4'h8;
    stim[60] = 4'h9;
    stim[61] = 4'ha;
    stim[62] = 4'h9;
    stim[63] = 4'he;
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
      expv[0] = 22'h00000e;
      expv[1] = 22'h00000e;
      expv[2] = 22'h00000e;
      expv[3] = 22'h00000e;
      expv[4] = 22'h00000e;
      expv[5] = 22'h2af340;
      expv[6] = 22'h2af340;
      expv[7] = 22'h2af340;
      expv[8] = 22'h2af39e;
      expv[9] = 22'h2af39e;
      expv[10] = 22'h2af340;
      expv[11] = 22'h2af340;
      expv[12] = 22'h2af340;
      expv[13] = 22'h2af39e;
      expv[14] = 22'h2af39e;
      expv[15] = 22'h2af340;
      expv[16] = 22'h2af39e;
      expv[17] = 22'h2af39e;
      expv[18] = 22'h2af39e;
      expv[19] = 22'h2af39e;
      expv[20] = 22'h2af39e;
      expv[21] = 22'h2af39e;
      expv[22] = 22'h2af340;
      expv[23] = 22'h2af340;
      expv[24] = 22'h2af340;
      expv[25] = 22'h2af340;
      expv[26] = 22'h2af39e;
      expv[27] = 22'h2af39e;
      expv[28] = 22'h2af39e;
      expv[29] = 22'h2af39e;
      expv[30] = 22'h2af39e;
      expv[31] = 22'h2af39e;
      expv[32] = 22'h2af39e;
      expv[33] = 22'h2af340;
      expv[34] = 22'h00000e;
      expv[35] = 22'h00000e;
      expv[36] = 22'h00000e;
      expv[37] = 22'h00000e;
      expv[38] = 22'h00000e;
      expv[39] = 22'h00000e;
      expv[40] = 22'h00000e;
      expv[41] = 22'h00000e;
      expv[42] = 22'h00000e;
      expv[43] = 22'h00000e;
      expv[44] = 22'h00000e;
      expv[45] = 22'h00000e;
      expv[46] = 22'h2af340;
      expv[47] = 22'h2af39e;
      expv[48] = 22'h2af39e;
      expv[49] = 22'h2af340;
      expv[50] = 22'h2af340;
      expv[51] = 22'h2af340;
      expv[52] = 22'h00000e;
      expv[53] = 22'h00000e;
      expv[54] = 22'h00000e;
      expv[55] = 22'h2af340;
      expv[56] = 22'h2af340;
      expv[57] = 22'h2af340;
      expv[58] = 22'h2af340;
      expv[59] = 22'h2af340;
      expv[60] = 22'h2af340;
      expv[61] = 22'h2af340;
      expv[62] = 22'h2af340;
      expv[63] = 22'h2af340;
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
