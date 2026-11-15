// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157598 dut (
    .clock(clk),
    .reset(in_vec[54:54]),
    .A(in_vec[53:36]),
    .B(in_vec[35:0]),
    .MAC_OUT(out_vec[52:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h70b5b8cff591de;
    stim[1] = 55'h781704cbf82d13;
    stim[2] = 55'h53539543178832;
    stim[3] = 55'h0d30dd155e5b25;
    stim[4] = 55'h018ade49d8ff42;
    stim[5] = 55'h1d78daeea2d83f;
    stim[6] = 55'h3fb7433db9c92d;
    stim[7] = 55'h2454b71cf5d984;
    stim[8] = 55'h04abfaadc49e7a;
    stim[9] = 55'h27f1704f2a8b8d;
    stim[10] = 55'h0fcbb3e9fba2cf;
    stim[11] = 55'h1c632e3fb0a8c9;
    stim[12] = 55'h1f29ed183aed96;
    stim[13] = 55'h002e91d96e323c;
    stim[14] = 55'h03d6c7c226b5d8;
    stim[15] = 55'h31ed43a7cc10e8;
    stim[16] = 55'h60af7fc0ece302;
    stim[17] = 55'h11504baa0ab164;
    stim[18] = 55'h4d94d05977c3a4;
    stim[19] = 55'h20c53f55732fc0;
    stim[20] = 55'h324deb17a2b09a;
    stim[21] = 55'h20236c7b540e63;
    stim[22] = 55'h331450ea02d474;
    stim[23] = 55'h170eeca0508bd9;
    stim[24] = 55'h34a3252c47f874;
    stim[25] = 55'h31dab09b1fe551;
    stim[26] = 55'h38249f249c8b80;
    stim[27] = 55'h0dc6151e844ada;
    stim[28] = 55'h0cf14014e73886;
    stim[29] = 55'h3396d410246a25;
    stim[30] = 55'h30d353df5e8386;
    stim[31] = 55'h004404f4070588;
    stim[32] = 55'h157cea8d28650c;
    stim[33] = 55'h06d3553bd4ff49;
    stim[34] = 55'h05f9ddf336e2c0;
    stim[35] = 55'h056bd1fff95312;
    stim[36] = 55'h32763cbe5380f7;
    stim[37] = 55'h2a172de918d04d;
    stim[38] = 55'h3d0d2c828897a3;
    stim[39] = 55'h22d2eb898cdddd;
    stim[40] = 55'h36864d8fdc71fd;
    stim[41] = 55'h24141bbc76bd04;
    stim[42] = 55'h25b55b1373fb6a;
    stim[43] = 55'h37f5d8ac786fba;
    stim[44] = 55'h278cf779449222;
    stim[45] = 55'h001022ae92a39e;
    stim[46] = 55'h6f04c673da5688;
    stim[47] = 55'h072d68141f27cd;
    stim[48] = 55'h3bbdfa9456564c;
    stim[49] = 55'h246d6968a99703;
    stim[50] = 55'h2c45001d229d5f;
    stim[51] = 55'h3e8af0e52515b0;
    stim[52] = 55'h32bf6ab8815603;
    stim[53] = 55'h1a4125d3f5a03d;
    stim[54] = 55'h07c5cd845da3d4;
    stim[55] = 55'h0865fed3f82f37;
    stim[56] = 55'h05decf4e8cc328;
    stim[57] = 55'h29df62c7b40654;
    stim[58] = 55'h28fafdb5b23392;
    stim[59] = 55'h3459b8bf50603a;
    stim[60] = 55'h3e7a34e542398b;
    stim[61] = 55'h208d9dd0e60f58;
    stim[62] = 55'h3607fde29e680c;
    stim[63] = 55'h34da0ef39c02b3;
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
      expv[0] = 53'h00000000000000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000000000;
      expv[3] = 53'h00000000000000;
      expv[4] = 53'h00000000000000;
      expv[5] = 53'h00000000000000;
      expv[6] = 53'h00000000000000;
      expv[7] = 53'h00000000000000;
      expv[8] = 53'h00000000000000;
      expv[9] = 53'h00000000000000;
      expv[10] = 53'h00000000000000;
      expv[11] = 53'h00000000000000;
      expv[12] = 53'h00000000000000;
      expv[13] = 53'h00000000000000;
      expv[14] = 53'h00000000000000;
      expv[15] = 53'h00000000000000;
      expv[16] = 53'h00000000000000;
      expv[17] = 53'h00000000000000;
      expv[18] = 53'h00000000000000;
      expv[19] = 53'h00000000000000;
      expv[20] = 53'h00000000000000;
      expv[21] = 53'h00000000000000;
      expv[22] = 53'h00000000000000;
      expv[23] = 53'h00000000000000;
      expv[24] = 53'h00000000000000;
      expv[25] = 53'h00000000000000;
      expv[26] = 53'h00000000000000;
      expv[27] = 53'h00000000000000;
      expv[28] = 53'h00000000000000;
      expv[29] = 53'h00000000000000;
      expv[30] = 53'h00000000000000;
      expv[31] = 53'h00000000000000;
      expv[32] = 53'h00000000000000;
      expv[33] = 53'h00000000000000;
      expv[34] = 53'h00000000000000;
      expv[35] = 53'h00000000000000;
      expv[36] = 53'h00000000000000;
      expv[37] = 53'h00000000000000;
      expv[38] = 53'h00000000000000;
      expv[39] = 53'h00000000000000;
      expv[40] = 53'h00000000000000;
      expv[41] = 53'h00000000000000;
      expv[42] = 53'h00000000000000;
      expv[43] = 53'h00000000000000;
      expv[44] = 53'h00000000000000;
      expv[45] = 53'h00000000000000;
      expv[46] = 53'h00000000000000;
      expv[47] = 53'h00000000000000;
      expv[48] = 53'h00000000000000;
      expv[49] = 53'h00000000000000;
      expv[50] = 53'h00000000000000;
      expv[51] = 53'h00000000000000;
      expv[52] = 53'h00000000000000;
      expv[53] = 53'h00000000000000;
      expv[54] = 53'h00000000000000;
      expv[55] = 53'h00000000000000;
      expv[56] = 53'h00000000000000;
      expv[57] = 53'h00000000000000;
      expv[58] = 53'h00000000000000;
      expv[59] = 53'h00000000000000;
      expv[60] = 53'h00000000000000;
      expv[61] = 53'h00000000000000;
      expv[62] = 53'h00000000000000;
      expv[63] = 53'h00000000000000;
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
