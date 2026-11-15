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

  origen_181539 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .mem_bus_out(in_vec[31:16]),
    .bus_out(in_vec[15:0]),
    .mem_bus_in(out_vec[35:20]),
    .mem_data_strobe(out_vec[19:19]),
    .mem_bus_rw(out_vec[18:18]),
    .bus_in(out_vec[17:2]),
    .data_strobe(out_vec[1:1]),
    .bus_rw(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1fa09ef85;
    stim[1] = 33'h11ce20de2;
    stim[2] = 33'h0279837ad;
    stim[3] = 33'h079248fd3;
    stim[4] = 33'h05d6d3e9e;
    stim[5] = 33'h0c5a5d9c7;
    stim[6] = 33'h0302a198b;
    stim[7] = 33'h0a5565c27;
    stim[8] = 33'h0f19b8714;
    stim[9] = 33'h0c479ab17;
    stim[10] = 33'h0582954c1;
    stim[11] = 33'h07dca406b;
    stim[12] = 33'h04d865c0f;
    stim[13] = 33'h0c5085292;
    stim[14] = 33'h072744074;
    stim[15] = 33'h0a4d08cf0;
    stim[16] = 33'h0b9c5b445;
    stim[17] = 33'h0f4a3c4cd;
    stim[18] = 33'h03eda4e1f;
    stim[19] = 33'h1067b659e;
    stim[20] = 33'h0b74489d6;
    stim[21] = 33'h01c1b7408;
    stim[22] = 33'h08d04729b;
    stim[23] = 33'h04730fc04;
    stim[24] = 33'h028cca97d;
    stim[25] = 33'h0895e2d56;
    stim[26] = 33'h0ed6afe68;
    stim[27] = 33'h09533de04;
    stim[28] = 33'h022b2a18e;
    stim[29] = 33'h019d18ae7;
    stim[30] = 33'h03894ed62;
    stim[31] = 33'h0de888b45;
    stim[32] = 33'h08bbdf7c5;
    stim[33] = 33'h08b8f99a9;
    stim[34] = 33'h0d5fa7ccf;
    stim[35] = 33'h01eda33f5;
    stim[36] = 33'h0e7b97c0a;
    stim[37] = 33'h07fccb4b1;
    stim[38] = 33'h03d6855c8;
    stim[39] = 33'h071d52bb2;
    stim[40] = 33'h09f8cd279;
    stim[41] = 33'h0724299d3;
    stim[42] = 33'h0adc4066e;
    stim[43] = 33'h0182603dc;
    stim[44] = 33'h0d57d457e;
    stim[45] = 33'h0caa269eb;
    stim[46] = 33'h0a5826131;
    stim[47] = 33'h0c8631a4e;
    stim[48] = 33'h005c65d64;
    stim[49] = 33'h050bf2d5d;
    stim[50] = 33'h0dd42353f;
    stim[51] = 33'h0923693f0;
    stim[52] = 33'h0c108c803;
    stim[53] = 33'h07451b9c0;
    stim[54] = 33'h05a6cdf38;
    stim[55] = 33'h0c9476bd8;
    stim[56] = 33'h0fad470c4;
    stim[57] = 33'h0bffc977d;
    stim[58] = 33'h00df8ce8d;
    stim[59] = 33'h0c1096911;
    stim[60] = 33'h06c5dd0c1;
    stim[61] = 33'h0e49a3994;
    stim[62] = 33'h0083090ec;
    stim[63] = 33'h0150033e5;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000000;
      expv[6] = 36'h000000000;
      expv[7] = 36'h000000000;
      expv[8] = 36'h000000000;
      expv[9] = 36'h000000000;
      expv[10] = 36'h000000000;
      expv[11] = 36'h000000000;
      expv[12] = 36'h000000000;
      expv[13] = 36'h000000000;
      expv[14] = 36'h000000000;
      expv[15] = 36'h000000000;
      expv[16] = 36'h000000000;
      expv[17] = 36'h000000000;
      expv[18] = 36'h000000000;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h000000000;
      expv[22] = 36'h000000000;
      expv[23] = 36'h000000000;
      expv[24] = 36'h000000000;
      expv[25] = 36'h000000000;
      expv[26] = 36'h000000000;
      expv[27] = 36'h000000000;
      expv[28] = 36'h000000000;
      expv[29] = 36'h000000000;
      expv[30] = 36'h000000000;
      expv[31] = 36'h000000000;
      expv[32] = 36'h000000000;
      expv[33] = 36'h000000000;
      expv[34] = 36'h000000000;
      expv[35] = 36'h000000000;
      expv[36] = 36'h000000000;
      expv[37] = 36'h000000000;
      expv[38] = 36'h000000000;
      expv[39] = 36'h000000000;
      expv[40] = 36'h000000000;
      expv[41] = 36'h000000000;
      expv[42] = 36'h000000000;
      expv[43] = 36'h000000000;
      expv[44] = 36'h000000000;
      expv[45] = 36'h000000000;
      expv[46] = 36'h000000000;
      expv[47] = 36'h000000000;
      expv[48] = 36'h000000000;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000000;
      expv[51] = 36'h000000000;
      expv[52] = 36'h000000000;
      expv[53] = 36'h000000000;
      expv[54] = 36'h000000000;
      expv[55] = 36'h000000000;
      expv[56] = 36'h000000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h000000000;
      expv[60] = 36'h000000000;
      expv[61] = 36'h000000000;
      expv[62] = 36'h000000000;
      expv[63] = 36'h000000000;
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
