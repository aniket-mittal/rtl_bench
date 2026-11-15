// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007687 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .signed_div_i(in_vec[66:66]),
    .opdata1_i(in_vec[65:34]),
    .opdata2_i(in_vec[33:2]),
    .start_i(in_vec[1:1]),
    .annul_i(in_vec[0:0]),
    .result_o(out_vec[64:1]),
    .ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hcaab3787f84d0dd86;
    stim[1] = 68'hbb7340360360f7f7e;
    stim[2] = 68'h49554aa0eb175dd3c;
    stim[3] = 68'h6acc3e2eca46ab09a;
    stim[4] = 68'h34323930c62c989c3;
    stim[5] = 68'h7dc125b33881f248e;
    stim[6] = 68'h5f9a128c46f6000ad;
    stim[7] = 68'h06360377db238e2c3;
    stim[8] = 68'h07fe0997b565784a4;
    stim[9] = 68'h5e5089b080a8dc032;
    stim[10] = 68'h4116c40bc3ab70480;
    stim[11] = 68'h1333165ebce2fe78f;
    stim[12] = 68'h30344f46a835c5812;
    stim[13] = 68'h62163254a8cc2d02d;
    stim[14] = 68'h5a64be07c4f8f9754;
    stim[15] = 68'h1ce62bec4d5580728;
    stim[16] = 68'h703e9c3737da575d9;
    stim[17] = 68'h304f64b5ebc8e0695;
    stim[18] = 68'h0c42c9696b53ca21c;
    stim[19] = 68'h274d4adb84e292f2a;
    stim[20] = 68'h296dde2291a707983;
    stim[21] = 68'h6fa4b42a9bfde9012;
    stim[22] = 68'h212713f4dee0520b5;
    stim[23] = 68'h5a37e0f7cca2c8b10;
    stim[24] = 68'h0179b929462a4ab51;
    stim[25] = 68'h6bd08db5b221fd5dc;
    stim[26] = 68'h7ba36a7a6df9a58e0;
    stim[27] = 68'h6598c8f3e9a8c47a0;
    stim[28] = 68'h28b95f9af73cb93a7;
    stim[29] = 68'h2583fbadb0c313ead;
    stim[30] = 68'h528abb701f1f14828;
    stim[31] = 68'h71e7aa62677087666;
    stim[32] = 68'h4f84b6d0dcc6bcc4b;
    stim[33] = 68'h4d4f7d3e47a043e20;
    stim[34] = 68'h0cf07d2bc9cfabe84;
    stim[35] = 68'h2c1445d1a83f39e04;
    stim[36] = 68'hd16b1466fb9fe2363;
    stim[37] = 68'h170f9daf6c3ebc91b;
    stim[38] = 68'h7cd8a359eab8bb2f0;
    stim[39] = 68'h4a52efe7d5adca5d1;
    stim[40] = 68'h21627cec90e3203d4;
    stim[41] = 68'h5aaae0ddd301747bb;
    stim[42] = 68'h1e83c9522d1a2205d;
    stim[43] = 68'h6ff6a49d36fb0e5ab;
    stim[44] = 68'h4ab0d5639758bfa99;
    stim[45] = 68'h6948e2133c67b2df4;
    stim[46] = 68'h4cdb3ead8fce1d66b;
    stim[47] = 68'h576411bdbb7d5e89c;
    stim[48] = 68'h64530c61fc6593b21;
    stim[49] = 68'h60ff807ccb2781d8a;
    stim[50] = 68'h71a2e8cc58bd38630;
    stim[51] = 68'h3ad62ef745a5fc7a1;
    stim[52] = 68'h555a9be71863cbf55;
    stim[53] = 68'h1c84bfd9c61a6d60f;
    stim[54] = 68'h7460f56d422653b71;
    stim[55] = 68'h279434bb19c8b738e;
    stim[56] = 68'h0a5fbc97d93517178;
    stim[57] = 68'h46a985fe61ccf6f99;
    stim[58] = 68'h31db267aa1c6789a1;
    stim[59] = 68'h3b0d2c1c5a99b0e6e;
    stim[60] = 68'h2207cc5b4f2b109c4;
    stim[61] = 68'h57511b1fa5f06c044;
    stim[62] = 68'h194d69c7cc4bb5a65;
    stim[63] = 68'h4fb2170898b13643f;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
