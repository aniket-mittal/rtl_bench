// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05129 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[41:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0013112841;
    stim[1] = 37'h0d5cd87165;
    stim[2] = 37'h120ca2df8e;
    stim[3] = 37'h105f9ba431;
    stim[4] = 37'h1a9f20ab84;
    stim[5] = 37'h1aae608b26;
    stim[6] = 37'h1eccd17b4a;
    stim[7] = 37'h079f8f2685;
    stim[8] = 37'h1b466b2eec;
    stim[9] = 37'h1ba7e479ed;
    stim[10] = 37'h02c54e7117;
    stim[11] = 37'h0ad522ce62;
    stim[12] = 37'h03a27c75b5;
    stim[13] = 37'h1adfbf919e;
    stim[14] = 37'h02226df740;
    stim[15] = 37'h03c9c7f8ba;
    stim[16] = 37'h0bb6ca3d2b;
    stim[17] = 37'h035cb67867;
    stim[18] = 37'h0709dd4162;
    stim[19] = 37'h1a55628100;
    stim[20] = 37'h0eee055e67;
    stim[21] = 37'h06e757f485;
    stim[22] = 37'h02697c03f1;
    stim[23] = 37'h06d70b332d;
    stim[24] = 37'h0ff274f82a;
    stim[25] = 37'h03873a13e6;
    stim[26] = 37'h12f6854f0e;
    stim[27] = 37'h1f6c078122;
    stim[28] = 37'h0be7d8b0cc;
    stim[29] = 37'h1e0969d397;
    stim[30] = 37'h134c1ba14d;
    stim[31] = 37'h06a73eeccf;
    stim[32] = 37'h1a4f5877ef;
    stim[33] = 37'h0fee9063d5;
    stim[34] = 37'h0b4ba2bc9b;
    stim[35] = 37'h02cd3b0711;
    stim[36] = 37'h0f26a36165;
    stim[37] = 37'h17662c9937;
    stim[38] = 37'h1feca217ef;
    stim[39] = 37'h073c941dd8;
    stim[40] = 37'h1668e2eddf;
    stim[41] = 37'h03ec14131c;
    stim[42] = 37'h12b4d55859;
    stim[43] = 37'h0b5a28728f;
    stim[44] = 37'h14c3e25cb6;
    stim[45] = 37'h1fbfb0e802;
    stim[46] = 37'h06de5e79e3;
    stim[47] = 37'h06170614d5;
    stim[48] = 37'h0ab9728f1a;
    stim[49] = 37'h17a6c37d38;
    stim[50] = 37'h0f8adc92ef;
    stim[51] = 37'h12fb38aa95;
    stim[52] = 37'h0ed49e67ca;
    stim[53] = 37'h037ac23ca2;
    stim[54] = 37'h1b645ef74e;
    stim[55] = 37'h1bb6674ade;
    stim[56] = 37'h16c7746ac5;
    stim[57] = 37'h0b02a96c99;
    stim[58] = 37'h073a1b340c;
    stim[59] = 37'h1b62fb78c8;
    stim[60] = 37'h03d6969bae;
    stim[61] = 37'h1be8d282b0;
    stim[62] = 37'h0af67f722a;
    stim[63] = 37'h03ceef82c9;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00000000000;
      expv[16] = 42'h00000000000;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h08500000085;
      expv[23] = 42'h08500000085;
      expv[24] = 42'h32d00000000;
      expv[25] = 42'h32d0000032d;
      expv[26] = 42'h32d00000000;
      expv[27] = 42'h32d00000000;
      expv[28] = 42'h32d00000000;
      expv[29] = 42'h32d00000000;
      expv[30] = 42'h32d00000000;
      expv[31] = 42'h32d0000032d;
      expv[32] = 42'h0cf00000000;
      expv[33] = 42'h0cf00000000;
      expv[34] = 42'h0cf00000000;
      expv[35] = 42'h0cf000000cf;
      expv[36] = 42'h0cf00000000;
      expv[37] = 42'h0cf00000000;
      expv[38] = 42'h0cf00000000;
      expv[39] = 42'h0cf000000cf;
      expv[40] = 42'h0cf00000000;
      expv[41] = 42'h0cf000000cf;
      expv[42] = 42'h0cf00000000;
      expv[43] = 42'h0cf00000000;
      expv[44] = 42'h00000000000;
      expv[45] = 42'h00000000000;
      expv[46] = 42'h00000000000;
      expv[47] = 42'h1e3000001e3;
      expv[48] = 42'h0d500000000;
      expv[49] = 42'h0d500000000;
      expv[50] = 42'h0d500000000;
      expv[51] = 42'h0d500000000;
      expv[52] = 42'h0d500000000;
      expv[53] = 42'h0d5000000d5;
      expv[54] = 42'h0d500000000;
      expv[55] = 42'h0d500000000;
      expv[56] = 42'h0d500000000;
      expv[57] = 42'h0d500000000;
      expv[58] = 42'h0d5000000d5;
      expv[59] = 42'h0d500000000;
      expv[60] = 42'h0d5000000d5;
      expv[61] = 42'h0d500000000;
      expv[62] = 42'h0d500000000;
      expv[63] = 42'h0d5000000d5;
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
