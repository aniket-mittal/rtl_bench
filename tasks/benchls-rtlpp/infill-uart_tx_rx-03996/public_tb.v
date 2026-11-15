// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03996 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .rx(in_vec[26:26]),
    .transmit(in_vec[25:25]),
    .tx_byte(in_vec[24:17]),
    .baud(in_vec[16:1]),
    .recv_ack(in_vec[0:0]),
    .tx(out_vec[12:12]),
    .received(out_vec[11:11]),
    .rx_byte(out_vec[10:3]),
    .is_receiving(out_vec[2:2]),
    .is_transmitting(out_vec[1:1]),
    .recv_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'he47aff9;
    stim[1] = 28'h83c0826;
    stim[2] = 28'h3beb410;
    stim[3] = 28'h61f97d9;
    stim[4] = 28'h6587578;
    stim[5] = 28'h155ec05;
    stim[6] = 28'h5872894;
    stim[7] = 28'h68b2e76;
    stim[8] = 28'h2b88b59;
    stim[9] = 28'h6b41326;
    stim[10] = 28'h26b804d;
    stim[11] = 28'h0de3184;
    stim[12] = 28'h0007cb0;
    stim[13] = 28'h089026c;
    stim[14] = 28'h3c4bfe2;
    stim[15] = 28'h34ec68f;
    stim[16] = 28'h3c6352a;
    stim[17] = 28'h184042d;
    stim[18] = 28'h05d6367;
    stim[19] = 28'h4e54550;
    stim[20] = 28'h5ca5847;
    stim[21] = 28'h2f5936b;
    stim[22] = 28'h37a6ae0;
    stim[23] = 28'h7798612;
    stim[24] = 28'h49d56fe;
    stim[25] = 28'h50c2f50;
    stim[26] = 28'h41e4d77;
    stim[27] = 28'h1c35408;
    stim[28] = 28'h78314f0;
    stim[29] = 28'h2b5f9f3;
    stim[30] = 28'h37eeedf;
    stim[31] = 28'h3225e96;
    stim[32] = 28'h720af6d;
    stim[33] = 28'h6b50386;
    stim[34] = 28'h79415cb;
    stim[35] = 28'h3b871d0;
    stim[36] = 28'h4499f18;
    stim[37] = 28'h0b09ba2;
    stim[38] = 28'h3bfa203;
    stim[39] = 28'h361ba69;
    stim[40] = 28'h697fa83;
    stim[41] = 28'h5752b19;
    stim[42] = 28'h3347602;
    stim[43] = 28'h2809efc;
    stim[44] = 28'h35970b5;
    stim[45] = 28'h4f627f9;
    stim[46] = 28'h6d671eb;
    stim[47] = 28'h0ea2b91;
    stim[48] = 28'h536bf70;
    stim[49] = 28'h606f5d6;
    stim[50] = 28'h734f5a0;
    stim[51] = 28'h05e8c98;
    stim[52] = 28'h7d9a1a0;
    stim[53] = 28'h71ad174;
    stim[54] = 28'h0fd504f;
    stim[55] = 28'h6690069;
    stim[56] = 28'h58d691c;
    stim[57] = 28'h14cfd90;
    stim[58] = 28'h6b0967d;
    stim[59] = 28'h726e0e5;
    stim[60] = 28'h79c3a31;
    stim[61] = 28'h1a74bac;
    stim[62] = 28'h4dd26e2;
    stim[63] = 28'h77a396c;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h1002;
      expv[2] = 13'h1002;
      expv[3] = 13'h1006;
      expv[4] = 13'h1006;
      expv[5] = 13'h1006;
      expv[6] = 13'h1006;
      expv[7] = 13'h1006;
      expv[8] = 13'h1006;
      expv[9] = 13'h1006;
      expv[10] = 13'h1006;
      expv[11] = 13'h1006;
      expv[12] = 13'h1006;
      expv[13] = 13'h1006;
      expv[14] = 13'h1006;
      expv[15] = 13'h1006;
      expv[16] = 13'h1006;
      expv[17] = 13'h1006;
      expv[18] = 13'h1006;
      expv[19] = 13'h1006;
      expv[20] = 13'h1006;
      expv[21] = 13'h1006;
      expv[22] = 13'h1006;
      expv[23] = 13'h1006;
      expv[24] = 13'h1006;
      expv[25] = 13'h1006;
      expv[26] = 13'h1006;
      expv[27] = 13'h1006;
      expv[28] = 13'h1006;
      expv[29] = 13'h1006;
      expv[30] = 13'h1006;
      expv[31] = 13'h1006;
      expv[32] = 13'h1006;
      expv[33] = 13'h1006;
      expv[34] = 13'h1006;
      expv[35] = 13'h1006;
      expv[36] = 13'h1006;
      expv[37] = 13'h1006;
      expv[38] = 13'h1006;
      expv[39] = 13'h1006;
      expv[40] = 13'h1006;
      expv[41] = 13'h1006;
      expv[42] = 13'h1006;
      expv[43] = 13'h1006;
      expv[44] = 13'h1006;
      expv[45] = 13'h1006;
      expv[46] = 13'h1006;
      expv[47] = 13'h1006;
      expv[48] = 13'h1006;
      expv[49] = 13'h1006;
      expv[50] = 13'h1006;
      expv[51] = 13'h1006;
      expv[52] = 13'h1006;
      expv[53] = 13'h1006;
      expv[54] = 13'h1006;
      expv[55] = 13'h1006;
      expv[56] = 13'h1006;
      expv[57] = 13'h1006;
      expv[58] = 13'h1006;
      expv[59] = 13'h1006;
      expv[60] = 13'h1006;
      expv[61] = 13'h1006;
      expv[62] = 13'h1006;
      expv[63] = 13'h1006;
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
