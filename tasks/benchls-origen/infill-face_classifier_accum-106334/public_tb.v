// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106334 dut (
    .Clk(clk),
    .Z(in_vec[33:2]),
    .classify(in_vec[1:1]),
    .RST(in_vec[0:0]),
    .Hw(out_vec[16:16]),
    .To_Hex(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h244204c4f;
    stim[1] = 34'h35e2bdcbd;
    stim[2] = 34'h10b5c8c5e;
    stim[3] = 34'h214d16eaf;
    stim[4] = 34'h27a0a2286;
    stim[5] = 34'h0f8c5bf8c;
    stim[6] = 34'h2fdb0166a;
    stim[7] = 34'h16aa495a8;
    stim[8] = 34'h0a991ae50;
    stim[9] = 34'h22acc14f6;
    stim[10] = 34'h1916bbf02;
    stim[11] = 34'h002598f86;
    stim[12] = 34'h1b619567c;
    stim[13] = 34'h040a666ca;
    stim[14] = 34'h3cc65cb64;
    stim[15] = 34'h2bdfdf9ee;
    stim[16] = 34'h1d149e2a2;
    stim[17] = 34'h3cdb71018;
    stim[18] = 34'h330f2e71e;
    stim[19] = 34'h03d9802ce;
    stim[20] = 34'h283de5460;
    stim[21] = 34'h2bd478f54;
    stim[22] = 34'h250c09f58;
    stim[23] = 34'h1011890aa;
    stim[24] = 34'h2760000e0;
    stim[25] = 34'h2012a2e25;
    stim[26] = 34'h1351422e6;
    stim[27] = 34'h056eddce8;
    stim[28] = 34'h061cece7a;
    stim[29] = 34'h01ab55ea0;
    stim[30] = 34'h01fd0aa4a;
    stim[31] = 34'h296b2fb3a;
    stim[32] = 34'h3696b2c32;
    stim[33] = 34'h2730ac918;
    stim[34] = 34'h1fb44c412;
    stim[35] = 34'h31fd11806;
    stim[36] = 34'h00cd81ff2;
    stim[37] = 34'h3c4d052b0;
    stim[38] = 34'h1bb78b4d3;
    stim[39] = 34'h0211eaa1e;
    stim[40] = 34'h3baa13d02;
    stim[41] = 34'h16b9eae56;
    stim[42] = 34'h321aca5bb;
    stim[43] = 34'h39c951dc4;
    stim[44] = 34'h173679b9c;
    stim[45] = 34'h34c77a9cc;
    stim[46] = 34'h25f8cee08;
    stim[47] = 34'h17bd63de5;
    stim[48] = 34'h167acc95a;
    stim[49] = 34'h0fbd4f89c;
    stim[50] = 34'h1085d8d4e;
    stim[51] = 34'h1c81e4710;
    stim[52] = 34'h399d1df5a;
    stim[53] = 34'h00ee57828;
    stim[54] = 34'h3291ff1b8;
    stim[55] = 34'h04fbfe896;
    stim[56] = 34'h016fbcaee;
    stim[57] = 34'h143a9a8e8;
    stim[58] = 34'h38943404c;
    stim[59] = 34'h0e571700c;
    stim[60] = 34'h220afa5b8;
    stim[61] = 34'h31b68c5b6;
    stim[62] = 34'h3394c9e18;
    stim[63] = 34'h154560702;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h10000;
      expv[6] = 17'h10000;
      expv[7] = 17'h10000;
      expv[8] = 17'h10000;
      expv[9] = 17'h10000;
      expv[10] = 17'h10000;
      expv[11] = 17'h10000;
      expv[12] = 17'h10000;
      expv[13] = 17'h10000;
      expv[14] = 17'h10000;
      expv[15] = 17'h10000;
      expv[16] = 17'h10000;
      expv[17] = 17'h10000;
      expv[18] = 17'h10000;
      expv[19] = 17'h10000;
      expv[20] = 17'h10000;
      expv[21] = 17'h10000;
      expv[22] = 17'h10000;
      expv[23] = 17'h10000;
      expv[24] = 17'h10000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h10000;
      expv[28] = 17'h10000;
      expv[29] = 17'h10000;
      expv[30] = 17'h10000;
      expv[31] = 17'h10000;
      expv[32] = 17'h10000;
      expv[33] = 17'h10000;
      expv[34] = 17'h10000;
      expv[35] = 17'h10000;
      expv[36] = 17'h10000;
      expv[37] = 17'h10000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h10000;
      expv[41] = 17'h10000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h10000;
      expv[50] = 17'h10000;
      expv[51] = 17'h10000;
      expv[52] = 17'h10000;
      expv[53] = 17'h10000;
      expv[54] = 17'h10000;
      expv[55] = 17'h10000;
      expv[56] = 17'h10000;
      expv[57] = 17'h10000;
      expv[58] = 17'h10000;
      expv[59] = 17'h10000;
      expv[60] = 17'h10000;
      expv[61] = 17'h10000;
      expv[62] = 17'h10000;
      expv[63] = 17'h10000;
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
