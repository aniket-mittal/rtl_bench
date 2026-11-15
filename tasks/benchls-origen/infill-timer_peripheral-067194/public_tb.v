// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067194 dut (
    .mclk(clk),
    .per_addr(in_vec[34:21]),
    .per_din(in_vec[20:5]),
    .per_en(in_vec[4:4]),
    .per_we(in_vec[3:2]),
    .puc_rst(in_vec[1:1]),
    .irqacc(in_vec[0:0]),
    .per_dout(out_vec[16:1]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h2f77eda3a;
    stim[1] = 35'h477f9c20e;
    stim[2] = 35'h08276468c;
    stim[3] = 35'h509e2ab15;
    stim[4] = 35'h5922bb4b8;
    stim[5] = 35'h360259c64;
    stim[6] = 35'h090e512c0;
    stim[7] = 35'h61b535b8c;
    stim[8] = 35'h4b61bb5f8;
    stim[9] = 35'h65713b81c;
    stim[10] = 35'h1bf5068cc;
    stim[11] = 35'h1ed009348;
    stim[12] = 35'h16323ff80;
    stim[13] = 35'h74a273c89;
    stim[14] = 35'h331b4e3f1;
    stim[15] = 35'h77af2bfe1;
    stim[16] = 35'h6286658d0;
    stim[17] = 35'h3422d99a8;
    stim[18] = 35'h27449a969;
    stim[19] = 35'h1738ee379;
    stim[20] = 35'h1438d9b75;
    stim[21] = 35'h18b05ce9d;
    stim[22] = 35'h3ed09c98d;
    stim[23] = 35'h5ebe4abf5;
    stim[24] = 35'h05075e355;
    stim[25] = 35'h24d63f37d;
    stim[26] = 35'h21f2fa811;
    stim[27] = 35'h5b944d44c;
    stim[28] = 35'h1386ef34c;
    stim[29] = 35'h4209384f8;
    stim[30] = 35'h21dfe6de1;
    stim[31] = 35'h17b9374a5;
    stim[32] = 35'h7662d87b0;
    stim[33] = 35'h44e6dd8a0;
    stim[34] = 35'h158ea7598;
    stim[35] = 35'h5e78275c9;
    stim[36] = 35'h5a21f8151;
    stim[37] = 35'h441dcacd1;
    stim[38] = 35'h79977ad59;
    stim[39] = 35'h6e1a79be5;
    stim[40] = 35'h5603244e9;
    stim[41] = 35'h48cd620c5;
    stim[42] = 35'h1fb8401b0;
    stim[43] = 35'h56b49c379;
    stim[44] = 35'h7af3fb0e0;
    stim[45] = 35'h3836fa414;
    stim[46] = 35'h6426ad2fd;
    stim[47] = 35'h1683cc165;
    stim[48] = 35'h1c13265b9;
    stim[49] = 35'h6d6f54ed8;
    stim[50] = 35'h20cd05889;
    stim[51] = 35'h07c605664;
    stim[52] = 35'h4900b01b0;
    stim[53] = 35'h6cf2fadf4;
    stim[54] = 35'h5df371444;
    stim[55] = 35'h3ecd5fcb8;
    stim[56] = 35'h2e5e5de80;
    stim[57] = 35'h1dd0e1091;
    stim[58] = 35'h51343bfe0;
    stim[59] = 35'h6c7798b88;
    stim[60] = 35'h673b283a9;
    stim[61] = 35'h36a54b5c8;
    stim[62] = 35'h61ded7c85;
    stim[63] = 35'h3898690b4;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
