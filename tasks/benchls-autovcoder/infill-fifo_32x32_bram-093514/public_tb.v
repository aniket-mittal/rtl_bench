// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093514 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h38f674d81d;
    stim[1] = 38'h2435314f00;
    stim[2] = 38'h0cb6c97ae4;
    stim[3] = 38'h119e01ca9f;
    stim[4] = 38'h19d8709986;
    stim[5] = 38'h02253f346c;
    stim[6] = 38'h0271c7eb0b;
    stim[7] = 38'h132e771b91;
    stim[8] = 38'h099c46967a;
    stim[9] = 38'h282b07a3a6;
    stim[10] = 38'h1dd778b87b;
    stim[11] = 38'h00420ce316;
    stim[12] = 38'h2e4c2c931d;
    stim[13] = 38'h16be532bcd;
    stim[14] = 38'h0b983af166;
    stim[15] = 38'h02be6164b4;
    stim[16] = 38'h3cdf34e94f;
    stim[17] = 38'h1e3cd6b830;
    stim[18] = 38'h11024e3a65;
    stim[19] = 38'h08b3df5c82;
    stim[20] = 38'h1233bdea12;
    stim[21] = 38'h024612246b;
    stim[22] = 38'h11c999a60f;
    stim[23] = 38'h02c69b3c42;
    stim[24] = 38'h0b01ed6a37;
    stim[25] = 38'h061d47781e;
    stim[26] = 38'h1490763bc2;
    stim[27] = 38'h104b835e27;
    stim[28] = 38'h0bf7deac91;
    stim[29] = 38'h0b1ea5d6d0;
    stim[30] = 38'h1a2c2e77c7;
    stim[31] = 38'h01710bd940;
    stim[32] = 38'h06f2eb1e83;
    stim[33] = 38'h06052a9977;
    stim[34] = 38'h0cebc32b9f;
    stim[35] = 38'h13bd8e405d;
    stim[36] = 38'h1cc07241ef;
    stim[37] = 38'h1231846f39;
    stim[38] = 38'h1d9397fd53;
    stim[39] = 38'h1d6fb3528d;
    stim[40] = 38'h10369367bf;
    stim[41] = 38'h17cec17210;
    stim[42] = 38'h0d158f0681;
    stim[43] = 38'h090bcd4280;
    stim[44] = 38'h0c852389a6;
    stim[45] = 38'h105d3a8370;
    stim[46] = 38'h09b402db73;
    stim[47] = 38'h04b9b1b3d0;
    stim[48] = 38'h02feccc1b3;
    stim[49] = 38'h15feb7468e;
    stim[50] = 38'h0ebeda5ed5;
    stim[51] = 38'h1d0e401c5d;
    stim[52] = 38'h316770dea8;
    stim[53] = 38'h06297c364a;
    stim[54] = 38'h12b1f63939;
    stim[55] = 38'h1493d7b377;
    stim[56] = 38'h0ec1ce7336;
    stim[57] = 38'h16379435d3;
    stim[58] = 38'h0abd58d92b;
    stim[59] = 38'h0941142b7c;
    stim[60] = 38'h1bffdf5e5e;
    stim[61] = 38'h1ebfcfd849;
    stim[62] = 38'h0bf88f13f9;
    stim[63] = 38'h1bc8f872b9;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h3930b24c7;
      expv[22] = 34'h3930b24c7;
      expv[23] = 34'h2930b24c7;
      expv[24] = 34'h2930b24c7;
      expv[25] = 34'h2930b24c7;
      expv[26] = 34'h2930b24c7;
      expv[27] = 34'h2930b24c7;
      expv[28] = 34'h2930b24c7;
      expv[29] = 34'h2930b24c7;
      expv[30] = 34'h2930b24c7;
      expv[31] = 34'h2930b24c7;
      expv[32] = 34'h2930b24c7;
      expv[33] = 34'h2930b24c7;
      expv[34] = 34'h2930b24c7;
      expv[35] = 34'h2930b24c7;
      expv[36] = 34'h2930b24c7;
      expv[37] = 34'h2930b24c7;
      expv[38] = 34'h2930b24c7;
      expv[39] = 34'h3301c907b;
      expv[40] = 34'h3301c907b;
      expv[41] = 34'h364e5ff54;
      expv[42] = 34'h364e5ff54;
      expv[43] = 34'h364e5ff54;
      expv[44] = 34'h364e5ff54;
      expv[45] = 34'h364e5ff54;
      expv[46] = 34'h364e5ff54;
      expv[47] = 34'h364e5ff54;
      expv[48] = 34'h364e5ff54;
      expv[49] = 34'h364e5ff54;
      expv[50] = 34'h364e5ff54;
      expv[51] = 34'h364e5ff54;
      expv[52] = 34'h364e5ff54;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
