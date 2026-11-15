// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05543 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0404cb;
    stim[1] = 22'h388b81;
    stim[2] = 22'h13a4bb;
    stim[3] = 22'h2bcf05;
    stim[4] = 22'h1b0276;
    stim[5] = 22'h1795cc;
    stim[6] = 22'h16b682;
    stim[7] = 22'h3b7991;
    stim[8] = 22'h3ee3d4;
    stim[9] = 22'h1795fd;
    stim[10] = 22'h331adf;
    stim[11] = 22'h0b597a;
    stim[12] = 22'h17e9c2;
    stim[13] = 22'h1a4aa9;
    stim[14] = 22'h03b3fb;
    stim[15] = 22'h0b611b;
    stim[16] = 22'h229272;
    stim[17] = 22'h3389a6;
    stim[18] = 22'h331588;
    stim[19] = 22'h069f47;
    stim[20] = 22'h2e0484;
    stim[21] = 22'h17839a;
    stim[22] = 22'h2e17bd;
    stim[23] = 22'h0a5da2;
    stim[24] = 22'h1ed4e8;
    stim[25] = 22'h2b2085;
    stim[26] = 22'h2eafb9;
    stim[27] = 22'h068278;
    stim[28] = 22'h134ac4;
    stim[29] = 22'h2768bc;
    stim[30] = 22'h2af66a;
    stim[31] = 22'h2fab12;
    stim[32] = 22'h36c26d;
    stim[33] = 22'h3fb125;
    stim[34] = 22'h2b1cbc;
    stim[35] = 22'h3305c8;
    stim[36] = 22'h025d57;
    stim[37] = 22'h26d71e;
    stim[38] = 22'h03a792;
    stim[39] = 22'h17a8d6;
    stim[40] = 22'h27c9b7;
    stim[41] = 22'h0b21f4;
    stim[42] = 22'h3f661e;
    stim[43] = 22'h260132;
    stim[44] = 22'h2e70d5;
    stim[45] = 22'h0f7fd3;
    stim[46] = 22'h02b37c;
    stim[47] = 22'h2baf8c;
    stim[48] = 22'h2b3d51;
    stim[49] = 22'h032c00;
    stim[50] = 22'h0039dd;
    stim[51] = 22'h2fa8c4;
    stim[52] = 22'h125af4;
    stim[53] = 22'h139b1d;
    stim[54] = 22'h0b08f2;
    stim[55] = 22'h2203ce;
    stim[56] = 22'h121ec2;
    stim[57] = 22'h16275d;
    stim[58] = 22'h0f9b75;
    stim[59] = 22'h278969;
    stim[60] = 22'h1c7e82;
    stim[61] = 22'h1a1c23;
    stim[62] = 22'h3a76c3;
    stim[63] = 22'h03f377;
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
      expv[3] = 17'h00063;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00063;
      expv[7] = 17'h00063;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h0b682;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h0b682;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h0b682;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0b682;
      expv[30] = 17'h0b682;
      expv[31] = 17'h0d4e8;
      expv[32] = 17'h0d4e8;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h0d4e8;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h0b682;
      expv[39] = 17'h00000;
      expv[40] = 17'h0b682;
      expv[41] = 17'h0b682;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h0b682;
      expv[45] = 17'h0d4e8;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h0d4e8;
      expv[49] = 17'h0d4e8;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00063;
      expv[54] = 17'h00063;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00063;
      expv[58] = 17'h00063;
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
