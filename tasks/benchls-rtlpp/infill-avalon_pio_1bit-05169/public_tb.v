// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05169 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h015988d250;
    stim[1] = 37'h08930e1b28;
    stim[2] = 37'h0364ce41eb;
    stim[3] = 37'h1af83f6ecd;
    stim[4] = 37'h0f665771a1;
    stim[5] = 37'h12f7190aed;
    stim[6] = 37'h07e89f0e89;
    stim[7] = 37'h02e8b367b6;
    stim[8] = 37'h0af99635f5;
    stim[9] = 37'h179a38e696;
    stim[10] = 37'h0e946da8f7;
    stim[11] = 37'h1a85f45461;
    stim[12] = 37'h1a5ae34c5b;
    stim[13] = 37'h0e2d4fb1f6;
    stim[14] = 37'h1fd5b09022;
    stim[15] = 37'h020439d4d5;
    stim[16] = 37'h03516cf67c;
    stim[17] = 37'h07d1ebc3f1;
    stim[18] = 37'h1e9e4d253e;
    stim[19] = 37'h17b1c1f917;
    stim[20] = 37'h166db28a9d;
    stim[21] = 37'h03a05a3a3a;
    stim[22] = 37'h0365ca3335;
    stim[23] = 37'h032b630638;
    stim[24] = 37'h04cf7ffb31;
    stim[25] = 37'h1e68fc4382;
    stim[26] = 37'h0eebcbe213;
    stim[27] = 37'h07d22f3401;
    stim[28] = 37'h1299b9987c;
    stim[29] = 37'h0fc1ae4310;
    stim[30] = 37'h02a0040574;
    stim[31] = 37'h0f45efda6b;
    stim[32] = 37'h0b481b74cd;
    stim[33] = 37'h07bedf4a00;
    stim[34] = 37'h1352c095f4;
    stim[35] = 37'h1b8b877fae;
    stim[36] = 37'h02b64c80af;
    stim[37] = 37'h0a2857de01;
    stim[38] = 37'h17685ff76e;
    stim[39] = 37'h1f8b081a0e;
    stim[40] = 37'h122a79469a;
    stim[41] = 37'h0eeb4f5abf;
    stim[42] = 37'h1a12e7eba1;
    stim[43] = 37'h1e2fc59229;
    stim[44] = 37'h022a952829;
    stim[45] = 37'h1a3abe41c1;
    stim[46] = 37'h173ced6b39;
    stim[47] = 37'h1ab87103db;
    stim[48] = 37'h0afa3760bb;
    stim[49] = 37'h04cfff4a6a;
    stim[50] = 37'h1b25eff1fb;
    stim[51] = 37'h1767cb6050;
    stim[52] = 37'h1e69db9a40;
    stim[53] = 37'h1e19d23629;
    stim[54] = 37'h1350e25b3b;
    stim[55] = 37'h1ab2930b16;
    stim[56] = 37'h1e63919f0c;
    stim[57] = 37'h062fd4a67e;
    stim[58] = 37'h0241212462;
    stim[59] = 37'h07067c141a;
    stim[60] = 37'h073073093c;
    stim[61] = 37'h072181293c;
    stim[62] = 37'h03e40f940a;
    stim[63] = 37'h1b53826f36;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
