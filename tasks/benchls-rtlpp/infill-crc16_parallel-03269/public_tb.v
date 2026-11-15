// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03269 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'ha5faf;
    stim[1] = 20'hcf95f;
    stim[2] = 20'hd49f8;
    stim[3] = 20'h06b16;
    stim[4] = 20'h682f0;
    stim[5] = 20'h0b11c;
    stim[6] = 20'h594ca;
    stim[7] = 20'h87b24;
    stim[8] = 20'hbc076;
    stim[9] = 20'ha520a;
    stim[10] = 20'hca8f6;
    stim[11] = 20'hff160;
    stim[12] = 20'he03c4;
    stim[13] = 20'hd7fb4;
    stim[14] = 20'h4ca7a;
    stim[15] = 20'hce068;
    stim[16] = 20'hfa3e2;
    stim[17] = 20'h3c768;
    stim[18] = 20'h62c50;
    stim[19] = 20'hf877c;
    stim[20] = 20'h91f72;
    stim[21] = 20'hb5668;
    stim[22] = 20'h013bc;
    stim[23] = 20'ha474a;
    stim[24] = 20'hdb01c;
    stim[25] = 20'h5c4fd;
    stim[26] = 20'h2fb96;
    stim[27] = 20'hded32;
    stim[28] = 20'hf28b4;
    stim[29] = 20'h13f28;
    stim[30] = 20'hbf1dc;
    stim[31] = 20'hc5602;
    stim[32] = 20'h76b0a;
    stim[33] = 20'h69a7a;
    stim[34] = 20'h5cafc;
    stim[35] = 20'ha6574;
    stim[36] = 20'h814a2;
    stim[37] = 20'hfe62a;
    stim[38] = 20'hc30d0;
    stim[39] = 20'ha0e0e;
    stim[40] = 20'h0827a;
    stim[41] = 20'h3e2ea;
    stim[42] = 20'h8a86c;
    stim[43] = 20'h90740;
    stim[44] = 20'h43a24;
    stim[45] = 20'h41ffc;
    stim[46] = 20'hb7f8e;
    stim[47] = 20'h34330;
    stim[48] = 20'h7d2bc;
    stim[49] = 20'hc33c8;
    stim[50] = 20'hf1906;
    stim[51] = 20'h0b31c;
    stim[52] = 20'hd4744;
    stim[53] = 20'h0601a;
    stim[54] = 20'h546ce;
    stim[55] = 20'h4d1c2;
    stim[56] = 20'h8997e;
    stim[57] = 20'h05a22;
    stim[58] = 20'haba7e;
    stim[59] = 20'h8f08a;
    stim[60] = 20'hd2248;
    stim[61] = 20'hbfcda;
    stim[62] = 20'hb7a32;
    stim[63] = 20'h5a56a;
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
      expv[0] = 16'hffff;
      expv[1] = 16'hffff;
      expv[2] = 16'hffff;
      expv[3] = 16'hffff;
      expv[4] = 16'hffff;
      expv[5] = 16'hffff;
      expv[6] = 16'hffff;
      expv[7] = 16'hfba6;
      expv[8] = 16'hffff;
      expv[9] = 16'hffff;
      expv[10] = 16'h613a;
      expv[11] = 16'hffff;
      expv[12] = 16'hffff;
      expv[13] = 16'hffff;
      expv[14] = 16'hffff;
      expv[15] = 16'h356a;
      expv[16] = 16'h356a;
      expv[17] = 16'hdff5;
      expv[18] = 16'hdff5;
      expv[19] = 16'hdff5;
      expv[20] = 16'hffff;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'hffff;
      expv[24] = 16'hc9fc;
      expv[25] = 16'hffff;
      expv[26] = 16'hffff;
      expv[27] = 16'hffff;
      expv[28] = 16'h0000;
      expv[29] = 16'hffff;
      expv[30] = 16'hffff;
      expv[31] = 16'hffff;
      expv[32] = 16'h0000;
      expv[33] = 16'h684e;
      expv[34] = 16'h76b6;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'h0000;
      expv[38] = 16'hc4c1;
      expv[39] = 16'hc4c1;
      expv[40] = 16'hffff;
      expv[41] = 16'h28a8;
      expv[42] = 16'h0da4;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'hffff;
      expv[50] = 16'hffff;
      expv[51] = 16'hffff;
      expv[52] = 16'hffff;
      expv[53] = 16'hffff;
      expv[54] = 16'h868b;
      expv[55] = 16'hffff;
      expv[56] = 16'h0000;
      expv[57] = 16'hffff;
      expv[58] = 16'h0000;
      expv[59] = 16'hffff;
      expv[60] = 16'h0646;
      expv[61] = 16'h0646;
      expv[62] = 16'hac50;
      expv[63] = 16'h2b13;
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
