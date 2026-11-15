// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_009242 dut (
    .in1(in_vec[36:21]),
    .in2(in_vec[20:5]),
    .opcode(in_vec[4:0]),
    .out(out_vec[19:4]),
    .flags(out_vec[3:1]),
    .set_flags(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0d91b2560e;
    stim[1] = 37'h0dcb3a64d8;
    stim[2] = 37'h0c1f4ebe9b;
    stim[3] = 37'h1128599284;
    stim[4] = 37'h0a740188ee;
    stim[5] = 37'h00ed630d77;
    stim[6] = 37'h157723b99e;
    stim[7] = 37'h0da62a5f50;
    stim[8] = 37'h040e720bf5;
    stim[9] = 37'h1852ff31b7;
    stim[10] = 37'h05546bd336;
    stim[11] = 37'h10d409b4ac;
    stim[12] = 37'h1bd9898d3a;
    stim[13] = 37'h0c2a7865a2;
    stim[14] = 37'h1a6a84c4b3;
    stim[15] = 37'h1497607e8d;
    stim[16] = 37'h07aa53f1e0;
    stim[17] = 37'h1d53c958ba;
    stim[18] = 37'h05af749cd5;
    stim[19] = 37'h1f0916e73c;
    stim[20] = 37'h15d5358999;
    stim[21] = 37'h01f9670d79;
    stim[22] = 37'h160ff34ca4;
    stim[23] = 37'h19ad452ace;
    stim[24] = 37'h037237b215;
    stim[25] = 37'h06d4d08772;
    stim[26] = 37'h138742d815;
    stim[27] = 37'h128bb1d956;
    stim[28] = 37'h076a36f4e4;
    stim[29] = 37'h16421b8cb8;
    stim[30] = 37'h196af7ad85;
    stim[31] = 37'h1a00345d0f;
    stim[32] = 37'h1b24e30010;
    stim[33] = 37'h051f50bedc;
    stim[34] = 37'h0a749048d1;
    stim[35] = 37'h1796947cb8;
    stim[36] = 37'h056f6372aa;
    stim[37] = 37'h014d7261e9;
    stim[38] = 37'h0a12376b49;
    stim[39] = 37'h0711aa8ca0;
    stim[40] = 37'h0f9e72ba23;
    stim[41] = 37'h04c76b01c1;
    stim[42] = 37'h0c380271e7;
    stim[43] = 37'h17e47227b0;
    stim[44] = 37'h02669f77aa;
    stim[45] = 37'h1c53bbc545;
    stim[46] = 37'h1016de7d2f;
    stim[47] = 37'h1c7d487e15;
    stim[48] = 37'h16f95eb94a;
    stim[49] = 37'h057940e0c0;
    stim[50] = 37'h11c1e67035;
    stim[51] = 37'h1f629995ac;
    stim[52] = 37'h0b5f69d597;
    stim[53] = 37'h02a187e007;
    stim[54] = 37'h1170356074;
    stim[55] = 37'h03885402c6;
    stim[56] = 37'h17426c6adb;
    stim[57] = 37'h12aa5c1833;
    stim[58] = 37'h1e9f2b7b8e;
    stim[59] = 37'h165a96f5d2;
    stim[60] = 37'h15107339f8;
    stim[61] = 37'h1e44899816;
    stim[62] = 37'h0e912e5361;
    stim[63] = 37'h17dc4d7a63;
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
      expv[0] = 20'h6c8d0;
      expv[1] = 20'h6e590;
      expv[2] = 20'h60fa0;
      expv[3] = 20'h55d69;
      expv[4] = 20'h53a00;
      expv[5] = 20'h076b0;
      expv[6] = 20'habb90;
      expv[7] = 20'h6d310;
      expv[8] = 20'h20730;
      expv[9] = 20'hc2970;
      expv[10] = 20'h2aa30;
      expv[11] = 20'h86a00;
      expv[12] = 20'hdecc0;
      expv[13] = 20'ha27e0;
      expv[14] = 20'hd3540;
      expv[15] = 20'ha4bb0;
      expv[16] = 20'h1d020;
      expv[17] = 20'hea9e0;
      expv[18] = 20'h2d7b0;
      expv[19] = 20'hf8480;
      expv[20] = 20'haea90;
      expv[21] = 20'h0fcb0;
      expv[22] = 20'h4ae43;
      expv[23] = 20'hcd6a0;
      expv[24] = 20'h1b910;
      expv[25] = 20'h36a60;
      expv[26] = 20'h9c3a0;
      expv[27] = 20'h945d0;
      expv[28] = 20'hf2f89;
      expv[29] = 20'hb2100;
      expv[30] = 20'h0deb3;
      expv[31] = 20'hd0010;
      expv[32] = 20'hd9270;
      expv[33] = 20'h28fa0;
      expv[34] = 20'h53a40;
      expv[35] = 20'hbcb40;
      expv[36] = 20'h957b0;
      expv[37] = 20'h0a0f0;
      expv[38] = 20'h505a0;
      expv[39] = 20'h10050;
      expv[40] = 20'h830c0;
      expv[41] = 20'h7e3f0;
      expv[42] = 20'h00000;
      expv[43] = 20'hbf230;
      expv[44] = 20'hbd340;
      expv[45] = 20'h04733;
      expv[46] = 20'h80b60;
      expv[47] = 20'he3ea0;
      expv[48] = 20'hcaca0;
      expv[49] = 20'h03020;
      expv[50] = 20'h8e0f0;
      expv[51] = 20'hfb140;
      expv[52] = 20'h5afb0;
      expv[53] = 20'h150c0;
      expv[54] = 20'h8b810;
      expv[55] = 20'h7c2c9;
      expv[56] = 20'hba130;
      expv[57] = 20'h95520;
      expv[58] = 20'hf4f90;
      expv[59] = 20'hb2d40;
      expv[60] = 20'ha8830;
      expv[61] = 20'hf2240;
      expv[62] = 20'h769b0;
      expv[63] = 20'h411d0;
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
