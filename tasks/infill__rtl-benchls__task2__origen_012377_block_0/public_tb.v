// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012377 dut (
    .Clk(clk),
    .Rst(in_vec[9:9]),
    .PC_INC(in_vec[8:8]),
    .PCH_INC(in_vec[7:7]),
    .PCH_IN(in_vec[6:6]),
    .PC_IN(in_vec[5:5]),
    .PC_OUT(in_vec[4:4]),
    .BUS_IN(in_vec[3:0]),
    .BUS_OUT(out_vec[11:8]),
    .C_MEM(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h21b;
    stim[1] = 10'h2c3;
    stim[2] = 10'h1cc;
    stim[3] = 10'h068;
    stim[4] = 10'h125;
    stim[5] = 10'h117;
    stim[6] = 10'h0ee;
    stim[7] = 10'h040;
    stim[8] = 10'h029;
    stim[9] = 10'h106;
    stim[10] = 10'h00e;
    stim[11] = 10'h1f6;
    stim[12] = 10'h0a3;
    stim[13] = 10'h040;
    stim[14] = 10'h17d;
    stim[15] = 10'h07a;
    stim[16] = 10'h14e;
    stim[17] = 10'h008;
    stim[18] = 10'h182;
    stim[19] = 10'h126;
    stim[20] = 10'h0bb;
    stim[21] = 10'h05a;
    stim[22] = 10'h09c;
    stim[23] = 10'h0ca;
    stim[24] = 10'h078;
    stim[25] = 10'h1c7;
    stim[26] = 10'h1a6;
    stim[27] = 10'h1e6;
    stim[28] = 10'h0d4;
    stim[29] = 10'h06a;
    stim[30] = 10'h1a9;
    stim[31] = 10'h1bd;
    stim[32] = 10'h0ac;
    stim[33] = 10'h1d1;
    stim[34] = 10'h0ac;
    stim[35] = 10'h08b;
    stim[36] = 10'h059;
    stim[37] = 10'h116;
    stim[38] = 10'h031;
    stim[39] = 10'h18d;
    stim[40] = 10'h13f;
    stim[41] = 10'h03d;
    stim[42] = 10'h1ed;
    stim[43] = 10'h1a1;
    stim[44] = 10'h0b3;
    stim[45] = 10'h1bd;
    stim[46] = 10'h184;
    stim[47] = 10'h3fd;
    stim[48] = 10'h007;
    stim[49] = 10'h073;
    stim[50] = 10'h031;
    stim[51] = 10'h15c;
    stim[52] = 10'h1e3;
    stim[53] = 10'h150;
    stim[54] = 10'h1f1;
    stim[55] = 10'h0f5;
    stim[56] = 10'h0d0;
    stim[57] = 10'h12f;
    stim[58] = 10'h042;
    stim[59] = 10'h1a5;
    stim[60] = 10'h0dc;
    stim[61] = 10'h1d2;
    stim[62] = 10'h127;
    stim[63] = 10'h0e2;
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
      expv[0] = 12'h000;
      expv[1] = 12'hx00;
      expv[2] = 12'hx00;
      expv[3] = 12'hxc1;
      expv[4] = 12'hx88;
      expv[5] = 12'h585;
      expv[6] = 12'hx86;
      expv[7] = 12'hxee;
      expv[8] = 12'hx0e;
      expv[9] = 12'hx09;
      expv[10] = 12'hx0a;
      expv[11] = 12'ha0a;
      expv[12] = 12'hx66;
      expv[13] = 12'hx73;
      expv[14] = 12'h303;
      expv[15] = 12'hddd;
      expv[16] = 12'hxaa;
      expv[17] = 12'hxeb;
      expv[18] = 12'hxeb;
      expv[19] = 12'hxfc;
      expv[20] = 12'h6f6;
      expv[21] = 12'hbfb;
      expv[22] = 12'hbab;
      expv[23] = 12'hxbb;
      expv[24] = 12'hbab;
      expv[25] = 12'hx88;
      expv[26] = 12'hx79;
      expv[27] = 12'hx86;
      expv[28] = 12'h666;
      expv[29] = 12'hx46;
      expv[30] = 12'hxaa;
      expv[31] = 12'h9b9;
      expv[32] = 12'hxcd;
      expv[33] = 12'hcdc;
      expv[34] = 12'hx1d;
      expv[35] = 12'hx2c;
      expv[36] = 12'hc3c;
      expv[37] = 12'hc9c;
      expv[38] = 12'hd9d;
      expv[39] = 12'hx91;
      expv[40] = 12'h2a2;
      expv[41] = 12'hfaf;
      expv[42] = 12'hxad;
      expv[43] = 12'hxdd;
      expv[44] = 12'h1e1;
      expv[45] = 12'h3f3;
      expv[46] = 12'hxfd;
      expv[47] = 12'h000;
      expv[48] = 12'hx00;
      expv[49] = 12'h000;
      expv[50] = 12'h333;
      expv[51] = 12'h131;
      expv[52] = 12'hxc2;
      expv[53] = 12'h333;
      expv[54] = 12'h404;
      expv[55] = 12'h111;
      expv[56] = 12'h555;
      expv[57] = 12'hx05;
      expv[58] = 12'hx0f;
      expv[59] = 12'hx2f;
      expv[60] = 12'h535;
      expv[61] = 12'h5c5;
      expv[62] = 12'hx26;
      expv[63] = 12'hx27;
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
