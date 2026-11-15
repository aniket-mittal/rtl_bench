// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_200410 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .deserial_on(in_vec[1:1]),
    .serial_data_in(in_vec[0:0]),
    .parallel_data_out(out_vec[70:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h4;
    stim[2] = 3'h2;
    stim[3] = 3'h4;
    stim[4] = 3'h5;
    stim[5] = 3'h1;
    stim[6] = 3'h0;
    stim[7] = 3'h3;
    stim[8] = 3'h1;
    stim[9] = 3'h2;
    stim[10] = 3'h3;
    stim[11] = 3'h0;
    stim[12] = 3'h1;
    stim[13] = 3'h1;
    stim[14] = 3'h1;
    stim[15] = 3'h1;
    stim[16] = 3'h2;
    stim[17] = 3'h0;
    stim[18] = 3'h1;
    stim[19] = 3'h3;
    stim[20] = 3'h3;
    stim[21] = 3'h3;
    stim[22] = 3'h2;
    stim[23] = 3'h1;
    stim[24] = 3'h3;
    stim[25] = 3'h2;
    stim[26] = 3'h2;
    stim[27] = 3'h0;
    stim[28] = 3'h1;
    stim[29] = 3'h0;
    stim[30] = 3'h1;
    stim[31] = 3'h3;
    stim[32] = 3'h0;
    stim[33] = 3'h0;
    stim[34] = 3'h0;
    stim[35] = 3'h0;
    stim[36] = 3'h3;
    stim[37] = 3'h3;
    stim[38] = 3'h2;
    stim[39] = 3'h0;
    stim[40] = 3'h1;
    stim[41] = 3'h1;
    stim[42] = 3'h0;
    stim[43] = 3'h2;
    stim[44] = 3'h2;
    stim[45] = 3'h2;
    stim[46] = 3'h2;
    stim[47] = 3'h1;
    stim[48] = 3'h3;
    stim[49] = 3'h0;
    stim[50] = 3'h0;
    stim[51] = 3'h1;
    stim[52] = 3'h3;
    stim[53] = 3'h2;
    stim[54] = 3'h2;
    stim[55] = 3'h0;
    stim[56] = 3'h3;
    stim[57] = 3'h2;
    stim[58] = 3'h2;
    stim[59] = 3'h2;
    stim[60] = 3'h1;
    stim[61] = 3'h2;
    stim[62] = 3'h1;
    stim[63] = 3'h0;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h000000000000000000;
      expv[4] = 71'h000000000000000000;
      expv[5] = 71'h000000000000000000;
      expv[6] = 71'h000000000000000000;
      expv[7] = 71'h000000000000000000;
      expv[8] = 71'h000000000000000001;
      expv[9] = 71'h000000000000000003;
      expv[10] = 71'h000000000000000006;
      expv[11] = 71'h00000000000000000d;
      expv[12] = 71'h00000000000000001a;
      expv[13] = 71'h000000000000000035;
      expv[14] = 71'h00000000000000006b;
      expv[15] = 71'h0000000000000000d7;
      expv[16] = 71'h0000000000000001af;
      expv[17] = 71'h00000000000000035e;
      expv[18] = 71'h0000000000000006bc;
      expv[19] = 71'h000000000000000d79;
      expv[20] = 71'h000000000000001af3;
      expv[21] = 71'h0000000000000035e7;
      expv[22] = 71'h000000000000006bcf;
      expv[23] = 71'h00000000000000d79e;
      expv[24] = 71'h00000000000001af3d;
      expv[25] = 71'h000000000000035e7b;
      expv[26] = 71'h00000000000006bcf6;
      expv[27] = 71'h0000000000000d79ec;
      expv[28] = 71'h0000000000001af3d8;
      expv[29] = 71'h00000000000035e7b1;
      expv[30] = 71'h0000000000006bcf62;
      expv[31] = 71'h000000000000d79ec5;
      expv[32] = 71'h000000000001af3d8b;
      expv[33] = 71'h0000000000035e7b16;
      expv[34] = 71'h000000000006bcf62c;
      expv[35] = 71'h00000000000d79ec58;
      expv[36] = 71'h00000000001af3d8b0;
      expv[37] = 71'h000000000035e7b161;
      expv[38] = 71'h00000000006bcf62c3;
      expv[39] = 71'h0000000000d79ec586;
      expv[40] = 71'h0000000001af3d8b0c;
      expv[41] = 71'h00000000035e7b1619;
      expv[42] = 71'h0000000006bcf62c33;
      expv[43] = 71'h000000000d79ec5866;
      expv[44] = 71'h000000001af3d8b0cc;
      expv[45] = 71'h0000000035e7b16198;
      expv[46] = 71'h000000006bcf62c330;
      expv[47] = 71'h00000000d79ec58660;
      expv[48] = 71'h00000001af3d8b0cc1;
      expv[49] = 71'h000000035e7b161983;
      expv[50] = 71'h00000006bcf62c3306;
      expv[51] = 71'h0000000d79ec58660c;
      expv[52] = 71'h0000001af3d8b0cc19;
      expv[53] = 71'h00000035e7b1619833;
      expv[54] = 71'h0000006bcf62c33066;
      expv[55] = 71'h000000d79ec58660cc;
      expv[56] = 71'h000001af3d8b0cc198;
      expv[57] = 71'h0000035e7b16198331;
      expv[58] = 71'h000006bcf62c330662;
      expv[59] = 71'h00000d79ec58660cc4;
      expv[60] = 71'h00001af3d8b0cc1988;
      expv[61] = 71'h000035e7b161983311;
      expv[62] = 71'h00006bcf62c3306622;
      expv[63] = 71'h0000d79ec58660cc45;
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
