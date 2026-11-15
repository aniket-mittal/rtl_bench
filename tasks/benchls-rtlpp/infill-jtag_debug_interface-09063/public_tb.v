// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09063 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h30616571ad6;
    stim[1] = 42'h364bbb0a613;
    stim[2] = 42'h25badad7180;
    stim[3] = 42'h16ec07a64af;
    stim[4] = 42'h274bb41e036;
    stim[5] = 42'h0a273e16e09;
    stim[6] = 42'h1bd5cf1fea1;
    stim[7] = 42'h30129b6084e;
    stim[8] = 42'h0b23854327c;
    stim[9] = 42'h23d1d0b8219;
    stim[10] = 42'h3f4db021ef2;
    stim[11] = 42'h2adb8b1405b;
    stim[12] = 42'h382393411fa;
    stim[13] = 42'h3191336fc56;
    stim[14] = 42'h1eea49571aa;
    stim[15] = 42'h2c34c348bb9;
    stim[16] = 42'h13e155302e2;
    stim[17] = 42'h3593bf1003c;
    stim[18] = 42'h279ceda55e5;
    stim[19] = 42'h08750f8d9b6;
    stim[20] = 42'h1b033a18265;
    stim[21] = 42'h022ff7f96cf;
    stim[22] = 42'h03db8bd5fdb;
    stim[23] = 42'h24436badf63;
    stim[24] = 42'h3dd2dedcef9;
    stim[25] = 42'h3ff19142130;
    stim[26] = 42'h3f5a4ee54c6;
    stim[27] = 42'h23e341b36ea;
    stim[28] = 42'h371140aa1f3;
    stim[29] = 42'h04ac0222bb3;
    stim[30] = 42'h39b647d9962;
    stim[31] = 42'h2ae4d38316a;
    stim[32] = 42'h0dd11547205;
    stim[33] = 42'h0fe67b53a01;
    stim[34] = 42'h2668e8bc98e;
    stim[35] = 42'h3d707a3f2f4;
    stim[36] = 42'h2fa578c8fa3;
    stim[37] = 42'h326b98d0bae;
    stim[38] = 42'h2d27d0c51b7;
    stim[39] = 42'h1095d9e138b;
    stim[40] = 42'h09cd8c081d8;
    stim[41] = 42'h14c39556f3a;
    stim[42] = 42'h143ee3cf12b;
    stim[43] = 42'h1de737aba78;
    stim[44] = 42'h04db3f70246;
    stim[45] = 42'h11b7a87aed4;
    stim[46] = 42'h32e0f71fcd3;
    stim[47] = 42'h3e75e69f423;
    stim[48] = 42'h08ca6831a1b;
    stim[49] = 42'h0c3ee795766;
    stim[50] = 42'h1237fa33f96;
    stim[51] = 42'h224203f4765;
    stim[52] = 42'h3d826e8b2e8;
    stim[53] = 42'h24bbdc98da2;
    stim[54] = 42'h0ee1fe8e8da;
    stim[55] = 42'h2b3c82c1893;
    stim[56] = 42'h249979bbb34;
    stim[57] = 42'h0955ae1d78e;
    stim[58] = 42'h14efda89e52;
    stim[59] = 42'h2449d0726a9;
    stim[60] = 42'h28162d9e834;
    stim[61] = 42'h14d0eeb4193;
    stim[62] = 42'h11c70e43210;
    stim[63] = 42'h2990bc55e71;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'h5eae78ff50020;
      expv[8] = 51'h5eae78ff50000;
      expv[9] = 51'h5eae78ff50000;
      expv[10] = 51'h5eae78ff50000;
      expv[11] = 51'h7a6d810f78100;
      expv[12] = 51'h7a6d810f78000;
      expv[13] = 51'h7a6d810f78000;
      expv[14] = 51'h0c899b7e2a080;
      expv[15] = 51'h0c899b7e2a000;
      expv[16] = 51'h0c899b7e2a000;
      expv[17] = 51'h0c899b7e2a000;
      expv[18] = 51'h0c899b7e2a000;
      expv[19] = 51'h0c899b7e2a000;
      expv[20] = 51'h43a87c6cdb000;
      expv[21] = 51'h43a87c6cda000;
      expv[22] = 51'h43a87c6cda000;
      expv[23] = 51'h1edc5eafec100;
      expv[24] = 51'h1edc5eafec000;
      expv[25] = 51'h6e96f6e77c800;
      expv[26] = 51'h6e96f6e77c000;
      expv[27] = 51'h6e96f6e77c000;
      expv[28] = 51'h6e96f6e77c000;
      expv[29] = 51'h6e96f6e77c000;
      expv[30] = 51'h25601115d8008;
      expv[31] = 51'h25601115d8000;
      expv[32] = 51'h25601115d8000;
      expv[33] = 51'h25601115d8000;
      expv[34] = 51'h25601115d8000;
      expv[35] = 51'h25601115d8000;
      expv[36] = 51'h25601115d8000;
      expv[37] = 51'h25601115d8000;
      expv[38] = 51'h135cc685d6000;
      expv[39] = 51'h135cc685d6000;
      expv[40] = 51'h04aecf09c4001;
      expv[41] = 51'h04aecf09c4000;
      expv[42] = 51'h04aecf09c4000;
      expv[43] = 51'h04aecf09c4000;
      expv[44] = 51'h04aecf09c4000;
      expv[45] = 51'h26d9fb8122040;
      expv[46] = 51'h26d9fb8122000;
      expv[47] = 51'h26d9fb8122000;
      expv[48] = 51'h73af34fa10020;
      expv[49] = 51'h73af34fa10000;
      expv[50] = 51'h61f73cabb2002;
      expv[51] = 51'h61f73cabb2000;
      expv[52] = 51'h61f73cabb2000;
      expv[53] = 51'h61f73cabb2000;
      expv[54] = 51'h61f73cabb2000;
      expv[55] = 51'h61f73cabb2000;
      expv[56] = 51'h61f73cabb2000;
      expv[57] = 51'h24cbcddd9a002;
      expv[58] = 51'h24cbcddd9a000;
      expv[59] = 51'h24cbcddd9a000;
      expv[60] = 51'h24cbcddd9a000;
      expv[61] = 51'h40b16cf41a020;
      expv[62] = 51'h40b16cf41a000;
      expv[63] = 51'h40b16cf41a000;
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
