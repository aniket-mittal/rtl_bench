// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051748 dut (
    .SW(in_vec[13:4]),
    .KEY(in_vec[3:0]),
    .LEDR(out_vec[49:42]),
    .HEX0(out_vec[41:35]),
    .HEX1(out_vec[34:28]),
    .HEX2(out_vec[27:21]),
    .HEX3(out_vec[20:14]),
    .HEX4(out_vec[13:7]),
    .HEX5(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h163d;
    stim[1] = 14'h0568;
    stim[2] = 14'h14a3;
    stim[3] = 14'h077f;
    stim[4] = 14'h2fe2;
    stim[5] = 14'h0af8;
    stim[6] = 14'h208e;
    stim[7] = 14'h151d;
    stim[8] = 14'h1c76;
    stim[9] = 14'h055b;
    stim[10] = 14'h1973;
    stim[11] = 14'h20e9;
    stim[12] = 14'h11ee;
    stim[13] = 14'h26a5;
    stim[14] = 14'h00f7;
    stim[15] = 14'h0594;
    stim[16] = 14'h22c5;
    stim[17] = 14'h0276;
    stim[18] = 14'h1d26;
    stim[19] = 14'h0048;
    stim[20] = 14'h16e7;
    stim[21] = 14'h16f5;
    stim[22] = 14'h3687;
    stim[23] = 14'h1ab8;
    stim[24] = 14'h3568;
    stim[25] = 14'h0a50;
    stim[26] = 14'h0e4f;
    stim[27] = 14'h19ba;
    stim[28] = 14'h36e0;
    stim[29] = 14'h2b6e;
    stim[30] = 14'h3b32;
    stim[31] = 14'h2e49;
    stim[32] = 14'h36dc;
    stim[33] = 14'h2df0;
    stim[34] = 14'h1851;
    stim[35] = 14'h3eaf;
    stim[36] = 14'h3875;
    stim[37] = 14'h0a8d;
    stim[38] = 14'h00c2;
    stim[39] = 14'h1139;
    stim[40] = 14'h0480;
    stim[41] = 14'h3a8f;
    stim[42] = 14'h2cac;
    stim[43] = 14'h256a;
    stim[44] = 14'h09b7;
    stim[45] = 14'h0fd9;
    stim[46] = 14'h305a;
    stim[47] = 14'h096b;
    stim[48] = 14'h1b6c;
    stim[49] = 14'h2657;
    stim[50] = 14'h0f26;
    stim[51] = 14'h1c2a;
    stim[52] = 14'h2ddb;
    stim[53] = 14'h0251;
    stim[54] = 14'h2ec0;
    stim[55] = 14'h2e61;
    stim[56] = 14'h0350;
    stim[57] = 14'h3278;
    stim[58] = 14'h3f60;
    stim[59] = 14'h0ef7;
    stim[60] = 14'h3a23;
    stim[61] = 14'h2b8d;
    stim[62] = 14'h099e;
    stim[63] = 14'h1c39;
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
      expv[0] = 50'hxxx840810xxxx;
      expv[1] = 50'h00x140810xxx0;
      expv[2] = 50'h00x440810xxx0;
      expv[3] = 50'h00xc40810xxx0;
      expv[4] = 50'h0003408102040;
      expv[5] = 50'h0007408102040;
      expv[6] = 50'h0000408102040;
      expv[7] = 50'h003cc08102040;
      expv[8] = 50'h003c408102040;
      expv[9] = 50'h0009408102040;
      expv[10] = 50'h003c408102040;
      expv[11] = 50'h0003408102040;
      expv[12] = 50'h0043408103cc0;
      expv[13] = 50'h0004408102040;
      expv[14] = 50'h0007408102040;
      expv[15] = 50'h2408408102010;
      expv[16] = 50'h0023408102040;
      expv[17] = 50'h003c408102040;
      expv[18] = 50'h0012408102040;
      expv[19] = 50'h000cc08102040;
      expv[20] = 50'h0003408102040;
      expv[21] = 50'h0007408102040;
      expv[22] = 50'h0000408102040;
      expv[23] = 50'h0041c08103cc0;
      expv[24] = 50'h0001408102040;
      expv[25] = 50'h0009408102040;
      expv[26] = 50'h000cc08102040;
      expv[27] = 50'h0001c08102040;
      expv[28] = 50'h0003408102040;
      expv[29] = 50'h0001408102040;
      expv[30] = 50'h0018408102040;
      expv[31] = 50'h000cc08102040;
      expv[32] = 50'h0010c08102040;
      expv[33] = 50'h0007408102040;
      expv[34] = 50'h0009408102040;
      expv[35] = 50'h0004408102040;
      expv[36] = 50'h003c408102040;
      expv[37] = 50'h0000408102040;
      expv[38] = 50'h0023408102040;
      expv[39] = 50'h0018408102040;
      expv[40] = 50'h0000408102040;
      expv[41] = 50'h0000408102040;
      expv[42] = 50'h0004408102040;
      expv[43] = 50'h0001408102040;
      expv[44] = 50'h0001c08102040;
      expv[45] = 50'h0010c08102040;
      expv[46] = 50'h0009408102040;
      expv[47] = 50'h0001408102040;
      expv[48] = 50'h0001408102040;
      expv[49] = 50'h0009408102040;
      expv[50] = 50'h0012408102040;
      expv[51] = 50'h0012408102040;
      expv[52] = 50'h0010c08102040;
      expv[53] = 50'h0009408102040;
      expv[54] = 50'h0023408102040;
      expv[55] = 50'h0001408102040;
      expv[56] = 50'h0009408102040;
      expv[57] = 50'h003c408102040;
      expv[58] = 50'h0001408102040;
      expv[59] = 50'h0007408102040;
      expv[60] = 50'h0012408102040;
      expv[61] = 50'h0000408102040;
      expv[62] = 50'h0208408100040;
      expv[63] = 50'h0218408100040;
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
