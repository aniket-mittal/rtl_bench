// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_142176 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a19d;
    stim[1] = 17'h112b2;
    stim[2] = 17'h025f3;
    stim[3] = 17'h05678;
    stim[4] = 17'h04d05;
    stim[5] = 17'h0c8df;
    stim[6] = 17'h0d967;
    stim[7] = 17'h08105;
    stim[8] = 17'h014b5;
    stim[9] = 17'h0a809;
    stim[10] = 17'h0a17e;
    stim[11] = 17'h082ca;
    stim[12] = 17'h0bb61;
    stim[13] = 17'h02bb6;
    stim[14] = 17'h0bb92;
    stim[15] = 17'h095af;
    stim[16] = 17'h0ae08;
    stim[17] = 17'h00842;
    stim[18] = 17'h0dfb9;
    stim[19] = 17'h04386;
    stim[20] = 17'h0cc06;
    stim[21] = 17'h0234d;
    stim[22] = 17'h06929;
    stim[23] = 17'h00c2f;
    stim[24] = 17'h07837;
    stim[25] = 17'h02b15;
    stim[26] = 17'h0f351;
    stim[27] = 17'h0b7a3;
    stim[28] = 17'h00199;
    stim[29] = 17'h01e96;
    stim[30] = 17'h0bb1b;
    stim[31] = 17'h0a650;
    stim[32] = 17'h040b4;
    stim[33] = 17'h05081;
    stim[34] = 17'h097d3;
    stim[35] = 17'h0beb1;
    stim[36] = 17'h01c65;
    stim[37] = 17'h0c42d;
    stim[38] = 17'h078df;
    stim[39] = 17'h0e3de;
    stim[40] = 17'h04e58;
    stim[41] = 17'h04334;
    stim[42] = 17'h0194a;
    stim[43] = 17'h0387d;
    stim[44] = 17'h0680a;
    stim[45] = 17'h0d670;
    stim[46] = 17'h0fa82;
    stim[47] = 17'h00a2d;
    stim[48] = 17'h0c1a7;
    stim[49] = 17'h02be1;
    stim[50] = 17'h05a97;
    stim[51] = 17'h08965;
    stim[52] = 17'h0440b;
    stim[53] = 17'h08625;
    stim[54] = 17'h0a774;
    stim[55] = 17'h0da3b;
    stim[56] = 17'h02738;
    stim[57] = 17'h03c3c;
    stim[58] = 17'h099cf;
    stim[59] = 17'h0f467;
    stim[60] = 17'h05d2e;
    stim[61] = 17'h04215;
    stim[62] = 17'h02380;
    stim[63] = 17'h013bf;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h025f;
      expv[5] = 16'h07c6;
      expv[6] = 16'hfc97;
      expv[7] = 16'hf8ff;
      expv[8] = 16'h03b9;
      expv[9] = 16'h0699;
      expv[10] = 16'h03aa;
      expv[11] = 16'h01dd;
      expv[12] = 16'hfdbf;
      expv[13] = 16'hfd30;
      expv[14] = 16'h07b9;
      expv[15] = 16'h0081;
      expv[16] = 16'h028a;
      expv[17] = 16'h035b;
      expv[18] = 16'h0259;
      expv[19] = 16'hffcc;
      expv[20] = 16'h0254;
      expv[21] = 16'hfd14;
      expv[22] = 16'hff20;
      expv[23] = 16'h00e1;
      expv[24] = 16'hf9cc;
      expv[25] = 16'h0662;
      expv[26] = 16'h013c;
      expv[27] = 16'h01ed;
      expv[28] = 16'hfa1b;
      expv[29] = 16'h04cd;
      expv[30] = 16'hfce1;
      expv[31] = 16'hfcdd;
      expv[32] = 16'hf921;
      expv[33] = 16'hf85d;
      expv[34] = 16'hfc22;
      expv[35] = 16'hfffc;
      expv[36] = 16'hfe0f;
      expv[37] = 16'hffa1;
      expv[38] = 16'hfcee;
      expv[39] = 16'h03ce;
      expv[40] = 16'h01a7;
      expv[41] = 16'h042b;
      expv[42] = 16'h06ee;
      expv[43] = 16'hfebe;
      expv[44] = 16'hf851;
      expv[45] = 16'hfd69;
      expv[46] = 16'hff32;
      expv[47] = 16'hf924;
      expv[48] = 16'h07d0;
      expv[49] = 16'h04e3;
      expv[50] = 16'hfa70;
      expv[51] = 16'hff21;
      expv[52] = 16'h04c7;
      expv[53] = 16'hfca6;
      expv[54] = 16'h0557;
      expv[55] = 16'hfafd;
      expv[56] = 16'hffa7;
      expv[57] = 16'h0451;
      expv[58] = 16'h0321;
      expv[59] = 16'hfe52;
      expv[60] = 16'hfd88;
      expv[61] = 16'hfea9;
      expv[62] = 16'h021d;
      expv[63] = 16'h02e7;
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
