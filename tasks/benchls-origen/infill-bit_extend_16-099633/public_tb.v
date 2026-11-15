// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099633 dut (
    .in(in_vec[7:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hea;
    stim[1] = 8'ha9;
    stim[2] = 8'hc9;
    stim[3] = 8'h2d;
    stim[4] = 8'hd3;
    stim[5] = 8'hfa;
    stim[6] = 8'h78;
    stim[7] = 8'hc9;
    stim[8] = 8'h42;
    stim[9] = 8'h1d;
    stim[10] = 8'h61;
    stim[11] = 8'hbe;
    stim[12] = 8'hb2;
    stim[13] = 8'h08;
    stim[14] = 8'hb6;
    stim[15] = 8'h7c;
    stim[16] = 8'hd3;
    stim[17] = 8'h73;
    stim[18] = 8'he9;
    stim[19] = 8'h87;
    stim[20] = 8'ha1;
    stim[21] = 8'hb3;
    stim[22] = 8'hf3;
    stim[23] = 8'he1;
    stim[24] = 8'h6c;
    stim[25] = 8'h50;
    stim[26] = 8'h05;
    stim[27] = 8'h9e;
    stim[28] = 8'hff;
    stim[29] = 8'hbf;
    stim[30] = 8'h83;
    stim[31] = 8'h06;
    stim[32] = 8'hb9;
    stim[33] = 8'h90;
    stim[34] = 8'h43;
    stim[35] = 8'h0f;
    stim[36] = 8'h60;
    stim[37] = 8'ha1;
    stim[38] = 8'h91;
    stim[39] = 8'ha9;
    stim[40] = 8'h91;
    stim[41] = 8'h91;
    stim[42] = 8'h3b;
    stim[43] = 8'h30;
    stim[44] = 8'h3c;
    stim[45] = 8'h46;
    stim[46] = 8'h17;
    stim[47] = 8'h43;
    stim[48] = 8'hb5;
    stim[49] = 8'he3;
    stim[50] = 8'h24;
    stim[51] = 8'h30;
    stim[52] = 8'h5c;
    stim[53] = 8'hfe;
    stim[54] = 8'h50;
    stim[55] = 8'h76;
    stim[56] = 8'hbc;
    stim[57] = 8'h36;
    stim[58] = 8'ha0;
    stim[59] = 8'h7c;
    stim[60] = 8'h0e;
    stim[61] = 8'h8f;
    stim[62] = 8'h6d;
    stim[63] = 8'ha9;
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
      expv[0] = 16'hffea;
      expv[1] = 16'hffa9;
      expv[2] = 16'hffc9;
      expv[3] = 16'h002d;
      expv[4] = 16'hffd3;
      expv[5] = 16'hfffa;
      expv[6] = 16'h0078;
      expv[7] = 16'hffc9;
      expv[8] = 16'h0042;
      expv[9] = 16'h001d;
      expv[10] = 16'h0061;
      expv[11] = 16'hffbe;
      expv[12] = 16'hffb2;
      expv[13] = 16'h0008;
      expv[14] = 16'hffb6;
      expv[15] = 16'h007c;
      expv[16] = 16'hffd3;
      expv[17] = 16'h0073;
      expv[18] = 16'hffe9;
      expv[19] = 16'hff87;
      expv[20] = 16'hffa1;
      expv[21] = 16'hffb3;
      expv[22] = 16'hfff3;
      expv[23] = 16'hffe1;
      expv[24] = 16'h006c;
      expv[25] = 16'h0050;
      expv[26] = 16'h0005;
      expv[27] = 16'hff9e;
      expv[28] = 16'hffff;
      expv[29] = 16'hffbf;
      expv[30] = 16'hff83;
      expv[31] = 16'h0006;
      expv[32] = 16'hffb9;
      expv[33] = 16'hff90;
      expv[34] = 16'h0043;
      expv[35] = 16'h000f;
      expv[36] = 16'h0060;
      expv[37] = 16'hffa1;
      expv[38] = 16'hff91;
      expv[39] = 16'hffa9;
      expv[40] = 16'hff91;
      expv[41] = 16'hff91;
      expv[42] = 16'h003b;
      expv[43] = 16'h0030;
      expv[44] = 16'h003c;
      expv[45] = 16'h0046;
      expv[46] = 16'h0017;
      expv[47] = 16'h0043;
      expv[48] = 16'hffb5;
      expv[49] = 16'hffe3;
      expv[50] = 16'h0024;
      expv[51] = 16'h0030;
      expv[52] = 16'h005c;
      expv[53] = 16'hfffe;
      expv[54] = 16'h0050;
      expv[55] = 16'h0076;
      expv[56] = 16'hffbc;
      expv[57] = 16'h0036;
      expv[58] = 16'hffa0;
      expv[59] = 16'h007c;
      expv[60] = 16'h000e;
      expv[61] = 16'hff8f;
      expv[62] = 16'h006d;
      expv[63] = 16'hffa9;
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
