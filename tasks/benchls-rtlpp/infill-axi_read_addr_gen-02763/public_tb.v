// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02763 dut (
    .ACLK(clk),
    .ARESETn(in_vec[49:49]),
    .ARADDR(in_vec[48:17]),
    .ARBURST(in_vec[16:15]),
    .ARSIZE(in_vec[14:12]),
    .ARLEN(in_vec[11:4]),
    .ARVALID(in_vec[3:3]),
    .RVALID(in_vec[2:2]),
    .RREADY(in_vec[1:1]),
    .RLAST(in_vec[0:0]),
    .ARREADY(out_vec[33:33]),
    .SIF_RD_ADDR(out_vec[32:1]),
    .SIF_RD_EN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h01f8d34ecb77e;
    stim[1] = 50'h036f4251b2d8a;
    stim[2] = 50'h307ee9e0df8c8;
    stim[3] = 50'h26e804d812f79;
    stim[4] = 50'h369d5bed2d5c0;
    stim[5] = 50'h321e2af40ceae;
    stim[6] = 50'h2430ff6a87aaf;
    stim[7] = 50'h2369d7827547f;
    stim[8] = 50'h3a8797575c508;
    stim[9] = 50'h200777b2f4ba7;
    stim[10] = 50'h2158eac1b26d9;
    stim[11] = 50'h245af73fdc793;
    stim[12] = 50'h21679f2273d60;
    stim[13] = 50'h3562bb0409acf;
    stim[14] = 50'h3c0a43c7515ea;
    stim[15] = 50'h3e62ea22ffe40;
    stim[16] = 50'h28adfdf5e4027;
    stim[17] = 50'h3741c88da8383;
    stim[18] = 50'h35a593e11c217;
    stim[19] = 50'h35f55cccda447;
    stim[20] = 50'h20d736d07a74e;
    stim[21] = 50'h2916975150117;
    stim[22] = 50'h353c6db6ce020;
    stim[23] = 50'h2dc47add667c2;
    stim[24] = 50'h24db7336dbbfb;
    stim[25] = 50'h20beabee6f61b;
    stim[26] = 50'h3a9ebb3b4ee2b;
    stim[27] = 50'h24453d43e16ab;
    stim[28] = 50'h3bda8930e5719;
    stim[29] = 50'h3d92b0b7825c5;
    stim[30] = 50'h2eaa720bb6ce9;
    stim[31] = 50'h216f0663b134c;
    stim[32] = 50'h2d7d2a9d87edf;
    stim[33] = 50'h255283d8dd56c;
    stim[34] = 50'h2ea1b328ffc31;
    stim[35] = 50'h30919f88d514c;
    stim[36] = 50'h313ee0ab4ec3a;
    stim[37] = 50'h3a0e265a7f732;
    stim[38] = 50'h34edc8406976d;
    stim[39] = 50'h307c64ac74e59;
    stim[40] = 50'h211bd69bb603a;
    stim[41] = 50'h320eafa14e4cd;
    stim[42] = 50'h3aabcb856d105;
    stim[43] = 50'h3f27d487bba75;
    stim[44] = 50'h37a15f03f2cf0;
    stim[45] = 50'h25a07f53d8973;
    stim[46] = 50'h304c8016dc165;
    stim[47] = 50'h3b0cefee10b9a;
    stim[48] = 50'h25941f8d42db8;
    stim[49] = 50'h219cc0febbf24;
    stim[50] = 50'h23bf88b0a73e7;
    stim[51] = 50'h2233d79604cec;
    stim[52] = 50'h3ea03c7b6f2c3;
    stim[53] = 50'h3ea98bec64b8d;
    stim[54] = 50'h37bf45f5985cb;
    stim[55] = 50'h2c764c114877f;
    stim[56] = 50'h3c0d892679b41;
    stim[57] = 50'h3efff36f86fe3;
    stim[58] = 50'h229ec64dde8c9;
    stim[59] = 50'h226ce358e4c4e;
    stim[60] = 50'h24420cd6d666f;
    stim[61] = 50'h22a4fcbc7b339;
    stim[62] = 50'h29a535400560c;
    stim[63] = 50'h22c1428872703;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h107ee9e01;
      expv[4] = 34'h107ee9e00;
      expv[5] = 34'h107ee9e00;
      expv[6] = 34'h107ee9e00;
      expv[7] = 34'h307ee9e00;
      expv[8] = 34'h0369d7821;
      expv[9] = 34'h0369d7820;
      expv[10] = 34'h2369d7820;
      expv[11] = 34'h0158eac11;
      expv[12] = 34'h0158eac21;
      expv[13] = 34'h0158eac21;
      expv[14] = 34'h2158eac31;
      expv[15] = 34'h1c0a43c71;
      expv[16] = 34'h1c0a43c71;
      expv[17] = 34'h3c0a43c71;
      expv[18] = 34'h3c0a43c70;
      expv[19] = 34'h3c0a43c70;
      expv[20] = 34'h3c0a43c70;
      expv[21] = 34'h00d736d01;
      expv[22] = 34'h20d736d01;
      expv[23] = 34'h20d736d00;
      expv[24] = 34'h20d736d00;
      expv[25] = 34'h04db73361;
      expv[26] = 34'h04db73371;
      expv[27] = 34'h04db73381;
      expv[28] = 34'h04db73391;
      expv[29] = 34'h04db733a1;
      expv[30] = 34'h04db733b1;
      expv[31] = 34'h04db733c1;
      expv[32] = 34'h04db733d1;
      expv[33] = 34'h24db733e1;
      expv[34] = 34'h055283d81;
      expv[35] = 34'h055283d80;
      expv[36] = 34'h055283d80;
      expv[37] = 34'h055283d80;
      expv[38] = 34'h055283d80;
      expv[39] = 34'h055283d80;
      expv[40] = 34'h055283d80;
      expv[41] = 34'h055283d80;
      expv[42] = 34'h055283d80;
      expv[43] = 34'h055283d80;
      expv[44] = 34'h055283d80;
      expv[45] = 34'h055283d80;
      expv[46] = 34'h055283d80;
      expv[47] = 34'h055283d80;
      expv[48] = 34'h055283d80;
      expv[49] = 34'h055283d80;
      expv[50] = 34'h055283d80;
      expv[51] = 34'h255283d80;
      expv[52] = 34'h0233d7961;
      expv[53] = 34'h0233d7960;
      expv[54] = 34'h0233d7960;
      expv[55] = 34'h0233d7960;
      expv[56] = 34'h2233d7960;
      expv[57] = 34'h2233d7960;
      expv[58] = 34'h2233d7960;
      expv[59] = 34'h029ec64d1;
      expv[60] = 34'h029ec64d0;
      expv[61] = 34'h229ec64d0;
      expv[62] = 34'h02a4fcbc1;
      expv[63] = 34'h02a4fcbd1;
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
