// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051730 dut (
    .vga_clk(clk),
    .sclk(in_vec[25:25]),
    .rst_n(in_vec[24:24]),
    .rgb_data(in_vec[23:0]),
    .h_sync(out_vec[27:27]),
    .v_sync(out_vec[26:26]),
    .pixel_start_flag(out_vec[25:25]),
    .pixel_de(out_vec[24:24]),
    .r(out_vec[23:16]),
    .g(out_vec[15:8]),
    .b(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h0fe593b;
    stim[1] = 26'h2a555ef;
    stim[2] = 26'h328be61;
    stim[3] = 26'h38f12b2;
    stim[4] = 26'h3e95a12;
    stim[5] = 26'h1a56caf;
    stim[6] = 26'h1bbb575;
    stim[7] = 26'h3994a80;
    stim[8] = 26'h388aac5;
    stim[9] = 26'h1d43f0d;
    stim[10] = 26'h1521bf4;
    stim[11] = 26'h13be244;
    stim[12] = 26'h18d4acb;
    stim[13] = 26'h18f5c2f;
    stim[14] = 26'h30732f0;
    stim[15] = 26'h1d7c97e;
    stim[16] = 26'h312c285;
    stim[17] = 26'h19b67f0;
    stim[18] = 26'h198802f;
    stim[19] = 26'h1e2c8de;
    stim[20] = 26'h344a94d;
    stim[21] = 26'h318fb5f;
    stim[22] = 26'h341cb96;
    stim[23] = 26'h3e77455;
    stim[24] = 26'h3ac8952;
    stim[25] = 26'h3a4ba5e;
    stim[26] = 26'h3b7d93a;
    stim[27] = 26'h30eb43e;
    stim[28] = 26'h3eca005;
    stim[29] = 26'h38e7362;
    stim[30] = 26'h1d36574;
    stim[31] = 26'h197858a;
    stim[32] = 26'h35ebe21;
    stim[33] = 26'h34d46cf;
    stim[34] = 26'h30d8a8c;
    stim[35] = 26'h320d62e;
    stim[36] = 26'h13e365e;
    stim[37] = 26'h3e6fc20;
    stim[38] = 26'h13c29be;
    stim[39] = 26'h130e440;
    stim[40] = 26'h3100d33;
    stim[41] = 26'h3bec9b2;
    stim[42] = 26'h1a69096;
    stim[43] = 26'h1af2c44;
    stim[44] = 26'h12c8d37;
    stim[45] = 26'h364b918;
    stim[46] = 26'h3ef69f1;
    stim[47] = 26'h3ab5ca6;
    stim[48] = 26'h3a78aa5;
    stim[49] = 26'h362f713;
    stim[50] = 26'h38fbc28;
    stim[51] = 26'h1c7493f;
    stim[52] = 26'h3850d18;
    stim[53] = 26'h35ab021;
    stim[54] = 26'h10107fd;
    stim[55] = 26'h1625620;
    stim[56] = 26'h1b7d8ae;
    stim[57] = 26'h343b5e7;
    stim[58] = 26'h3ce3f34;
    stim[59] = 26'h1f842d4;
    stim[60] = 26'h1eb5f1c;
    stim[61] = 26'h34d3aba;
    stim[62] = 26'h1f92054;
    stim[63] = 26'h17398d8;
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
      expv[0] = 28'hc000000;
      expv[1] = 28'hc000000;
      expv[2] = 28'hc000000;
      expv[3] = 28'hd000000;
      expv[4] = 28'hd8f12b2;
      expv[5] = 28'hde95a12;
      expv[6] = 28'hda56caf;
      expv[7] = 28'hdbbb575;
      expv[8] = 28'hd994a80;
      expv[9] = 28'hd88aac5;
      expv[10] = 28'hdd43f0d;
      expv[11] = 28'hd521bf4;
      expv[12] = 28'hd3be244;
      expv[13] = 28'hd8d4acb;
      expv[14] = 28'hd8f5c2f;
      expv[15] = 28'hd0732f0;
      expv[16] = 28'hdd7c97e;
      expv[17] = 28'hd12c285;
      expv[18] = 28'hd9b67f0;
      expv[19] = 28'hd98802f;
      expv[20] = 28'hde2c8de;
      expv[21] = 28'hd44a94d;
      expv[22] = 28'hd18fb5f;
      expv[23] = 28'hd41cb96;
      expv[24] = 28'hde77455;
      expv[25] = 28'hdac8952;
      expv[26] = 28'hda4ba5e;
      expv[27] = 28'hdb7d93a;
      expv[28] = 28'hd0eb43e;
      expv[29] = 28'hdeca005;
      expv[30] = 28'hd8e7362;
      expv[31] = 28'hdd36574;
      expv[32] = 28'hd97858a;
      expv[33] = 28'hd5ebe21;
      expv[34] = 28'hd4d46cf;
      expv[35] = 28'hd0d8a8c;
      expv[36] = 28'hd20d62e;
      expv[37] = 28'hd3e365e;
      expv[38] = 28'hde6fc20;
      expv[39] = 28'hd3c29be;
      expv[40] = 28'hd30e440;
      expv[41] = 28'hd100d33;
      expv[42] = 28'hdbec9b2;
      expv[43] = 28'hda69096;
      expv[44] = 28'hdaf2c44;
      expv[45] = 28'hd2c8d37;
      expv[46] = 28'hd64b918;
      expv[47] = 28'hdef69f1;
      expv[48] = 28'hdab5ca6;
      expv[49] = 28'hda78aa5;
      expv[50] = 28'hd62f713;
      expv[51] = 28'hd8fbc28;
      expv[52] = 28'hdc7493f;
      expv[53] = 28'hd850d18;
      expv[54] = 28'hd5ab021;
      expv[55] = 28'hd0107fd;
      expv[56] = 28'hd625620;
      expv[57] = 28'hdb7d8ae;
      expv[58] = 28'hd43b5e7;
      expv[59] = 28'hdce3f34;
      expv[60] = 28'hdf842d4;
      expv[61] = 28'hdeb5f1c;
      expv[62] = 28'hd4d3aba;
      expv[63] = 28'hdf92054;
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
