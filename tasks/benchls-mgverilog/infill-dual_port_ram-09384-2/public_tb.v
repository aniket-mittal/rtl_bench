// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09384 dut (
    .clk(clk),
    .addr0(in_vec[54:45]),
    .ce0(in_vec[44:44]),
    .d0(in_vec[43:12]),
    .we0(in_vec[11:11]),
    .addr1(in_vec[10:1]),
    .ce1(in_vec[0:0]),
    .q0(out_vec[63:32]),
    .q1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h3c60e36007f8cd;
    stim[1] = 55'h05b511707b6e40;
    stim[2] = 55'h3ab26d2bfb3611;
    stim[3] = 55'h6a02c5d34a72ec;
    stim[4] = 55'h4897bf7bf1491b;
    stim[5] = 55'h2ddcc54b82e56e;
    stim[6] = 55'h4a0b57576d057c;
    stim[7] = 55'h51c1061bd6aebc;
    stim[8] = 55'h648d4908bb79f8;
    stim[9] = 55'h2944ed8fcc8ed6;
    stim[10] = 55'h6497f95101bf98;
    stim[11] = 55'h6a1724a5bc3d35;
    stim[12] = 55'h03cb6b6415b5a4;
    stim[13] = 55'h0b76bdb07b97b2;
    stim[14] = 55'h78830cf6b6945f;
    stim[15] = 55'h5d312f917dd9ba;
    stim[16] = 55'h542ce971850882;
    stim[17] = 55'h57e3267a2f01f2;
    stim[18] = 55'h55dae3c294f05c;
    stim[19] = 55'h7b1e9621b56276;
    stim[20] = 55'h2410f76b576a08;
    stim[21] = 55'h462ea9641c533f;
    stim[22] = 55'h10ed59b4ab524e;
    stim[23] = 55'h030d0d456a9c55;
    stim[24] = 55'h36fc049dabdd04;
    stim[25] = 55'h3526a4051d6e08;
    stim[26] = 55'h307a7a2baf2b8e;
    stim[27] = 55'h3ceada187f3481;
    stim[28] = 55'h1c33f13e49f559;
    stim[29] = 55'h0f0ab3ae3029ea;
    stim[30] = 55'h005bf8935e5497;
    stim[31] = 55'h5d39f4876a4c16;
    stim[32] = 55'h0d657194e0a4f9;
    stim[33] = 55'h72dd9f9e53ebc7;
    stim[34] = 55'h002c61cc827189;
    stim[35] = 55'h7c4b7bb090b7e7;
    stim[36] = 55'h569c16eae31f94;
    stim[37] = 55'h4ff5ce11d49ed2;
    stim[38] = 55'h749e8e0249e73d;
    stim[39] = 55'h26ae151372307a;
    stim[40] = 55'h2e1e01d4ad7b6c;
    stim[41] = 55'h3e49a061f2338b;
    stim[42] = 55'h6fa8b97fda932b;
    stim[43] = 55'h6dcd06c09e2f09;
    stim[44] = 55'h14b668ff40fa8f;
    stim[45] = 55'h7cd6d72db140e4;
    stim[46] = 55'h7f3efac96ce652;
    stim[47] = 55'h4dc4d0630b6453;
    stim[48] = 55'h3d1fa6069248b1;
    stim[49] = 55'h7503ab490d6eb5;
    stim[50] = 55'h371c5d24a83083;
    stim[51] = 55'h18782d1875e7f8;
    stim[52] = 55'h446db8de09cee1;
    stim[53] = 55'h56866c2a84b237;
    stim[54] = 55'h681d2571edf5ad;
    stim[55] = 55'h757cfb310fae1a;
    stim[56] = 55'h21dedf6d8190b2;
    stim[57] = 55'h0aac9a4be4496a;
    stim[58] = 55'h6c832753ccbc99;
    stim[59] = 55'h26a45894c9524c;
    stim[60] = 55'h7c5dc10ddd7c5e;
    stim[61] = 55'h2c1795a161645e;
    stim[62] = 55'h738b3fb30d0b33;
    stim[63] = 55'h5e54f841cbc94b;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'h511707b6xxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'h7bf7bf14xxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'h7f95101bxxxxxxxx;
      expv[12] = 64'h724a5bc3xxxxxxxx;
      expv[13] = 64'h724a5bc3xxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'h12f917ddxxxxxxxx;
      expv[17] = 64'h12f917ddxxxxxxxx;
      expv[18] = 64'h12f917ddxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'h0f76b576xxxxxxxx;
      expv[22] = 64'h0f76b576xxxxxxxx;
      expv[23] = 64'h0f76b576xxxxxxxx;
      expv[24] = 64'h0f76b576xxxxxxxx;
      expv[25] = 64'hc049dabdxxxxxxxx;
      expv[26] = 64'hc049dabdxxxxxxxx;
      expv[27] = 64'ha7a2baf2xxxxxxxx;
      expv[28] = 64'ha7a2baf2xxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'h9f4876a4xxxxxxxx;
      expv[33] = 64'h9f4876a4xxxxxxxx;
      expv[34] = 64'hd9f9e53exxxxxxxx;
      expv[35] = 64'hd9f9e53exxxxxxxx;
      expv[36] = 64'hd9f9e53exxxxxxxx;
      expv[37] = 64'hc16eae31xxxxxxxx;
      expv[38] = 64'h5ce11d49xxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'he01d4ad7xxxxxxxx;
      expv[42] = 64'he01d4ad7xxxxxxxx;
      expv[43] = 64'he01d4ad7xxxxxxxx;
      expv[44] = 64'he01d4ad7xxxxxxxx;
      expv[45] = 64'h668ff40fxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hfa606924xxxxxxxx;
      expv[50] = 64'hfa606924xxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hcfb310faxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hdc10ddd7xxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
