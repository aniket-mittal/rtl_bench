// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09108 dut (
    .clock(clk),
    .z0(in_vec[21:2]),
    .start(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .cos_z0(out_vec[40:21]),
    .sin_z0(out_vec[20:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0cc063;
    stim[1] = 22'h0f3cbb;
    stim[2] = 22'h085b16;
    stim[3] = 22'h04b7e6;
    stim[4] = 22'h2d41a2;
    stim[5] = 22'h2982c0;
    stim[6] = 22'h148ca0;
    stim[7] = 22'h0c8ff6;
    stim[8] = 22'h2a155a;
    stim[9] = 22'h0b18ea;
    stim[10] = 22'h035796;
    stim[11] = 22'h27a3da;
    stim[12] = 22'h2a922c;
    stim[13] = 22'h36087c;
    stim[14] = 22'h1a19b4;
    stim[15] = 22'h24a3f6;
    stim[16] = 22'h1aa45a;
    stim[17] = 22'h345e98;
    stim[18] = 22'h22b17e;
    stim[19] = 22'h0451e0;
    stim[20] = 22'h00b388;
    stim[21] = 22'h36ab54;
    stim[22] = 22'h2fa186;
    stim[23] = 22'h15e0c4;
    stim[24] = 22'h154296;
    stim[25] = 22'h233030;
    stim[26] = 22'h197340;
    stim[27] = 22'h09a5fa;
    stim[28] = 22'h21ead4;
    stim[29] = 22'h3ccdee;
    stim[30] = 22'h0e1aa8;
    stim[31] = 22'h338030;
    stim[32] = 22'h141964;
    stim[33] = 22'h2488c4;
    stim[34] = 22'h19423c;
    stim[35] = 22'h057b82;
    stim[36] = 22'h17099c;
    stim[37] = 22'h108500;
    stim[38] = 22'h2b47a2;
    stim[39] = 22'h3d8aec;
    stim[40] = 22'h03551c;
    stim[41] = 22'h0bc7b2;
    stim[42] = 22'h0d4e14;
    stim[43] = 22'h2d3dc0;
    stim[44] = 22'h163ada;
    stim[45] = 22'h15e2d0;
    stim[46] = 22'h02f788;
    stim[47] = 22'h3c35c0;
    stim[48] = 22'h07a09e;
    stim[49] = 22'h23b61c;
    stim[50] = 22'h1519ca;
    stim[51] = 22'h233b76;
    stim[52] = 22'h0367aa;
    stim[53] = 22'h1c85b8;
    stim[54] = 22'h229eec;
    stim[55] = 22'h26afb0;
    stim[56] = 22'h176474;
    stim[57] = 22'h2b9ef0;
    stim[58] = 22'h201194;
    stim[59] = 22'h18636a;
    stim[60] = 22'h03aa64;
    stim[61] = 22'h3e1af0;
    stim[62] = 22'h06d92c;
    stim[63] = 22'h156dc6;
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
      expv[0] = 41'h00000200000;
      expv[1] = 41'h00000200000;
      expv[2] = 41'h00000200000;
      expv[3] = 41'h00000200000;
      expv[4] = 41'h00000200000;
      expv[5] = 41'h00000200000;
      expv[6] = 41'h00000200000;
      expv[7] = 41'h00000200000;
      expv[8] = 41'h00000200000;
      expv[9] = 41'h00000200000;
      expv[10] = 41'h00000200000;
      expv[11] = 41'h00000200000;
      expv[12] = 41'h00000200000;
      expv[13] = 41'h00000200000;
      expv[14] = 41'h00000200000;
      expv[15] = 41'h00000200000;
      expv[16] = 41'h00000200000;
      expv[17] = 41'h00000200000;
      expv[18] = 41'h00000200000;
      expv[19] = 41'h00000200000;
      expv[20] = 41'h00000200000;
      expv[21] = 41'h00000200000;
      expv[22] = 41'h06ef0e3fd8f;
      expv[23] = 41'h06ef0e3fd8e;
      expv[24] = 41'h06ef0e3fd8e;
      expv[25] = 41'h06ef0e3fd8e;
      expv[26] = 41'h06ef0e3fd8e;
      expv[27] = 41'h06ef0e3fd8e;
      expv[28] = 41'h06ef0e3fd8e;
      expv[29] = 41'h06ef0e3fd8e;
      expv[30] = 41'h06ef0e3fd8e;
      expv[31] = 41'h06ef0e3fd8e;
      expv[32] = 41'h06ef0e3fd8e;
      expv[33] = 41'h06ef0e3fd8e;
      expv[34] = 41'h06ef0e3fd8e;
      expv[35] = 41'h06ef0e3fd8e;
      expv[36] = 41'h06ef0e3fd8e;
      expv[37] = 41'h06ef0e3fd8e;
      expv[38] = 41'h06ef0e3fd8e;
      expv[39] = 41'h06ef0e3fd8e;
      expv[40] = 41'h06ef0e3fd8e;
      expv[41] = 41'h06ef0e3fd8e;
      expv[42] = 41'h042a8392b91;
      expv[43] = 41'h042a8392b91;
      expv[44] = 41'h042a8392b91;
      expv[45] = 41'h042a8392b90;
      expv[46] = 41'h042a8392b90;
      expv[47] = 41'h042a8392b90;
      expv[48] = 41'h042a8392b90;
      expv[49] = 41'h042a8392b90;
      expv[50] = 41'h042a8392b90;
      expv[51] = 41'h042a8392b90;
      expv[52] = 41'h042a8392b90;
      expv[53] = 41'h042a8392b90;
      expv[54] = 41'h042a8392b90;
      expv[55] = 41'h042a8392b90;
      expv[56] = 41'h042a8392b90;
      expv[57] = 41'h042a8392b90;
      expv[58] = 41'h042a8392b90;
      expv[59] = 41'h042a8392b90;
      expv[60] = 41'h042a8392b90;
      expv[61] = 41'h042a8392b90;
      expv[62] = 41'h042a8392b90;
      expv[63] = 41'h042a8392b90;
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
