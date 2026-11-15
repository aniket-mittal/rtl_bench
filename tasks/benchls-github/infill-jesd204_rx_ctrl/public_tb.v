// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_rx_ctrl dut (
    .clk(clk),
    .reset(in_vec[6:6]),
    .cfg_lanes_disable(in_vec[5:5]),
    .cfg_links_disable(in_vec[4:4]),
    .phy_ready(in_vec[3:3]),
    .cgs_ready(in_vec[2:2]),
    .lmfc_edge(in_vec[1:1]),
    .frame_align_err_thresh_met(in_vec[0:0]),
    .phy_en_char_align(out_vec[7:7]),
    .cgs_reset(out_vec[6:6]),
    .ifs_reset(out_vec[5:5]),
    .sync(out_vec[4:4]),
    .latency_monitor_reset(out_vec[3:3]),
    .status_state(out_vec[2:1]),
    .event_data_phase(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h5d;
    stim[1] = 7'h59;
    stim[2] = 7'h1e;
    stim[3] = 7'h20;
    stim[4] = 7'h21;
    stim[5] = 7'h1b;
    stim[6] = 7'h28;
    stim[7] = 7'h06;
    stim[8] = 7'h16;
    stim[9] = 7'h2c;
    stim[10] = 7'h3e;
    stim[11] = 7'h3f;
    stim[12] = 7'h12;
    stim[13] = 7'h2b;
    stim[14] = 7'h01;
    stim[15] = 7'h0f;
    stim[16] = 7'h34;
    stim[17] = 7'h21;
    stim[18] = 7'h35;
    stim[19] = 7'h04;
    stim[20] = 7'h33;
    stim[21] = 7'h07;
    stim[22] = 7'h01;
    stim[23] = 7'h17;
    stim[24] = 7'h11;
    stim[25] = 7'h04;
    stim[26] = 7'h24;
    stim[27] = 7'h22;
    stim[28] = 7'h18;
    stim[29] = 7'h53;
    stim[30] = 7'h3a;
    stim[31] = 7'h36;
    stim[32] = 7'h3d;
    stim[33] = 7'h3f;
    stim[34] = 7'h09;
    stim[35] = 7'h0a;
    stim[36] = 7'h3b;
    stim[37] = 7'h3f;
    stim[38] = 7'h3c;
    stim[39] = 7'h15;
    stim[40] = 7'h77;
    stim[41] = 7'h18;
    stim[42] = 7'h14;
    stim[43] = 7'h2a;
    stim[44] = 7'h1e;
    stim[45] = 7'h06;
    stim[46] = 7'h22;
    stim[47] = 7'h01;
    stim[48] = 7'h2f;
    stim[49] = 7'h20;
    stim[50] = 7'h1f;
    stim[51] = 7'h03;
    stim[52] = 7'h28;
    stim[53] = 7'h37;
    stim[54] = 7'h14;
    stim[55] = 7'h3b;
    stim[56] = 7'h19;
    stim[57] = 7'h0b;
    stim[58] = 7'h2e;
    stim[59] = 7'h4b;
    stim[60] = 7'h38;
    stim[61] = 7'h06;
    stim[62] = 7'h0c;
    stim[63] = 7'h0f;
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
      expv[0] = 8'h7x;
      expv[1] = 8'h78;
      expv[2] = 8'h78;
      expv[3] = 8'h78;
      expv[4] = 8'h78;
      expv[5] = 8'h78;
      expv[6] = 8'h78;
      expv[7] = 8'h78;
      expv[8] = 8'h78;
      expv[9] = 8'h78;
      expv[10] = 8'h7a;
      expv[11] = 8'h7a;
      expv[12] = 8'h7a;
      expv[13] = 8'h7a;
      expv[14] = 8'h7a;
      expv[15] = 8'h7a;
      expv[16] = 8'h7a;
      expv[17] = 8'h7a;
      expv[18] = 8'h7a;
      expv[19] = 8'h7a;
      expv[20] = 8'h7a;
      expv[21] = 8'h7a;
      expv[22] = 8'h7a;
      expv[23] = 8'h7a;
      expv[24] = 8'h7a;
      expv[25] = 8'h7a;
      expv[26] = 8'h7a;
      expv[27] = 8'h7a;
      expv[28] = 8'h7a;
      expv[29] = 8'h7a;
      expv[30] = 8'h78;
      expv[31] = 8'h78;
      expv[32] = 8'h78;
      expv[33] = 8'h78;
      expv[34] = 8'h78;
      expv[35] = 8'h78;
      expv[36] = 8'h78;
      expv[37] = 8'h78;
      expv[38] = 8'h7a;
      expv[39] = 8'h7a;
      expv[40] = 8'h7a;
      expv[41] = 8'h78;
      expv[42] = 8'h78;
      expv[43] = 8'h78;
      expv[44] = 8'h78;
      expv[45] = 8'h78;
      expv[46] = 8'h78;
      expv[47] = 8'h78;
      expv[48] = 8'h78;
      expv[49] = 8'h7a;
      expv[50] = 8'h7a;
      expv[51] = 8'h7a;
      expv[52] = 8'h7a;
      expv[53] = 8'h7a;
      expv[54] = 8'h7a;
      expv[55] = 8'h7a;
      expv[56] = 8'h7a;
      expv[57] = 8'h7a;
      expv[58] = 8'h7a;
      expv[59] = 8'h7a;
      expv[60] = 8'h78;
      expv[61] = 8'h78;
      expv[62] = 8'h78;
      expv[63] = 8'h78;
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
