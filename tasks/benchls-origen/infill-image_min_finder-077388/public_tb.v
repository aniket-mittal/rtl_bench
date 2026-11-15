// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077388 dut (
    .clk(clk),
    .reset(in_vec[24:24]),
    .sti_di(in_vec[23:8]),
    .res_di(in_vec[7:0]),
    .done(out_vec[32:32]),
    .sti_rd(out_vec[31:31]),
    .sti_addr(out_vec[30:24]),
    .res_wr(out_vec[23:23]),
    .res_rd(out_vec[22:22]),
    .res_addr(out_vec[21:8]),
    .res_do(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h18796be;
    stim[1] = 25'h1971b3c;
    stim[2] = 25'h09ea390;
    stim[3] = 25'h04a7574;
    stim[4] = 25'h0aba456;
    stim[5] = 25'h13dafb9;
    stim[6] = 25'h0cafdba;
    stim[7] = 25'h04bae9f;
    stim[8] = 25'h03ab233;
    stim[9] = 25'h02607a8;
    stim[10] = 25'h0f5e234;
    stim[11] = 25'h0b3d61e;
    stim[12] = 25'h07d2859;
    stim[13] = 25'h0919420;
    stim[14] = 25'h0ef9788;
    stim[15] = 25'h01e9fcd;
    stim[16] = 25'h0e257e5;
    stim[17] = 25'h01b32a9;
    stim[18] = 25'h06e3631;
    stim[19] = 25'h0fc7c30;
    stim[20] = 25'h03161ee;
    stim[21] = 25'h043b548;
    stim[22] = 25'h0eaf101;
    stim[23] = 25'h0660041;
    stim[24] = 25'h0541d16;
    stim[25] = 25'h17e6456;
    stim[26] = 25'h0ea9429;
    stim[27] = 25'h03b29f6;
    stim[28] = 25'h01ebf79;
    stim[29] = 25'h09e2d30;
    stim[30] = 25'h0e888a7;
    stim[31] = 25'h0051b65;
    stim[32] = 25'h00e74bc;
    stim[33] = 25'h0a4ed04;
    stim[34] = 25'h0a97c98;
    stim[35] = 25'h0360729;
    stim[36] = 25'h094af9b;
    stim[37] = 25'h0b6dbdc;
    stim[38] = 25'h0e6d0b0;
    stim[39] = 25'h0d19c36;
    stim[40] = 25'h052c007;
    stim[41] = 25'h0c4bbbc;
    stim[42] = 25'h0f9a116;
    stim[43] = 25'h0f0984f;
    stim[44] = 25'h0e43b03;
    stim[45] = 25'h03f2b60;
    stim[46] = 25'h00b0f1f;
    stim[47] = 25'h0b888cc;
    stim[48] = 25'h00e0ee3;
    stim[49] = 25'h0575829;
    stim[50] = 25'h0a566e6;
    stim[51] = 25'h0b9691e;
    stim[52] = 25'h05387b0;
    stim[53] = 25'h0321b55;
    stim[54] = 25'h088ddac;
    stim[55] = 25'h09d867e;
    stim[56] = 25'h009d6f9;
    stim[57] = 25'h002d206;
    stim[58] = 25'h139af51;
    stim[59] = 25'h0345cd9;
    stim[60] = 25'h006ae75;
    stim[61] = 25'h0668f12;
    stim[62] = 25'h0ce686f;
    stim[63] = 25'h0156d8b;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h080000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h080000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h0000000ff;
      expv[10] = 33'h0000000ff;
      expv[11] = 33'h0000000ff;
      expv[12] = 33'h000800000;
      expv[13] = 33'h000000100;
      expv[14] = 33'h000000100;
      expv[15] = 33'h0000001ff;
      expv[16] = 33'h0000002ff;
      expv[17] = 33'h0000002ff;
      expv[18] = 33'h0000002ff;
      expv[19] = 33'h0000003ff;
      expv[20] = 33'h0000003ff;
      expv[21] = 33'h000800300;
      expv[22] = 33'h000000400;
      expv[23] = 33'h000000400;
      expv[24] = 33'h0000004ff;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h080000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h0000000ff;
      expv[30] = 33'h0000000ff;
      expv[31] = 33'h0000000ff;
      expv[32] = 33'h0000000ff;
      expv[33] = 33'h0000001ff;
      expv[34] = 33'h0000001ff;
      expv[35] = 33'h000800100;
      expv[36] = 33'h000000200;
      expv[37] = 33'h000000200;
      expv[38] = 33'h000800200;
      expv[39] = 33'h000000300;
      expv[40] = 33'h000000300;
      expv[41] = 33'h000800300;
      expv[42] = 33'h000000400;
      expv[43] = 33'h000000400;
      expv[44] = 33'h0000004ff;
      expv[45] = 33'h0000005ff;
      expv[46] = 33'h0000005ff;
      expv[47] = 33'h000800500;
      expv[48] = 33'h000000600;
      expv[49] = 33'h000000600;
      expv[50] = 33'h000800600;
      expv[51] = 33'h000000700;
      expv[52] = 33'h000000700;
      expv[53] = 33'h0000007ff;
      expv[54] = 33'h0000008ff;
      expv[55] = 33'h0000008ff;
      expv[56] = 33'h0000008ff;
      expv[57] = 33'h0000009ff;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h080000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h0000000ff;
      expv[63] = 33'h0000000ff;
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
