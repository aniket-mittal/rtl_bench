// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00377 dut (
    .pcx_spc_grant_bufp1_pa_l(in_vec[4:0]),
    .pcx_spc_grant_bufpdl_pa(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h10;
    stim[1] = 5'h17;
    stim[2] = 5'h16;
    stim[3] = 5'h0a;
    stim[4] = 5'h19;
    stim[5] = 5'h0e;
    stim[6] = 5'h06;
    stim[7] = 5'h07;
    stim[8] = 5'h1d;
    stim[9] = 5'h03;
    stim[10] = 5'h05;
    stim[11] = 5'h1e;
    stim[12] = 5'h1b;
    stim[13] = 5'h04;
    stim[14] = 5'h0a;
    stim[15] = 5'h11;
    stim[16] = 5'h09;
    stim[17] = 5'h0b;
    stim[18] = 5'h02;
    stim[19] = 5'h14;
    stim[20] = 5'h11;
    stim[21] = 5'h03;
    stim[22] = 5'h18;
    stim[23] = 5'h08;
    stim[24] = 5'h12;
    stim[25] = 5'h02;
    stim[26] = 5'h02;
    stim[27] = 5'h14;
    stim[28] = 5'h1f;
    stim[29] = 5'h16;
    stim[30] = 5'h0c;
    stim[31] = 5'h1f;
    stim[32] = 5'h0b;
    stim[33] = 5'h1e;
    stim[34] = 5'h18;
    stim[35] = 5'h0a;
    stim[36] = 5'h13;
    stim[37] = 5'h16;
    stim[38] = 5'h0e;
    stim[39] = 5'h18;
    stim[40] = 5'h1b;
    stim[41] = 5'h1e;
    stim[42] = 5'h17;
    stim[43] = 5'h05;
    stim[44] = 5'h15;
    stim[45] = 5'h1f;
    stim[46] = 5'h0b;
    stim[47] = 5'h00;
    stim[48] = 5'h06;
    stim[49] = 5'h02;
    stim[50] = 5'h1a;
    stim[51] = 5'h16;
    stim[52] = 5'h00;
    stim[53] = 5'h08;
    stim[54] = 5'h0b;
    stim[55] = 5'h02;
    stim[56] = 5'h1f;
    stim[57] = 5'h16;
    stim[58] = 5'h09;
    stim[59] = 5'h11;
    stim[60] = 5'h01;
    stim[61] = 5'h04;
    stim[62] = 5'h0a;
    stim[63] = 5'h1f;
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
      expv[0] = 5'h0f;
      expv[1] = 5'h08;
      expv[2] = 5'h09;
      expv[3] = 5'h15;
      expv[4] = 5'h06;
      expv[5] = 5'h11;
      expv[6] = 5'h19;
      expv[7] = 5'h18;
      expv[8] = 5'h02;
      expv[9] = 5'h1c;
      expv[10] = 5'h1a;
      expv[11] = 5'h01;
      expv[12] = 5'h04;
      expv[13] = 5'h1b;
      expv[14] = 5'h15;
      expv[15] = 5'h0e;
      expv[16] = 5'h16;
      expv[17] = 5'h14;
      expv[18] = 5'h1d;
      expv[19] = 5'h0b;
      expv[20] = 5'h0e;
      expv[21] = 5'h1c;
      expv[22] = 5'h07;
      expv[23] = 5'h17;
      expv[24] = 5'h0d;
      expv[25] = 5'h1d;
      expv[26] = 5'h1d;
      expv[27] = 5'h0b;
      expv[28] = 5'h00;
      expv[29] = 5'h09;
      expv[30] = 5'h13;
      expv[31] = 5'h00;
      expv[32] = 5'h14;
      expv[33] = 5'h01;
      expv[34] = 5'h07;
      expv[35] = 5'h15;
      expv[36] = 5'h0c;
      expv[37] = 5'h09;
      expv[38] = 5'h11;
      expv[39] = 5'h07;
      expv[40] = 5'h04;
      expv[41] = 5'h01;
      expv[42] = 5'h08;
      expv[43] = 5'h1a;
      expv[44] = 5'h0a;
      expv[45] = 5'h00;
      expv[46] = 5'h14;
      expv[47] = 5'h1f;
      expv[48] = 5'h19;
      expv[49] = 5'h1d;
      expv[50] = 5'h05;
      expv[51] = 5'h09;
      expv[52] = 5'h1f;
      expv[53] = 5'h17;
      expv[54] = 5'h14;
      expv[55] = 5'h1d;
      expv[56] = 5'h00;
      expv[57] = 5'h09;
      expv[58] = 5'h16;
      expv[59] = 5'h0e;
      expv[60] = 5'h1e;
      expv[61] = 5'h1b;
      expv[62] = 5'h15;
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
