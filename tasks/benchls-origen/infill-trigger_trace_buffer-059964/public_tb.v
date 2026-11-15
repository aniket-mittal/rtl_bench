// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059964 dut (
    .clk(clk),
    .resetn(in_vec[36:36]),
    .enable(in_vec[35:35]),
    .trigger(in_vec[34:34]),
    .data(in_vec[33:2]),
    .dump_en(in_vec[1:1]),
    .dump_ready(in_vec[0:0]),
    .triggered(out_vec[9:9]),
    .dump_valid(out_vec[8:8]),
    .dump_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0ad4e23fee;
    stim[1] = 37'h0456bbab56;
    stim[2] = 37'h1282f1fe30;
    stim[3] = 37'h1cd2b7f39f;
    stim[4] = 37'h122f42c305;
    stim[5] = 37'h19d43a2515;
    stim[6] = 37'h1882d0abd9;
    stim[7] = 37'h10bab22c15;
    stim[8] = 37'h1211bb4fca;
    stim[9] = 37'h17f2783ac0;
    stim[10] = 37'h1f07114c62;
    stim[11] = 37'h1a7a494a30;
    stim[12] = 37'h1f83e46e79;
    stim[13] = 37'h19650a09ed;
    stim[14] = 37'h1d3ca9ef24;
    stim[15] = 37'h15c53c5cc1;
    stim[16] = 37'h11a9889b7f;
    stim[17] = 37'h1726569fe0;
    stim[18] = 37'h13966de092;
    stim[19] = 37'h142fd9e866;
    stim[20] = 37'h180f78d7f8;
    stim[21] = 37'h1fe5f51e75;
    stim[22] = 37'h1ab5774cd4;
    stim[23] = 37'h19f69d293e;
    stim[24] = 37'h1bd9f14e7c;
    stim[25] = 37'h17c74b85a9;
    stim[26] = 37'h15d1401167;
    stim[27] = 37'h16beb0adf5;
    stim[28] = 37'h1d56fcb86d;
    stim[29] = 37'h11e2b3231a;
    stim[30] = 37'h19cbd3c1c5;
    stim[31] = 37'h1fadfbf1e9;
    stim[32] = 37'h1c577d9f4f;
    stim[33] = 37'h1e03471246;
    stim[34] = 37'h1f0d9924e7;
    stim[35] = 37'h127ab30b7d;
    stim[36] = 37'h0ad9a1471b;
    stim[37] = 37'h1941508a52;
    stim[38] = 37'h19d6ee828d;
    stim[39] = 37'h12e3eb1909;
    stim[40] = 37'h15f41c3630;
    stim[41] = 37'h13a672c79c;
    stim[42] = 37'h182b9adb6b;
    stim[43] = 37'h17e8bd1d64;
    stim[44] = 37'h1416a77de5;
    stim[45] = 37'h17c25f5357;
    stim[46] = 37'h16928992aa;
    stim[47] = 37'h1c2de220e7;
    stim[48] = 37'h165271e8d0;
    stim[49] = 37'h1cf0c8e215;
    stim[50] = 37'h1adfe06d41;
    stim[51] = 37'h1ce0394b3b;
    stim[52] = 37'h139ef95cb8;
    stim[53] = 37'h16df3d6e84;
    stim[54] = 37'h1bd3e7fa49;
    stim[55] = 37'h1ea7266f5d;
    stim[56] = 37'h1dc7aec090;
    stim[57] = 37'h1349e514e0;
    stim[58] = 37'h10e6782841;
    stim[59] = 37'h19edf66340;
    stim[60] = 37'h107f50f967;
    stim[61] = 37'h1eadb6dfcc;
    stim[62] = 37'h1cfc68baea;
    stim[63] = 37'h1873806213;
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
      expv[0] = 10'h0xx;
      expv[1] = 10'h0xx;
      expv[2] = 10'h0xx;
      expv[3] = 10'h0xx;
      expv[4] = 10'h2xx;
      expv[5] = 10'h2xx;
      expv[6] = 10'h2xx;
      expv[7] = 10'h2xx;
      expv[8] = 10'h2xx;
      expv[9] = 10'h2xx;
      expv[10] = 10'h2xx;
      expv[11] = 10'h2xx;
      expv[12] = 10'h2xx;
      expv[13] = 10'h2xx;
      expv[14] = 10'h2xx;
      expv[15] = 10'h2xx;
      expv[16] = 10'h2xx;
      expv[17] = 10'h2xx;
      expv[18] = 10'h2xx;
      expv[19] = 10'h2xx;
      expv[20] = 10'h2xx;
      expv[21] = 10'h2xx;
      expv[22] = 10'h2xx;
      expv[23] = 10'h2xx;
      expv[24] = 10'h2xx;
      expv[25] = 10'h2xx;
      expv[26] = 10'h2xx;
      expv[27] = 10'h2xx;
      expv[28] = 10'h2xx;
      expv[29] = 10'h2xx;
      expv[30] = 10'h2xx;
      expv[31] = 10'h2xx;
      expv[32] = 10'h2xx;
      expv[33] = 10'h2xx;
      expv[34] = 10'h2xx;
      expv[35] = 10'h2xx;
      expv[36] = 10'h0xx;
      expv[37] = 10'h0xx;
      expv[38] = 10'h0xx;
      expv[39] = 10'h0xx;
      expv[40] = 10'h0xx;
      expv[41] = 10'h0xx;
      expv[42] = 10'h0xx;
      expv[43] = 10'h0xx;
      expv[44] = 10'h0xx;
      expv[45] = 10'h0xx;
      expv[46] = 10'h0xx;
      expv[47] = 10'h0xx;
      expv[48] = 10'h2xx;
      expv[49] = 10'h2xx;
      expv[50] = 10'h2xx;
      expv[51] = 10'h2xx;
      expv[52] = 10'h2xx;
      expv[53] = 10'h2xx;
      expv[54] = 10'h2xx;
      expv[55] = 10'h2xx;
      expv[56] = 10'h2xx;
      expv[57] = 10'h2xx;
      expv[58] = 10'h2xx;
      expv[59] = 10'h2xx;
      expv[60] = 10'h2xx;
      expv[61] = 10'h2xx;
      expv[62] = 10'h2xx;
      expv[63] = 10'h2xx;
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
