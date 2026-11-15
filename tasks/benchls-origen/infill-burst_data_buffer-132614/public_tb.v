// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132614 dut (
    .clk_i(clk),
    .rst_i(in_vec[19:19]),
    .flush_i(in_vec[18:18]),
    .stb_i(in_vec[17:17]),
    .di(in_vec[16:1]),
    .next_i(in_vec[0:0]),
    .can_burst_o(out_vec[9:9]),
    .do8_valid(out_vec[8:8]),
    .do8(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hc4e93;
    stim[1] = 20'he4468;
    stim[2] = 20'h4cd0d;
    stim[3] = 20'h3f0b5;
    stim[4] = 20'h045a6;
    stim[5] = 20'h7c766;
    stim[6] = 20'h499be;
    stim[7] = 20'h7f5c0;
    stim[8] = 20'h6eaa0;
    stim[9] = 20'h31bca;
    stim[10] = 20'h2f190;
    stim[11] = 20'h24627;
    stim[12] = 20'h3e8fa;
    stim[13] = 20'h0c70c;
    stim[14] = 20'h11299;
    stim[15] = 20'h26ac5;
    stim[16] = 20'h141d1;
    stim[17] = 20'h0414b;
    stim[18] = 20'h59818;
    stim[19] = 20'h347b2;
    stim[20] = 20'h3bc5c;
    stim[21] = 20'h1bb50;
    stim[22] = 20'h05fca;
    stim[23] = 20'h3360f;
    stim[24] = 20'h0cde0;
    stim[25] = 20'h6ad4f;
    stim[26] = 20'h6fb9d;
    stim[27] = 20'h73bdb;
    stim[28] = 20'h5cfed;
    stim[29] = 20'h4cfd4;
    stim[30] = 20'h0f520;
    stim[31] = 20'h0508b;
    stim[32] = 20'h0100d;
    stim[33] = 20'h3c89c;
    stim[34] = 20'h58adf;
    stim[35] = 20'hda76c;
    stim[36] = 20'h2eea2;
    stim[37] = 20'h13b5a;
    stim[38] = 20'h44fc5;
    stim[39] = 20'h34908;
    stim[40] = 20'h51028;
    stim[41] = 20'h3b9fe;
    stim[42] = 20'h02e70;
    stim[43] = 20'h1179a;
    stim[44] = 20'h68a3c;
    stim[45] = 20'h25569;
    stim[46] = 20'h11bf8;
    stim[47] = 20'h12dab;
    stim[48] = 20'h20c7f;
    stim[49] = 20'h5f458;
    stim[50] = 20'h0a994;
    stim[51] = 20'h7055d;
    stim[52] = 20'h349d2;
    stim[53] = 20'h460ca;
    stim[54] = 20'h6a192;
    stim[55] = 20'h776da;
    stim[56] = 20'h29d37;
    stim[57] = 20'h76352;
    stim[58] = 20'h0cb9c;
    stim[59] = 20'h31f00;
    stim[60] = 20'h52eb4;
    stim[61] = 20'h12e3c;
    stim[62] = 20'h64cd4;
    stim[63] = 20'h0e153;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
