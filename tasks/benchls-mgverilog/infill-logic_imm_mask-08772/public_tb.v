// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 192;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08772 dut (
    .LowMaskSel_Top(in_vec[23:18]),
    .HighMaskSel_Top(in_vec[17:12]),
    .LowMaskSel_Bot(in_vec[11:6]),
    .HighMaskSel_Bot(in_vec[5:0]),
    .LogicImm(out_vec[191:128]),
    .LowLogicImm(out_vec[127:64]),
    .HighLogicImm(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'ha6d156;
    stim[1] = 24'h66b413;
    stim[2] = 24'h6d045c;
    stim[3] = 24'h04bfe4;
    stim[4] = 24'hc62287;
    stim[5] = 24'h230f07;
    stim[6] = 24'h1091ed;
    stim[7] = 24'hab6df1;
    stim[8] = 24'h536595;
    stim[9] = 24'h74a262;
    stim[10] = 24'h5ca8de;
    stim[11] = 24'h28a77e;
    stim[12] = 24'h94629a;
    stim[13] = 24'h33806e;
    stim[14] = 24'h81a477;
    stim[15] = 24'ha784f8;
    stim[16] = 24'h94eb80;
    stim[17] = 24'h02b6f0;
    stim[18] = 24'h52e6e9;
    stim[19] = 24'h12c75c;
    stim[20] = 24'h6f9024;
    stim[21] = 24'h1e3b67;
    stim[22] = 24'h33534b;
    stim[23] = 24'h64da4f;
    stim[24] = 24'h9aa778;
    stim[25] = 24'hf0c0b2;
    stim[26] = 24'h77c7f4;
    stim[27] = 24'h144c9b;
    stim[28] = 24'h56452a;
    stim[29] = 24'hf2fbb2;
    stim[30] = 24'h9eeea4;
    stim[31] = 24'h7ff1b5;
    stim[32] = 24'h040d83;
    stim[33] = 24'hedf3ff;
    stim[34] = 24'hcfb7f8;
    stim[35] = 24'h577928;
    stim[36] = 24'he26036;
    stim[37] = 24'h3d65ab;
    stim[38] = 24'h91d790;
    stim[39] = 24'h9e3ee7;
    stim[40] = 24'hfd0f78;
    stim[41] = 24'h6c95e7;
    stim[42] = 24'h51d950;
    stim[43] = 24'hb813ca;
    stim[44] = 24'h10095d;
    stim[45] = 24'h6e6aae;
    stim[46] = 24'h49879f;
    stim[47] = 24'ha9fcbf;
    stim[48] = 24'he4ce95;
    stim[49] = 24'h57732f;
    stim[50] = 24'h79e08c;
    stim[51] = 24'h7f2752;
    stim[52] = 24'hd5e881;
    stim[53] = 24'hae8a20;
    stim[54] = 24'he6e679;
    stim[55] = 24'hee4c52;
    stim[56] = 24'h0d9f52;
    stim[57] = 24'h95c44c;
    stim[58] = 24'h6ac2dc;
    stim[59] = 24'h7045de;
    stim[60] = 24'h9226c3;
    stim[61] = 24'h6eac1c;
    stim[62] = 24'h20f5dc;
    stim[63] = 24'hbca006;
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
      expv[0] = 192'h00003e00007fffe0fffffe00ffffffe000003fff007fffff;
      expv[1] = 192'h00000fff000f0000ffffffffffff000000000fff000fffff;
      expv[2] = 192'h000000001ffe0000fffffffffffe0000000000001fffffff;
      expv[3] = 192'h0000000000000000ffffffff0000000000000000ffffffff;
      expv[4] = 192'h0000000000000000fffe0000fffffc0000000007000000ff;
      expv[5] = 192'h0001ffff00000000ffffffff000000000001ffff000000ff;
      expv[6] = 192'h00000000ffffff80ffffffffffffff8000000000ffffffff;
      expv[7] = 192'h007ffc0000000000fffffc0000000000007fffffffffffff;
      expv[8] = 192'h007fffff00000000ffffffffffc00000007fffff003fffff;
      expv[9] = 192'h00000000fffffe00fffffffffffffe0000000000ffffffff;
      expv[10] = 192'h0000000000000000ffffffff00000000000000007fffffff;
      expv[11] = 192'h00000000e0000000ffffffffe000000000000000ffffffff;
      expv[12] = 192'h0000000007fffc00ffffffe0fffffc000000000007ffffff;
      expv[13] = 192'h01fffffffffffffefffffffffffffffe01ffffffffffffff;
      expv[14] = 192'h00000000fffe0000fffffffffffe000000000000ffffffff;
      expv[15] = 192'h01fffe00fff80000fffffe00fff8000001ffffffffffffff;
      expv[16] = 192'h0000000000000000ffffffe0000000000000000000000001;
      expv[17] = 192'h00000ffff8000000fffffffff800000000000fffffffffff;
      expv[18] = 192'h00007ffff8000000fffffffff800000000007fffffffffff;
      expv[19] = 192'h00001fff00000000ffffffffe000000000001fff1fffffff;
      expv[20] = 192'h03ffffffffffffffffffffffffffffff03ffffffffffffff;
      expv[21] = 192'h0000000f00000000ffffffff000000000000000fffffffff;
      expv[22] = 192'h003fffff00000000ffffffffffffe000003fffff00000fff;
      expv[23] = 192'h0000000000000000ffffffff00000000000000000000ffff;
      expv[24] = 192'h000007c0e0000000ffffffc0e0000000000007ffffffffff;
      expv[25] = 192'h00000000fffffffcf0000000fffffffc00000000ffffffff;
      expv[26] = 192'h1fffffff80000000ffffffff800000001fffffffffffffff;
      expv[27] = 192'h0000000000000000ffffffff00000000000000000fffffff;
      expv[28] = 192'h0000001ffff00000fffffffffff000000000001fffffffff;
      expv[29] = 192'h0000000000000000f0000000000000000000ffffffffffff;
      expv[30] = 192'h00007f8000000000ffffff800000000000007fffffffffff;
      expv[31] = 192'hffffffffffffffc0ffffffffffffffc0ffffffffffffffff;
      expv[32] = 192'h0000000000000000ffffffff00000000000000000000000f;
      expv[33] = 192'h00000000ffff8000f8000000ffff800000000000ffffffff;
      expv[34] = 192'h0ff8000080000000fff80000800000000fffffffffffffff;
      expv[35] = 192'h00ffffff00000000ffffffff0000000000ffffffffffffff;
      expv[36] = 192'h00000000ffffffffff000000ffffffff0000007fffffffff;
      expv[37] = 192'h00000000ffc00000ffffffffffc0000000000000ffffffff;
      expv[38] = 192'h0000000000000000fffffff0c0000000000000000001ffff;
      expv[39] = 192'h0000000000000000ffffff80000000000000000fffffffff;
      expv[40] = 192'h0000000000000000800000000000000000000000ffffffff;
      expv[41] = 192'h00000000ff800000ffffffffff80000000000000ffffffff;
      expv[42] = 192'h0000000000000000ffffffff00000000000000000001ffff;
      expv[43] = 192'h0000000000000000ffffc000ffff800000000000000007ff;
      expv[44] = 192'h0000000000000000ffffffff00000000000000003fffffff;
      expv[45] = 192'h0000007f00000000ffffffff000000000000007fffffffff;
      expv[46] = 192'h00000000c0000000ffffffffc000000000000000ffffffff;
      expv[47] = 192'h0000000000000000fffffc000000000000000000ffffffff;
      expv[48] = 192'h0000000000000000fe0000000000000000000000003fffff;
      expv[49] = 192'h00fffffffffff000fffffffffffff00000ffffffffffffff;
      expv[50] = 192'h0000000000001ffcfffffffffffffffc0000000000001fff;
      expv[51] = 192'h0007ffff00000000ffffffffe00000000007ffff0007ffff;
      expv[52] = 192'h0000000000000000ffe00000000000000000000000000003;
      expv[53] = 192'h0000000000000000fffff80000000000000001ffffffffff;
      expv[54] = 192'h00000000fe000000fe000000fe00000000007fffffffffff;
      expv[55] = 192'h0000000000000000f8000000000000000000001f0007ffff;
      expv[56] = 192'h0000000000000000ffffffff00000000000000000007ffff;
      expv[57] = 192'h0000000000000000ffffffe0fffe00000000000000001fff;
      expv[58] = 192'h00001fff1ffff800fffffffffffff80000001fff1fffffff;
      expv[59] = 192'h000000007f800000ffffffffff800000000000007fffffff;
      expv[60] = 192'h0000000000000000fffffff0f8000000000000070000000f;
      expv[61] = 192'h000007ff00000000ffffffff00000000000007ff1fffffff;
      expv[62] = 192'h000000001f800000ffffffffff800000000000001fffffff;
      expv[63] = 192'h000000000000007fffff8000ffffffff000000000000007f;
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
