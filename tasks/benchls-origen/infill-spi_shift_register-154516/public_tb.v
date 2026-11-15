// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154516 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .spi_start(in_vec[33:33]),
    .spi_clk_in(in_vec[32:32]),
    .data_in(in_vec[31:0]),
    .spi_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h69ce31b47;
    stim[1] = 35'h657668bbe;
    stim[2] = 35'h35a58cd35;
    stim[3] = 35'h1685a2786;
    stim[4] = 35'h14cbc280e;
    stim[5] = 35'h144b4ad9f;
    stim[6] = 35'h08f3db824;
    stim[7] = 35'h1a779c2c9;
    stim[8] = 35'h3ad64d2de;
    stim[9] = 35'h21871ef8d;
    stim[10] = 35'h2c4fdf9f2;
    stim[11] = 35'h0bb07b1f8;
    stim[12] = 35'h084485efe;
    stim[13] = 35'h05298cd25;
    stim[14] = 35'h5ff0a2cc6;
    stim[15] = 35'h15cff4285;
    stim[16] = 35'h221d48d6f;
    stim[17] = 35'h3829a8785;
    stim[18] = 35'h1f4c38a8e;
    stim[19] = 35'h1e974eebd;
    stim[20] = 35'h364130614;
    stim[21] = 35'h0d2839461;
    stim[22] = 35'h35999c36e;
    stim[23] = 35'h3d9256fd6;
    stim[24] = 35'h182111dc4;
    stim[25] = 35'h290a6fd1f;
    stim[26] = 35'h1f11032c5;
    stim[27] = 35'h04cf19e36;
    stim[28] = 35'h18d1e112b;
    stim[29] = 35'h2410d6833;
    stim[30] = 35'h1d6b3247a;
    stim[31] = 35'h26bdda0cd;
    stim[32] = 35'h36ff49595;
    stim[33] = 35'h629737e64;
    stim[34] = 35'h1ace27ffe;
    stim[35] = 35'h061051b7d;
    stim[36] = 35'h0ad20e78a;
    stim[37] = 35'h0213de028;
    stim[38] = 35'h7a196ab5c;
    stim[39] = 35'h008499f06;
    stim[40] = 35'h1ff2f06ac;
    stim[41] = 35'h39a3422ad;
    stim[42] = 35'h09a4b33e8;
    stim[43] = 35'h3dc491c96;
    stim[44] = 35'h1f001d889;
    stim[45] = 35'h39da2e9f0;
    stim[46] = 35'h1ed5f838d;
    stim[47] = 35'h19a6ec48a;
    stim[48] = 35'h202c9c097;
    stim[49] = 35'h1a4fd8c79;
    stim[50] = 35'h110fee2c0;
    stim[51] = 35'h2f1a19f24;
    stim[52] = 35'h00592c25c;
    stim[53] = 35'h0ed54914d;
    stim[54] = 35'h324fc0be0;
    stim[55] = 35'h214146eba;
    stim[56] = 35'h144d0e72d;
    stim[57] = 35'h242aff598;
    stim[58] = 35'h31736038f;
    stim[59] = 35'h0b095735b;
    stim[60] = 35'h177770064;
    stim[61] = 35'h370eefd8d;
    stim[62] = 35'h3883fd2d0;
    stim[63] = 35'h01e7831bc;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000001;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000001;
      expv[8] = 32'h00000001;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000001;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000001;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000001;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000001;
      expv[26] = 32'h00000001;
      expv[27] = 32'h00000001;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000001;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000001;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000001;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000001;
      expv[47] = 32'h00000001;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000001;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000001;
      expv[54] = 32'h00000001;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000001;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000001;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
