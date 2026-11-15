// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00915 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .start(in_vec[10:10]),
    .busy(in_vec[9:9]),
    .new_data(in_vec[8:8]),
    .rx_data(in_vec[7:0]),
    .tx_data(out_vec[10:3]),
    .start_spi(out_vec[2:2]),
    .done(out_vec[1:1]),
    .chip_select(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h8a2;
    stim[1] = 12'h895;
    stim[2] = 12'h34b;
    stim[3] = 12'h327;
    stim[4] = 12'h65e;
    stim[5] = 12'h2aa;
    stim[6] = 12'hf38;
    stim[7] = 12'h610;
    stim[8] = 12'h779;
    stim[9] = 12'h72b;
    stim[10] = 12'h162;
    stim[11] = 12'h7ae;
    stim[12] = 12'h423;
    stim[13] = 12'h7d7;
    stim[14] = 12'h294;
    stim[15] = 12'h33d;
    stim[16] = 12'h779;
    stim[17] = 12'h3b9;
    stim[18] = 12'hd93;
    stim[19] = 12'h723;
    stim[20] = 12'h178;
    stim[21] = 12'h69d;
    stim[22] = 12'h5d1;
    stim[23] = 12'h0e0;
    stim[24] = 12'h271;
    stim[25] = 12'h021;
    stim[26] = 12'h06b;
    stim[27] = 12'h348;
    stim[28] = 12'h237;
    stim[29] = 12'h06b;
    stim[30] = 12'h5e9;
    stim[31] = 12'h2eb;
    stim[32] = 12'h52a;
    stim[33] = 12'h407;
    stim[34] = 12'h792;
    stim[35] = 12'h5a8;
    stim[36] = 12'h775;
    stim[37] = 12'h00f;
    stim[38] = 12'h700;
    stim[39] = 12'h43c;
    stim[40] = 12'ha86;
    stim[41] = 12'h19f;
    stim[42] = 12'h2be;
    stim[43] = 12'h75c;
    stim[44] = 12'h147;
    stim[45] = 12'h46d;
    stim[46] = 12'h279;
    stim[47] = 12'h169;
    stim[48] = 12'h122;
    stim[49] = 12'h183;
    stim[50] = 12'h48e;
    stim[51] = 12'h009;
    stim[52] = 12'h4b0;
    stim[53] = 12'h63b;
    stim[54] = 12'h442;
    stim[55] = 12'h0e0;
    stim[56] = 12'h7fc;
    stim[57] = 12'h1ab;
    stim[58] = 12'hd87;
    stim[59] = 12'h164;
    stim[60] = 12'h699;
    stim[61] = 12'h5dd;
    stim[62] = 12'h2b7;
    stim[63] = 12'h718;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h3c1;
      expv[2] = 11'h3c1;
      expv[3] = 11'h3c1;
      expv[4] = 11'h3c1;
      expv[5] = 11'h3c1;
      expv[6] = 11'h3c4;
      expv[7] = 11'h3c1;
      expv[8] = 11'h3c1;
      expv[9] = 11'h3c4;
      expv[10] = 11'h3c0;
      expv[11] = 11'h3c4;
      expv[12] = 11'h3c4;
      expv[13] = 11'h3c0;
      expv[14] = 11'h3c0;
      expv[15] = 11'h3c0;
      expv[16] = 11'h3c0;
      expv[17] = 11'h3c0;
      expv[18] = 11'h3c0;
      expv[19] = 11'h3c1;
      expv[20] = 11'h3c1;
      expv[21] = 11'h3c4;
      expv[22] = 11'h3c0;
      expv[23] = 11'h3c4;
      expv[24] = 11'h3c4;
      expv[25] = 11'h3c0;
      expv[26] = 11'h3c0;
      expv[27] = 11'h3c0;
      expv[28] = 11'h3c0;
      expv[29] = 11'h3c0;
      expv[30] = 11'h3c0;
      expv[31] = 11'hxxx;
      expv[32] = 11'hxxx;
      expv[33] = 11'hxxx;
      expv[34] = 11'hxxx;
      expv[35] = 11'hxxx;
      expv[36] = 11'hxxx;
      expv[37] = 11'hxxx;
      expv[38] = 11'h3c3;
      expv[39] = 11'h3c3;
      expv[40] = 11'h3c4;
      expv[41] = 11'h3c1;
      expv[42] = 11'h3c1;
      expv[43] = 11'h3c1;
      expv[44] = 11'h3c1;
      expv[45] = 11'h3c4;
      expv[46] = 11'h3c0;
      expv[47] = 11'h3c0;
      expv[48] = 11'h3c4;
      expv[49] = 11'h3c4;
      expv[50] = 11'h3c0;
      expv[51] = 11'h3c0;
      expv[52] = 11'h3c0;
      expv[53] = 11'h3c0;
      expv[54] = 11'h3c0;
      expv[55] = 11'h3c0;
      expv[56] = 11'h3c0;
      expv[57] = 11'h3c0;
      expv[58] = 11'hxxx;
      expv[59] = 11'h3c1;
      expv[60] = 11'h3c1;
      expv[61] = 11'h3c1;
      expv[62] = 11'h3c4;
      expv[63] = 11'h3c0;
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
