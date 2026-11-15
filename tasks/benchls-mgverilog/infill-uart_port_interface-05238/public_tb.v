// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05238 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .port_id(in_vec[31:24]),
    .data_in(in_vec[23:16]),
    .read_strobe(in_vec[15:15]),
    .write_strobe(in_vec[14:14]),
    .uart_data_read(in_vec[13:6]),
    .rx_data_present(in_vec[5:5]),
    .rx_half_full(in_vec[4:4]),
    .rx_full(in_vec[3:3]),
    .tx_data_present(in_vec[2:2]),
    .tx_half_full(in_vec[1:1]),
    .tx_full(in_vec[0:0]),
    .data_out(out_vec[35:28]),
    .interrupt(out_vec[27:27]),
    .buffer_write(out_vec[26:26]),
    .uart_data_write(out_vec[25:18]),
    .buffer_read(out_vec[17:17]),
    .enable(out_vec[16:16]),
    .uart_clock_divide(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h162365bc7;
    stim[1] = 33'h106754b68;
    stim[2] = 33'h0543b7a35;
    stim[3] = 33'h00a0dfa82;
    stim[4] = 33'h07a9115a2;
    stim[5] = 33'h00a80c75e;
    stim[6] = 33'h00c734e13;
    stim[7] = 33'h0b7f1e1ad;
    stim[8] = 33'h0f5239426;
    stim[9] = 33'h0c9247fe0;
    stim[10] = 33'h1f65721bd;
    stim[11] = 33'h02af06657;
    stim[12] = 33'h007e8239a;
    stim[13] = 33'h0d248e186;
    stim[14] = 33'h07b85813b;
    stim[15] = 33'h080ed541d;
    stim[16] = 33'h0e2a3b4c5;
    stim[17] = 33'h0f100a372;
    stim[18] = 33'h0ae89687c;
    stim[19] = 33'h0e524e414;
    stim[20] = 33'h0fe64f5e9;
    stim[21] = 33'h0548b8af6;
    stim[22] = 33'h0c896e043;
    stim[23] = 33'h0cf21ffa9;
    stim[24] = 33'h090c4ac45;
    stim[25] = 33'h032dbdc08;
    stim[26] = 33'h068e708d7;
    stim[27] = 33'h0e2631b29;
    stim[28] = 33'h0deff7fe2;
    stim[29] = 33'h059f20a71;
    stim[30] = 33'h0f05599c4;
    stim[31] = 33'h0b77e12d6;
    stim[32] = 33'h0251deaf6;
    stim[33] = 33'h06ba6a2ad;
    stim[34] = 33'h016e9a8ac;
    stim[35] = 33'h005ffc168;
    stim[36] = 33'h0d61ae1aa;
    stim[37] = 33'h1ceaed479;
    stim[38] = 33'h04e54276e;
    stim[39] = 33'h03b88accf;
    stim[40] = 33'h018709b6f;
    stim[41] = 33'h011b5e8e3;
    stim[42] = 33'h07961363a;
    stim[43] = 33'h067923671;
    stim[44] = 33'h0a327533b;
    stim[45] = 33'h0016ceb6b;
    stim[46] = 33'h079d057fb;
    stim[47] = 33'h0e769eef9;
    stim[48] = 33'h0e122e53b;
    stim[49] = 33'h086e5e5a8;
    stim[50] = 33'h0ff1d0673;
    stim[51] = 33'h058831467;
    stim[52] = 33'h00299e5da;
    stim[53] = 33'h044c422f9;
    stim[54] = 33'h0b66ab6fe;
    stim[55] = 33'h05bde4a07;
    stim[56] = 33'h024dd47cd;
    stim[57] = 33'h075c1e6b9;
    stim[58] = 33'h04d59e9c0;
    stim[59] = 33'h0b0ff7710;
    stim[60] = 33'h06759d014;
    stim[61] = 33'h01976057e;
    stim[62] = 33'h0a3ebe783;
    stim[63] = 33'h05fa04a0b;
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
      expv[0] = 36'h0000x0000;
      expv[1] = 36'h0000x0000;
      expv[2] = 36'h0080x7500;
      expv[3] = 36'h0080x7500;
      expv[4] = 36'h0000x7500;
      expv[5] = 36'h0080x7500;
      expv[6] = 36'h0000x7500;
      expv[7] = 36'h0000x7500;
      expv[8] = 36'h0080x7500;
      expv[9] = 36'h0080x7500;
      expv[10] = 36'h0080x7500;
      expv[11] = 36'h0080x7500;
      expv[12] = 36'h0000x7500;
      expv[13] = 36'h0000x7500;
      expv[14] = 36'h0000x7500;
      expv[15] = 36'h0080x7500;
      expv[16] = 36'h0000x7500;
      expv[17] = 36'h0000x7500;
      expv[18] = 36'h0080x7500;
      expv[19] = 36'h0080x7500;
      expv[20] = 36'h0000x7500;
      expv[21] = 36'h0080x7500;
      expv[22] = 36'h0080x7500;
      expv[23] = 36'h0000x7500;
      expv[24] = 36'h0080x7500;
      expv[25] = 36'h0000x7500;
      expv[26] = 36'h0000x7500;
      expv[27] = 36'h0000x7500;
      expv[28] = 36'h0080x7500;
      expv[29] = 36'h0080x7500;
      expv[30] = 36'h0080x7500;
      expv[31] = 36'h0000x7500;
      expv[32] = 36'h0000x7500;
      expv[33] = 36'h0080x7500;
      expv[34] = 36'h0080x7500;
      expv[35] = 36'h0080x7500;
      expv[36] = 36'h0080x75ff;
      expv[37] = 36'h0080x75ff;
      expv[38] = 36'h0080x75ff;
      expv[39] = 36'h0080x75ff;
      expv[40] = 36'h0000x75ff;
      expv[41] = 36'h0080x75ff;
      expv[42] = 36'h0080x75ff;
      expv[43] = 36'h0080x75ff;
      expv[44] = 36'h0080x75ff;
      expv[45] = 36'h0080x75ff;
      expv[46] = 36'h0080x75ff;
      expv[47] = 36'h0080x75ff;
      expv[48] = 36'h0080x75ff;
      expv[49] = 36'h0080x75ff;
      expv[50] = 36'h0080x75ff;
      expv[51] = 36'h0080x75ff;
      expv[52] = 36'h0080x75ff;
      expv[53] = 36'h1600x75ff;
      expv[54] = 36'h0080x75ff;
      expv[55] = 36'h0080x75ff;
      expv[56] = 36'h0000x75ff;
      expv[57] = 36'h0000x75ff;
      expv[58] = 36'h0080x75ff;
      expv[59] = 36'h0000x75ff;
      expv[60] = 36'h0000x75ff;
      expv[61] = 36'h0000x75ff;
      expv[62] = 36'h0080x75ff;
      expv[63] = 36'h0000x75ff;
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
