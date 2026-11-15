// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03893 dut (
    .CLK(clk),
    .RESET_N(in_vec[22:22]),
    .CMD(in_vec[21:19]),
    .ADDR(in_vec[18:3]),
    .REF_ACK(in_vec[2:2]),
    .INIT_ACK(in_vec[1:1]),
    .CM_ACK(in_vec[0:0]),
    .NOP(out_vec[24:24]),
    .READA(out_vec[23:23]),
    .WRITEA(out_vec[22:22]),
    .REFRESH(out_vec[21:21]),
    .PRECHARGE(out_vec[20:20]),
    .LOAD_MODE(out_vec[19:19]),
    .SADDR(out_vec[18:3]),
    .REF_REQ(out_vec[2:2]),
    .INIT_REQ(out_vec[1:1]),
    .CMD_ACK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h304ee7;
    stim[1] = 23'h1f212e;
    stim[2] = 23'h5ab101;
    stim[3] = 23'h4f3098;
    stim[4] = 23'h6f3d46;
    stim[5] = 23'h7f15d9;
    stim[6] = 23'h4cf74d;
    stim[7] = 23'h543bd7;
    stim[8] = 23'h4ec769;
    stim[9] = 23'h55b66d;
    stim[10] = 23'h4bd1cd;
    stim[11] = 23'h41b355;
    stim[12] = 23'h5af0be;
    stim[13] = 23'h5daded;
    stim[14] = 23'h5196c7;
    stim[15] = 23'h75d442;
    stim[16] = 23'h40172b;
    stim[17] = 23'h7ce5cd;
    stim[18] = 23'h4fb2fe;
    stim[19] = 23'h5ae568;
    stim[20] = 23'h7a27ae;
    stim[21] = 23'h65261d;
    stim[22] = 23'h44da25;
    stim[23] = 23'h4b76ba;
    stim[24] = 23'h5e2f66;
    stim[25] = 23'h53a1a3;
    stim[26] = 23'h6b206e;
    stim[27] = 23'h7a10cb;
    stim[28] = 23'h5543c5;
    stim[29] = 23'h7fff74;
    stim[30] = 23'h6422c8;
    stim[31] = 23'h6a4c4e;
    stim[32] = 23'h4d44fc;
    stim[33] = 23'h40c254;
    stim[34] = 23'h569589;
    stim[35] = 23'h75ecfb;
    stim[36] = 23'h6dbea3;
    stim[37] = 23'h57a02e;
    stim[38] = 23'h41a353;
    stim[39] = 23'h5c607d;
    stim[40] = 23'h43711f;
    stim[41] = 23'h6728cd;
    stim[42] = 23'h679099;
    stim[43] = 23'h40f0c2;
    stim[44] = 23'h5e9b7f;
    stim[45] = 23'h6d992d;
    stim[46] = 23'h468af0;
    stim[47] = 23'h404050;
    stim[48] = 23'h6b053f;
    stim[49] = 23'h5dc344;
    stim[50] = 23'h5f82bd;
    stim[51] = 23'h42bc61;
    stim[52] = 23'h6b1a0f;
    stim[53] = 23'h41576b;
    stim[54] = 23'h6da3a0;
    stim[55] = 23'h48461d;
    stim[56] = 23'h68b7e2;
    stim[57] = 23'h550d95;
    stim[58] = 23'h5b3f62;
    stim[59] = 23'h51294b;
    stim[60] = 23'h743cf0;
    stim[61] = 23'h7056cb;
    stim[62] = 23'h47069b;
    stim[63] = 23'h77d3b4;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h002b107;
      expv[4] = 25'h087309a;
      expv[5] = 25'h0073d42;
      expv[6] = 25'h00715db;
      expv[7] = 25'h084f74a;
      expv[8] = 25'h0443bd3;
      expv[9] = 25'h086c76a;
      expv[10] = 25'h045b66b;
      expv[11] = 25'h083d1ca;
      expv[12] = 25'h101b353;
      expv[13] = 25'h002f0ba;
      expv[14] = 25'h005adeb;
      expv[15] = 25'h04196c2;
      expv[16] = 25'h005d442;
      expv[17] = 25'h100172b;
      expv[18] = 25'h004e5ca;
      expv[19] = 25'h087b2fa;
      expv[20] = 25'h002e56a;
      expv[21] = 25'h00227aa;
      expv[22] = 25'h005261b;
      expv[23] = 25'h104da22;
      expv[24] = 25'h08376ba;
      expv[25] = 25'h0062f62;
      expv[26] = 25'h043a1a3;
      expv[27] = 25'h003206a;
      expv[28] = 25'h00210cb;
      expv[29] = 25'h04543c2;
      expv[30] = 25'h007ff72;
      expv[31] = 25'h00422ca;
      expv[32] = 25'h0024c4a;
      expv[33] = 25'h08544fa;
      expv[34] = 25'h100c252;
      expv[35] = 25'h046958b;
      expv[36] = 25'h005ecfa;
      expv[37] = 25'h005bea3;
      expv[38] = 25'h047a02a;
      expv[39] = 25'h101a353;
      expv[40] = 25'h004607a;
      expv[41] = 25'h103711b;
      expv[42] = 25'h00728ca;
      expv[43] = 25'h007909b;
      expv[44] = 25'h100f0c2;
      expv[45] = 25'h0069b7b;
      expv[46] = 25'h005992a;
      expv[47] = 25'h1068af2;
      expv[48] = 25'h1004052;
      expv[49] = 25'h003053b;
      expv[50] = 25'h005c342;
      expv[51] = 25'h00782bb;
      expv[52] = 25'h102bc62;
      expv[53] = 25'h0031a0b;
      expv[54] = 25'h101576a;
      expv[55] = 25'h005a3a2;
      expv[56] = 25'h080461b;
      expv[57] = 25'h000b7e2;
      expv[58] = 25'h0450d93;
      expv[59] = 25'h0033f62;
      expv[60] = 25'h041294b;
      expv[61] = 25'h0043cf2;
      expv[62] = 25'h00056cb;
      expv[63] = 25'h107069a;
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
