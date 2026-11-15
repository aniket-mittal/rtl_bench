// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03661 dut (
    .clk(clk),
    .pc_we(in_vec[32:32]),
    .pc_next(in_vec[31:0]),
    .pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0b09e6994;
    stim[1] = 33'h078941872;
    stim[2] = 33'h0ab639c84;
    stim[3] = 33'h026508601;
    stim[4] = 33'h101b70ced;
    stim[5] = 33'h12891fa12;
    stim[6] = 33'h1d5a3c75f;
    stim[7] = 33'h16283e7d1;
    stim[8] = 33'h1e8084ff4;
    stim[9] = 33'h10f5c190e;
    stim[10] = 33'h03dcbb373;
    stim[11] = 33'h1d1a2b7d2;
    stim[12] = 33'h14ee058d2;
    stim[13] = 33'h05feaa833;
    stim[14] = 33'h12f43b1d2;
    stim[15] = 33'h1a7d60a4e;
    stim[16] = 33'h0bcfe5ab8;
    stim[17] = 33'h02a25c63c;
    stim[18] = 33'h15c99ab1d;
    stim[19] = 33'h010f4994b;
    stim[20] = 33'h16fd862c4;
    stim[21] = 33'h1f11a2e5f;
    stim[22] = 33'h0d1e4dc58;
    stim[23] = 33'h019b1d157;
    stim[24] = 33'h1e75f5332;
    stim[25] = 33'h126c28dfd;
    stim[26] = 33'h0ec12b2d2;
    stim[27] = 33'h054a4400e;
    stim[28] = 33'h1c2181080;
    stim[29] = 33'h0bfc60cff;
    stim[30] = 33'h0d2eb4a1a;
    stim[31] = 33'h1c04e9803;
    stim[32] = 33'h125360b68;
    stim[33] = 33'h019cbf84d;
    stim[34] = 33'h02493ad74;
    stim[35] = 33'h14c6d8778;
    stim[36] = 33'h0dee3950e;
    stim[37] = 33'h155fdfe4e;
    stim[38] = 33'h18fbe979b;
    stim[39] = 33'h0cc8296aa;
    stim[40] = 33'h04c8fd4f1;
    stim[41] = 33'h06d2a10d8;
    stim[42] = 33'h01901207a;
    stim[43] = 33'h069de4f07;
    stim[44] = 33'h0889f9a01;
    stim[45] = 33'h15aa113f7;
    stim[46] = 33'h0477c80cb;
    stim[47] = 33'h1a5d6ffdd;
    stim[48] = 33'h0b058496c;
    stim[49] = 33'h1dd2e1624;
    stim[50] = 33'h181e69745;
    stim[51] = 33'h029272afa;
    stim[52] = 33'h1ce7d7c13;
    stim[53] = 33'h112bfdbf6;
    stim[54] = 33'h10b74f4bf;
    stim[55] = 33'h116428503;
    stim[56] = 33'h0f17788a0;
    stim[57] = 33'h1b857631c;
    stim[58] = 33'h0254bae8b;
    stim[59] = 33'h0d64edd61;
    stim[60] = 33'h0c138a46d;
    stim[61] = 33'h17c29a708;
    stim[62] = 33'h12c89928c;
    stim[63] = 33'h0518418ea;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'h01b70ced;
      expv[6] = 32'h2891fa12;
      expv[7] = 32'hd5a3c75f;
      expv[8] = 32'h6283e7d1;
      expv[9] = 32'he8084ff4;
      expv[10] = 32'h0f5c190e;
      expv[11] = 32'h0f5c190e;
      expv[12] = 32'hd1a2b7d2;
      expv[13] = 32'h4ee058d2;
      expv[14] = 32'h4ee058d2;
      expv[15] = 32'h2f43b1d2;
      expv[16] = 32'ha7d60a4e;
      expv[17] = 32'ha7d60a4e;
      expv[18] = 32'ha7d60a4e;
      expv[19] = 32'h5c99ab1d;
      expv[20] = 32'h5c99ab1d;
      expv[21] = 32'h6fd862c4;
      expv[22] = 32'hf11a2e5f;
      expv[23] = 32'hf11a2e5f;
      expv[24] = 32'hf11a2e5f;
      expv[25] = 32'he75f5332;
      expv[26] = 32'h26c28dfd;
      expv[27] = 32'h26c28dfd;
      expv[28] = 32'h26c28dfd;
      expv[29] = 32'hc2181080;
      expv[30] = 32'hc2181080;
      expv[31] = 32'hc2181080;
      expv[32] = 32'hc04e9803;
      expv[33] = 32'h25360b68;
      expv[34] = 32'h25360b68;
      expv[35] = 32'h25360b68;
      expv[36] = 32'h4c6d8778;
      expv[37] = 32'h4c6d8778;
      expv[38] = 32'h55fdfe4e;
      expv[39] = 32'h8fbe979b;
      expv[40] = 32'h8fbe979b;
      expv[41] = 32'h8fbe979b;
      expv[42] = 32'h8fbe979b;
      expv[43] = 32'h8fbe979b;
      expv[44] = 32'h8fbe979b;
      expv[45] = 32'h8fbe979b;
      expv[46] = 32'h5aa113f7;
      expv[47] = 32'h5aa113f7;
      expv[48] = 32'ha5d6ffdd;
      expv[49] = 32'ha5d6ffdd;
      expv[50] = 32'hdd2e1624;
      expv[51] = 32'h81e69745;
      expv[52] = 32'h81e69745;
      expv[53] = 32'hce7d7c13;
      expv[54] = 32'h12bfdbf6;
      expv[55] = 32'h0b74f4bf;
      expv[56] = 32'h16428503;
      expv[57] = 32'h16428503;
      expv[58] = 32'hb857631c;
      expv[59] = 32'hb857631c;
      expv[60] = 32'hb857631c;
      expv[61] = 32'hb857631c;
      expv[62] = 32'h7c29a708;
      expv[63] = 32'h2c89928c;
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
