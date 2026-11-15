// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083582 dut (
    .IN_CLOCK(clk),
    .IN_RESET(in_vec[13:13]),
    .IN_BITS(in_vec[12:1]),
    .IN_SAMPLE_READY(in_vec[0:0]),
    .OUT_SPI_SCK(out_vec[40:40]),
    .OUT_SPI_MOSI(out_vec[39:39]),
    .OUT_DAC_CS(out_vec[38:38]),
    .OUT_DAC_CLR(out_vec[37:37]),
    .OUT_STATE(out_vec[36:32]),
    .OUT_WRITE_BIT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3a88;
    stim[1] = 14'h3ef4;
    stim[2] = 14'h1f6a;
    stim[3] = 14'h1864;
    stim[4] = 14'h042d;
    stim[5] = 14'h1b52;
    stim[6] = 14'h0ecd;
    stim[7] = 14'h01f7;
    stim[8] = 14'h117d;
    stim[9] = 14'h0eb4;
    stim[10] = 14'h1633;
    stim[11] = 14'h14fa;
    stim[12] = 14'h055b;
    stim[13] = 14'h0371;
    stim[14] = 14'h1224;
    stim[15] = 14'h0a73;
    stim[16] = 14'h1959;
    stim[17] = 14'h04e6;
    stim[18] = 14'h13c8;
    stim[19] = 14'h12a5;
    stim[20] = 14'h00b3;
    stim[21] = 14'h0982;
    stim[22] = 14'h1a50;
    stim[23] = 14'h1215;
    stim[24] = 14'h07f2;
    stim[25] = 14'h1e57;
    stim[26] = 14'h0d7f;
    stim[27] = 14'h12ee;
    stim[28] = 14'h18d8;
    stim[29] = 14'h08e0;
    stim[30] = 14'h11c7;
    stim[31] = 14'h14b9;
    stim[32] = 14'h03ab;
    stim[33] = 14'h16c0;
    stim[34] = 14'h0640;
    stim[35] = 14'h1fd6;
    stim[36] = 14'h17ca;
    stim[37] = 14'h1b97;
    stim[38] = 14'h1e4a;
    stim[39] = 14'h17a2;
    stim[40] = 14'h0b55;
    stim[41] = 14'h199a;
    stim[42] = 14'h0d4a;
    stim[43] = 14'h00e7;
    stim[44] = 14'h180e;
    stim[45] = 14'h15f9;
    stim[46] = 14'h1f35;
    stim[47] = 14'h0c96;
    stim[48] = 14'h0d49;
    stim[49] = 14'h0172;
    stim[50] = 14'h10ff;
    stim[51] = 14'h12c0;
    stim[52] = 14'h0195;
    stim[53] = 14'h1e85;
    stim[54] = 14'h0f42;
    stim[55] = 14'h114a;
    stim[56] = 14'h1f02;
    stim[57] = 14'h1cca;
    stim[58] = 14'h0463;
    stim[59] = 14'h0dea;
    stim[60] = 14'h13e0;
    stim[61] = 14'h0523;
    stim[62] = 14'h1958;
    stim[63] = 14'h0b81;
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
      expv[0] = 41'h06000000000;
      expv[1] = 41'h06000000000;
      expv[2] = 41'h06000000000;
      expv[3] = 41'h06000000000;
      expv[4] = 41'h06000000000;
      expv[5] = 41'h06100000000;
      expv[6] = 41'h06230000da9;
      expv[7] = 41'h02330000da9;
      expv[8] = 41'h02330000da9;
      expv[9] = 41'h12330000da9;
      expv[10] = 41'h02330000da9;
      expv[11] = 41'h1a330000da9;
      expv[12] = 41'h0a330000da9;
      expv[13] = 41'h1a330000da9;
      expv[14] = 41'h0a330000da9;
      expv[15] = 41'h12330000da9;
      expv[16] = 41'h02330000da9;
      expv[17] = 41'h12330000da9;
      expv[18] = 41'h02330000da9;
      expv[19] = 41'h12330000da9;
      expv[20] = 41'h02330000da9;
      expv[21] = 41'h12330000da9;
      expv[22] = 41'h02330000da9;
      expv[23] = 41'h12330000da9;
      expv[24] = 41'h02330000da9;
      expv[25] = 41'h12330000da9;
      expv[26] = 41'h02330000da9;
      expv[27] = 41'h12330000da9;
      expv[28] = 41'h02330000da9;
      expv[29] = 41'h12330000da9;
      expv[30] = 41'h02330000da9;
      expv[31] = 41'h12330000da9;
      expv[32] = 41'h02330000da9;
      expv[33] = 41'h12330000da9;
      expv[34] = 41'h02330000da9;
      expv[35] = 41'h12330000da9;
      expv[36] = 41'h02330000da9;
      expv[37] = 41'h12330000da9;
      expv[38] = 41'h02330000da9;
      expv[39] = 41'h12330000da9;
      expv[40] = 41'h02330000da9;
      expv[41] = 41'h12330000da9;
      expv[42] = 41'h02330000da9;
      expv[43] = 41'h12330000da9;
      expv[44] = 41'h02330000da9;
      expv[45] = 41'h12330000da9;
      expv[46] = 41'h02330000da9;
      expv[47] = 41'h1a330000da9;
      expv[48] = 41'h0a330000da9;
      expv[49] = 41'h1a330000da9;
      expv[50] = 41'h0a330000da9;
      expv[51] = 41'h12330000da9;
      expv[52] = 41'h02330000da9;
      expv[53] = 41'h1a330000da9;
      expv[54] = 41'h0a330000da9;
      expv[55] = 41'h1a330000da9;
      expv[56] = 41'h0a330000da9;
      expv[57] = 41'h12330000da9;
      expv[58] = 41'h02330000da9;
      expv[59] = 41'h1a330000da9;
      expv[60] = 41'h0a330000da9;
      expv[61] = 41'h12330000da9;
      expv[62] = 41'h02330000da9;
      expv[63] = 41'h1a330000da9;
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
