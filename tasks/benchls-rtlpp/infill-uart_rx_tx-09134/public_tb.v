// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09134 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .rx(in_vec[9:9]),
    .transmit(in_vec[8:8]),
    .tx_byte(in_vec[7:0]),
    .tx(out_vec[12:12]),
    .received(out_vec[11:11]),
    .rx_byte(out_vec[10:3]),
    .is_receiving(out_vec[2:2]),
    .is_transmitting(out_vec[1:1]),
    .recv_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5a8;
    stim[1] = 11'h7db;
    stim[2] = 11'h3d7;
    stim[3] = 11'h060;
    stim[4] = 11'h1ec;
    stim[5] = 11'h347;
    stim[6] = 11'h089;
    stim[7] = 11'h335;
    stim[8] = 11'h3ad;
    stim[9] = 11'h01f;
    stim[10] = 11'h00b;
    stim[11] = 11'h37b;
    stim[12] = 11'h255;
    stim[13] = 11'h58a;
    stim[14] = 11'h0a5;
    stim[15] = 11'h33d;
    stim[16] = 11'h2d7;
    stim[17] = 11'h154;
    stim[18] = 11'h1eb;
    stim[19] = 11'h305;
    stim[20] = 11'h116;
    stim[21] = 11'h06d;
    stim[22] = 11'h100;
    stim[23] = 11'h02f;
    stim[24] = 11'h0f0;
    stim[25] = 11'h002;
    stim[26] = 11'h0db;
    stim[27] = 11'h145;
    stim[28] = 11'h3cd;
    stim[29] = 11'h37b;
    stim[30] = 11'h3d4;
    stim[31] = 11'h17d;
    stim[32] = 11'h1f0;
    stim[33] = 11'h360;
    stim[34] = 11'h090;
    stim[35] = 11'h1fa;
    stim[36] = 11'h380;
    stim[37] = 11'h287;
    stim[38] = 11'h34b;
    stim[39] = 11'h3d8;
    stim[40] = 11'h09a;
    stim[41] = 11'h0e4;
    stim[42] = 11'h161;
    stim[43] = 11'h2e6;
    stim[44] = 11'h361;
    stim[45] = 11'h3a4;
    stim[46] = 11'h215;
    stim[47] = 11'h0d2;
    stim[48] = 11'h2b2;
    stim[49] = 11'h096;
    stim[50] = 11'h39f;
    stim[51] = 11'h32a;
    stim[52] = 11'h1e7;
    stim[53] = 11'h365;
    stim[54] = 11'h285;
    stim[55] = 11'h082;
    stim[56] = 11'h28f;
    stim[57] = 11'h342;
    stim[58] = 11'h1ae;
    stim[59] = 11'h223;
    stim[60] = 11'h20a;
    stim[61] = 11'h37d;
    stim[62] = 11'h1c6;
    stim[63] = 11'h01f;
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
      expv[0] = 13'h1xxx;
      expv[1] = 13'h1xxx;
      expv[2] = 13'h1xxx;
      expv[3] = 13'h0xxx;
      expv[4] = 13'h0xxx;
      expv[5] = 13'h0xxx;
      expv[6] = 13'h0xxx;
      expv[7] = 13'h0xxx;
      expv[8] = 13'h0xxx;
      expv[9] = 13'h0xxx;
      expv[10] = 13'h0xxx;
      expv[11] = 13'h0xxx;
      expv[12] = 13'h0xxx;
      expv[13] = 13'h0xxx;
      expv[14] = 13'h1xxx;
      expv[15] = 13'h1xxx;
      expv[16] = 13'h0xxx;
      expv[17] = 13'h0xxx;
      expv[18] = 13'h0xxx;
      expv[19] = 13'h0xxx;
      expv[20] = 13'h0xxx;
      expv[21] = 13'h0xxx;
      expv[22] = 13'h0xxx;
      expv[23] = 13'h0xxx;
      expv[24] = 13'h0xxx;
      expv[25] = 13'h0xxx;
      expv[26] = 13'h0xxx;
      expv[27] = 13'h0xxx;
      expv[28] = 13'h0xxx;
      expv[29] = 13'h0xxx;
      expv[30] = 13'h0xxx;
      expv[31] = 13'h0xxx;
      expv[32] = 13'h0xxx;
      expv[33] = 13'h1xxx;
      expv[34] = 13'h1xxx;
      expv[35] = 13'h1xxx;
      expv[36] = 13'h1xxx;
      expv[37] = 13'h1xxx;
      expv[38] = 13'h1xxx;
      expv[39] = 13'h1xxx;
      expv[40] = 13'h1xxx;
      expv[41] = 13'h1xxx;
      expv[42] = 13'h1xxx;
      expv[43] = 13'h1xxx;
      expv[44] = 13'h1xxx;
      expv[45] = 13'h1xxx;
      expv[46] = 13'h1xxx;
      expv[47] = 13'h1xxx;
      expv[48] = 13'h1xxx;
      expv[49] = 13'h0xxx;
      expv[50] = 13'h0xxx;
      expv[51] = 13'h0xxx;
      expv[52] = 13'h0xxx;
      expv[53] = 13'h0xxx;
      expv[54] = 13'h0xxx;
      expv[55] = 13'h0xxx;
      expv[56] = 13'h0xxx;
      expv[57] = 13'h0xxx;
      expv[58] = 13'h0xxx;
      expv[59] = 13'h0xxx;
      expv[60] = 13'h0xxx;
      expv[61] = 13'h0xxx;
      expv[62] = 13'h0xxx;
      expv[63] = 13'h0xxx;
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
