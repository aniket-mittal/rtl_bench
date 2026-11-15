// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139479 dut (
    .clk(clk),
    .rst(in_vec[28:28]),
    .slow_signal(in_vec[27:27]),
    .select(in_vec[26:24]),
    .data_in0(in_vec[23:20]),
    .data_in1(in_vec[19:16]),
    .data_in2(in_vec[15:12]),
    .data_in3(in_vec[11:8]),
    .data_in4(in_vec[7:4]),
    .data_in5(in_vec[3:0]),
    .final_output(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h162165d8;
    stim[1] = 29'h114a3ab9;
    stim[2] = 29'h0137567e;
    stim[3] = 29'h0e1fb21f;
    stim[4] = 29'h0a5ad9ae;
    stim[5] = 29'h0985a104;
    stim[6] = 29'h0a2eb3a6;
    stim[7] = 29'h0b73deeb;
    stim[8] = 29'h0c415e8d;
    stim[9] = 29'h0e896a27;
    stim[10] = 29'h0533c048;
    stim[11] = 29'h05f1b1b6;
    stim[12] = 29'h0b6134f1;
    stim[13] = 29'h07900404;
    stim[14] = 29'h04bb286d;
    stim[15] = 29'h00cedde6;
    stim[16] = 29'h00b72cd0;
    stim[17] = 29'h0b83ab18;
    stim[18] = 29'h026cb15f;
    stim[19] = 29'h0952cdec;
    stim[20] = 29'h0a068129;
    stim[21] = 29'h0caa18b0;
    stim[22] = 29'h0a6f6388;
    stim[23] = 29'h093f4a23;
    stim[24] = 29'h04fcb7e9;
    stim[25] = 29'h08ba206a;
    stim[26] = 29'h0f601407;
    stim[27] = 29'h0f4bd581;
    stim[28] = 29'h07a19765;
    stim[29] = 29'h0fac4289;
    stim[30] = 29'h02569e27;
    stim[31] = 29'h0b6dd86e;
    stim[32] = 29'h08d16ca7;
    stim[33] = 29'h028883da;
    stim[34] = 29'h056cdff8;
    stim[35] = 29'h091013c4;
    stim[36] = 29'h08914731;
    stim[37] = 29'h0e92d542;
    stim[38] = 29'h0fd1dfe4;
    stim[39] = 29'h07d1c828;
    stim[40] = 29'h0148a1c9;
    stim[41] = 29'h0d1dbb8c;
    stim[42] = 29'h08d840fd;
    stim[43] = 29'h06ca2024;
    stim[44] = 29'h07f3efbb;
    stim[45] = 29'h0a24b7f3;
    stim[46] = 29'h0d452456;
    stim[47] = 29'h01f7ac5b;
    stim[48] = 29'h0b53b75d;
    stim[49] = 29'h0eb055dc;
    stim[50] = 29'h02a9a6af;
    stim[51] = 29'h0043d514;
    stim[52] = 29'h08338ffc;
    stim[53] = 29'h010ac78a;
    stim[54] = 29'h0baa4663;
    stim[55] = 29'h0b826ec3;
    stim[56] = 29'h0967fcfb;
    stim[57] = 29'h0a39d9f9;
    stim[58] = 29'h0b2777c4;
    stim[59] = 29'h012e49bb;
    stim[60] = 29'h0a900b32;
    stim[61] = 29'h0cd04589;
    stim[62] = 29'h0c6c1193;
    stim[63] = 29'h01d85692;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h8;
      expv[11] = 4'h0;
      expv[12] = 4'h4;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'hb;
      expv[18] = 4'hb;
      expv[19] = 4'h2;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'he;
      expv[25] = 4'hb;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h9;
      expv[31] = 4'h8;
      expv[32] = 4'h0;
      expv[33] = 4'h8;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'hc;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'hb;
      expv[46] = 4'h0;
      expv[47] = 4'h7;
      expv[48] = 4'h7;
      expv[49] = 4'h0;
      expv[50] = 4'ha;
      expv[51] = 4'h0;
      expv[52] = 4'h3;
      expv[53] = 4'ha;
      expv[54] = 4'h6;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'he;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h8;
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
