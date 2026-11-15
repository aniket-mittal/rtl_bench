// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061007 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5bb75265a;
    stim[1] = 35'h42a6d3392;
    stim[2] = 35'h2f0916e0e;
    stim[3] = 35'h2e3b8705b;
    stim[4] = 35'h183846ee5;
    stim[5] = 35'h22e18d7dc;
    stim[6] = 35'h15d280812;
    stim[7] = 35'h3fd8de174;
    stim[8] = 35'h1616c5abf;
    stim[9] = 35'h08e499a9a;
    stim[10] = 35'h0f070b7dd;
    stim[11] = 35'h2d437758a;
    stim[12] = 35'h176b21575;
    stim[13] = 35'h1b3af1417;
    stim[14] = 35'h29382a354;
    stim[15] = 35'h2002662dd;
    stim[16] = 35'h3256fd2fe;
    stim[17] = 35'h3b652b7d3;
    stim[18] = 35'h1cbfd1883;
    stim[19] = 35'h140fd7f06;
    stim[20] = 35'h0015cec10;
    stim[21] = 35'h2adf589bf;
    stim[22] = 35'h1ec0db74e;
    stim[23] = 35'h347a64173;
    stim[24] = 35'h0be77e836;
    stim[25] = 35'h1158cf2c2;
    stim[26] = 35'h2eea07b8e;
    stim[27] = 35'h20ba5e171;
    stim[28] = 35'h32f433ac8;
    stim[29] = 35'h04962ceab;
    stim[30] = 35'h2241393d4;
    stim[31] = 35'h18933b3d4;
    stim[32] = 35'h16dc33ee2;
    stim[33] = 35'h1bf3e615d;
    stim[34] = 35'h00df49c3b;
    stim[35] = 35'h151e79438;
    stim[36] = 35'h21cf2a479;
    stim[37] = 35'h0c2a81255;
    stim[38] = 35'h0b8b607e9;
    stim[39] = 35'h0d819a6fd;
    stim[40] = 35'h0f611401a;
    stim[41] = 35'h04317ba55;
    stim[42] = 35'h151ae1021;
    stim[43] = 35'h0f1cd676e;
    stim[44] = 35'h2ab395cdf;
    stim[45] = 35'h350ac1f38;
    stim[46] = 35'h3d0ba6e3b;
    stim[47] = 35'h0812108df;
    stim[48] = 35'h08dcd3832;
    stim[49] = 35'h24f81d22b;
    stim[50] = 35'h1cdbd4c9e;
    stim[51] = 35'h169c72095;
    stim[52] = 35'h22c47d95f;
    stim[53] = 35'h024132e6c;
    stim[54] = 35'h0132b80d5;
    stim[55] = 35'h0b9d1b756;
    stim[56] = 35'h28c2c9948;
    stim[57] = 35'h07284ad73;
    stim[58] = 35'h3c69fb92b;
    stim[59] = 35'h06d90274d;
    stim[60] = 35'h3ad5ef1a9;
    stim[61] = 35'h3a3fa0588;
    stim[62] = 35'h2a2add80e;
    stim[63] = 35'h24b1c35d1;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h02a6d3390;
      expv[3] = 35'h6f0916e0c;
      expv[4] = 35'h6e3b8705a;
      expv[5] = 35'h583846ee4;
      expv[6] = 35'h62e18d7dc;
      expv[7] = 35'h55d280813;
      expv[8] = 35'h55d280812;
      expv[9] = 35'h5616c5abf;
      expv[10] = 35'h1616c5abf;
      expv[11] = 35'h48e499a9b;
      expv[12] = 35'h08e499a9b;
      expv[13] = 35'h6d437758a;
      expv[14] = 35'h5b3af1417;
      expv[15] = 35'h5b3af1416;
      expv[16] = 35'h6002662dc;
      expv[17] = 35'h7256fd2fe;
      expv[18] = 35'h7b652b7d2;
      expv[19] = 35'h5cbfd1883;
      expv[20] = 35'h1cbfd1883;
      expv[21] = 35'h1cbfd1883;
      expv[22] = 35'h540fd7f07;
      expv[23] = 35'h140fd7f07;
      expv[24] = 35'h5ec0db74f;
      expv[25] = 35'h1ec0db74f;
      expv[26] = 35'h1ec0db74f;
      expv[27] = 35'h1ec0db74f;
      expv[28] = 35'h4be77e837;
      expv[29] = 35'h4be77e836;
      expv[30] = 35'h44962ceab;
      expv[31] = 35'h44962ceab;
      expv[32] = 35'h44962ceab;
      expv[33] = 35'h04962ceab;
      expv[34] = 35'h56dc33ee2;
      expv[35] = 35'h40df49c3b;
      expv[36] = 35'h40df49c3a;
      expv[37] = 35'h61cf2a478;
      expv[38] = 35'h4c2a81254;
      expv[39] = 35'h4b8b607e8;
      expv[40] = 35'h4d819a6fc;
      expv[41] = 35'h4f611401a;
      expv[42] = 35'h44317ba54;
      expv[43] = 35'h551ae1020;
      expv[44] = 35'h4f1cd676e;
      expv[45] = 35'h6ab395cdf;
      expv[46] = 35'h6ab395cde;
      expv[47] = 35'h7d0ba6e3a;
      expv[48] = 35'h4812108df;
      expv[49] = 35'h0812108df;
      expv[50] = 35'h48dcd3833;
      expv[51] = 35'h08dcd3833;
      expv[52] = 35'h5cdbd4c9e;
      expv[53] = 35'h62c47d95f;
      expv[54] = 35'h62c47d95e;
      expv[55] = 35'h4132b80d4;
      expv[56] = 35'h4b9d1b757;
      expv[57] = 35'h4b9d1b756;
      expv[58] = 35'h47284ad72;
      expv[59] = 35'h7c69fb92a;
      expv[60] = 35'h46d90274c;
      expv[61] = 35'h7ad5ef1a8;
      expv[62] = 35'h7a3fa0588;
      expv[63] = 35'h6a2add80e;
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
