// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014050 dut (
    .A_Data(in_vec[33:18]),
    .B_Data(in_vec[17:2]),
    .opcode(in_vec[1:0]),
    .OF(out_vec[16:16]),
    .ALU_result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h21a0f207b;
    stim[1] = 34'h0baa0958b;
    stim[2] = 34'h239137f40;
    stim[3] = 34'h06fded192;
    stim[4] = 34'h273a4f779;
    stim[5] = 34'h2476bc020;
    stim[6] = 34'h1fda33757;
    stim[7] = 34'h25b88754d;
    stim[8] = 34'h0d9c28b07;
    stim[9] = 34'h1eb05edec;
    stim[10] = 34'h26b7e3ff2;
    stim[11] = 34'h1bdf08bb5;
    stim[12] = 34'h0f99b6128;
    stim[13] = 34'h1779f3fbc;
    stim[14] = 34'h08adef7a4;
    stim[15] = 34'h271d2dae4;
    stim[16] = 34'h3e78c2f3a;
    stim[17] = 34'h14c557760;
    stim[18] = 34'h3b407da70;
    stim[19] = 34'h1b726a756;
    stim[20] = 34'h2ceb44654;
    stim[21] = 34'h280966efb;
    stim[22] = 34'h1d60dbd8a;
    stim[23] = 34'h2aadf24f8;
    stim[24] = 34'h2d84b30a1;
    stim[25] = 34'h2c8276771;
    stim[26] = 34'h0ae0d0b37;
    stim[27] = 34'h2da1103cf;
    stim[28] = 34'h34136bc96;
    stim[29] = 34'h1921f366f;
    stim[30] = 34'h1f08bbce5;
    stim[31] = 34'h236891e31;
    stim[32] = 34'h0a2e3317c;
    stim[33] = 34'h136675abb;
    stim[34] = 34'h335231c0e;
    stim[35] = 34'h1c3b6ee59;
    stim[36] = 34'h00033c03e;
    stim[37] = 34'h0fafc35b5;
    stim[38] = 34'h3e66948d1;
    stim[39] = 34'h2cb867066;
    stim[40] = 34'h18b0a6c48;
    stim[41] = 34'h35bf2f14d;
    stim[42] = 34'h2dfa6cc61;
    stim[43] = 34'h12569e58c;
    stim[44] = 34'h36d728d68;
    stim[45] = 34'h287a48f40;
    stim[46] = 34'h02d91a385;
    stim[47] = 34'h3849dfd6f;
    stim[48] = 34'h199e0546f;
    stim[49] = 34'h109712da5;
    stim[50] = 34'h3518a2d40;
    stim[51] = 34'h2f8b418bd;
    stim[52] = 34'h32865d06e;
    stim[53] = 34'h2d364c3c5;
    stim[54] = 34'h075b9e3da;
    stim[55] = 34'h24daaed62;
    stim[56] = 34'h1dd4c28c1;
    stim[57] = 34'h2b1af3616;
    stim[58] = 34'h30347a077;
    stim[59] = 34'h004383b82;
    stim[60] = 34'h0b5b28966;
    stim[61] = 34'h28747b0a7;
    stim[62] = 34'h3683d6df4;
    stim[63] = 34'h3004b91c9;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 17'h00000;
      expv[1] = 17'h00001;
      expv[2] = 17'h10000;
      expv[3] = 17'h10000;
      expv[4] = 17'h05f0b;
      expv[5] = 17'h10000;
      expv[6] = 17'h00000;
      expv[7] = 17'h0798f;
      expv[8] = 17'h00000;
      expv[9] = 17'h0f63c;
      expv[10] = 17'h10000;
      expv[11] = 17'h04c8f;
      expv[12] = 17'h10000;
      expv[13] = 17'h10000;
      expv[14] = 17'h0e0a0;
      expv[15] = 17'h10000;
      expv[16] = 17'h10000;
      expv[17] = 17'h0b0ed;
      expv[18] = 17'h10000;
      expv[19] = 17'h10000;
      expv[20] = 17'h0c542;
      expv[21] = 17'h00001;
      expv[22] = 17'h10000;
      expv[23] = 17'h10000;
      expv[24] = 17'h10000;
      expv[25] = 17'h10000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00002;
      expv[28] = 17'h10000;
      expv[29] = 17'h00000;
      expv[30] = 17'h10000;
      expv[31] = 17'h04616;
      expv[32] = 17'h0f517;
      expv[33] = 17'h00000;
      expv[34] = 17'h10000;
      expv[35] = 17'h10000;
      expv[36] = 17'h10000;
      expv[37] = 17'h03152;
      expv[38] = 17'h0a766;
      expv[39] = 17'h10000;
      expv[40] = 17'h0fdd4;
      expv[41] = 17'h01aa9;
      expv[42] = 17'h004d1;
      expv[43] = 17'h0c2bd;
      expv[44] = 17'h10000;
      expv[45] = 17'h0c5b9;
      expv[46] = 17'h10000;
      expv[47] = 17'h00001;
      expv[48] = 17'h00004;
      expv[49] = 17'h10000;
      expv[50] = 17'h10000;
      expv[51] = 17'h0b7fe;
      expv[52] = 17'h10000;
      expv[53] = 17'h083e8;
      expv[54] = 17'h10000;
      expv[55] = 17'h10000;
      expv[56] = 17'h06d23;
      expv[57] = 17'h10000;
      expv[58] = 17'h00000;
      expv[59] = 17'h10000;
      expv[60] = 17'h10000;
      expv[61] = 17'h00000;
      expv[62] = 17'h10000;
      expv[63] = 17'h10000;
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
