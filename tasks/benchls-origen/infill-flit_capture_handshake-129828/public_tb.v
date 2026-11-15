// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129828 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .mem_done_access(in_vec[33:33]),
    .v_d_flits_m(in_vec[32:32]),
    .d_flits_m(in_vec[31:0]),
    .d_m_cstate(out_vec[32:32]),
    .d_m_areg_flits(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5996a0a50;
    stim[1] = 35'h4284f2967;
    stim[2] = 35'h20ca451e3;
    stim[3] = 35'h1ac9ffbf8;
    stim[4] = 35'h125687d56;
    stim[5] = 35'h02b296681;
    stim[6] = 35'h2875c107f;
    stim[7] = 35'h0b34f8c6e;
    stim[8] = 35'h2448ddd3b;
    stim[9] = 35'h0ed50f81f;
    stim[10] = 35'h0eefb836c;
    stim[11] = 35'h23e9fa53a;
    stim[12] = 35'h5a09bcc86;
    stim[13] = 35'h037ae2b9b;
    stim[14] = 35'h109b8f771;
    stim[15] = 35'h09b576e9a;
    stim[16] = 35'h3eccf6b0a;
    stim[17] = 35'h1d9a4e3f0;
    stim[18] = 35'h34ed9a110;
    stim[19] = 35'h1ea3ce6ad;
    stim[20] = 35'h2a58befa7;
    stim[21] = 35'h1265092fe;
    stim[22] = 35'h043f75f20;
    stim[23] = 35'h11da938bf;
    stim[24] = 35'h179c9bc66;
    stim[25] = 35'h16a9600c5;
    stim[26] = 35'h3d251681b;
    stim[27] = 35'h1fa8b6ab3;
    stim[28] = 35'h1f86d3f68;
    stim[29] = 35'h01042733a;
    stim[30] = 35'h058fa0468;
    stim[31] = 35'h1e8653831;
    stim[32] = 35'h16aeb10b4;
    stim[33] = 35'h35ea1bf1a;
    stim[34] = 35'h11e18f7de;
    stim[35] = 35'h0b2d8a7e7;
    stim[36] = 35'h0e03deb96;
    stim[37] = 35'h0bdb7cfd6;
    stim[38] = 35'h3d672d09b;
    stim[39] = 35'h14d78c3b8;
    stim[40] = 35'h183e2b02d;
    stim[41] = 35'h194e01188;
    stim[42] = 35'h2816a8de9;
    stim[43] = 35'h313775aa9;
    stim[44] = 35'h065101434;
    stim[45] = 35'h0995ddc01;
    stim[46] = 35'h2292e1fed;
    stim[47] = 35'h3edd21b0e;
    stim[48] = 35'h3979e3976;
    stim[49] = 35'h12a4a4a74;
    stim[50] = 35'h2c3eff086;
    stim[51] = 35'h3933ed255;
    stim[52] = 35'h09a421376;
    stim[53] = 35'h215dd2007;
    stim[54] = 35'h05f10e57c;
    stim[55] = 35'h373e095c7;
    stim[56] = 35'h39764c6b2;
    stim[57] = 35'h238f6d70f;
    stim[58] = 35'h19a53df9f;
    stim[59] = 35'h1124abafd;
    stim[60] = 35'h3f1956339;
    stim[61] = 35'h34334333c;
    stim[62] = 35'h364fd9cad;
    stim[63] = 35'h0ed4fc372;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h100000000;
      expv[4] = 33'h0ac9ffbf8;
      expv[5] = 33'h0ac9ffbf8;
      expv[6] = 33'h0ac9ffbf8;
      expv[7] = 33'h1ac9ffbf8;
      expv[8] = 33'h1ac9ffbf8;
      expv[9] = 33'h1ac9ffbf8;
      expv[10] = 33'h1ac9ffbf8;
      expv[11] = 33'h1ac9ffbf8;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h100000000;
      expv[15] = 33'h009b8f771;
      expv[16] = 33'h009b8f771;
      expv[17] = 33'h109b8f771;
      expv[18] = 33'h0d9a4e3f0;
      expv[19] = 33'h1d9a4e3f0;
      expv[20] = 33'h0ea3ce6ad;
      expv[21] = 33'h1ea3ce6ad;
      expv[22] = 33'h0265092fe;
      expv[23] = 33'h0265092fe;
      expv[24] = 33'h0265092fe;
      expv[25] = 33'h0265092fe;
      expv[26] = 33'h0265092fe;
      expv[27] = 33'h1265092fe;
      expv[28] = 33'h0fa8b6ab3;
      expv[29] = 33'h0fa8b6ab3;
      expv[30] = 33'h0fa8b6ab3;
      expv[31] = 33'h0fa8b6ab3;
      expv[32] = 33'h0fa8b6ab3;
      expv[33] = 33'h0fa8b6ab3;
      expv[34] = 33'h1fa8b6ab3;
      expv[35] = 33'h01e18f7de;
      expv[36] = 33'h01e18f7de;
      expv[37] = 33'h01e18f7de;
      expv[38] = 33'h01e18f7de;
      expv[39] = 33'h11e18f7de;
      expv[40] = 33'h04d78c3b8;
      expv[41] = 33'h04d78c3b8;
      expv[42] = 33'h04d78c3b8;
      expv[43] = 33'h14d78c3b8;
      expv[44] = 33'h013775aa9;
      expv[45] = 33'h013775aa9;
      expv[46] = 33'h013775aa9;
      expv[47] = 33'h113775aa9;
      expv[48] = 33'h0edd21b0e;
      expv[49] = 33'h1edd21b0e;
      expv[50] = 33'h02a4a4a74;
      expv[51] = 33'h12a4a4a74;
      expv[52] = 33'h0933ed255;
      expv[53] = 33'h0933ed255;
      expv[54] = 33'h1933ed255;
      expv[55] = 33'h1933ed255;
      expv[56] = 33'h073e095c7;
      expv[57] = 33'h173e095c7;
      expv[58] = 33'h173e095c7;
      expv[59] = 33'h09a53df9f;
      expv[60] = 33'h09a53df9f;
      expv[61] = 33'h19a53df9f;
      expv[62] = 33'h04334333c;
      expv[63] = 33'h14334333c;
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
