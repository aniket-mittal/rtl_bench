// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06037 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[17:17]),
    .readdata(out_vec[16:1]),
    .resetrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h08b64d;
    stim[1] = 22'h003f28;
    stim[2] = 22'h3f9c32;
    stim[3] = 22'h338bb0;
    stim[4] = 22'h2a62b7;
    stim[5] = 22'h3b8110;
    stim[6] = 22'h17b94b;
    stim[7] = 22'h131c1b;
    stim[8] = 22'h06740f;
    stim[9] = 22'h237c77;
    stim[10] = 22'h33eb82;
    stim[11] = 22'h1e94d6;
    stim[12] = 22'h22f7a1;
    stim[13] = 22'h106b8f;
    stim[14] = 22'h0be9fa;
    stim[15] = 22'h069ca9;
    stim[16] = 22'h265180;
    stim[17] = 22'h063be9;
    stim[18] = 22'h163d50;
    stim[19] = 22'h0ece05;
    stim[20] = 22'h37ff7a;
    stim[21] = 22'h3a71c9;
    stim[22] = 22'h1216b4;
    stim[23] = 22'h06e541;
    stim[24] = 22'h2fd292;
    stim[25] = 22'h0719aa;
    stim[26] = 22'h0a3657;
    stim[27] = 22'h1e7094;
    stim[28] = 22'h17c036;
    stim[29] = 22'h371b95;
    stim[30] = 22'h37e9e2;
    stim[31] = 22'h232a6e;
    stim[32] = 22'h3afcdf;
    stim[33] = 22'h23c8b8;
    stim[34] = 22'h0ae635;
    stim[35] = 22'h1aad06;
    stim[36] = 22'h16c762;
    stim[37] = 22'h2a70ed;
    stim[38] = 22'h2376c5;
    stim[39] = 22'h37a621;
    stim[40] = 22'h0b2180;
    stim[41] = 22'h370ee9;
    stim[42] = 22'h0a4715;
    stim[43] = 22'h366fbe;
    stim[44] = 22'h02e6fc;
    stim[45] = 22'h32247f;
    stim[46] = 22'h3f2d32;
    stim[47] = 22'h2ff969;
    stim[48] = 22'h166726;
    stim[49] = 22'h02b0d9;
    stim[50] = 22'h0b3e01;
    stim[51] = 22'h3702dc;
    stim[52] = 22'h3f6968;
    stim[53] = 22'h2bb32d;
    stim[54] = 22'h03529c;
    stim[55] = 22'h0651c0;
    stim[56] = 22'h0265f6;
    stim[57] = 22'h2ecb19;
    stim[58] = 22'h06e247;
    stim[59] = 22'h0720b7;
    stim[60] = 22'h1fd1f4;
    stim[61] = 22'h2ad989;
    stim[62] = 22'h268c3d;
    stim[63] = 22'h0765b4;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00004;
      expv[25] = 18'h00000;
      expv[26] = 18'h00004;
      expv[27] = 18'h00002;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00002;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00002;
      expv[42] = 18'h00000;
      expv[43] = 18'h00002;
      expv[44] = 18'h00000;
      expv[45] = 18'h00004;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00004;
      expv[51] = 18'h00002;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00004;
      expv[56] = 18'h00004;
      expv[57] = 18'h00004;
      expv[58] = 18'h00000;
      expv[59] = 18'h00004;
      expv[60] = 18'h00004;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
