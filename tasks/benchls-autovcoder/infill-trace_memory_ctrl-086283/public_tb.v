// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_086283 dut (
    .clk(clk),
    .jrst_n(in_vec[52:52]),
    .trc_ctrl(in_vec[51:36]),
    .tw(in_vec[35:0]),
    .tracemem_on(out_vec[46:46]),
    .tracemem_trcdata(out_vec[45:10]),
    .tracemem_tw(out_vec[9:9]),
    .trc_im_addr(out_vec[8:2]),
    .trc_wrap(out_vec[1:1]),
    .xbrk_wrap_traceoff(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h0097dfd19f9693;
    stim[1] = 53'h0778eba13858bc;
    stim[2] = 53'h1593691286d830;
    stim[3] = 53'h1255c5ab2c1520;
    stim[4] = 53'h15326c4ad94411;
    stim[5] = 53'h1466b4df9ea154;
    stim[6] = 53'h152a0ddbccf4f9;
    stim[7] = 53'h160444965f5bef;
    stim[8] = 53'h10febe3cab8532;
    stim[9] = 53'h18d07b4d661343;
    stim[10] = 53'h1f16e4be31dfb7;
    stim[11] = 53'h15d9216e4a82e8;
    stim[12] = 53'h112f8b5292db02;
    stim[13] = 53'h182dcf9d9a1052;
    stim[14] = 53'h1e10bddf54c906;
    stim[15] = 53'h17804f05d69b3a;
    stim[16] = 53'h1261689497944b;
    stim[17] = 53'h125bfb3705818c;
    stim[18] = 53'h1247939d1ecd6b;
    stim[19] = 53'h12e6b95b7f596d;
    stim[20] = 53'h1169d0476c7dcc;
    stim[21] = 53'h1624c92d9868fa;
    stim[22] = 53'h159190e66d1a26;
    stim[23] = 53'h1ef4582dabd02b;
    stim[24] = 53'h1c597f1c57c9cb;
    stim[25] = 53'h1986067beaed4e;
    stim[26] = 53'h118a357b729608;
    stim[27] = 53'h17f1c3311d0c73;
    stim[28] = 53'h161a849aafb3d0;
    stim[29] = 53'h18f6b2081b854d;
    stim[30] = 53'h1a165077916e12;
    stim[31] = 53'h105c830f0084d8;
    stim[32] = 53'h1acd2f7d8d05eb;
    stim[33] = 53'h1f160225f1cf9c;
    stim[34] = 53'h119112889a404b;
    stim[35] = 53'h19edc9365c1a96;
    stim[36] = 53'h1be6ddcad385bd;
    stim[37] = 53'h1a9f9a7c84946b;
    stim[38] = 53'h1838e0e06a96f0;
    stim[39] = 53'h1e5a3bf2033a24;
    stim[40] = 53'h16ba3d45a9759d;
    stim[41] = 53'h123ab38ee4720f;
    stim[42] = 53'h104611d3d74770;
    stim[43] = 53'h1192a5ad5d495c;
    stim[44] = 53'h130976dd696ea5;
    stim[45] = 53'h1572b2bcfdd7d9;
    stim[46] = 53'h1728c575f4e9d1;
    stim[47] = 53'h10d22666570cb4;
    stim[48] = 53'h12f2c641fd8871;
    stim[49] = 53'h1961b31832e7e9;
    stim[50] = 53'h1b1e43053a6e5a;
    stim[51] = 53'h194f053780a4d1;
    stim[52] = 53'h14532e0cadce61;
    stim[53] = 53'h13f9d36250936d;
    stim[54] = 53'h13823623adb730;
    stim[55] = 53'h1085be73969520;
    stim[56] = 53'h1ca63a96f5cb8a;
    stim[57] = 53'h1e3ca038f81a69;
    stim[58] = 53'h1e1aad6bf0677f;
    stim[59] = 53'h1c9078fa703055;
    stim[60] = 53'h1c2f9ff6828029;
    stim[61] = 53'h1afa83f786dad1;
    stim[62] = 53'h17c9ccf23df11e;
    stim[63] = 53'h197e002a1703ef;
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
      expv[0] = 47'hx00000000x00;
      expv[1] = 47'hx00000000x00;
      expv[2] = 47'hx00000000x00;
      expv[3] = 47'hx00000000x00;
      expv[4] = 47'hx00000000x00;
      expv[5] = 47'hx00000000x00;
      expv[6] = 47'hx00000000x00;
      expv[7] = 47'hx00000000x00;
      expv[8] = 47'hx00000000x00;
      expv[9] = 47'hx00000000x00;
      expv[10] = 47'hx00000000x00;
      expv[11] = 47'hx00000000x00;
      expv[12] = 47'hx00000000x00;
      expv[13] = 47'hx00000000x00;
      expv[14] = 47'hx00000000x00;
      expv[15] = 47'hx00000000x00;
      expv[16] = 47'hx00000000x00;
      expv[17] = 47'hx00000000x00;
      expv[18] = 47'hx00000000x00;
      expv[19] = 47'hx00000000x00;
      expv[20] = 47'hx00000000x00;
      expv[21] = 47'hx00000000x00;
      expv[22] = 47'hx00000000x00;
      expv[23] = 47'hx00000000x00;
      expv[24] = 47'hx00000000x00;
      expv[25] = 47'hx00000000x00;
      expv[26] = 47'hx00000000x00;
      expv[27] = 47'hx00000000x00;
      expv[28] = 47'hx00000000x00;
      expv[29] = 47'hx00000000x00;
      expv[30] = 47'hx00000000x00;
      expv[31] = 47'hx00000000x00;
      expv[32] = 47'hx00000000x00;
      expv[33] = 47'hx00000000x00;
      expv[34] = 47'hx00000000x00;
      expv[35] = 47'hx00000000x00;
      expv[36] = 47'hx00000000x00;
      expv[37] = 47'hx00000000x00;
      expv[38] = 47'hx00000000x00;
      expv[39] = 47'hx00000000x00;
      expv[40] = 47'hx00000000x00;
      expv[41] = 47'hx00000000x00;
      expv[42] = 47'hx00000000x00;
      expv[43] = 47'hx00000000x00;
      expv[44] = 47'hx00000000x00;
      expv[45] = 47'hx00000000x00;
      expv[46] = 47'hx00000000x00;
      expv[47] = 47'hx00000000x00;
      expv[48] = 47'hx00000000x00;
      expv[49] = 47'hx00000000x00;
      expv[50] = 47'hx00000000x00;
      expv[51] = 47'hx00000000x00;
      expv[52] = 47'hx00000000x00;
      expv[53] = 47'hx00000000x00;
      expv[54] = 47'hx00000000x00;
      expv[55] = 47'hx00000000x00;
      expv[56] = 47'hx00000000x00;
      expv[57] = 47'hx00000000x00;
      expv[58] = 47'hx00000000x00;
      expv[59] = 47'hx00000000x00;
      expv[60] = 47'hx00000000x00;
      expv[61] = 47'hx00000000x00;
      expv[62] = 47'hx00000000x00;
      expv[63] = 47'hx00000000x00;
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
