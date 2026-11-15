// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212282 dut (
    .clk(clk),
    .rst(in_vec[37:37]),
    .pass_data(in_vec[36:5]),
    .aes_en(in_vec[4:4]),
    .div_bits(in_vec[3:0]),
    .out_data(out_vec[8:1]),
    .out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h338dfd6ef4;
    stim[1] = 38'h307ffc1b20;
    stim[2] = 38'h1b54a10b0a;
    stim[3] = 38'h0a7ea97ef5;
    stim[4] = 38'h04f6c2b923;
    stim[5] = 38'h16b76849a4;
    stim[6] = 38'h000ad53326;
    stim[7] = 38'h2943193db3;
    stim[8] = 38'h2b9a64499b;
    stim[9] = 38'h02b6a738cd;
    stim[10] = 38'h0ee043fe0e;
    stim[11] = 38'h0e883230af;
    stim[12] = 38'h1ed0ca2954;
    stim[13] = 38'h0be9823f58;
    stim[14] = 38'h06f6d4a926;
    stim[15] = 38'h06c5ae4f49;
    stim[16] = 38'h17778669ee;
    stim[17] = 38'h01a7cc71d1;
    stim[18] = 38'h02256d532f;
    stim[19] = 38'h15b16f1f27;
    stim[20] = 38'h0b15bc60cf;
    stim[21] = 38'h1f6db5bc04;
    stim[22] = 38'h075daf412d;
    stim[23] = 38'h1cc15d3f66;
    stim[24] = 38'h086f9e02e3;
    stim[25] = 38'h1821ecdc6c;
    stim[26] = 38'h0a0f7859a0;
    stim[27] = 38'h1398a36dd6;
    stim[28] = 38'h13be2eb4bf;
    stim[29] = 38'h088b39f518;
    stim[30] = 38'h1a7f1f8ed1;
    stim[31] = 38'h03df358442;
    stim[32] = 38'h1b3e9ef9df;
    stim[33] = 38'h1e8e7aead6;
    stim[34] = 38'h075752aa20;
    stim[35] = 38'h149748c510;
    stim[36] = 38'h14cf63a6e6;
    stim[37] = 38'h0631b9044c;
    stim[38] = 38'h0e6ca12f0e;
    stim[39] = 38'h191863a302;
    stim[40] = 38'h12ab6e4481;
    stim[41] = 38'h085841e6c3;
    stim[42] = 38'h07ef1c5a3a;
    stim[43] = 38'h070e7b2d40;
    stim[44] = 38'h07030b5426;
    stim[45] = 38'h01ab89c405;
    stim[46] = 38'h0bf87776aa;
    stim[47] = 38'h1e67b5a82f;
    stim[48] = 38'h1d85147376;
    stim[49] = 38'h1c63b9fdaa;
    stim[50] = 38'h166415951c;
    stim[51] = 38'h1becfa35a5;
    stim[52] = 38'h1555b9afa5;
    stim[53] = 38'h0d6e44f9f0;
    stim[54] = 38'h36b516d951;
    stim[55] = 38'h1b3b0d9f0b;
    stim[56] = 38'h079d193aa9;
    stim[57] = 38'h02507e5b1c;
    stim[58] = 38'h1ce625aad1;
    stim[59] = 38'h0ab1fb52a2;
    stim[60] = 38'h16894ab31f;
    stim[61] = 38'h1dce31170e;
    stim[62] = 38'h1583a719f6;
    stim[63] = 38'h0366ca4033;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h001;
      expv[11] = 9'h001;
      expv[12] = 9'h001;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h095;
      expv[30] = 9'h14b;
      expv[31] = 9'h14a;
      expv[32] = 9'h14a;
      expv[33] = 9'h14a;
      expv[34] = 9'h14a;
      expv[35] = 9'h14a;
      expv[36] = 9'h14a;
      expv[37] = 9'h14a;
      expv[38] = 9'h14a;
      expv[39] = 9'h14a;
      expv[40] = 9'h14a;
      expv[41] = 9'h14a;
      expv[42] = 9'h14a;
      expv[43] = 9'h14a;
      expv[44] = 9'h14a;
      expv[45] = 9'h14a;
      expv[46] = 9'h14a;
      expv[47] = 9'h0ad;
      expv[48] = 9'h0ad;
      expv[49] = 9'h0ad;
      expv[50] = 9'h0ad;
      expv[51] = 9'h0ad;
      expv[52] = 9'h151;
      expv[53] = 9'h151;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h001;
      expv[57] = 9'h001;
      expv[58] = 9'h001;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
