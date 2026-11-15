// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_phy_glue dut (
    .in(in_vec[19:0]),
    .out(out_vec[21:2]),
    .const_out(out_vec[1:1]),
    .polinv(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'had69d;
    stim[1] = 20'h93e7f;
    stim[2] = 20'h41f18;
    stim[3] = 20'h8db28;
    stim[4] = 20'h489ee;
    stim[5] = 20'h76280;
    stim[6] = 20'h89b7d;
    stim[7] = 20'h707fe;
    stim[8] = 20'hb1b33;
    stim[9] = 20'h38086;
    stim[10] = 20'h8771f;
    stim[11] = 20'h3e2d8;
    stim[12] = 20'h34d49;
    stim[13] = 20'hcba39;
    stim[14] = 20'h5f337;
    stim[15] = 20'he292e;
    stim[16] = 20'hb566f;
    stim[17] = 20'hcea94;
    stim[18] = 20'h0d961;
    stim[19] = 20'h624a6;
    stim[20] = 20'ha26fe;
    stim[21] = 20'hea681;
    stim[22] = 20'h91292;
    stim[23] = 20'h86ad9;
    stim[24] = 20'h5728b;
    stim[25] = 20'hd89f0;
    stim[26] = 20'hf340b;
    stim[27] = 20'h0f01a;
    stim[28] = 20'hb2c34;
    stim[29] = 20'h1ab53;
    stim[30] = 20'h015a2;
    stim[31] = 20'hae877;
    stim[32] = 20'h466b8;
    stim[33] = 20'h80454;
    stim[34] = 20'hbe429;
    stim[35] = 20'h21ecc;
    stim[36] = 20'h69e3a;
    stim[37] = 20'h3dcb6;
    stim[38] = 20'h2b308;
    stim[39] = 20'h87bbf;
    stim[40] = 20'hfc14e;
    stim[41] = 20'hb6292;
    stim[42] = 20'h8cf17;
    stim[43] = 20'h0e45f;
    stim[44] = 20'h996d6;
    stim[45] = 20'hb3f90;
    stim[46] = 20'hc9e5c;
    stim[47] = 20'hfd2df;
    stim[48] = 20'h242fd;
    stim[49] = 20'h6f972;
    stim[50] = 20'h96ed7;
    stim[51] = 20'h9077c;
    stim[52] = 20'h6dcaf;
    stim[53] = 20'hf7974;
    stim[54] = 20'h2f4c1;
    stim[55] = 20'hce94e;
    stim[56] = 20'h2e2d2;
    stim[57] = 20'h866ec;
    stim[58] = 20'h936c7;
    stim[59] = 20'h497de;
    stim[60] = 20'haee02;
    stim[61] = 20'hfe5f1;
    stim[62] = 20'h5162a;
    stim[63] = 20'h314ad;
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
      expv[0] = 22'h2b5a74;
      expv[1] = 22'h24f9fc;
      expv[2] = 22'h107c60;
      expv[3] = 22'h236ca0;
      expv[4] = 22'h1227b8;
      expv[5] = 22'h1d8a00;
      expv[6] = 22'h226df4;
      expv[7] = 22'h1c1ff8;
      expv[8] = 22'h2c6ccc;
      expv[9] = 22'h0e0218;
      expv[10] = 22'h21dc7c;
      expv[11] = 22'h0f8b60;
      expv[12] = 22'h0d3524;
      expv[13] = 22'h32e8e4;
      expv[14] = 22'h17ccdc;
      expv[15] = 22'h38a4b8;
      expv[16] = 22'h2d59bc;
      expv[17] = 22'h33aa50;
      expv[18] = 22'h036584;
      expv[19] = 22'h189298;
      expv[20] = 22'h289bf8;
      expv[21] = 22'h3a9a04;
      expv[22] = 22'h244a48;
      expv[23] = 22'h21ab64;
      expv[24] = 22'h15ca2c;
      expv[25] = 22'h3627c0;
      expv[26] = 22'h3cd02c;
      expv[27] = 22'h03c068;
      expv[28] = 22'h2cb0d0;
      expv[29] = 22'h06ad4c;
      expv[30] = 22'h005688;
      expv[31] = 22'h2ba1dc;
      expv[32] = 22'h119ae0;
      expv[33] = 22'h201150;
      expv[34] = 22'h2f90a4;
      expv[35] = 22'h087b30;
      expv[36] = 22'h1a78e8;
      expv[37] = 22'h0f72d8;
      expv[38] = 22'h0acc20;
      expv[39] = 22'h21eefc;
      expv[40] = 22'h3f0538;
      expv[41] = 22'h2d8a48;
      expv[42] = 22'h233c5c;
      expv[43] = 22'h03917c;
      expv[44] = 22'h265b58;
      expv[45] = 22'h2cfe40;
      expv[46] = 22'h327970;
      expv[47] = 22'h3f4b7c;
      expv[48] = 22'h090bf4;
      expv[49] = 22'h1be5c8;
      expv[50] = 22'h25bb5c;
      expv[51] = 22'h241df0;
      expv[52] = 22'h1b72bc;
      expv[53] = 22'h3de5d0;
      expv[54] = 22'h0bd304;
      expv[55] = 22'h33a538;
      expv[56] = 22'h0b8b48;
      expv[57] = 22'h219bb0;
      expv[58] = 22'h24db1c;
      expv[59] = 22'h125f78;
      expv[60] = 22'h2bb808;
      expv[61] = 22'h3f97c4;
      expv[62] = 22'h1458a8;
      expv[63] = 22'h0c52b4;
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
