// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05642 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0c5dd3;
    stim[1] = 22'h2ddcb0;
    stim[2] = 22'h3362a0;
    stim[3] = 22'h16191a;
    stim[4] = 22'h06cdf3;
    stim[5] = 22'h3f15ee;
    stim[6] = 22'h0ea7e5;
    stim[7] = 22'h0b2fa5;
    stim[8] = 22'h1e77c5;
    stim[9] = 22'h36cc2a;
    stim[10] = 22'h221747;
    stim[11] = 22'h175e4f;
    stim[12] = 22'h07ae85;
    stim[13] = 22'h3a0327;
    stim[14] = 22'h23df34;
    stim[15] = 22'h23acb7;
    stim[16] = 22'h1b9bde;
    stim[17] = 22'h0322e1;
    stim[18] = 22'h23959f;
    stim[19] = 22'h0f3168;
    stim[20] = 22'h1ef7e4;
    stim[21] = 22'h1f6a78;
    stim[22] = 22'h1e8f78;
    stim[23] = 22'h1ad94f;
    stim[24] = 22'h3e39c6;
    stim[25] = 22'h138a62;
    stim[26] = 22'h03c4f4;
    stim[27] = 22'h0f63eb;
    stim[28] = 22'h23c0b0;
    stim[29] = 22'h2fcc4d;
    stim[30] = 22'h2fa054;
    stim[31] = 22'h1fa24c;
    stim[32] = 22'h027b5a;
    stim[33] = 22'h17eb39;
    stim[34] = 22'h0a3701;
    stim[35] = 22'h36f2a5;
    stim[36] = 22'h2bf536;
    stim[37] = 22'h1bca98;
    stim[38] = 22'h122419;
    stim[39] = 22'h130e6c;
    stim[40] = 22'h270a0c;
    stim[41] = 22'h3fb04c;
    stim[42] = 22'h3a1fd8;
    stim[43] = 22'h077b6a;
    stim[44] = 22'h22e82b;
    stim[45] = 22'h1e1b64;
    stim[46] = 22'h268b20;
    stim[47] = 22'h0eba3c;
    stim[48] = 22'h1304aa;
    stim[49] = 22'h2a2090;
    stim[50] = 22'h06df9d;
    stim[51] = 22'h0fa49e;
    stim[52] = 22'h03addb;
    stim[53] = 22'h369f37;
    stim[54] = 22'h07a509;
    stim[55] = 22'h1e07fd;
    stim[56] = 22'h26507d;
    stim[57] = 22'h322b8a;
    stim[58] = 22'h2ea433;
    stim[59] = 22'h1e2e07;
    stim[60] = 22'h136e5c;
    stim[61] = 22'h2678d6;
    stim[62] = 22'h1291ee;
    stim[63] = 22'h2230c4;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0ea5f;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00005;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h0191a;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h077c5;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00005;
      expv[21] = 17'h077c5;
      expv[22] = 17'h0f7e4;
      expv[23] = 17'h0f7e4;
      expv[24] = 17'h08f78;
      expv[25] = 17'h00000;
      expv[26] = 17'h0191a;
      expv[27] = 17'h00000;
      expv[28] = 17'h00005;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h08f78;
      expv[33] = 17'h00000;
      expv[34] = 17'h0191a;
      expv[35] = 17'h00005;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h08f78;
      expv[39] = 17'h0191a;
      expv[40] = 17'h0191a;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h08f78;
      expv[47] = 17'h00000;
      expv[48] = 17'h00005;
      expv[49] = 17'h0191a;
      expv[50] = 17'h08f78;
      expv[51] = 17'h00002;
      expv[52] = 17'h0000c;
      expv[53] = 17'h00002;
      expv[54] = 17'h00000;
      expv[55] = 17'h00002;
      expv[56] = 17'h01b64;
      expv[57] = 17'h0191a;
      expv[58] = 17'h00000;
      expv[59] = 17'h01b64;
      expv[60] = 17'h007fd;
      expv[61] = 17'h0191a;
      expv[62] = 17'h0191a;
      expv[63] = 17'h0191a;
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
