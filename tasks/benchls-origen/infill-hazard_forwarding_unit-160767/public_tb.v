// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_160767 dut (
    .clk(clk),
    .ID_branch(in_vec[23:23]),
    .IDEX_regWrite(in_vec[22:22]),
    .EXMEM_regWrite(in_vec[21:21]),
    .EXMEM_memRead(in_vec[20:20]),
    .EX_regDst(in_vec[19:15]),
    .EXMEM_regRd(in_vec[14:10]),
    .ID_regRt(in_vec[9:5]),
    .ID_regRs(in_vec[4:0]),
    .forward1(out_vec[4:4]),
    .forward2(out_vec[3:3]),
    .PCWrite(out_vec[2:2]),
    .IFID_write(out_vec[1:1]),
    .ID_flush(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h57c207;
    stim[1] = 24'hfea61d;
    stim[2] = 24'h2b0c7c;
    stim[3] = 24'h810475;
    stim[4] = 24'h216312;
    stim[5] = 24'h328482;
    stim[6] = 24'h887e8c;
    stim[7] = 24'hef197c;
    stim[8] = 24'h98a4c0;
    stim[9] = 24'h3de15e;
    stim[10] = 24'hd6f0cc;
    stim[11] = 24'h328294;
    stim[12] = 24'hba0f41;
    stim[13] = 24'h14327b;
    stim[14] = 24'hfb72d7;
    stim[15] = 24'he15d1c;
    stim[16] = 24'h90affa;
    stim[17] = 24'h6cc733;
    stim[18] = 24'h6cb618;
    stim[19] = 24'h06f218;
    stim[20] = 24'h54cba3;
    stim[21] = 24'h05a6e4;
    stim[22] = 24'hee9081;
    stim[23] = 24'h0f212e;
    stim[24] = 24'h2e28d3;
    stim[25] = 24'h39081e;
    stim[26] = 24'h541482;
    stim[27] = 24'h378438;
    stim[28] = 24'h8a6657;
    stim[29] = 24'he01261;
    stim[30] = 24'hc3a227;
    stim[31] = 24'hca7c2b;
    stim[32] = 24'h28f4c0;
    stim[33] = 24'h96ac44;
    stim[34] = 24'hce0213;
    stim[35] = 24'he13ee2;
    stim[36] = 24'h2dd4c4;
    stim[37] = 24'hed01cf;
    stim[38] = 24'h055453;
    stim[39] = 24'he45b38;
    stim[40] = 24'h931baa;
    stim[41] = 24'hc38336;
    stim[42] = 24'hd39b89;
    stim[43] = 24'h448178;
    stim[44] = 24'hecc10a;
    stim[45] = 24'h4952c2;
    stim[46] = 24'hab1479;
    stim[47] = 24'h175ec8;
    stim[48] = 24'h505c68;
    stim[49] = 24'ha91e17;
    stim[50] = 24'h0a7fd8;
    stim[51] = 24'hfb765e;
    stim[52] = 24'h1bb626;
    stim[53] = 24'h88f357;
    stim[54] = 24'h41e4a9;
    stim[55] = 24'hc5f001;
    stim[56] = 24'hdf0d71;
    stim[57] = 24'h71fb44;
    stim[58] = 24'hdcf64b;
    stim[59] = 24'h244ad0;
    stim[60] = 24'h05c642;
    stim[61] = 24'ha6b4c9;
    stim[62] = 24'h3da574;
    stim[63] = 24'hd156d9;
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
      expv[0] = 5'h06;
      expv[1] = 5'h06;
      expv[2] = 5'h01;
      expv[3] = 5'h06;
      expv[4] = 5'h06;
      expv[5] = 5'h06;
      expv[6] = 5'h06;
      expv[7] = 5'h06;
      expv[8] = 5'h06;
      expv[9] = 5'h06;
      expv[10] = 5'h06;
      expv[11] = 5'h06;
      expv[12] = 5'h06;
      expv[13] = 5'h06;
      expv[14] = 5'h06;
      expv[15] = 5'h01;
      expv[16] = 5'h06;
      expv[17] = 5'h06;
      expv[18] = 5'h06;
      expv[19] = 5'h06;
      expv[20] = 5'h06;
      expv[21] = 5'h06;
      expv[22] = 5'h06;
      expv[23] = 5'h0e;
      expv[24] = 5'h06;
      expv[25] = 5'h06;
      expv[26] = 5'h06;
      expv[27] = 5'h06;
      expv[28] = 5'h06;
      expv[29] = 5'h06;
      expv[30] = 5'h06;
      expv[31] = 5'h01;
      expv[32] = 5'h06;
      expv[33] = 5'h06;
      expv[34] = 5'h06;
      expv[35] = 5'h06;
      expv[36] = 5'h01;
      expv[37] = 5'h06;
      expv[38] = 5'h06;
      expv[39] = 5'h06;
      expv[40] = 5'h06;
      expv[41] = 5'h06;
      expv[42] = 5'h06;
      expv[43] = 5'h06;
      expv[44] = 5'h06;
      expv[45] = 5'h06;
      expv[46] = 5'h06;
      expv[47] = 5'h06;
      expv[48] = 5'h06;
      expv[49] = 5'h06;
      expv[50] = 5'h06;
      expv[51] = 5'h06;
      expv[52] = 5'h06;
      expv[53] = 5'h06;
      expv[54] = 5'h06;
      expv[55] = 5'h06;
      expv[56] = 5'h06;
      expv[57] = 5'h06;
      expv[58] = 5'h06;
      expv[59] = 5'h06;
      expv[60] = 5'h06;
      expv[61] = 5'h06;
      expv[62] = 5'h06;
      expv[63] = 5'h06;
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
