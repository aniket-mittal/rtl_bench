// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_136065 dut (
    .clkin(clk),
    .sysclk(in_vec[35:35]),
    .we(in_vec[34:34]),
    .pgm_address(in_vec[33:18]),
    .pgm_data(in_vec[17:2]),
    .play(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .sdout(out_vec[18:18]),
    .lrck(out_vec[17:17]),
    .mclk(out_vec[16:16]),
    .DAC_STATUS(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb88d882d9;
    stim[1] = 36'h273b0911f;
    stim[2] = 36'hdefd405b4;
    stim[3] = 36'h634c64d7a;
    stim[4] = 36'h6f5e816e4;
    stim[5] = 36'hc741b000e;
    stim[6] = 36'ha74792176;
    stim[7] = 36'hfa9b30b4e;
    stim[8] = 36'ha4172869c;
    stim[9] = 36'h6c6abf14a;
    stim[10] = 36'hf7821b1d6;
    stim[11] = 36'he21ac9ae0;
    stim[12] = 36'h3468dc200;
    stim[13] = 36'hd6ce35e4a;
    stim[14] = 36'h4e0788b2e;
    stim[15] = 36'h97f6349e6;
    stim[16] = 36'ha57b130b0;
    stim[17] = 36'hade57f44e;
    stim[18] = 36'h2bae50f40;
    stim[19] = 36'hb5050d7ee;
    stim[20] = 36'h1ba2b8bf6;
    stim[21] = 36'h085668316;
    stim[22] = 36'h46b70e93a;
    stim[23] = 36'h2bff30ba2;
    stim[24] = 36'hba55cc2d8;
    stim[25] = 36'he3a402c22;
    stim[26] = 36'h47d7e3f34;
    stim[27] = 36'hef5fab37d;
    stim[28] = 36'h161ca5aba;
    stim[29] = 36'hb03151638;
    stim[30] = 36'h5d14e076a;
    stim[31] = 36'hb89585918;
    stim[32] = 36'hf6a00b982;
    stim[33] = 36'h3ea650a2b;
    stim[34] = 36'hdd61013dc;
    stim[35] = 36'h1b4d771fe;
    stim[36] = 36'h1c828e11c;
    stim[37] = 36'h1d4b76c56;
    stim[38] = 36'h3d86cc846;
    stim[39] = 36'hb79bdca7a;
    stim[40] = 36'h19a4c1570;
    stim[41] = 36'hf5a80cf0a;
    stim[42] = 36'habca1b432;
    stim[43] = 36'h556f9af7c;
    stim[44] = 36'he5fe22904;
    stim[45] = 36'h08eddf90a;
    stim[46] = 36'h3bcba6f8a;
    stim[47] = 36'h6413a499e;
    stim[48] = 36'h7cb20204c;
    stim[49] = 36'h5f09c9aa4;
    stim[50] = 36'hb7432d7d0;
    stim[51] = 36'h74e87eab6;
    stim[52] = 36'ha26217036;
    stim[53] = 36'h4d22f6a2b;
    stim[54] = 36'h12f359306;
    stim[55] = 36'h4a4cf571c;
    stim[56] = 36'h1a4c63fd2;
    stim[57] = 36'hf7cecc8b0;
    stim[58] = 36'h66fa694be;
    stim[59] = 36'h4e0a0d03e;
    stim[60] = 36'had4ccfc10;
    stim[61] = 36'he833817a0;
    stim[62] = 36'h8e8995670;
    stim[63] = 36'h08b12b4e0;
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
      expv[0] = 19'hxxxxx;
      expv[1] = 19'hxxxxx;
      expv[2] = 19'hxxxxx;
      expv[3] = 19'hx7bf5;
      expv[4] = 19'hx0000;
      expv[5] = 19'h00000;
      expv[6] = 19'h21d06;
      expv[7] = 19'h21d06;
      expv[8] = 19'h3ea6c;
      expv[9] = 19'h3ea6c;
      expv[10] = 19'h2b1aa;
      expv[11] = 19'h2de08;
      expv[12] = 19'h3886b;
      expv[13] = 19'h3886b;
      expv[14] = 19'h25b38;
      expv[15] = 19'h2381e;
      expv[16] = 19'h3381e;
      expv[17] = 19'h3381e;
      expv[18] = 19'h2381e;
      expv[19] = 19'h2381e;
      expv[20] = 19'h3381e;
      expv[21] = 19'h3381e;
      expv[22] = 19'h2381e;
      expv[23] = 19'h21adc;
      expv[24] = 19'h31adc;
      expv[25] = 19'h31adc;
      expv[26] = 19'h28e90;
      expv[27] = 19'h21f5f;
      expv[28] = 19'h3bd7e;
      expv[29] = 19'h3bd7e;
      expv[30] = 19'h2bd7e;
      expv[31] = 19'h00000;
      expv[32] = 19'h20000;
      expv[33] = 19'h2da80;
      expv[34] = 19'h3da80;
      expv[35] = 19'h37584;
      expv[36] = 19'h27584;
      expv[37] = 19'h00000;
      expv[38] = 19'h20000;
      expv[39] = 19'h20000;
      expv[40] = 19'h30000;
      expv[41] = 19'h30000;
      expv[42] = 19'h2d6a0;
      expv[43] = 19'h2d6a0;
      expv[44] = 19'h355be;
      expv[45] = 19'h397f8;
      expv[46] = 19'h297f8;
      expv[47] = 19'h297f8;
      expv[48] = 19'h3904e;
      expv[49] = 19'h3f2c8;
      expv[50] = 19'h27c27;
      expv[51] = 19'h27c27;
      expv[52] = 19'h3d3a1;
      expv[53] = 19'h3d3a1;
      expv[54] = 19'h2348b;
      expv[55] = 19'h2348b;
      expv[56] = 19'h32933;
      expv[57] = 19'h00000;
      expv[58] = 19'h2df3b;
      expv[59] = 19'h29be9;
      expv[60] = 19'h33828;
      expv[61] = 19'h33828;
      expv[62] = 19'h2a0ce;
      expv[63] = 19'h2a0ce;
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
