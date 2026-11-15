// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032249 dut (
    .A(in_vec[23:10]),
    .B(in_vec[9:1]),
    .TC(in_vec[0:0]),
    .QUOTIENT(out_vec[14:1]),
    .DIVIDE_BY_0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hecba35;
    stim[1] = 24'hd3c676;
    stim[2] = 24'h39cf1c;
    stim[3] = 24'ha44290;
    stim[4] = 24'h16ca98;
    stim[5] = 24'hb82ef4;
    stim[6] = 24'hb5f61e;
    stim[7] = 24'h4050ba;
    stim[8] = 24'hc360e1;
    stim[9] = 24'haccd4a;
    stim[10] = 24'h7d2e5d;
    stim[11] = 24'hd71a3d;
    stim[12] = 24'h5c66eb;
    stim[13] = 24'ha0f995;
    stim[14] = 24'h65cf4f;
    stim[15] = 24'h59e6cd;
    stim[16] = 24'h4df482;
    stim[17] = 24'h02583a;
    stim[18] = 24'hb7a736;
    stim[19] = 24'hcf3de3;
    stim[20] = 24'h94f4d3;
    stim[21] = 24'h821c82;
    stim[22] = 24'h692c97;
    stim[23] = 24'h04bac2;
    stim[24] = 24'h25122b;
    stim[25] = 24'h851111;
    stim[26] = 24'h579506;
    stim[27] = 24'hc91905;
    stim[28] = 24'h65af3b;
    stim[29] = 24'h94f582;
    stim[30] = 24'h018898;
    stim[31] = 24'hf935e0;
    stim[32] = 24'h9c1530;
    stim[33] = 24'h2ae2f8;
    stim[34] = 24'h1944f6;
    stim[35] = 24'h1d1390;
    stim[36] = 24'h73ccb2;
    stim[37] = 24'h5bb361;
    stim[38] = 24'h1ec27e;
    stim[39] = 24'h441feb;
    stim[40] = 24'hf8725e;
    stim[41] = 24'hec7678;
    stim[42] = 24'h753f7c;
    stim[43] = 24'h0d0d94;
    stim[44] = 24'h1d420a;
    stim[45] = 24'he6f152;
    stim[46] = 24'h01fe82;
    stim[47] = 24'h267ce2;
    stim[48] = 24'hfbac79;
    stim[49] = 24'h9f34bc;
    stim[50] = 24'h58b0ed;
    stim[51] = 24'h1205b8;
    stim[52] = 24'h2ed8d0;
    stim[53] = 24'ha124e3;
    stim[54] = 24'h8b4c60;
    stim[55] = 24'h80dc75;
    stim[56] = 24'ha98f57;
    stim[57] = 24'h7dca9e;
    stim[58] = 24'hf09e32;
    stim[59] = 24'hd8fdbe;
    stim[60] = 24'h4f82b4;
    stim[61] = 24'h277aed;
    stim[62] = 24'h41ff76;
    stim[63] = 24'h04a334;
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
      expv[0] = 15'h000a;
      expv[1] = 15'h0056;
      expv[2] = 15'h0012;
      expv[3] = 15'h0040;
      expv[4] = 15'h0008;
      expv[5] = 15'h003e;
      expv[6] = 15'h0054;
      expv[7] = 15'h0058;
      expv[8] = 15'h7fbc;
      expv[9] = 15'h0086;
      expv[10] = 15'h7fb4;
      expv[11] = 15'h0016;
      expv[12] = 15'h7fac;
      expv[13] = 15'h7fc4;
      expv[14] = 15'h7f6e;
      expv[15] = 15'h7fb6;
      expv[16] = 15'h0098;
      expv[17] = 15'h000a;
      expv[18] = 15'h0038;
      expv[19] = 15'h7fe8;
      expv[20] = 15'h7f7e;
      expv[21] = 15'h0100;
      expv[22] = 15'h00b2;
      expv[23] = 15'h0000;
      expv[24] = 15'h7fec;
      expv[25] = 15'h7f8e;
      expv[26] = 15'h0054;
      expv[27] = 15'h7fca;
      expv[28] = 15'h7f7e;
      expv[29] = 15'h0062;
      expv[30] = 15'h0002;
      expv[31] = 15'h0084;
      expv[32] = 15'h0082;
      expv[33] = 15'h000e;
      expv[34] = 15'h001a;
      expv[35] = 15'h0008;
      expv[36] = 15'h00a6;
      expv[37] = 15'h7f6e;
      expv[38] = 15'h000c;
      expv[39] = 15'h7ce8;
      expv[40] = 15'h0068;
      expv[41] = 15'h005e;
      expv[42] = 15'h0020;
      expv[43] = 15'h0008;
      expv[44] = 15'h000e;
      expv[45] = 15'h00ae;
      expv[46] = 15'h0000;
      expv[47] = 15'h002a;
      expv[48] = 15'h7ff8;
      expv[49] = 15'h00d8;
      expv[50] = 15'h0060;
      expv[51] = 15'h000a;
      expv[52] = 15'h0038;
      expv[53] = 15'h7f96;
      expv[54] = 15'h0172;
      expv[55] = 15'h7ee8;
      expv[56] = 15'h0082;
      expv[57] = 15'h0030;
      expv[58] = 15'h006c;
      expv[59] = 15'h007c;
      expv[60] = 15'h001c;
      expv[61] = 15'h7fdc;
      expv[62] = 15'h0012;
      expv[63] = 15'h0000;
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
