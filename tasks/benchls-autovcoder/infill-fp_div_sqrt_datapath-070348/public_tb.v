// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070348 dut (
    .A_DI(in_vec[54:30]),
    .B_DI(in_vec[29:5]),
    .Div_enable_SI(in_vec[4:4]),
    .Div_start_dly_SI(in_vec[3:3]),
    .Sqrt_enable_SI(in_vec[2:2]),
    .D_DI(in_vec[1:0]),
    .D_DO(out_vec[27:26]),
    .Sum_DO(out_vec[25:1]),
    .Carry_out_DO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h34cc8c61dcecef;
    stim[1] = 55'h178562cd847663;
    stim[2] = 55'h1c6668a22a2dcb;
    stim[3] = 55'h0b44c1a4a55b36;
    stim[4] = 55'h0323535572fa1b;
    stim[5] = 55'h156a3610341bbe;
    stim[6] = 55'h3ceec3930bd799;
    stim[7] = 55'h647015d77ddc7b;
    stim[8] = 55'h3de14f58a20d89;
    stim[9] = 55'h48b599cc06544e;
    stim[10] = 55'h28ec1c65ae64aa;
    stim[11] = 55'h50b00863c6bf8e;
    stim[12] = 55'h6e94497f6554c5;
    stim[13] = 55'h6ce2cc3c2b96a4;
    stim[14] = 55'h263999095a4e56;
    stim[15] = 55'h5860c83d87e4f5;
    stim[16] = 55'h3ebe1c3150e9d8;
    stim[17] = 55'h40425082c258b5;
    stim[18] = 55'h3304a184b55a9f;
    stim[19] = 55'h1393bbda91e241;
    stim[20] = 55'h2b5d96c7e9b9e4;
    stim[21] = 55'h3240ad67c7a4bd;
    stim[22] = 55'h67ed6e5211ed9d;
    stim[23] = 55'h67288c78be3a1f;
    stim[24] = 55'h6ce22af6766ec0;
    stim[25] = 55'h564f2662fcda5c;
    stim[26] = 55'h1382f151ace347;
    stim[27] = 55'h003e66107b11b8;
    stim[28] = 55'h38da883129983f;
    stim[29] = 55'h6d6a9c2ef9694e;
    stim[30] = 55'h57d336d574d127;
    stim[31] = 55'h320f4c6d671b72;
    stim[32] = 55'h0d2ef89901b335;
    stim[33] = 55'h28f22c26728a68;
    stim[34] = 55'h11045f725e7de8;
    stim[35] = 55'h5f4c20a79095ca;
    stim[36] = 55'h26cdf7816fe4de;
    stim[37] = 55'h36ebe8d96965d0;
    stim[38] = 55'h248957a1c73208;
    stim[39] = 55'h266191bf83c528;
    stim[40] = 55'h435d6cf6814eba;
    stim[41] = 55'h4a18d63c11d446;
    stim[42] = 55'h258e72440cdbc5;
    stim[43] = 55'h533794608ff8ad;
    stim[44] = 55'h2d09226437f22d;
    stim[45] = 55'h574da51d10d6da;
    stim[46] = 55'h1a4e309e415cb9;
    stim[47] = 55'h3486e8901119b5;
    stim[48] = 55'h3bb69303380c4d;
    stim[49] = 55'h1d62f842e5a3b2;
    stim[50] = 55'h5401ba57cd92f3;
    stim[51] = 55'h08e4958f3f2279;
    stim[52] = 55'h608cc1031a6a42;
    stim[53] = 55'h001f1dbe7f9829;
    stim[54] = 55'h117c8f9e2280c9;
    stim[55] = 55'h3f3bd6ce7e0092;
    stim[56] = 55'h5f561c082fc01a;
    stim[57] = 55'h266d3e22255a99;
    stim[58] = 55'h691e4452b6e6a3;
    stim[59] = 55'h4aeca3ec19315e;
    stim[60] = 55'h29ce1dae46d4f8;
    stim[61] = 55'h3608af6e695876;
    stim[62] = 55'h39c5bc83a3a8ac;
    stim[63] = 55'h4f6d5a668a0bb2;
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
      expv[0] = 28'hbc43332;
      expv[1] = 28'h994727c;
      expv[2] = 28'hb05d620;
      expv[3] = 28'h6a47bbe;
      expv[4] = 28'h9704a3c;
      expv[5] = 28'h5ae936c;
      expv[6] = 28'h3183396;
      expv[7] = 28'h89b5e77;
      expv[8] = 28'h3792b52;
      expv[9] = 28'h7061214;
      expv[10] = 28'h7a2472c;
      expv[11] = 28'h4c1ec3d;
      expv[12] = 28'h36af799;
      expv[13] = 28'hf29cfcb;
      expv[14] = 28'h5c771ac;
      expv[15] = 28'h29b848f;
      expv[16] = 28'hd0aff7f;
      expv[17] = 28'h22e380e;
      expv[18] = 28'h9e37ab6;
      expv[19] = 28'h245bc02;
      expv[20] = 28'hdd98854;
      expv[21] = 28'h00e7fb7;
      expv[22] = 28'h0608a4d;
      expv[23] = 28'hac52805;
      expv[24] = 28'hece7843;
      expv[25] = 28'hce246d9;
      expv[26] = 28'h9b6e5c0;
      expv[27] = 28'hd09a44c;
      expv[28] = 28'h8d96dc5;
      expv[29] = 28'h65aeb77;
      expv[30] = 28'h815e6cb;
      expv[31] = 28'h466ec19;
      expv[32] = 28'h1f992f6;
      expv[33] = 28'hfaeba06;
      expv[34] = 28'hfae0ad8;
      expv[35] = 28'h5736a61;
      expv[36] = 28'h54d6e0a;
      expv[37] = 28'hf4df5a2;
      expv[38] = 28'hf40bddc;
      expv[39] = 28'hd2b48df;
      expv[40] = 28'h5830053;
      expv[41] = 28'h611e3f7;
      expv[42] = 28'h16d4150;
      expv[43] = 28'h0a2bc2f;
      expv[44] = 28'h3abc836;
      expv[45] = 28'h48b7a97;
      expv[46] = 28'h2b68750;
      expv[47] = 28'h2a548de;
      expv[48] = 28'h211355e;
      expv[49] = 28'h51971fc;
      expv[50] = 28'h81ce701;
      expv[51] = 28'h13b16d4;
      expv[52] = 28'h7360cac;
      expv[53] = 28'h3e8f26e;
      expv[54] = 28'h26e0c88;
      expv[55] = 28'h6e1bebe;
      expv[56] = 28'h77dace2;
      expv[57] = 28'h355bf9a;
      expv[58] = 28'h874608d;
      expv[59] = 28'h518f835;
      expv[60] = 28'hc32de3d;
      expv[61] = 28'h496db01;
      expv[62] = 28'he08686e;
      expv[63] = 28'h4e40b8d;
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
