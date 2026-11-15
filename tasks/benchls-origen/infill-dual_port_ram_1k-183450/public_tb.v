// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183450 dut (
    .PORT_R_CLK(clk),
    .CLK_CLK(in_vec[38:38]),
    .PORT_R_ADDR(in_vec[37:28]),
    .PORT_W_CLK(in_vec[27:27]),
    .PORT_W_WR_EN(in_vec[26:26]),
    .PORT_W_ADDR(in_vec[25:16]),
    .PORT_W_WR_DATA(in_vec[15:0]),
    .PORT_R_RD_DATA(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h52c4a47dcb;
    stim[1] = 39'h7e8fcd3b7e;
    stim[2] = 39'h2a15ddfd28;
    stim[3] = 39'h2350eea64e;
    stim[4] = 39'h201aae4e12;
    stim[5] = 39'h2b884463ad;
    stim[6] = 39'h7dc302ae34;
    stim[7] = 39'h45a6b59557;
    stim[8] = 39'h6d2a6908a6;
    stim[9] = 39'h7fbb30cb1a;
    stim[10] = 39'h625b0097d8;
    stim[11] = 39'h666c50b33f;
    stim[12] = 39'h33eb324b38;
    stim[13] = 39'h61ac0b67ac;
    stim[14] = 39'h0ef745f2ea;
    stim[15] = 39'h7407d4c3c2;
    stim[16] = 39'h234ae191b7;
    stim[17] = 39'h464817b128;
    stim[18] = 39'h7d12c42d3a;
    stim[19] = 39'h7e37dc8c48;
    stim[20] = 39'h0d5b6c78f2;
    stim[21] = 39'h6049cb701b;
    stim[22] = 39'h3d703ce109;
    stim[23] = 39'h1233506dd1;
    stim[24] = 39'h172e5c798b;
    stim[25] = 39'h1e0a87a07a;
    stim[26] = 39'h300638eda7;
    stim[27] = 39'h7a3fa8bab8;
    stim[28] = 39'h61e6682d62;
    stim[29] = 39'h739733f862;
    stim[30] = 39'h2c469bbf7d;
    stim[31] = 39'h63b02488a1;
    stim[32] = 39'h69262f94a7;
    stim[33] = 39'h0d5847c83c;
    stim[34] = 39'h556a2f0b67;
    stim[35] = 39'h60d1ac193f;
    stim[36] = 39'h42b37921e4;
    stim[37] = 39'h14498ab668;
    stim[38] = 39'h30843efc70;
    stim[39] = 39'h4881d29fe1;
    stim[40] = 39'h6117b12bb9;
    stim[41] = 39'h01103be70a;
    stim[42] = 39'h4a0688344c;
    stim[43] = 39'h3b40634e1a;
    stim[44] = 39'h77fe955ee8;
    stim[45] = 39'h71721182ea;
    stim[46] = 39'h2427c78a6a;
    stim[47] = 39'h3970b87326;
    stim[48] = 39'h6c17a2e724;
    stim[49] = 39'h39c9b80ff4;
    stim[50] = 39'h6dbdfee9ea;
    stim[51] = 39'h45653df225;
    stim[52] = 39'h513ecc8475;
    stim[53] = 39'h37996f21c6;
    stim[54] = 39'h6910b11260;
    stim[55] = 39'h66e9b22173;
    stim[56] = 39'h3c687b6168;
    stim[57] = 39'h5d013ca158;
    stim[58] = 39'h40e4cb302e;
    stim[59] = 39'h745223c5b6;
    stim[60] = 39'h142b2c3bfb;
    stim[61] = 39'h720b5d55be;
    stim[62] = 39'h3e4c48afa8;
    stim[63] = 39'h05980fd05b;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
