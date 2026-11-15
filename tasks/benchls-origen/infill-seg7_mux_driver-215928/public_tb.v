// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215928 dut (
    .clk(clk),
    .x(in_vec[16:1]),
    .clr(in_vec[0:0]),
    .a_to_g(out_vec[11:5]),
    .an(out_vec[4:1]),
    .dp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1bbf7;
    stim[1] = 17'h12c35;
    stim[2] = 17'h07912;
    stim[3] = 17'h0349a;
    stim[4] = 17'h1fe64;
    stim[5] = 17'h1ca6c;
    stim[6] = 17'h0d6ba;
    stim[7] = 17'h0a86e;
    stim[8] = 17'h1743c;
    stim[9] = 17'h055dc;
    stim[10] = 17'h17b78;
    stim[11] = 17'h020ac;
    stim[12] = 17'h0fa56;
    stim[13] = 17'h15010;
    stim[14] = 17'h07f9c;
    stim[15] = 17'h0e772;
    stim[16] = 17'h115bc;
    stim[17] = 17'h12c92;
    stim[18] = 17'h19f8c;
    stim[19] = 17'h1f968;
    stim[20] = 17'h16196;
    stim[21] = 17'h1a28a;
    stim[22] = 17'h16be8;
    stim[23] = 17'h066a0;
    stim[24] = 17'h18b0e;
    stim[25] = 17'h07cbe;
    stim[26] = 17'h06e92;
    stim[27] = 17'h0c308;
    stim[28] = 17'h10a8a;
    stim[29] = 17'h1dc4e;
    stim[30] = 17'h06b7c;
    stim[31] = 17'h17ac8;
    stim[32] = 17'h01680;
    stim[33] = 17'h11e38;
    stim[34] = 17'h05d52;
    stim[35] = 17'h13bec;
    stim[36] = 17'h147e8;
    stim[37] = 17'h1415a;
    stim[38] = 17'h0ac56;
    stim[39] = 17'h17354;
    stim[40] = 17'h0e068;
    stim[41] = 17'h032ba;
    stim[42] = 17'h09a5e;
    stim[43] = 17'h042ba;
    stim[44] = 17'h08178;
    stim[45] = 17'h025f2;
    stim[46] = 17'h1c736;
    stim[47] = 17'h1e38e;
    stim[48] = 17'h1c7d8;
    stim[49] = 17'h0aa84;
    stim[50] = 17'h1d5e8;
    stim[51] = 17'h0a90b;
    stim[52] = 17'h0672e;
    stim[53] = 17'h1b004;
    stim[54] = 17'h1a25c;
    stim[55] = 17'h121f2;
    stim[56] = 17'h06fd2;
    stim[57] = 17'h05716;
    stim[58] = 17'h09382;
    stim[59] = 17'h00954;
    stim[60] = 17'h0f99c;
    stim[61] = 17'h1cb08;
    stim[62] = 17'h0da46;
    stim[63] = 17'h1d212;
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
      expv[0] = 12'hfff;
      expv[1] = 12'hfff;
      expv[2] = 12'h21d;
      expv[3] = 12'h33b;
      expv[4] = 12'h1d7;
      expv[5] = 12'h0cf;
      expv[6] = 12'h43d;
      expv[7] = 12'h61b;
      expv[8] = 12'h117;
      expv[9] = 12'h48f;
      expv[10] = 12'h8dd;
      expv[11] = 12'h25b;
      expv[12] = 12'h437;
      expv[13] = 12'h10f;
      expv[14] = 12'h0dd;
      expv[15] = 12'h07b;
      expv[16] = 12'h117;
      expv[17] = 12'h20f;
      expv[18] = 12'h05d;
      expv[19] = 12'h07b;
      expv[20] = 12'h817;
      expv[21] = 12'h42f;
      expv[22] = 12'h33d;
      expv[23] = 12'h25b;
      expv[24] = 12'h257;
      expv[25] = 12'h60f;
      expv[26] = 12'h21d;
      expv[27] = 12'h01b;
      expv[28] = 12'h257;
      expv[29] = 12'h0cf;
      expv[30] = 12'h0dd;
      expv[31] = 12'h05b;
      expv[32] = 12'h077;
      expv[33] = 12'h00f;
      expv[34] = 12'h21d;
      expv[35] = 12'h1db;
      expv[36] = 12'h617;
      expv[37] = 12'h10f;
      expv[38] = 12'h07d;
      expv[39] = 12'h11b;
      expv[40] = 12'h817;
      expv[41] = 12'hf2f;
      expv[42] = 12'h1dd;
      expv[43] = 12'h25b;
      expv[44] = 12'h817;
      expv[45] = 12'hf2f;
      expv[46] = 12'h07d;
      expv[47] = 12'h8db;
      expv[48] = 12'h617;
      expv[49] = 12'h24f;
      expv[50] = 12'h33d;
      expv[51] = 12'hfff;
      expv[52] = 12'hf1d;
      expv[53] = 12'h81b;
      expv[54] = 12'hf37;
      expv[55] = 12'h20f;
      expv[56] = 12'h21d;
      expv[57] = 12'h01b;
      expv[58] = 12'h217;
      expv[59] = 12'h80f;
      expv[60] = 12'h0dd;
      expv[61] = 12'h01b;
      expv[62] = 12'h437;
      expv[63] = 12'h0cf;
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
