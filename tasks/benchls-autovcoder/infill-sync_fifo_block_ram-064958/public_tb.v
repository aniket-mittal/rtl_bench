// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_064958 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h228293cd22;
    stim[1] = 38'h3799211c2a;
    stim[2] = 38'h0579a46e77;
    stim[3] = 38'h031665ead9;
    stim[4] = 38'h0a475f29ef;
    stim[5] = 38'h17fef42ece;
    stim[6] = 38'h0e378ad759;
    stim[7] = 38'h17c0cc39cc;
    stim[8] = 38'h3362c2abe9;
    stim[9] = 38'h0c909f3044;
    stim[10] = 38'h12734313ce;
    stim[11] = 38'h166561527b;
    stim[12] = 38'h19c7435233;
    stim[13] = 38'h06ae628f65;
    stim[14] = 38'h10296db3d2;
    stim[15] = 38'h0dd8331fde;
    stim[16] = 38'h1b58498614;
    stim[17] = 38'h062f60a99e;
    stim[18] = 38'h13d0231bc3;
    stim[19] = 38'h08c1a3e2f8;
    stim[20] = 38'h15bb105335;
    stim[21] = 38'h0bf2a02069;
    stim[22] = 38'h13e34487ba;
    stim[23] = 38'h0b3e68fe5f;
    stim[24] = 38'h1d8445015f;
    stim[25] = 38'h1b196725a0;
    stim[26] = 38'h07a4ec751d;
    stim[27] = 38'h23ce0a5ea9;
    stim[28] = 38'h1225b9c05d;
    stim[29] = 38'h13bfbe4d60;
    stim[30] = 38'h08f2e15e0d;
    stim[31] = 38'h0f2e098f27;
    stim[32] = 38'h11fa6d8fa7;
    stim[33] = 38'h0e2b1daa9a;
    stim[34] = 38'h182bbbd5c0;
    stim[35] = 38'h0a2e77e060;
    stim[36] = 38'h0496592b48;
    stim[37] = 38'h1b99d7fe05;
    stim[38] = 38'h1cef7e3ab0;
    stim[39] = 38'h0e236a006b;
    stim[40] = 38'h0f9ea64f58;
    stim[41] = 38'h0368a15589;
    stim[42] = 38'h1cf5686804;
    stim[43] = 38'h00f7bd57be;
    stim[44] = 38'h15fc8f870a;
    stim[45] = 38'h0b49ef8b26;
    stim[46] = 38'h011b517b50;
    stim[47] = 38'h04c2913aa3;
    stim[48] = 38'h0c979e94c7;
    stim[49] = 38'h0a192d27a0;
    stim[50] = 38'h0d5c4e30c5;
    stim[51] = 38'h01c20e4f21;
    stim[52] = 38'h142b4464a7;
    stim[53] = 38'h0735c18a2f;
    stim[54] = 38'h1dca176708;
    stim[55] = 38'h03d5d8ed35;
    stim[56] = 38'h17cf8d63a3;
    stim[57] = 38'h06a48ac5cd;
    stim[58] = 38'h1107b04865;
    stim[59] = 38'h1d4dac12d7;
    stim[60] = 38'h1a66fca85f;
    stim[61] = 38'h03259b3c9d;
    stim[62] = 38'h16cc86c27a;
    stim[63] = 38'h0303ec71d2;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h200000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h200000000;
      expv[36] = 34'h200000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h33d5a1a01;
      expv[46] = 34'h33d5a1a01;
      expv[47] = 34'h33d5a1a01;
      expv[48] = 34'h33d5a1a01;
      expv[49] = 34'h33d5a1a01;
      expv[50] = 34'h33d5a1a01;
      expv[51] = 34'h33d5a1a01;
      expv[52] = 34'h33d5a1a01;
      expv[53] = 34'h33d5a1a01;
      expv[54] = 34'h33d5a1a01;
      expv[55] = 34'h33d5a1a01;
      expv[56] = 34'h33d5a1a01;
      expv[57] = 34'h37285d9c2;
      expv[58] = 34'h37285d9c2;
      expv[59] = 34'h37285d9c2;
      expv[60] = 34'h27285d9c2;
      expv[61] = 34'h3536b04b5;
      expv[62] = 34'h3536b04b5;
      expv[63] = 34'h3536b04b5;
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
