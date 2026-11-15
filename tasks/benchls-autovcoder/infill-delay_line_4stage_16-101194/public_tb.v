// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101194 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .enable(in_vec[18:18]),
    .counter(in_vec[17:16]),
    .data_in(in_vec[15:0]),
    .data_out0(out_vec[63:48]),
    .data_out1(out_vec[47:32]),
    .data_out2(out_vec[31:16]),
    .data_out3(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9fa77;
    stim[1] = 20'h9e841;
    stim[2] = 20'h062af;
    stim[3] = 20'h7a85e;
    stim[4] = 20'h7dc8d;
    stim[5] = 20'h60f28;
    stim[6] = 20'h78245;
    stim[7] = 20'h151c1;
    stim[8] = 20'h0c2c7;
    stim[9] = 20'h09c3c;
    stim[10] = 20'h7be71;
    stim[11] = 20'h18985;
    stim[12] = 20'h3c214;
    stim[13] = 20'h4cc52;
    stim[14] = 20'h4b501;
    stim[15] = 20'h6fcdb;
    stim[16] = 20'h2874a;
    stim[17] = 20'h3ebf3;
    stim[18] = 20'h7ea0b;
    stim[19] = 20'h1b187;
    stim[20] = 20'h4bc4d;
    stim[21] = 20'h1356e;
    stim[22] = 20'h5a7f2;
    stim[23] = 20'h3ac9a;
    stim[24] = 20'h426ca;
    stim[25] = 20'h0159a;
    stim[26] = 20'h1e1c0;
    stim[27] = 20'h5abea;
    stim[28] = 20'h6f5d3;
    stim[29] = 20'h1f2e9;
    stim[30] = 20'h4831b;
    stim[31] = 20'h7d1d7;
    stim[32] = 20'h0296c;
    stim[33] = 20'h20ce1;
    stim[34] = 20'h63721;
    stim[35] = 20'h4da5f;
    stim[36] = 20'h6e75d;
    stim[37] = 20'h36d7c;
    stim[38] = 20'h5f414;
    stim[39] = 20'h5632d;
    stim[40] = 20'h7066d;
    stim[41] = 20'h71bf0;
    stim[42] = 20'h35fad;
    stim[43] = 20'h2f7f4;
    stim[44] = 20'h79c29;
    stim[45] = 20'h31149;
    stim[46] = 20'h0d903;
    stim[47] = 20'h18784;
    stim[48] = 20'h2f38a;
    stim[49] = 20'h40c28;
    stim[50] = 20'h288bd;
    stim[51] = 20'h7ef0a;
    stim[52] = 20'h2d5de;
    stim[53] = 20'h238c0;
    stim[54] = 20'h045ff;
    stim[55] = 20'h56b75;
    stim[56] = 20'h2ba4d;
    stim[57] = 20'h2163c;
    stim[58] = 20'h494ba;
    stim[59] = 20'h05668;
    stim[60] = 20'h1187e;
    stim[61] = 20'h473da;
    stim[62] = 20'h0ec0e;
    stim[63] = 20'h222d7;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
