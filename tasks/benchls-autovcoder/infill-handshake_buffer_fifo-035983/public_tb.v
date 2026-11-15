// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035983 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7aba2c22b;
    stim[1] = 35'h6391faf18;
    stim[2] = 35'h04bf88ec4;
    stim[3] = 35'h3597e865b;
    stim[4] = 35'h3911c6d55;
    stim[5] = 35'h0cdec0b61;
    stim[6] = 35'h2880830e6;
    stim[7] = 35'h24c8eb944;
    stim[8] = 35'h0fa45cc3b;
    stim[9] = 35'h397cce78c;
    stim[10] = 35'h0c237810f;
    stim[11] = 35'h10f037ef6;
    stim[12] = 35'h0a64856cb;
    stim[13] = 35'h30de9df4f;
    stim[14] = 35'h09fed5aad;
    stim[15] = 35'h292c5d612;
    stim[16] = 35'h1a4eb98dd;
    stim[17] = 35'h303397f6d;
    stim[18] = 35'h075cb80ab;
    stim[19] = 35'h3ca906159;
    stim[20] = 35'h204b1c305;
    stim[21] = 35'h4502b1d98;
    stim[22] = 35'h0ff181072;
    stim[23] = 35'h3adc38f92;
    stim[24] = 35'h0d49f613a;
    stim[25] = 35'h05a81e8e4;
    stim[26] = 35'h3b17e0bd6;
    stim[27] = 35'h1f58b558d;
    stim[28] = 35'h3d54bdf55;
    stim[29] = 35'h3e35e85d4;
    stim[30] = 35'h101dbed45;
    stim[31] = 35'h36520bd8e;
    stim[32] = 35'h321b15086;
    stim[33] = 35'h2a49b2ebe;
    stim[34] = 35'h2d2f2034a;
    stim[35] = 35'h01cc3daf0;
    stim[36] = 35'h357c50c2c;
    stim[37] = 35'h009f6bf74;
    stim[38] = 35'h094d0b048;
    stim[39] = 35'h230e89fb3;
    stim[40] = 35'h1540810bd;
    stim[41] = 35'h112945f5f;
    stim[42] = 35'h3b285d083;
    stim[43] = 35'h1f09bae93;
    stim[44] = 35'h3b3049bb4;
    stim[45] = 35'h11d5ac133;
    stim[46] = 35'h1566014be;
    stim[47] = 35'h1f0f40950;
    stim[48] = 35'h203399e8f;
    stim[49] = 35'h394ed1fc7;
    stim[50] = 35'h3ed22076b;
    stim[51] = 35'h3985a1afc;
    stim[52] = 35'h1e0db94d9;
    stim[53] = 35'h201dbd523;
    stim[54] = 35'h0bda9c403;
    stim[55] = 35'h170745b33;
    stim[56] = 35'h2fd907bef;
    stim[57] = 35'h0f541a25b;
    stim[58] = 35'h1fe05365c;
    stim[59] = 35'h1f248d38b;
    stim[60] = 35'h1862c7bdb;
    stim[61] = 35'h29518f0ef;
    stim[62] = 35'h071cb0ee4;
    stim[63] = 35'h28257721d;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h2391faf18;
      expv[3] = 35'h44bf88ec4;
      expv[4] = 35'h7597e865a;
      expv[5] = 35'h7911c6d54;
      expv[6] = 35'h4cdec0b60;
      expv[7] = 35'h6880830e7;
      expv[8] = 35'h6880830e6;
      expv[9] = 35'h4fa45cc3b;
      expv[10] = 35'h4fa45cc3a;
      expv[11] = 35'h4c237810f;
      expv[12] = 35'h0c237810f;
      expv[13] = 35'h50f037ef6;
      expv[14] = 35'h70de9df4e;
      expv[15] = 35'h49fed5aac;
      expv[16] = 35'h692c5d612;
      expv[17] = 35'h5a4eb98dc;
      expv[18] = 35'h703397f6c;
      expv[19] = 35'h475cb80aa;
      expv[20] = 35'h7ca906158;
      expv[21] = 35'h604b1c304;
      expv[22] = 35'h0502b1d98;
      expv[23] = 35'h4ff181070;
      expv[24] = 35'h7adc38f93;
      expv[25] = 35'h3adc38f93;
      expv[26] = 35'h3adc38f93;
      expv[27] = 35'h3adc38f93;
      expv[28] = 35'h4d49f613a;
      expv[29] = 35'h7d54bdf54;
      expv[30] = 35'h7e35e85d4;
      expv[31] = 35'h501dbed44;
      expv[32] = 35'h76520bd8f;
      expv[33] = 35'h36520bd8f;
      expv[34] = 35'h36520bd8f;
      expv[35] = 35'h36520bd8f;
      expv[36] = 35'h36520bd8f;
      expv[37] = 35'h36520bd8f;
      expv[38] = 35'h36520bd8f;
      expv[39] = 35'h36520bd8f;
      expv[40] = 35'h721b15086;
      expv[41] = 35'h5540810bc;
      expv[42] = 35'h512945f5e;
      expv[43] = 35'h7b285d082;
      expv[44] = 35'h5f09bae93;
      expv[45] = 35'h5f09bae92;
      expv[46] = 35'h51d5ac133;
      expv[47] = 35'h11d5ac133;
      expv[48] = 35'h11d5ac133;
      expv[49] = 35'h5566014be;
      expv[50] = 35'h794ed1fc6;
      expv[51] = 35'h7ed22076b;
      expv[52] = 35'h7ed22076a;
      expv[53] = 35'h5e0db94d8;
      expv[54] = 35'h601dbd522;
      expv[55] = 35'h4bda9c402;
      expv[56] = 35'h570745b32;
      expv[57] = 35'h6fd907bee;
      expv[58] = 35'h4f541a25b;
      expv[59] = 35'h4f541a25a;
      expv[60] = 35'h5f248d38a;
      expv[61] = 35'h5862c7bda;
      expv[62] = 35'h69518f0ef;
      expv[63] = 35'h69518f0ee;
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
