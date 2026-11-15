// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145097 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .in(in_vec[23:8]),
    .ctl(in_vec[7:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1c69ee9;
    stim[1] = 25'h1782cbf;
    stim[2] = 25'h054e852;
    stim[3] = 25'h0628bd4;
    stim[4] = 25'h0e94a13;
    stim[5] = 25'h0f58261;
    stim[6] = 25'h0c0f100;
    stim[7] = 25'h0ba11f6;
    stim[8] = 25'h0dd6054;
    stim[9] = 25'h09b775f;
    stim[10] = 25'h0ae8367;
    stim[11] = 25'h080c468;
    stim[12] = 25'h0ad4695;
    stim[13] = 25'h01c185a;
    stim[14] = 25'h0243db1;
    stim[15] = 25'h08baa4f;
    stim[16] = 25'h0322981;
    stim[17] = 25'h01cfcad;
    stim[18] = 25'h0086fb7;
    stim[19] = 25'h001976e;
    stim[20] = 25'h083faa0;
    stim[21] = 25'h0ad6d00;
    stim[22] = 25'h0028596;
    stim[23] = 25'h0138e76;
    stim[24] = 25'h0f258de;
    stim[25] = 25'h0f9618e;
    stim[26] = 25'h0106694;
    stim[27] = 25'h098c62d;
    stim[28] = 25'h0f4628d;
    stim[29] = 25'h05d5244;
    stim[30] = 25'h00f167c;
    stim[31] = 25'h08b5e9e;
    stim[32] = 25'h120edaf;
    stim[33] = 25'h0d44cbe;
    stim[34] = 25'h0a7b2a1;
    stim[35] = 25'h0586b3b;
    stim[36] = 25'h0854d36;
    stim[37] = 25'h073302b;
    stim[38] = 25'h0a957d4;
    stim[39] = 25'h0fb7004;
    stim[40] = 25'h02d2ad7;
    stim[41] = 25'h00b32ea;
    stim[42] = 25'h0b29c1a;
    stim[43] = 25'h0f24786;
    stim[44] = 25'h02a856e;
    stim[45] = 25'h07d24d5;
    stim[46] = 25'h0f66b00;
    stim[47] = 25'h08ca99b;
    stim[48] = 25'h0241e43;
    stim[49] = 25'h0c09b54;
    stim[50] = 25'h0621fae;
    stim[51] = 25'h07e86c6;
    stim[52] = 25'h0308193;
    stim[53] = 25'h0635586;
    stim[54] = 25'h0d740b3;
    stim[55] = 25'h0b0d84f;
    stim[56] = 25'h0586850;
    stim[57] = 25'h05097e0;
    stim[58] = 25'h027724d;
    stim[59] = 25'h0eb7d8d;
    stim[60] = 25'h09b6bfa;
    stim[61] = 25'h0dd3d21;
    stim[62] = 25'h0408b1d;
    stim[63] = 25'h03cccd2;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h54e8;
      expv[4] = 16'h628b;
      expv[5] = 16'he94a;
      expv[6] = 16'hf582;
      expv[7] = 16'hc0f1;
      expv[8] = 16'h7422;
      expv[9] = 16'h9820;
      expv[10] = 16'h6ddc;
      expv[11] = 16'h688f;
      expv[12] = 16'h0498;
      expv[13] = 16'hbcea;
      expv[14] = 16'he0c0;
      expv[15] = 16'h4625;
      expv[16] = 16'h74a4;
      expv[17] = 16'h27c3;
      expv[18] = 16'h21d8;
      expv[19] = 16'h5cc5;
      expv[20] = 16'h0fe6;
      expv[21] = 16'habbe;
      expv[22] = 16'hc642;
      expv[23] = 16'h1bb7;
      expv[24] = 16'hc38c;
      expv[25] = 16'h69c8;
      expv[26] = 16'hbdca;
      expv[27] = 16'hb462;
      expv[28] = 16'hf7bc;
      expv[29] = 16'h8036;
      expv[30] = 16'ha534;
      expv[31] = 16'ha5f2;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'hd44c;
      expv[35] = 16'ha7b2;
      expv[36] = 16'h586b;
      expv[37] = 16'h854d;
      expv[38] = 16'he660;
      expv[39] = 16'hfc05;
      expv[40] = 16'hedc0;
      expv[41] = 16'he1d2;
      expv[42] = 16'h432c;
      expv[43] = 16'he244;
      expv[44] = 16'h9238;
      expv[45] = 16'h7ead;
      expv[46] = 16'he368;
      expv[47] = 16'h9699;
      expv[48] = 16'h7e9a;
      expv[49] = 16'h8d4a;
      expv[50] = 16'h860e;
      expv[51] = 16'h3755;
      expv[52] = 16'hf13c;
      expv[53] = 16'h158b;
      expv[54] = 16'he152;
      expv[55] = 16'h3fc0;
      expv[56] = 16'he870;
      expv[57] = 16'hcc78;
      expv[58] = 16'h25e6;
      expv[59] = 16'hb1e6;
      expv[60] = 16'h32e2;
      expv[61] = 16'had99;
      expv[62] = 16'ha462;
      expv[63] = 16'hc5f9;
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
