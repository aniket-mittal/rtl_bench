// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125517 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .A(in_vec[34:19]),
    .B(in_vec[18:3]),
    .C(in_vec[2:2]),
    .load(in_vec[1:1]),
    .shift_left(in_vec[0:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb7d9149a8;
    stim[1] = 36'ha810833dd;
    stim[2] = 36'h0ce387cc2;
    stim[3] = 36'h30af050a6;
    stim[4] = 36'h5218b0312;
    stim[5] = 36'h180cb4ae8;
    stim[6] = 36'h746c7a1cd;
    stim[7] = 36'h265bfe551;
    stim[8] = 36'h2e5b50103;
    stim[9] = 36'h2a64439e0;
    stim[10] = 36'h4d94efbde;
    stim[11] = 36'h5310c3aef;
    stim[12] = 36'h3b5900496;
    stim[13] = 36'h7ea84759b;
    stim[14] = 36'h3a1032548;
    stim[15] = 36'h0b07baa4d;
    stim[16] = 36'h21b7a4c1b;
    stim[17] = 36'h107c19ba4;
    stim[18] = 36'h59cb8ebe7;
    stim[19] = 36'h12003a94b;
    stim[20] = 36'h2e3667838;
    stim[21] = 36'h67fbe8c6e;
    stim[22] = 36'h05a7b3a7c;
    stim[23] = 36'h5270d4d69;
    stim[24] = 36'h7d2b90b4b;
    stim[25] = 36'h36d8aa5cf;
    stim[26] = 36'h1b02ea940;
    stim[27] = 36'h7bb9035e9;
    stim[28] = 36'h57ba154ea;
    stim[29] = 36'h595250e8a;
    stim[30] = 36'h88c3b841d;
    stim[31] = 36'hba0031f58;
    stim[32] = 36'h50b9e0728;
    stim[33] = 36'h028b1a3bc;
    stim[34] = 36'h2501a0e45;
    stim[35] = 36'h42b17b424;
    stim[36] = 36'h4ecf3d214;
    stim[37] = 36'h7ae8232de;
    stim[38] = 36'h4d8596b45;
    stim[39] = 36'h77e46c58f;
    stim[40] = 36'h028a2efd3;
    stim[41] = 36'h31133960f;
    stim[42] = 36'h0956a01b9;
    stim[43] = 36'h1a6eb5246;
    stim[44] = 36'h104f8865e;
    stim[45] = 36'h518117288;
    stim[46] = 36'h6682f6fa3;
    stim[47] = 36'h452db2a2c;
    stim[48] = 36'h438434801;
    stim[49] = 36'h025fa2e50;
    stim[50] = 36'h7d9e9e063;
    stim[51] = 36'h13079da86;
    stim[52] = 36'h1dd0b9aff;
    stim[53] = 36'h4adc20e9e;
    stim[54] = 36'h041c1c92b;
    stim[55] = 36'h3bfefd5ed;
    stim[56] = 36'h95a6ad514;
    stim[57] = 36'h4e7af6011;
    stim[58] = 36'h7d5597bf1;
    stim[59] = 36'h762ec269a;
    stim[60] = 36'h3448e7e7e;
    stim[61] = 36'h126c9575d;
    stim[62] = 36'h5d5a22e00;
    stim[63] = 36'h6bbfd950f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'hfffff439;
      expv[8] = 32'h0001ed8d;
      expv[9] = 32'h00046e0d;
      expv[10] = 32'h00046e0d;
      expv[11] = 32'h00046e0d;
      expv[12] = 32'h00003052;
      expv[13] = 32'h00003052;
      expv[14] = 32'h00014db8;
      expv[15] = 32'h00014db8;
      expv[16] = 32'h00014db8;
      expv[17] = 32'h00014db8;
      expv[18] = 32'h00014db8;
      expv[19] = 32'h000307fc;
      expv[20] = 32'h00063c1b;
      expv[21] = 32'h00063c1b;
      expv[22] = 32'h00063c1b;
      expv[23] = 32'h00063c1b;
      expv[24] = 32'h000adfd6;
      expv[25] = 32'h000cb394;
      expv[26] = 32'h000f04a3;
      expv[27] = 32'h000f04a3;
      expv[28] = 32'h000f0b60;
      expv[29] = 32'h000f0b60;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h0002efd0;
      expv[42] = 32'h0004bad4;
      expv[43] = 32'h00063c1e;
      expv[44] = 32'h00063c1e;
      expv[45] = 32'h00063c1e;
      expv[46] = 32'h00063c1e;
      expv[47] = 32'h00142d6a;
      expv[48] = 32'h00142d6a;
      expv[49] = 32'h00163a6a;
      expv[50] = 32'h00163a6a;
      expv[51] = 32'h001892e2;
      expv[52] = 32'h001892e2;
      expv[53] = 32'h001f5573;
      expv[54] = 32'h001f5573;
      expv[55] = 32'h00211e9b;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00002aeb;
      expv[63] = 32'h00002aeb;
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
