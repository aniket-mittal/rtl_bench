// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07420 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .wenb(in_vec[8:8]),
    .in_data(in_vec[7:0]),
    .reg_0x3E(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3bd;
    stim[1] = 10'h36c;
    stim[2] = 10'h085;
    stim[3] = 10'h01a;
    stim[4] = 10'h1c4;
    stim[5] = 10'h110;
    stim[6] = 10'h091;
    stim[7] = 10'h10f;
    stim[8] = 10'h109;
    stim[9] = 10'h0dd;
    stim[10] = 10'h159;
    stim[11] = 10'h17b;
    stim[12] = 10'h0bb;
    stim[13] = 10'h1b1;
    stim[14] = 10'h0fe;
    stim[15] = 10'h156;
    stim[16] = 10'h12d;
    stim[17] = 10'h092;
    stim[18] = 10'h128;
    stim[19] = 10'h0a8;
    stim[20] = 10'h04a;
    stim[21] = 10'h078;
    stim[22] = 10'h05f;
    stim[23] = 10'h1d4;
    stim[24] = 10'h043;
    stim[25] = 10'h14a;
    stim[26] = 10'h1c0;
    stim[27] = 10'h1c9;
    stim[28] = 10'h0f5;
    stim[29] = 10'h066;
    stim[30] = 10'h06f;
    stim[31] = 10'h05e;
    stim[32] = 10'h1fa;
    stim[33] = 10'h05e;
    stim[34] = 10'h024;
    stim[35] = 10'h076;
    stim[36] = 10'h1b7;
    stim[37] = 10'h017;
    stim[38] = 10'h0d1;
    stim[39] = 10'h112;
    stim[40] = 10'h0b2;
    stim[41] = 10'h1ea;
    stim[42] = 10'h059;
    stim[43] = 10'h055;
    stim[44] = 10'h0e5;
    stim[45] = 10'h150;
    stim[46] = 10'h15f;
    stim[47] = 10'h024;
    stim[48] = 10'h18d;
    stim[49] = 10'h159;
    stim[50] = 10'h098;
    stim[51] = 10'h1f9;
    stim[52] = 10'h048;
    stim[53] = 10'h168;
    stim[54] = 10'h1a5;
    stim[55] = 10'h024;
    stim[56] = 10'h094;
    stim[57] = 10'h048;
    stim[58] = 10'h12b;
    stim[59] = 10'h04e;
    stim[60] = 10'h1ee;
    stim[61] = 10'h0a3;
    stim[62] = 10'h1a6;
    stim[63] = 10'h0c4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h85;
      expv[4] = 8'h1a;
      expv[5] = 8'h1a;
      expv[6] = 8'h1a;
      expv[7] = 8'h91;
      expv[8] = 8'h91;
      expv[9] = 8'h91;
      expv[10] = 8'hdd;
      expv[11] = 8'hdd;
      expv[12] = 8'hdd;
      expv[13] = 8'hbb;
      expv[14] = 8'hbb;
      expv[15] = 8'hfe;
      expv[16] = 8'hfe;
      expv[17] = 8'hfe;
      expv[18] = 8'h92;
      expv[19] = 8'h92;
      expv[20] = 8'ha8;
      expv[21] = 8'h4a;
      expv[22] = 8'h78;
      expv[23] = 8'h5f;
      expv[24] = 8'h5f;
      expv[25] = 8'h43;
      expv[26] = 8'h43;
      expv[27] = 8'h43;
      expv[28] = 8'h43;
      expv[29] = 8'hf5;
      expv[30] = 8'h66;
      expv[31] = 8'h6f;
      expv[32] = 8'h5e;
      expv[33] = 8'h5e;
      expv[34] = 8'h5e;
      expv[35] = 8'h24;
      expv[36] = 8'h76;
      expv[37] = 8'h76;
      expv[38] = 8'h17;
      expv[39] = 8'hd1;
      expv[40] = 8'hd1;
      expv[41] = 8'hb2;
      expv[42] = 8'hb2;
      expv[43] = 8'h59;
      expv[44] = 8'h55;
      expv[45] = 8'he5;
      expv[46] = 8'he5;
      expv[47] = 8'he5;
      expv[48] = 8'h24;
      expv[49] = 8'h24;
      expv[50] = 8'h24;
      expv[51] = 8'h98;
      expv[52] = 8'h98;
      expv[53] = 8'h48;
      expv[54] = 8'h48;
      expv[55] = 8'h48;
      expv[56] = 8'h24;
      expv[57] = 8'h94;
      expv[58] = 8'h48;
      expv[59] = 8'h48;
      expv[60] = 8'h4e;
      expv[61] = 8'h4e;
      expv[62] = 8'ha3;
      expv[63] = 8'ha3;
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
