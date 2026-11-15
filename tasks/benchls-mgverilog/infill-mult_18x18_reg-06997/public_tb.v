// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06997 dut (
    .clk(clk),
    .clk_ena(in_vec[36:36]),
    .dataa(in_vec[35:18]),
    .datab(in_vec[17:0]),
    .result(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h07c9c915a9;
    stim[1] = 37'h02788fba66;
    stim[2] = 37'h087a0d325e;
    stim[3] = 37'h1bc1409a8f;
    stim[4] = 37'h1714febd9c;
    stim[5] = 37'h15bd72a96b;
    stim[6] = 37'h12c1dbd564;
    stim[7] = 37'h05801ec551;
    stim[8] = 37'h10ceb54cce;
    stim[9] = 37'h1e0407ea9f;
    stim[10] = 37'h02a8f1d0c0;
    stim[11] = 37'h0e9de188ff;
    stim[12] = 37'h0311eb398d;
    stim[13] = 37'h143796825e;
    stim[14] = 37'h080d809d54;
    stim[15] = 37'h07b3a84f07;
    stim[16] = 37'h0d6c02164c;
    stim[17] = 37'h0df8f8b5b0;
    stim[18] = 37'h1e87c61da5;
    stim[19] = 37'h0bcb2f2628;
    stim[20] = 37'h19630d934c;
    stim[21] = 37'h1ef135c6c1;
    stim[22] = 37'h03cdd21eaa;
    stim[23] = 37'h094f6934e6;
    stim[24] = 37'h19ea718f3e;
    stim[25] = 37'h1cdf50bfc2;
    stim[26] = 37'h1302c02bc4;
    stim[27] = 37'h07c0867f7e;
    stim[28] = 37'h05df5e4ca6;
    stim[29] = 37'h18d30f8595;
    stim[30] = 37'h10ddd45d1a;
    stim[31] = 37'h058dfe27c7;
    stim[32] = 37'h05c860d052;
    stim[33] = 37'h0ad9678cbe;
    stim[34] = 37'h06bf66347c;
    stim[35] = 37'h10754617bc;
    stim[36] = 37'h18519a6d66;
    stim[37] = 37'h12a9e70376;
    stim[38] = 37'h10e574c86b;
    stim[39] = 37'h175ba5c360;
    stim[40] = 37'h03093141b2;
    stim[41] = 37'h171e0a555b;
    stim[42] = 37'h167a425aee;
    stim[43] = 37'h16f46d64c9;
    stim[44] = 37'h1ee2629ac9;
    stim[45] = 37'h008f119ac5;
    stim[46] = 37'h04c0eb91aa;
    stim[47] = 37'h181556f9d0;
    stim[48] = 37'h11f149838b;
    stim[49] = 37'h00745a96e8;
    stim[50] = 37'h1c111bd9c4;
    stim[51] = 37'h0d1b01338c;
    stim[52] = 37'h1d3556db32;
    stim[53] = 37'h059411d5e8;
    stim[54] = 37'h1b9f5e7807;
    stim[55] = 37'h17bfd69b7a;
    stim[56] = 37'h1d36f16177;
    stim[57] = 37'h0eb682586f;
    stim[58] = 37'h08845e9001;
    stim[59] = 37'h1c6f970ecc;
    stim[60] = 37'h06f3a0288d;
    stim[61] = 37'h06e4d72846;
    stim[62] = 37'h1e48f28aa7;
    stim[63] = 37'h0724d7e952;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'h05cb0;
      expv[5] = 18'h1b564;
      expv[6] = 18'h14774;
      expv[7] = 18'h11c18;
      expv[8] = 18'h11c18;
      expv[9] = 18'h1f136;
      expv[10] = 18'h3099f;
      expv[11] = 18'h3099f;
      expv[12] = 18'h3099f;
      expv[13] = 18'h3099f;
      expv[14] = 18'h36416;
      expv[15] = 18'h36416;
      expv[16] = 18'h36416;
      expv[17] = 18'h36416;
      expv[18] = 18'h36416;
      expv[19] = 18'h1ad55;
      expv[20] = 18'h1ad55;
      expv[21] = 18'h152e4;
      expv[22] = 18'h1840d;
      expv[23] = 18'h1840d;
      expv[24] = 18'h1840d;
      expv[25] = 18'h2d5c8;
      expv[26] = 18'h37aa8;
      expv[27] = 18'h116c0;
      expv[28] = 18'h116c0;
      expv[29] = 18'h116c0;
      expv[30] = 18'h3047f;
      expv[31] = 18'h322e2;
      expv[32] = 18'h322e2;
      expv[33] = 18'h322e2;
      expv[34] = 18'h322e2;
      expv[35] = 18'h322e2;
      expv[36] = 18'h1ce7c;
      expv[37] = 18'h38ea4;
      expv[38] = 18'h0fec6;
      expv[39] = 18'h0a1df;
      expv[40] = 18'h11260;
      expv[41] = 18'h11260;
      expv[42] = 18'h01536;
      expv[43] = 18'h009e0;
      expv[44] = 18'h30633;
      expv[45] = 18'h35f58;
      expv[46] = 18'h35f58;
      expv[47] = 18'h35f58;
      expv[48] = 18'h20210;
      expv[49] = 18'h37686;
      expv[50] = 18'h37686;
      expv[51] = 18'h09b98;
      expv[52] = 18'h09b98;
      expv[53] = 18'h2d19a;
      expv[54] = 18'h2d19a;
      expv[55] = 18'h31ee1;
      expv[56] = 18'h3b1c2;
      expv[57] = 18'h15e64;
      expv[58] = 18'h15e64;
      expv[59] = 18'h15e64;
      expv[60] = 18'h3c07c;
      expv[61] = 18'h3c07c;
      expv[62] = 18'h3c07c;
      expv[63] = 18'h0bd24;
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
