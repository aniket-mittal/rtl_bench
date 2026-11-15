// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01637 dut (
    .man(in_vec[12:3]),
    .exp(in_vec[2:0]),
    .lin(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0207;
    stim[1] = 13'h082d;
    stim[2] = 13'h11f7;
    stim[3] = 13'h19bf;
    stim[4] = 13'h0707;
    stim[5] = 13'h028a;
    stim[6] = 13'h0fab;
    stim[7] = 13'h08e0;
    stim[8] = 13'h0286;
    stim[9] = 13'h13c6;
    stim[10] = 13'h1f01;
    stim[11] = 13'h19d0;
    stim[12] = 13'h1525;
    stim[13] = 13'h141e;
    stim[14] = 13'h111e;
    stim[15] = 13'h040f;
    stim[16] = 13'h1382;
    stim[17] = 13'h0702;
    stim[18] = 13'h04aa;
    stim[19] = 13'h0fea;
    stim[20] = 13'h1d71;
    stim[21] = 13'h0392;
    stim[22] = 13'h13d9;
    stim[23] = 13'h12db;
    stim[24] = 13'h1017;
    stim[25] = 13'h07d1;
    stim[26] = 13'h0208;
    stim[27] = 13'h0b0a;
    stim[28] = 13'h15d2;
    stim[29] = 13'h1e47;
    stim[30] = 13'h1df1;
    stim[31] = 13'h0976;
    stim[32] = 13'h163c;
    stim[33] = 13'h0c2c;
    stim[34] = 13'h0ed3;
    stim[35] = 13'h1db5;
    stim[36] = 13'h14da;
    stim[37] = 13'h0d8c;
    stim[38] = 13'h0eff;
    stim[39] = 13'h02a9;
    stim[40] = 13'h0be1;
    stim[41] = 13'h0756;
    stim[42] = 13'h08da;
    stim[43] = 13'h196c;
    stim[44] = 13'h02a3;
    stim[45] = 13'h1fd8;
    stim[46] = 13'h0fc4;
    stim[47] = 13'h0c97;
    stim[48] = 13'h1840;
    stim[49] = 13'h0d21;
    stim[50] = 13'h0478;
    stim[51] = 13'h0256;
    stim[52] = 13'h1664;
    stim[53] = 13'h17f9;
    stim[54] = 13'h1ae3;
    stim[55] = 13'h12bf;
    stim[56] = 13'h0669;
    stim[57] = 13'h0656;
    stim[58] = 13'h14f6;
    stim[59] = 13'h05f2;
    stim[60] = 13'h02e9;
    stim[61] = 13'h19c7;
    stim[62] = 13'h1f33;
    stim[63] = 13'h1c4c;
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
      expv[0] = 16'h1000;
      expv[1] = 16'h1050;
      expv[2] = 16'h8f80;
      expv[3] = 16'hcdc0;
      expv[4] = 16'h3800;
      expv[5] = 16'h00a2;
      expv[6] = 16'h07d4;
      expv[7] = 16'h0000;
      expv[8] = 16'h0a00;
      expv[9] = 16'hcf00;
      expv[10] = 16'hffe0;
      expv[11] = 16'h0000;
      expv[12] = 16'hea40;
      expv[13] = 16'hd060;
      expv[14] = 16'hc460;
      expv[15] = 16'h2040;
      expv[16] = 16'hfce0;
      expv[17] = 16'h01c0;
      expv[18] = 16'h012a;
      expv[19] = 16'h03fa;
      expv[20] = 16'hffae;
      expv[21] = 16'h00e4;
      expv[22] = 16'hfe7b;
      expv[23] = 16'hf96c;
      expv[24] = 16'h8080;
      expv[25] = 16'h00fa;
      expv[26] = 16'h0000;
      expv[27] = 16'h02c2;
      expv[28] = 16'hfd74;
      expv[29] = 16'hf200;
      expv[30] = 16'hffbe;
      expv[31] = 16'h25c0;
      expv[32] = 16'hf638;
      expv[33] = 16'h0c28;
      expv[34] = 16'h0768;
      expv[35] = 16'hfb60;
      expv[36] = 16'hfd36;
      expv[37] = 16'h0d88;
      expv[38] = 16'h77c0;
      expv[39] = 16'h0055;
      expv[40] = 16'h017c;
      expv[41] = 16'h1d40;
      expv[42] = 16'h0236;
      expv[43] = 16'hf968;
      expv[44] = 16'h0150;
      expv[45] = 16'h0000;
      expv[46] = 16'h0fc0;
      expv[47] = 16'h6480;
      expv[48] = 16'h0000;
      expv[49] = 16'h01a4;
      expv[50] = 16'h0000;
      expv[51] = 16'h0940;
      expv[52] = 16'hf660;
      expv[53] = 16'hfeff;
      expv[54] = 16'hfd70;
      expv[55] = 16'h95c0;
      expv[56] = 16'h00cd;
      expv[57] = 16'h1940;
      expv[58] = 16'hd3c0;
      expv[59] = 16'h017c;
      expv[60] = 16'h005d;
      expv[61] = 16'hce00;
      expv[62] = 16'hff98;
      expv[63] = 16'hfc48;
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
