// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hab3f;
    stim[1] = 16'he831;
    stim[2] = 16'h9324;
    stim[3] = 16'hc5f8;
    stim[4] = 16'h423d;
    stim[5] = 16'h327b;
    stim[6] = 16'hee12;
    stim[7] = 16'h945f;
    stim[8] = 16'h87c6;
    stim[9] = 16'hf5ee;
    stim[10] = 16'ha001;
    stim[11] = 16'he7b6;
    stim[12] = 16'hc57e;
    stim[13] = 16'hcc0c;
    stim[14] = 16'h188a;
    stim[15] = 16'h3f54;
    stim[16] = 16'hbc11;
    stim[17] = 16'h6493;
    stim[18] = 16'hfb21;
    stim[19] = 16'hfe16;
    stim[20] = 16'hcea4;
    stim[21] = 16'h2e23;
    stim[22] = 16'h9455;
    stim[23] = 16'h3499;
    stim[24] = 16'hb0c1;
    stim[25] = 16'h0310;
    stim[26] = 16'h81c4;
    stim[27] = 16'h50b1;
    stim[28] = 16'hfac2;
    stim[29] = 16'h3636;
    stim[30] = 16'h391b;
    stim[31] = 16'hf54d;
    stim[32] = 16'h4f1f;
    stim[33] = 16'h06ee;
    stim[34] = 16'h4c78;
    stim[35] = 16'h73a7;
    stim[36] = 16'h83af;
    stim[37] = 16'h046f;
    stim[38] = 16'h3eea;
    stim[39] = 16'h1f17;
    stim[40] = 16'ha7ca;
    stim[41] = 16'hd514;
    stim[42] = 16'h7966;
    stim[43] = 16'h20f7;
    stim[44] = 16'hc2fe;
    stim[45] = 16'h5f6c;
    stim[46] = 16'h3b56;
    stim[47] = 16'h64f6;
    stim[48] = 16'hb107;
    stim[49] = 16'h53c1;
    stim[50] = 16'h576a;
    stim[51] = 16'h17e4;
    stim[52] = 16'h03c3;
    stim[53] = 16'hf3d4;
    stim[54] = 16'h1021;
    stim[55] = 16'h985e;
    stim[56] = 16'h06c6;
    stim[57] = 16'h1937;
    stim[58] = 16'hf36d;
    stim[59] = 16'h6b7a;
    stim[60] = 16'h5a65;
    stim[61] = 16'h083b;
    stim[62] = 16'h52c3;
    stim[63] = 16'h44b0;
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
      expv[0] = 16'h3fab;
      expv[1] = 16'h31e8;
      expv[2] = 16'h2493;
      expv[3] = 16'hf8c5;
      expv[4] = 16'h3d42;
      expv[5] = 16'h7b32;
      expv[6] = 16'h12ee;
      expv[7] = 16'h5f94;
      expv[8] = 16'hc687;
      expv[9] = 16'heef5;
      expv[10] = 16'h01a0;
      expv[11] = 16'hb6e7;
      expv[12] = 16'h7ec5;
      expv[13] = 16'h0ccc;
      expv[14] = 16'h8a18;
      expv[15] = 16'h543f;
      expv[16] = 16'h11bc;
      expv[17] = 16'h9364;
      expv[18] = 16'h21fb;
      expv[19] = 16'h16fe;
      expv[20] = 16'ha4ce;
      expv[21] = 16'h232e;
      expv[22] = 16'h5594;
      expv[23] = 16'h9934;
      expv[24] = 16'hc1b0;
      expv[25] = 16'h1003;
      expv[26] = 16'hc481;
      expv[27] = 16'hb150;
      expv[28] = 16'hc2fa;
      expv[29] = 16'h3636;
      expv[30] = 16'h1b39;
      expv[31] = 16'h4df5;
      expv[32] = 16'h1f4f;
      expv[33] = 16'hee06;
      expv[34] = 16'h784c;
      expv[35] = 16'ha773;
      expv[36] = 16'haf83;
      expv[37] = 16'h6f04;
      expv[38] = 16'hea3e;
      expv[39] = 16'h171f;
      expv[40] = 16'hcaa7;
      expv[41] = 16'h14d5;
      expv[42] = 16'h6679;
      expv[43] = 16'hf720;
      expv[44] = 16'hfec2;
      expv[45] = 16'h6c5f;
      expv[46] = 16'h563b;
      expv[47] = 16'hf664;
      expv[48] = 16'h07b1;
      expv[49] = 16'hc153;
      expv[50] = 16'h6a57;
      expv[51] = 16'he417;
      expv[52] = 16'hc303;
      expv[53] = 16'hd4f3;
      expv[54] = 16'h2110;
      expv[55] = 16'h5e98;
      expv[56] = 16'hc606;
      expv[57] = 16'h3719;
      expv[58] = 16'h6df3;
      expv[59] = 16'h7a6b;
      expv[60] = 16'h655a;
      expv[61] = 16'h3b08;
      expv[62] = 16'hc352;
      expv[63] = 16'hb044;
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
