// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_029389 dut (
    .csi_clk(clk),
    .rsi_reset_n(in_vec[38:38]),
    .avs_s0_write(in_vec[37:37]),
    .avs_s0_read(in_vec[36:36]),
    .avs_s0_address(in_vec[35:32]),
    .avs_s0_writedata(in_vec[31:0]),
    .avs_s0_readdata(out_vec[72:41]),
    .number1(out_vec[40:35]),
    .number2(out_vec[34:29]),
    .number3(out_vec[28:23]),
    .number4(out_vec[22:17]),
    .dot1(out_vec[16:16]),
    .dot2(out_vec[15:15]),
    .dot3(out_vec[14:14]),
    .dot4(out_vec[13:13]),
    .light1(out_vec[12:10]),
    .light2(out_vec[9:7]),
    .light3(out_vec[6:4]),
    .light4(out_vec[3:1]),
    .ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h2f4b54c354;
    stim[1] = 39'h3ae94fbd30;
    stim[2] = 39'h4e32562413;
    stim[3] = 39'h7047d5d0da;
    stim[4] = 39'h6f519b9701;
    stim[5] = 39'h751e6436dc;
    stim[6] = 39'h74d4fb9f44;
    stim[7] = 39'h5d3bf107b5;
    stim[8] = 39'h5606bc56c4;
    stim[9] = 39'h57fc163f9a;
    stim[10] = 39'h7eab8db48d;
    stim[11] = 39'h7d0c02a2c0;
    stim[12] = 39'h5fca5f83e6;
    stim[13] = 39'h55a6dac099;
    stim[14] = 39'h7c5cb5c82b;
    stim[15] = 39'h4d4b82ad02;
    stim[16] = 39'h5dfb631544;
    stim[17] = 39'h467ff935f6;
    stim[18] = 39'h4c44acad07;
    stim[19] = 39'h5a1530cb6b;
    stim[20] = 39'h694c009e38;
    stim[21] = 39'h6943ee49bd;
    stim[22] = 39'h6d6dcebf96;
    stim[23] = 39'h624c225c17;
    stim[24] = 39'h46d87aa911;
    stim[25] = 39'h471bfd0849;
    stim[26] = 39'h69373891c9;
    stim[27] = 39'h6ead59e8e7;
    stim[28] = 39'h5f5f52a589;
    stim[29] = 39'h440e34d710;
    stim[30] = 39'h4dc5f1645a;
    stim[31] = 39'h737ac3ed13;
    stim[32] = 39'h764493196d;
    stim[33] = 39'h5486e33a15;
    stim[34] = 39'h7059e03c24;
    stim[35] = 39'h57f40378c1;
    stim[36] = 39'h5ebf456632;
    stim[37] = 39'h7f6639e518;
    stim[38] = 39'h4a7bc76ed6;
    stim[39] = 39'h78c1614b17;
    stim[40] = 39'h70baf49275;
    stim[41] = 39'h524dfd4039;
    stim[42] = 39'h49220476ad;
    stim[43] = 39'h68afa4d48b;
    stim[44] = 39'h5078fcc3a5;
    stim[45] = 39'h79ec09e021;
    stim[46] = 39'h42325f5e71;
    stim[47] = 39'h40819a1e6a;
    stim[48] = 39'h5375747a12;
    stim[49] = 39'h493b9d8555;
    stim[50] = 39'h5901811b31;
    stim[51] = 39'h418a2b71ab;
    stim[52] = 39'h53c86cff75;
    stim[53] = 39'h50d2f6aad0;
    stim[54] = 39'h5bc17fe48f;
    stim[55] = 39'h47c8a5f2d9;
    stim[56] = 39'h62241daa38;
    stim[57] = 39'h72876fdda8;
    stim[58] = 39'h7e659a7c6e;
    stim[59] = 39'h4395331df6;
    stim[60] = 39'h474e0c4ff4;
    stim[61] = 39'h5822f4c309;
    stim[62] = 39'h5a1b13476d;
    stim[63] = 39'h40d4c1cece;
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
      expv[0] = 73'h00000000xxxxxxxxxxx;
      expv[1] = 73'h1fffffffxxxxxxxxxxx;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h0000000800000000000;
      expv[4] = 73'h0000000000000000000;
      expv[5] = 73'h0000000000000000000;
      expv[6] = 73'h0000000000000000000;
      expv[7] = 73'h0000000000000000000;
      expv[8] = 73'h0000000000000000000;
      expv[9] = 73'h0000000000000000000;
      expv[10] = 73'h0000000000000000000;
      expv[11] = 73'h0000000000000000000;
      expv[12] = 73'h1fffffffe0000000000;
      expv[13] = 73'h0000000000000000000;
      expv[14] = 73'h0000000000000000000;
      expv[15] = 73'h0000000000000000000;
      expv[16] = 73'h0000000000000000000;
      expv[17] = 73'h0000000000000000000;
      expv[18] = 73'h0000000000000000000;
      expv[19] = 73'h1fffffffe0000000000;
      expv[20] = 73'h0000000000000000000;
      expv[21] = 73'h0000000000000000000;
      expv[22] = 73'h0000000000000000000;
      expv[23] = 73'h0000000000000000000;
      expv[24] = 73'h0000000000000000000;
      expv[25] = 73'h0000000000000000000;
      expv[26] = 73'h0000000000000000000;
      expv[27] = 73'h0000000000000000000;
      expv[28] = 73'h1fffffffe0000000000;
      expv[29] = 73'h0000000000000000000;
      expv[30] = 73'h0000000000000000000;
      expv[31] = 73'h0000000000000000000;
      expv[32] = 73'h0000000000000000000;
      expv[33] = 73'h0000000000000000000;
      expv[34] = 73'h0000000800000000000;
      expv[35] = 73'h0000000000000000000;
      expv[36] = 73'h0000000000000000000;
      expv[37] = 73'h1fffffffe0000000000;
      expv[38] = 73'h0000000000000000000;
      expv[39] = 73'h0000000000000000000;
      expv[40] = 73'h0000000800000000000;
      expv[41] = 73'h0000000000000000000;
      expv[42] = 73'h0000000000000000000;
      expv[43] = 73'h0000000000000000000;
      expv[44] = 73'h0000000800000000000;
      expv[45] = 73'h0000000000000000000;
      expv[46] = 73'h0000000000000000000;
      expv[47] = 73'h0000000000000000000;
      expv[48] = 73'h0000000000000000000;
      expv[49] = 73'h0000000000000000000;
      expv[50] = 73'h0000000000000000000;
      expv[51] = 73'h0000000000000000000;
      expv[52] = 73'h0000000000000000000;
      expv[53] = 73'h0000000800000000000;
      expv[54] = 73'h0000000000000000000;
      expv[55] = 73'h0000000000000000000;
      expv[56] = 73'h0000000000000000000;
      expv[57] = 73'h0000000000000000000;
      expv[58] = 73'h0000000000000000000;
      expv[59] = 73'h0000000000000000000;
      expv[60] = 73'h0000000000000000000;
      expv[61] = 73'h0000000000000000000;
      expv[62] = 73'h1fffffffe0000000000;
      expv[63] = 73'h0000000000000000000;
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
