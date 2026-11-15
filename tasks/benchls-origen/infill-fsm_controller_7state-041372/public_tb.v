// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041372 dut (
    .clock(clk),
    .vz(in_vec[3:2]),
    .start(in_vec[1:1]),
    .clear(in_vec[0:0]),
    .controller_out(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h7;
    stim[1] = 4'hf;
    stim[2] = 4'h4;
    stim[3] = 4'hb;
    stim[4] = 4'hd;
    stim[5] = 4'he;
    stim[6] = 4'ha;
    stim[7] = 4'h9;
    stim[8] = 4'h9;
    stim[9] = 4'hf;
    stim[10] = 4'h6;
    stim[11] = 4'h9;
    stim[12] = 4'he;
    stim[13] = 4'h9;
    stim[14] = 4'h4;
    stim[15] = 4'h7;
    stim[16] = 4'h5;
    stim[17] = 4'h8;
    stim[18] = 4'h9;
    stim[19] = 4'ha;
    stim[20] = 4'he;
    stim[21] = 4'h9;
    stim[22] = 4'h6;
    stim[23] = 4'hb;
    stim[24] = 4'h5;
    stim[25] = 4'h0;
    stim[26] = 4'ha;
    stim[27] = 4'h3;
    stim[28] = 4'hb;
    stim[29] = 4'h6;
    stim[30] = 4'hd;
    stim[31] = 4'h8;
    stim[32] = 4'h6;
    stim[33] = 4'h3;
    stim[34] = 4'h6;
    stim[35] = 4'h9;
    stim[36] = 4'hc;
    stim[37] = 4'h2;
    stim[38] = 4'hd;
    stim[39] = 4'h5;
    stim[40] = 4'h2;
    stim[41] = 4'he;
    stim[42] = 4'h6;
    stim[43] = 4'hf;
    stim[44] = 4'h5;
    stim[45] = 4'hc;
    stim[46] = 4'hb;
    stim[47] = 4'h7;
    stim[48] = 4'hf;
    stim[49] = 4'h0;
    stim[50] = 4'h6;
    stim[51] = 4'h4;
    stim[52] = 4'h4;
    stim[53] = 4'h5;
    stim[54] = 4'h3;
    stim[55] = 4'h4;
    stim[56] = 4'ha;
    stim[57] = 4'hb;
    stim[58] = 4'h4;
    stim[59] = 4'h7;
    stim[60] = 4'h0;
    stim[61] = 4'hd;
    stim[62] = 4'h4;
    stim[63] = 4'h0;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h06;
      expv[2] = 5'h06;
      expv[3] = 5'h00;
      expv[4] = 5'h06;
      expv[5] = 5'h0d;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h06;
      expv[9] = 5'h19;
      expv[10] = 5'h06;
      expv[11] = 5'h00;
      expv[12] = 5'h06;
      expv[13] = 5'h00;
      expv[14] = 5'h06;
      expv[15] = 5'h00;
      expv[16] = 5'h06;
      expv[17] = 5'h0e;
      expv[18] = 5'h00;
      expv[19] = 5'h06;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h06;
      expv[23] = 5'h00;
      expv[24] = 5'h06;
      expv[25] = 5'h0e;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h06;
      expv[29] = 5'h06;
      expv[30] = 5'h00;
      expv[31] = 5'h06;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h06;
      expv[35] = 5'h00;
      expv[36] = 5'h06;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h06;
      expv[40] = 5'h0e;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h06;
      expv[45] = 5'h0e;
      expv[46] = 5'h00;
      expv[47] = 5'h06;
      expv[48] = 5'h06;
      expv[49] = 5'h06;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h06;
      expv[55] = 5'h06;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h06;
      expv[59] = 5'h00;
      expv[60] = 5'h06;
      expv[61] = 5'h00;
      expv[62] = 5'h06;
      expv[63] = 5'h00;
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
