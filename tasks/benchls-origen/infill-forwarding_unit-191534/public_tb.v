// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191534 dut (
    .rf_waddr_exmem(in_vec[24:21]),
    .rf_waddr_memwb(in_vec[20:17]),
    .inst_curr_IDEX_7_4_rs(in_vec[16:13]),
    .inst_curr_IDEX_3_0_rt(in_vec[12:9]),
    .inst_curr_IDEX_11_8_rd(in_vec[8:5]),
    .rf_wen_exmem(in_vec[4:4]),
    .rf_wen_memwb(in_vec[3:3]),
    .mem2reg_memwb(in_vec[2:2]),
    .mem2reg_exmem(in_vec[1:1]),
    .dmem_wen_idex(in_vec[0:0]),
    .forwardA(out_vec[5:4]),
    .forwardB(out_vec[3:2]),
    .rdata2_sw_fcontrol(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h018f55f;
    stim[1] = 25'h126cad1;
    stim[2] = 25'h0bc03a6;
    stim[3] = 25'h0951eda;
    stim[4] = 25'h1a4d851;
    stim[5] = 25'h14d6103;
    stim[6] = 25'h1cca588;
    stim[7] = 25'h11ef1da;
    stim[8] = 25'h11af5e9;
    stim[9] = 25'h1ac439a;
    stim[10] = 25'h1a4af8e;
    stim[11] = 25'h165edc4;
    stim[12] = 25'h0662a8c;
    stim[13] = 25'h06c7325;
    stim[14] = 25'h00b54d3;
    stim[15] = 25'h0d61724;
    stim[16] = 25'h0611009;
    stim[17] = 25'h0c85c00;
    stim[18] = 25'h0fed0a8;
    stim[19] = 25'h06ca99a;
    stim[20] = 25'h115b2d8;
    stim[21] = 25'h0d67a7e;
    stim[22] = 25'h070ec38;
    stim[23] = 25'h0464246;
    stim[24] = 25'h005f53e;
    stim[25] = 25'h0d31ebf;
    stim[26] = 25'h1edfc15;
    stim[27] = 25'h0b95c12;
    stim[28] = 25'h060e2dc;
    stim[29] = 25'h02b1b85;
    stim[30] = 25'h0d76d46;
    stim[31] = 25'h1fc7211;
    stim[32] = 25'h0642f8e;
    stim[33] = 25'h00615ba;
    stim[34] = 25'h05b2368;
    stim[35] = 25'h055dcc3;
    stim[36] = 25'h02585fe;
    stim[37] = 25'h16b0f6e;
    stim[38] = 25'h07a64f7;
    stim[39] = 25'h118774c;
    stim[40] = 25'h195ad87;
    stim[41] = 25'h0167301;
    stim[42] = 25'h1316f0d;
    stim[43] = 25'h04dcad4;
    stim[44] = 25'h13caf7c;
    stim[45] = 25'h149cb11;
    stim[46] = 25'h1e1c37c;
    stim[47] = 25'h066b50e;
    stim[48] = 25'h0a17ebf;
    stim[49] = 25'h0c2e817;
    stim[50] = 25'h071f236;
    stim[51] = 25'h1f31bda;
    stim[52] = 25'h00a1192;
    stim[53] = 25'h1035f15;
    stim[54] = 25'h1c2f7c7;
    stim[55] = 25'h089a7ee;
    stim[56] = 25'h1b3b5b1;
    stim[57] = 25'h10aff10;
    stim[58] = 25'h017cde1;
    stim[59] = 25'h04da12d;
    stim[60] = 25'h1b4dd40;
    stim[61] = 25'h0bb37d6;
    stim[62] = 25'h111db07;
    stim[63] = 25'h0455852;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h0a;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h20;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h05;
      expv[37] = 6'h00;
      expv[38] = 6'h20;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h20;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h00;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
