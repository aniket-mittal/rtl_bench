// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_053856 dut (
    .vga_clk(clk),
    .reset(in_vec[40:40]),
    .vramstart(in_vec[39:24]),
    .cramstart(in_vec[23:8]),
    .vdata(in_vec[7:0]),
    .vaddr(out_vec[21:6]),
    .color(out_vec[5:2]),
    .hsync(out_vec[1:1]),
    .vsync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h197e0e77990;
    stim[1] = 41'h1dd421e4ec4;
    stim[2] = 41'h0f3c7821ad7;
    stim[3] = 41'h0900910930a;
    stim[4] = 41'h088fe861971;
    stim[5] = 41'h0b444311956;
    stim[6] = 41'h040867f12df;
    stim[7] = 41'h0d0c91c2e29;
    stim[8] = 41'h0932d7ead65;
    stim[9] = 41'h0337e6f865a;
    stim[10] = 41'h09ba0514007;
    stim[11] = 41'h0c2100abbcc;
    stim[12] = 41'h03392ae8a08;
    stim[13] = 41'h083c83071cc;
    stim[14] = 41'h079d7a13f2d;
    stim[15] = 41'h05abbf9402a;
    stim[16] = 41'h0f5e4654811;
    stim[17] = 41'h0ddd0a1f73c;
    stim[18] = 41'h0fd39b572a0;
    stim[19] = 41'h0f41a4ccd8f;
    stim[20] = 41'h0263343b727;
    stim[21] = 41'h0f61233e3f2;
    stim[22] = 41'h00cde7b33c4;
    stim[23] = 41'h09705369263;
    stim[24] = 41'h03b2862015b;
    stim[25] = 41'h057594fab7a;
    stim[26] = 41'h07f456a630a;
    stim[27] = 41'h0d7f6d11bca;
    stim[28] = 41'h0ff47ee42bd;
    stim[29] = 41'h0f5a789fa29;
    stim[30] = 41'h0a0d5062432;
    stim[31] = 41'h0089a7badda;
    stim[32] = 41'h0c9405eea3a;
    stim[33] = 41'h0b79c66d533;
    stim[34] = 41'h05d2f82779e;
    stim[35] = 41'h11c9dc2578f;
    stim[36] = 41'h0b0f75bda48;
    stim[37] = 41'h0fc3f2d1218;
    stim[38] = 41'h045041f89e2;
    stim[39] = 41'h097ccd8d4e9;
    stim[40] = 41'h01d58dcb6f7;
    stim[41] = 41'h0fed63512b9;
    stim[42] = 41'h1ab516c63aa;
    stim[43] = 41'h0925b391194;
    stim[44] = 41'h0c4da4ebaf8;
    stim[45] = 41'h0e797a6c912;
    stim[46] = 41'h025fa29c29c;
    stim[47] = 41'h07e2a440815;
    stim[48] = 41'h0f8e977f20a;
    stim[49] = 41'h0907dd82833;
    stim[50] = 41'h0552ff54ddf;
    stim[51] = 41'h06ece642980;
    stim[52] = 41'h0e55afeff88;
    stim[53] = 41'h02ac5240c2f;
    stim[54] = 41'h0c066b58eeb;
    stim[55] = 41'h0f294661faa;
    stim[56] = 41'h06b9d1e539a;
    stim[57] = 41'h0eeedcc7f11;
    stim[58] = 41'h09a952fc2c2;
    stim[59] = 41'h05578a22eac;
    stim[60] = 41'h0b29cbd632c;
    stim[61] = 41'h0a2d91f45e9;
    stim[62] = 41'h071d5c82455;
    stim[63] = 41'h0bdb6014625;
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
      expv[0] = 22'h25f8xx;
      expv[1] = 22'h25f8xx;
      expv[2] = 22'h3750xx;
      expv[3] = 22'h3cf1xx;
      expv[4] = 22'h2402xx;
      expv[5] = 22'h219axx;
      expv[6] = 22'h219axx;
      expv[7] = 22'h219a47;
      expv[8] = 22'h219a5f;
      expv[9] = 22'h219a5f;
      expv[10] = 22'h219a47;
      expv[11] = 22'h219a47;
      expv[12] = 22'h219a47;
      expv[13] = 22'h219a47;
      expv[14] = 22'h219a47;
      expv[15] = 22'h219a47;
      expv[16] = 22'h219a47;
      expv[17] = 22'h219a47;
      expv[18] = 22'h219a47;
      expv[19] = 22'h3f4e87;
      expv[20] = 22'h3d0707;
      expv[21] = 22'h120bc7;
      expv[22] = 22'h120bc7;
      expv[23] = 22'h120bdf;
      expv[24] = 22'h120bdf;
      expv[25] = 22'h120bcb;
      expv[26] = 22'h120bdf;
      expv[27] = 22'h120bdf;
      expv[28] = 22'h120bdf;
      expv[29] = 22'h120bdf;
      expv[30] = 22'h120bdf;
      expv[31] = 22'h120bdf;
      expv[32] = 22'h120bdf;
      expv[33] = 22'h120bdf;
      expv[34] = 22'h120bdf;
      expv[35] = 22'h07275f;
      expv[36] = 22'h07275f;
      expv[37] = 22'h2c3ddf;
      expv[38] = 22'h3f101f;
      expv[39] = 22'h08125f;
      expv[40] = 22'h08125f;
      expv[41] = 22'h08127b;
      expv[42] = 22'h2ad44b;
      expv[43] = 22'h2ad44b;
      expv[44] = 22'h2496cb;
      expv[45] = 22'h3136cb;
      expv[46] = 22'h2ba24b;
      expv[47] = 22'h2ba24b;
      expv[48] = 22'h2ba247;
      expv[49] = 22'h2ba247;
      expv[50] = 22'h2ba24b;
      expv[51] = 22'h2ba24b;
      expv[52] = 22'h2ba24b;
      expv[53] = 22'h2ba24b;
      expv[54] = 22'h2ba24b;
      expv[55] = 22'h2ba24b;
      expv[56] = 22'h2ba24b;
      expv[57] = 22'h2ba24b;
      expv[58] = 22'h2ba24b;
      expv[59] = 22'h2ba24b;
      expv[60] = 22'h155e4b;
      expv[61] = 22'h2ca78b;
      expv[62] = 22'h08294b;
      expv[63] = 22'h08294b;
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
