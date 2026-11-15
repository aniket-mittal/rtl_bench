// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072281 dut (
    .CLK(clk),
    .RST(in_vec[66:66]),
    .ACKo(in_vec[65:65]),
    .STBi(in_vec[64:64]),
    .DATi0(in_vec[63:56]),
    .DATi1(in_vec[55:48]),
    .DATi2(in_vec[47:40]),
    .DATi3(in_vec[39:32]),
    .DATi4(in_vec[31:24]),
    .DATi5(in_vec[23:16]),
    .DATi6(in_vec[15:8]),
    .DATi7(in_vec[7:0]),
    .STBo(out_vec[9:9]),
    .DATo(out_vec[8:1]),
    .ACKi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6eb7ed0d93cb3bd5b;
    stim[1] = 67'h468acefb8b9a71fee;
    stim[2] = 67'h38764f071b6376b32;
    stim[3] = 67'h26b7352708220c89a;
    stim[4] = 67'h19f6f25316a1a5bd1;
    stim[5] = 67'h06417cc9664eaaa90;
    stim[6] = 67'h163bd6e07867a3e46;
    stim[7] = 67'h1d53eba3e4f484735;
    stim[8] = 67'h2a44bf5fe1c27e568;
    stim[9] = 67'h0cb25a8e4057d4360;
    stim[10] = 67'h37be328b758219f4d;
    stim[11] = 67'h394d7d8a23f645e82;
    stim[12] = 67'h28a1983a291027201;
    stim[13] = 67'h2d4fa459bdadecdff;
    stim[14] = 67'h07a3287d56e81bc80;
    stim[15] = 67'h22e427a62d8b2143e;
    stim[16] = 67'h0dd0f1b1bd6f0812b;
    stim[17] = 67'h0d7c112182a063df3;
    stim[18] = 67'h2b2a9de88f0d551be;
    stim[19] = 67'h37fda982cd69d3030;
    stim[20] = 67'h0bffdd7c1da25717f;
    stim[21] = 67'h19bc73163bb8003fa;
    stim[22] = 67'h2b3fa82f9367947d7;
    stim[23] = 67'h02814390da9c008fa;
    stim[24] = 67'h2e6a5ad3e5a103d43;
    stim[25] = 67'h2b066df7a25c96a38;
    stim[26] = 67'h05d60fed9535d338c;
    stim[27] = 67'h0d5ffe0a46dcc4e34;
    stim[28] = 67'h24e6f7abdf96b01e5;
    stim[29] = 67'h2e64ba414e1007ef0;
    stim[30] = 67'h1e8ea4ddd0ae6f8b4;
    stim[31] = 67'h169b66c82ec0812c8;
    stim[32] = 67'h3c0b3f0af33f7e29b;
    stim[33] = 67'h0e6ac86337fc978a7;
    stim[34] = 67'h3ab7eaf83ac236065;
    stim[35] = 67'h39087228d7232a350;
    stim[36] = 67'h1c644f7b1bf253da8;
    stim[37] = 67'h0d556f7645a2a7aa7;
    stim[38] = 67'h3915ea23cecbad03a;
    stim[39] = 67'h0937d2cb7514983ab;
    stim[40] = 67'h07958dc2a8a220afe;
    stim[41] = 67'h2983766e3eae2461c;
    stim[42] = 67'h02c5c5fa1d74ee45f;
    stim[43] = 67'h068de045395140dc0;
    stim[44] = 67'h05d19e81e9cc31379;
    stim[45] = 67'h169ab031d8574b463;
    stim[46] = 67'h0defa3dcb818adc48;
    stim[47] = 67'h13f59c62ffa068142;
    stim[48] = 67'h19a5ce8f13517f788;
    stim[49] = 67'h05da47f892fc0ec31;
    stim[50] = 67'h0fb4792048a1c17c1;
    stim[51] = 67'h1665f68f70bc71dca;
    stim[52] = 67'h17e301a24abe97914;
    stim[53] = 67'h3faf97831fbe21e2b;
    stim[54] = 67'h2a08cc4b41f9a4324;
    stim[55] = 67'h26fd2800a2fecaa98;
    stim[56] = 67'h2a84724e2e0e5cf34;
    stim[57] = 67'h0a0178097d96d49b7;
    stim[58] = 67'h3bebee71c814eb8a0;
    stim[59] = 67'h1f56b3f9a3b4e2947;
    stim[60] = 67'h35460ae08f56dedc8;
    stim[61] = 67'h345b5a43d04d98b4a;
    stim[62] = 67'h2c0a547e2ecf5f179;
    stim[63] = 67'h26459f151bd5a4ad2;
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
      expv[0] = 10'h1d6;
      expv[1] = 10'h0d0;
      expv[2] = 10'h10e;
      expv[3] = 10'h2e6;
      expv[4] = 10'h2de;
      expv[5] = 10'h22e;
      expv[6] = 10'h37a;
      expv[7] = 10'h27c;
      expv[8] = 10'h296;
      expv[9] = 10'h24a;
      expv[10] = 10'h3c6;
      expv[11] = 10'h3b0;
      expv[12] = 10'h344;
      expv[13] = 10'h336;
      expv[14] = 10'h3aa;
      expv[15] = 10'h2c4;
      expv[16] = 10'h236;
      expv[17] = 10'h230;
      expv[18] = 10'h310;
      expv[19] = 10'h258;
      expv[20] = 10'h3b4;
      expv[21] = 10'h376;
      expv[22] = 10'h26c;
      expv[23] = 10'h352;
      expv[24] = 10'h2b4;
      expv[25] = 10'h24a;
      expv[26] = 10'h2a6;
      expv[27] = 10'h2da;
      expv[28] = 10'h3f2;
      expv[29] = 10'h3c2;
      expv[30] = 10'h214;
      expv[31] = 10'h3d8;
      expv[32] = 10'h266;
      expv[33] = 10'h392;
      expv[34] = 10'h246;
      expv[35] = 10'h346;
      expv[36] = 10'h350;
      expv[37] = 10'h34f;
      expv[38] = 10'h274;
      expv[39] = 10'h327;
      expv[40] = 10'h2f2;
      expv[41] = 10'h330;
      expv[42] = 10'h258;
      expv[43] = 10'h2d0;
      expv[44] = 10'h2ba;
      expv[45] = 10'h2d2;
      expv[46] = 10'h3bc;
      expv[47] = 10'h27e;
      expv[48] = 10'h334;
      expv[49] = 10'h2ba;
      expv[50] = 10'h3f6;
      expv[51] = 10'h2cc;
      expv[52] = 10'h2fc;
      expv[53] = 10'h3f4;
      expv[54] = 10'h318;
      expv[55] = 10'h3a4;
      expv[56] = 10'h28e;
      expv[57] = 10'h22e;
      expv[58] = 10'h37c;
      expv[59] = 10'h27e;
      expv[60] = 10'h35c;
      expv[61] = 10'h27a;
      expv[62] = 10'h3d8;
      expv[63] = 10'h37a;
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
