// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058508 dut (
    .clock(clk),
    .reset(in_vec[5:5]),
    .c_pad(in_vec[4:4]),
    .d_pad(in_vec[3:3]),
    .e_pad(in_vec[2:2]),
    .f_pad(in_vec[1:1]),
    .g_pad(in_vec[0:0]),
    .reset_sync(out_vec[6:6]),
    .c_pad_sync(out_vec[5:5]),
    .d_pad_sync(out_vec[4:4]),
    .e_pad_sync(out_vec[3:3]),
    .f_pad_sync(out_vec[2:2]),
    .g_pad_sync(out_vec[1:1]),
    .pad_touched(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h35;
    stim[1] = 6'h30;
    stim[2] = 6'h18;
    stim[3] = 6'h08;
    stim[4] = 6'h1b;
    stim[5] = 6'h07;
    stim[6] = 6'h0f;
    stim[7] = 6'h1c;
    stim[8] = 6'h0c;
    stim[9] = 6'h13;
    stim[10] = 6'h00;
    stim[11] = 6'h01;
    stim[12] = 6'h19;
    stim[13] = 6'h08;
    stim[14] = 6'h1b;
    stim[15] = 6'h0e;
    stim[16] = 6'h10;
    stim[17] = 6'h15;
    stim[18] = 6'h14;
    stim[19] = 6'h12;
    stim[20] = 6'h01;
    stim[21] = 6'h06;
    stim[22] = 6'h03;
    stim[23] = 6'h10;
    stim[24] = 6'h03;
    stim[25] = 6'h01;
    stim[26] = 6'h14;
    stim[27] = 6'h01;
    stim[28] = 6'h1c;
    stim[29] = 6'h08;
    stim[30] = 6'h14;
    stim[31] = 6'h17;
    stim[32] = 6'h00;
    stim[33] = 6'h07;
    stim[34] = 6'h1b;
    stim[35] = 6'h02;
    stim[36] = 6'h15;
    stim[37] = 6'h07;
    stim[38] = 6'h1c;
    stim[39] = 6'h1c;
    stim[40] = 6'h0e;
    stim[41] = 6'h0e;
    stim[42] = 6'h1b;
    stim[43] = 6'h04;
    stim[44] = 6'h0f;
    stim[45] = 6'h17;
    stim[46] = 6'h0c;
    stim[47] = 6'h1a;
    stim[48] = 6'h00;
    stim[49] = 6'h0e;
    stim[50] = 6'h09;
    stim[51] = 6'h17;
    stim[52] = 6'h0b;
    stim[53] = 6'h09;
    stim[54] = 6'h05;
    stim[55] = 6'h09;
    stim[56] = 6'h02;
    stim[57] = 6'h01;
    stim[58] = 6'h16;
    stim[59] = 6'h0b;
    stim[60] = 6'h17;
    stim[61] = 6'h26;
    stim[62] = 6'h02;
    stim[63] = 6'h11;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h31;
      expv[5] = 7'h11;
      expv[6] = 7'h37;
      expv[7] = 7'h0f;
      expv[8] = 7'h1f;
      expv[9] = 7'h39;
      expv[10] = 7'h19;
      expv[11] = 7'h27;
      expv[12] = 7'h00;
      expv[13] = 7'h03;
      expv[14] = 7'h33;
      expv[15] = 7'h11;
      expv[16] = 7'h37;
      expv[17] = 7'h1d;
      expv[18] = 7'h21;
      expv[19] = 7'h2b;
      expv[20] = 7'h29;
      expv[21] = 7'h25;
      expv[22] = 7'h03;
      expv[23] = 7'h0d;
      expv[24] = 7'h07;
      expv[25] = 7'h21;
      expv[26] = 7'h07;
      expv[27] = 7'h03;
      expv[28] = 7'h29;
      expv[29] = 7'h03;
      expv[30] = 7'h39;
      expv[31] = 7'h11;
      expv[32] = 7'h29;
      expv[33] = 7'h2f;
      expv[34] = 7'h00;
      expv[35] = 7'h0f;
      expv[36] = 7'h37;
      expv[37] = 7'h05;
      expv[38] = 7'h2b;
      expv[39] = 7'h0f;
      expv[40] = 7'h39;
      expv[41] = 7'h39;
      expv[42] = 7'h1d;
      expv[43] = 7'h1d;
      expv[44] = 7'h37;
      expv[45] = 7'h09;
      expv[46] = 7'h1f;
      expv[47] = 7'h2f;
      expv[48] = 7'h19;
      expv[49] = 7'h35;
      expv[50] = 7'h00;
      expv[51] = 7'h1d;
      expv[52] = 7'h13;
      expv[53] = 7'h2f;
      expv[54] = 7'h17;
      expv[55] = 7'h13;
      expv[56] = 7'h0b;
      expv[57] = 7'h13;
      expv[58] = 7'h05;
      expv[59] = 7'h03;
      expv[60] = 7'h2d;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h00;
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
