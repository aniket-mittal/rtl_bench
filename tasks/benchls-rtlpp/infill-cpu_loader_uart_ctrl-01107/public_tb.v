// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 95;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01107 dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .rx_byte(in_vec[43:36]),
    .received(in_vec[35:35]),
    .recv_error(in_vec[34:34]),
    .is_transmitting(in_vec[33:33]),
    .cpu_data_rd(in_vec[32:1]),
    .cpu_active(in_vec[0:0]),
    .leds(out_vec[94:79]),
    .cpu_address(out_vec[78:47]),
    .cpu_start(out_vec[46:46]),
    .cpu_selection(out_vec[45:42]),
    .cpu_write(out_vec[41:41]),
    .cpu_data_wr(out_vec[40:9]),
    .transmit(out_vec[8:8]),
    .tx_byte(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h10c482d8dd27;
    stim[1] = 45'h1f2599abc4ed;
    stim[2] = 45'h06d049645cde;
    stim[3] = 45'h01a1f8d5bc76;
    stim[4] = 45'h0874e8b27d3b;
    stim[5] = 45'h018805fcaad2;
    stim[6] = 45'h1d8b77abde5f;
    stim[7] = 45'h0396aaddb70f;
    stim[8] = 45'h09771452d0d7;
    stim[9] = 45'h0d96de85da1a;
    stim[10] = 45'h03084e754630;
    stim[11] = 45'h075b58906767;
    stim[12] = 45'h07634184682c;
    stim[13] = 45'h0adf4f84bce9;
    stim[14] = 45'h041b5dff9482;
    stim[15] = 45'h0ceecf721945;
    stim[16] = 45'h027ad73b8bd8;
    stim[17] = 45'h02555c980010;
    stim[18] = 45'h0b3ff9052422;
    stim[19] = 45'h047970f04aef;
    stim[20] = 45'h00a0c37c49f9;
    stim[21] = 45'h0e01eb03fdeb;
    stim[22] = 45'h0ae6fc3bbaf0;
    stim[23] = 45'h0c71e0f35619;
    stim[24] = 45'h060bc967f3d9;
    stim[25] = 45'h08df27fb03ae;
    stim[26] = 45'h0a7f0e8d687c;
    stim[27] = 45'h0ac43ca5d084;
    stim[28] = 45'h01871be10066;
    stim[29] = 45'h0416f3ff03c8;
    stim[30] = 45'h0c53492254d4;
    stim[31] = 45'h02293e3f3642;
    stim[32] = 45'h0aef06e0fbdb;
    stim[33] = 45'h0cf80e04f222;
    stim[34] = 45'h0113568a219b;
    stim[35] = 45'h04bdb178156f;
    stim[36] = 45'h027b01b83adb;
    stim[37] = 45'h0bf1b0927236;
    stim[38] = 45'h0bbd2047478e;
    stim[39] = 45'h00c0a1641c46;
    stim[40] = 45'h08c232d4cf9d;
    stim[41] = 45'h063a54ad25e4;
    stim[42] = 45'h06f21b4b66ca;
    stim[43] = 45'h0a4799fd8a45;
    stim[44] = 45'h19387aaee685;
    stim[45] = 45'h00ab19d525e4;
    stim[46] = 45'h0370ccae575c;
    stim[47] = 45'h099506765e83;
    stim[48] = 45'h058e3c4448d1;
    stim[49] = 45'h0c395965b342;
    stim[50] = 45'h00516df5e9fd;
    stim[51] = 45'h007f267ba4c2;
    stim[52] = 45'h068e31d13687;
    stim[53] = 45'h0dab867521c7;
    stim[54] = 45'h0e9ffadc4898;
    stim[55] = 45'h0c870ece3785;
    stim[56] = 45'h07af6ceabd09;
    stim[57] = 45'h054f5750dd30;
    stim[58] = 45'h071579b49851;
    stim[59] = 45'h0da44c6019cf;
    stim[60] = 45'h0d8e1ac0433a;
    stim[61] = 45'h0a040fbad3d1;
    stim[62] = 45'h099187c707c3;
    stim[63] = 45'h0b60aae2ded5;
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
      expv[0] = 95'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 95'h000000000000000000000000;
      expv[2] = 95'h000000000000000000000000;
      expv[3] = 95'h080000000000000000000000;
      expv[4] = 95'h080000000000000000000000;
      expv[5] = 95'h080000000000000000000000;
      expv[6] = 95'h080000000000000000000000;
      expv[7] = 95'h000000000000000000000000;
      expv[8] = 95'h000000000000000000000000;
      expv[9] = 95'h000000000000000000000000;
      expv[10] = 95'h000000000000000000000000;
      expv[11] = 95'h000000000000000000000000;
      expv[12] = 95'h000000000000000000000000;
      expv[13] = 95'h000000000000000000000000;
      expv[14] = 95'h000000000000000000000000;
      expv[15] = 95'h000000000000000000000000;
      expv[16] = 95'h000000000000000000000000;
      expv[17] = 95'h000000000000000000000000;
      expv[18] = 95'h000000000000000000000000;
      expv[19] = 95'h000000000000000000000000;
      expv[20] = 95'h000000000000000000000000;
      expv[21] = 95'h000000000000000000000000;
      expv[22] = 95'h000000000000000000000000;
      expv[23] = 95'h000000000000000000000000;
      expv[24] = 95'h000000000000000000000000;
      expv[25] = 95'h000000000000000000000000;
      expv[26] = 95'h000000000000000000000000;
      expv[27] = 95'h000000000000000000000000;
      expv[28] = 95'h000000000000000000000000;
      expv[29] = 95'h000000000000000000000000;
      expv[30] = 95'h000000000000000000000000;
      expv[31] = 95'h000000000000000000000000;
      expv[32] = 95'h000000000000000000000000;
      expv[33] = 95'h000000000000000000000000;
      expv[34] = 95'h000000000000000000000000;
      expv[35] = 95'h000000000000000000000000;
      expv[36] = 95'h000000000000000000000000;
      expv[37] = 95'h000000000000000000000000;
      expv[38] = 95'h000000000000000000000000;
      expv[39] = 95'h000000000000000000000000;
      expv[40] = 95'h000000000000000000000000;
      expv[41] = 95'h000000000000000000000000;
      expv[42] = 95'h000000000000000000000000;
      expv[43] = 95'h000000000000000000000000;
      expv[44] = 95'h000000000000000000000000;
      expv[45] = 95'h000000000000000000000000;
      expv[46] = 95'h000000000000000000000000;
      expv[47] = 95'h000000000000000000000000;
      expv[48] = 95'h000000000000000000000000;
      expv[49] = 95'h000000000000000000000000;
      expv[50] = 95'h000000000000000000000000;
      expv[51] = 95'h000000000000000000000000;
      expv[52] = 95'h000000000000000000000000;
      expv[53] = 95'h000000000000000000000000;
      expv[54] = 95'h000000000000000000000000;
      expv[55] = 95'h000000000000000000000000;
      expv[56] = 95'h000000000000000000000000;
      expv[57] = 95'h000000000000000000000000;
      expv[58] = 95'h000000000000000000000000;
      expv[59] = 95'h000000000000000000000000;
      expv[60] = 95'h000000000000000000000000;
      expv[61] = 95'h000000000000000000000000;
      expv[62] = 95'h000000000000000000000000;
      expv[63] = 95'h000000000000000000000000;
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
