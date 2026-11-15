// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09156 dut (
    .clk(clk),
    .clk7_en(in_vec[45:45]),
    .clk7n_en(in_vec[44:44]),
    .aen(in_vec[43:43]),
    .rd(in_vec[42:42]),
    .wr(in_vec[41:41]),
    .reset(in_vec[40:40]),
    .rs(in_vec[39:36]),
    .data_in(in_vec[35:28]),
    .tick(in_vec[27:27]),
    .eclk(in_vec[26:26]),
    .porta_in(in_vec[25:20]),
    .portb_in(in_vec[19:12]),
    .kms_level(in_vec[11:11]),
    .kbd_mouse_type(in_vec[10:9]),
    .kbd_mouse_data(in_vec[8:1]),
    .hrtmon_en(in_vec[0:0]),
    .data_out(out_vec[13:6]),
    .irq(out_vec[5:5]),
    .porta_out(out_vec[4:1]),
    .freeze(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h31d2de94e72b;
    stim[1] = 46'h01acab0585dc;
    stim[2] = 46'h1243019fbe15;
    stim[3] = 46'h3a7e04e18443;
    stim[4] = 46'h0c92c62cfc14;
    stim[5] = 46'h123ecc27b988;
    stim[6] = 46'h0c571086c9ec;
    stim[7] = 46'h1495751dd7da;
    stim[8] = 46'h16ada23cc572;
    stim[9] = 46'h28e3e66c0fd6;
    stim[10] = 46'h18286fdd6a45;
    stim[11] = 46'h1a8906a956aa;
    stim[12] = 46'h00f6509f7793;
    stim[13] = 46'h1cb17b5ba833;
    stim[14] = 46'h2ccb3182b702;
    stim[15] = 46'h18ad4688a168;
    stim[16] = 46'h2658dcbfa95f;
    stim[17] = 46'h3edd6d847788;
    stim[18] = 46'h30ed074adce2;
    stim[19] = 46'h029e798db113;
    stim[20] = 46'h30bc2c73a750;
    stim[21] = 46'h36f7c439e5c2;
    stim[22] = 46'h268bc96841fc;
    stim[23] = 46'h03f23c729091;
    stim[24] = 46'h160b73c32159;
    stim[25] = 46'h0c7fdbe6326b;
    stim[26] = 46'h00943af25bf7;
    stim[27] = 46'h1c0ba4a233f9;
    stim[28] = 46'h06abeb962bd7;
    stim[29] = 46'h0a65a0e79a50;
    stim[30] = 46'h3efc26becebb;
    stim[31] = 46'h367a84da2e94;
    stim[32] = 46'h2e3dddd5ac9a;
    stim[33] = 46'h36457adbcf75;
    stim[34] = 46'h004834cce909;
    stim[35] = 46'h1af4e552c0bb;
    stim[36] = 46'h367b838c107f;
    stim[37] = 46'h12215bf28477;
    stim[38] = 46'h08ecced8678d;
    stim[39] = 46'h3141e6fa9ab9;
    stim[40] = 46'h1e5c42e8228a;
    stim[41] = 46'h1ce3eca697cb;
    stim[42] = 46'h2ed65947878b;
    stim[43] = 46'h104f7b0da3a2;
    stim[44] = 46'h30b972e9c222;
    stim[45] = 46'h146a076d2c43;
    stim[46] = 46'h18061ed148a7;
    stim[47] = 46'h3ed5f40b8ecc;
    stim[48] = 46'h04fd06addab5;
    stim[49] = 46'h3c2fb07871c1;
    stim[50] = 46'h3c7b577d18bf;
    stim[51] = 46'h1cd338e2830c;
    stim[52] = 46'h30df56bfbf17;
    stim[53] = 46'h18e351a7182d;
    stim[54] = 46'h26b561653022;
    stim[55] = 46'h1afa60f46e45;
    stim[56] = 46'h07f733e8a002;
    stim[57] = 46'h04e5e8a6b20e;
    stim[58] = 46'h12346e0dfb71;
    stim[59] = 46'h224d5f73e7b9;
    stim[60] = 46'h28da3756413d;
    stim[61] = 46'h0a74be04667a;
    stim[62] = 46'h064f036faa29;
    stim[63] = 46'h066c8d57a2ca;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'hxxxe;
      expv[2] = 14'hxxxe;
      expv[3] = 14'hxxxe;
      expv[4] = 14'hxxxe;
      expv[5] = 14'hxxxe;
      expv[6] = 14'hxxxe;
      expv[7] = 14'hxxxe;
      expv[8] = 14'hxxxe;
      expv[9] = 14'hxxxe;
      expv[10] = 14'hxxxe;
      expv[11] = 14'hxxxe;
      expv[12] = 14'hxxxe;
      expv[13] = 14'hxxxe;
      expv[14] = 14'hxxxe;
      expv[15] = 14'hxxxe;
      expv[16] = 14'hxxxe;
      expv[17] = 14'hxxxe;
      expv[18] = 14'hxxxe;
      expv[19] = 14'hxxxe;
      expv[20] = 14'hxxxe;
      expv[21] = 14'hxxxe;
      expv[22] = 14'hxxxe;
      expv[23] = 14'hxxxe;
      expv[24] = 14'hxxxe;
      expv[25] = 14'hxxxe;
      expv[26] = 14'hxxxe;
      expv[27] = 14'hxxde;
      expv[28] = 14'hxxxe;
      expv[29] = 14'hxxxe;
      expv[30] = 14'hxxxe;
      expv[31] = 14'hxxxe;
      expv[32] = 14'hxxxe;
      expv[33] = 14'hxxxe;
      expv[34] = 14'hxxxe;
      expv[35] = 14'hxxxe;
      expv[36] = 14'hxxxe;
      expv[37] = 14'hxxxe;
      expv[38] = 14'hxxxe;
      expv[39] = 14'hxxxe;
      expv[40] = 14'hxxxe;
      expv[41] = 14'hxxxe;
      expv[42] = 14'hxxxe;
      expv[43] = 14'hxxxe;
      expv[44] = 14'hxxxe;
      expv[45] = 14'hxxxe;
      expv[46] = 14'hxxxe;
      expv[47] = 14'hxxxe;
      expv[48] = 14'hxxxe;
      expv[49] = 14'hxxxe;
      expv[50] = 14'hxxxe;
      expv[51] = 14'hxxde;
      expv[52] = 14'hxxxe;
      expv[53] = 14'hxxxe;
      expv[54] = 14'hxxxe;
      expv[55] = 14'hxxxe;
      expv[56] = 14'hxxxe;
      expv[57] = 14'hxxxe;
      expv[58] = 14'hxxxe;
      expv[59] = 14'hxxxe;
      expv[60] = 14'hxxxe;
      expv[61] = 14'hxxxe;
      expv[62] = 14'hxxxe;
      expv[63] = 14'hxxxe;
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
