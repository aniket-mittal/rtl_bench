// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_vfmau_lza_simd_half dut (
    .addend(in_vec[48:25]),
    .sub_vld(in_vec[24:24]),
    .summand(in_vec[23:0]),
    .lza_result(out_vec[5:1]),
    .lza_result_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h097ef9f0c58c2;
    stim[1] = 49'h1c0269a2c0cd2;
    stim[2] = 49'h06719e1bd0565;
    stim[3] = 49'h11d7f0e1f719a;
    stim[4] = 49'h076cc415cff15;
    stim[5] = 49'h1b4f0e448d663;
    stim[6] = 49'h0f339ab47411a;
    stim[7] = 49'h19ab450b947a0;
    stim[8] = 49'h1b824d06fb5b9;
    stim[9] = 49'h11e96819a14b1;
    stim[10] = 49'h1521aac832084;
    stim[11] = 49'h17c0fff50d5df;
    stim[12] = 49'h10cc1aeb6ca95;
    stim[13] = 49'h0d23788413102;
    stim[14] = 49'h1054226633a0f;
    stim[15] = 49'h103ada4214574;
    stim[16] = 49'h0018626e0dfc0;
    stim[17] = 49'h0909f80479cd4;
    stim[18] = 49'h10fe5e74e83fb;
    stim[19] = 49'h10e60b0ae1c50;
    stim[20] = 49'h06142cc94e042;
    stim[21] = 49'h1622b0abafc7e;
    stim[22] = 49'h11e9921541f37;
    stim[23] = 49'h1a0ac95053c51;
    stim[24] = 49'h13bddf47c6540;
    stim[25] = 49'h06d0a51f23cdc;
    stim[26] = 49'h0c07da116bfe3;
    stim[27] = 49'h048f5d2772867;
    stim[28] = 49'h0a3f4d036133b;
    stim[29] = 49'h083b16bbc6c36;
    stim[30] = 49'h0de7eab7f713e;
    stim[31] = 49'h0061b8f5b983c;
    stim[32] = 49'h05dcff7949e10;
    stim[33] = 49'h1e5bd66dae7d5;
    stim[34] = 49'h13b594ef04a42;
    stim[35] = 49'h176c7ed2572dd;
    stim[36] = 49'h104f3849ebc0f;
    stim[37] = 49'h1bd14eee06a2d;
    stim[38] = 49'h106dd0b3d21be;
    stim[39] = 49'h0ee0edc246f7d;
    stim[40] = 49'h1ae8d2f0c4e27;
    stim[41] = 49'h096ae29d4c8f9;
    stim[42] = 49'h0e52d6470cc58;
    stim[43] = 49'h078948ad46c52;
    stim[44] = 49'h1d685c96efc57;
    stim[45] = 49'h14f259f4b56a0;
    stim[46] = 49'h042ebc9b08749;
    stim[47] = 49'h05b908c909087;
    stim[48] = 49'h131e26e5bfd77;
    stim[49] = 49'h084c686b9daa2;
    stim[50] = 49'h1a3101a921e74;
    stim[51] = 49'h1997d2333ecbf;
    stim[52] = 49'h1eb4288ac1b0d;
    stim[53] = 49'h14f69b89f46cc;
    stim[54] = 49'h035a2d3cf3a07;
    stim[55] = 49'h022b994560f03;
    stim[56] = 49'h16bf86dc3f87d;
    stim[57] = 49'h1fd089b407cbc;
    stim[58] = 49'h1c6d348365a5c;
    stim[59] = 49'h0e6967f883c05;
    stim[60] = 49'h15d11b28b7414;
    stim[61] = 49'h10473db1062dc;
    stim[62] = 49'h1fdabaa24807e;
    stim[63] = 49'h01bfa1cfb11c3;
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
      expv[2] = 6'h06;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h02;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h04;
      expv[10] = 6'h00;
      expv[11] = 6'h06;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h04;
      expv[19] = 6'h00;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h04;
      expv[23] = 6'h04;
      expv[24] = 6'h00;
      expv[25] = 6'h04;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h0c;
      expv[30] = 6'h04;
      expv[31] = 6'h00;
      expv[32] = 6'h02;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h04;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h02;
      expv[39] = 6'h00;
      expv[40] = 6'h04;
      expv[41] = 6'h04;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h02;
      expv[45] = 6'h06;
      expv[46] = 6'h04;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h10;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h04;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h02;
      expv[58] = 6'h00;
      expv[59] = 6'h0a;
      expv[60] = 6'h00;
      expv[61] = 6'h02;
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
