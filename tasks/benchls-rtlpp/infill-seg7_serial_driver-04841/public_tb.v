// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04841 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h50588fc7f4ebd;
    stim[1] = 52'ha645ef2134fcd;
    stim[2] = 52'hf14c6bb84df82;
    stim[3] = 52'h671d5f1bdf9ee;
    stim[4] = 52'hf0bfc3e013a52;
    stim[5] = 52'hbf8ee083ba273;
    stim[6] = 52'hc3b0f2f719cda;
    stim[7] = 52'h7bab3d971b85a;
    stim[8] = 52'h71805c3db91d2;
    stim[9] = 52'h9e74f26a52431;
    stim[10] = 52'h4697cad78c858;
    stim[11] = 52'h048b80b414c39;
    stim[12] = 52'h2f5d7c8b3b1a9;
    stim[13] = 52'h3592889c41baa;
    stim[14] = 52'h1cd8ed35a1b3b;
    stim[15] = 52'h16b3b14550302;
    stim[16] = 52'h931a8ea9ba621;
    stim[17] = 52'h53207fd651870;
    stim[18] = 52'h8bcf47f63ccab;
    stim[19] = 52'he9769ac26e7f2;
    stim[20] = 52'h5e1139ca41ac1;
    stim[21] = 52'hca7dec2f19b88;
    stim[22] = 52'h34535645a82f2;
    stim[23] = 52'h67060109219a8;
    stim[24] = 52'hb7ffee4e94fc9;
    stim[25] = 52'h7236e127f1a43;
    stim[26] = 52'h2295c584a6d3a;
    stim[27] = 52'h6547bfbcfb4ab;
    stim[28] = 52'h1d3fd306015b9;
    stim[29] = 52'h68a8101f5f2fa;
    stim[30] = 52'heb500460f297a;
    stim[31] = 52'h93544b89418ba;
    stim[32] = 52'he554c6630aa81;
    stim[33] = 52'h14d4693443639;
    stim[34] = 52'h28911c016da88;
    stim[35] = 52'hef1f00ba75b0b;
    stim[36] = 52'habeeccfd13441;
    stim[37] = 52'hd224205f7ac7b;
    stim[38] = 52'hd7b33ba588bc8;
    stim[39] = 52'h496732eed9353;
    stim[40] = 52'h33dd2ca4c0e50;
    stim[41] = 52'h6d64de8a94e1a;
    stim[42] = 52'h94fa2a1d9ccb9;
    stim[43] = 52'h683b091051182;
    stim[44] = 52'hed79117695e03;
    stim[45] = 52'he7828c7ec1771;
    stim[46] = 52'hb59a93715bab3;
    stim[47] = 52'hded058a805779;
    stim[48] = 52'hcb7620e53d2b8;
    stim[49] = 52'h2ca8f9233d1f3;
    stim[50] = 52'h54082b030f77b;
    stim[51] = 52'h9535fa2ab86a2;
    stim[52] = 52'he1af3e2b2f059;
    stim[53] = 52'ha437caf5123d8;
    stim[54] = 52'he0d11e2705ec0;
    stim[55] = 52'hda135439b1a18;
    stim[56] = 52'h08525257464fb;
    stim[57] = 52'h09b2536ad1778;
    stim[58] = 52'hc34049e0d5703;
    stim[59] = 52'hfb2d541135cc0;
    stim[60] = 52'heb3a8fcb19268;
    stim[61] = 52'h79e3dbf3abb6a;
    stim[62] = 52'h57460f24c9fe2;
    stim[63] = 52'hbb9626d63d8f2;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h6;
      expv[3] = 4'h2;
      expv[4] = 4'h6;
      expv[5] = 4'h6;
      expv[6] = 4'h6;
      expv[7] = 4'h6;
      expv[8] = 4'h6;
      expv[9] = 4'h4;
      expv[10] = 4'h4;
      expv[11] = 4'h4;
      expv[12] = 4'h4;
      expv[13] = 4'h6;
      expv[14] = 4'h6;
      expv[15] = 4'h6;
      expv[16] = 4'h4;
      expv[17] = 4'h4;
      expv[18] = 4'h6;
      expv[19] = 4'h6;
      expv[20] = 4'h4;
      expv[21] = 4'h4;
      expv[22] = 4'h6;
      expv[23] = 4'h4;
      expv[24] = 4'h4;
      expv[25] = 4'h6;
      expv[26] = 4'h6;
      expv[27] = 4'h6;
      expv[28] = 4'h4;
      expv[29] = 4'h6;
      expv[30] = 4'h6;
      expv[31] = 4'h6;
      expv[32] = 4'h4;
      expv[33] = 4'h4;
      expv[34] = 4'h4;
      expv[35] = 4'h6;
      expv[36] = 4'h4;
      expv[37] = 4'h6;
      expv[38] = 4'h4;
      expv[39] = 4'h6;
      expv[40] = 4'h4;
      expv[41] = 4'h6;
      expv[42] = 4'h4;
      expv[43] = 4'h6;
      expv[44] = 4'h6;
      expv[45] = 4'h4;
      expv[46] = 4'h6;
      expv[47] = 4'h4;
      expv[48] = 4'h4;
      expv[49] = 4'h6;
      expv[50] = 4'h6;
      expv[51] = 4'h6;
      expv[52] = 4'h4;
      expv[53] = 4'h4;
      expv[54] = 4'h4;
      expv[55] = 4'h4;
      expv[56] = 4'h6;
      expv[57] = 4'h4;
      expv[58] = 4'h6;
      expv[59] = 4'h4;
      expv[60] = 4'h4;
      expv[61] = 4'h6;
      expv[62] = 4'h6;
      expv[63] = 4'h6;
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
