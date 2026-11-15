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

  autovcoder_036004 dut (
    .clk(clk),
    .f_bus_en(in_vec[3:3]),
    .bus_ready(in_vec[2:2]),
    .reset_n(in_vec[1:1]),
    .stopfetch(in_vec[0:0]),
    .pc_incr(out_vec[4:4]),
    .current_state(out_vec[3:2]),
    .wen_regs(out_vec[1:1]),
    .sw_fetch_internal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h4;
    stim[1] = 4'h8;
    stim[2] = 4'hf;
    stim[3] = 4'h3;
    stim[4] = 4'h7;
    stim[5] = 4'h7;
    stim[6] = 4'ha;
    stim[7] = 4'h2;
    stim[8] = 4'he;
    stim[9] = 4'hb;
    stim[10] = 4'he;
    stim[11] = 4'ha;
    stim[12] = 4'ha;
    stim[13] = 4'hb;
    stim[14] = 4'hf;
    stim[15] = 4'ha;
    stim[16] = 4'h6;
    stim[17] = 4'h6;
    stim[18] = 4'h7;
    stim[19] = 4'ha;
    stim[20] = 4'hf;
    stim[21] = 4'hb;
    stim[22] = 4'h3;
    stim[23] = 4'hf;
    stim[24] = 4'hf;
    stim[25] = 4'h7;
    stim[26] = 4'he;
    stim[27] = 4'hb;
    stim[28] = 4'h7;
    stim[29] = 4'ha;
    stim[30] = 4'hf;
    stim[31] = 4'hb;
    stim[32] = 4'h2;
    stim[33] = 4'hf;
    stim[34] = 4'h2;
    stim[35] = 4'hf;
    stim[36] = 4'hf;
    stim[37] = 4'h3;
    stim[38] = 4'h6;
    stim[39] = 4'hb;
    stim[40] = 4'h6;
    stim[41] = 4'hb;
    stim[42] = 4'h7;
    stim[43] = 4'hf;
    stim[44] = 4'he;
    stim[45] = 4'he;
    stim[46] = 4'ha;
    stim[47] = 4'h6;
    stim[48] = 4'ha;
    stim[49] = 4'h6;
    stim[50] = 4'h3;
    stim[51] = 4'ha;
    stim[52] = 4'h2;
    stim[53] = 4'h6;
    stim[54] = 4'h7;
    stim[55] = 4'ha;
    stim[56] = 4'hf;
    stim[57] = 4'h3;
    stim[58] = 4'h3;
    stim[59] = 4'h3;
    stim[60] = 4'hb;
    stim[61] = 4'h3;
    stim[62] = 4'h6;
    stim[63] = 4'h2;
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
      expv[0] = 5'h01;
      expv[1] = 5'h01;
      expv[2] = 5'h01;
      expv[3] = 5'h01;
      expv[4] = 5'h01;
      expv[5] = 5'h01;
      expv[6] = 5'h01;
      expv[7] = 5'h07;
      expv[8] = 5'h01;
      expv[9] = 5'h06;
      expv[10] = 5'h16;
      expv[11] = 5'h08;
      expv[12] = 5'h06;
      expv[13] = 5'h06;
      expv[14] = 5'h16;
      expv[15] = 5'h08;
      expv[16] = 5'h17;
      expv[17] = 5'h01;
      expv[18] = 5'h01;
      expv[19] = 5'h01;
      expv[20] = 5'h16;
      expv[21] = 5'h08;
      expv[22] = 5'h08;
      expv[23] = 5'h08;
      expv[24] = 5'h08;
      expv[25] = 5'h08;
      expv[26] = 5'h08;
      expv[27] = 5'h06;
      expv[28] = 5'h17;
      expv[29] = 5'h01;
      expv[30] = 5'h16;
      expv[31] = 5'h08;
      expv[32] = 5'h09;
      expv[33] = 5'h01;
      expv[34] = 5'h01;
      expv[35] = 5'h01;
      expv[36] = 5'h01;
      expv[37] = 5'h01;
      expv[38] = 5'h01;
      expv[39] = 5'h01;
      expv[40] = 5'h01;
      expv[41] = 5'h01;
      expv[42] = 5'h01;
      expv[43] = 5'h01;
      expv[44] = 5'h01;
      expv[45] = 5'h16;
      expv[46] = 5'h08;
      expv[47] = 5'h17;
      expv[48] = 5'h01;
      expv[49] = 5'h17;
      expv[50] = 5'h01;
      expv[51] = 5'h01;
      expv[52] = 5'h07;
      expv[53] = 5'h01;
      expv[54] = 5'h01;
      expv[55] = 5'h01;
      expv[56] = 5'h16;
      expv[57] = 5'h08;
      expv[58] = 5'h08;
      expv[59] = 5'h08;
      expv[60] = 5'h08;
      expv[61] = 5'h08;
      expv[62] = 5'h09;
      expv[63] = 5'h01;
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
