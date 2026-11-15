// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_081555 dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .clk_div(in_vec[43:36]),
    .wr(in_vec[35:35]),
    .wr_len(in_vec[34:33]),
    .wrdata(in_vec[32:1]),
    .sdi(in_vec[0:0]),
    .wr_done(out_vec[36:36]),
    .rddata(out_vec[35:4]),
    .sck(out_vec[3:3]),
    .sdo(out_vec[2:2]),
    .ss(out_vec[1:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h140755f02579;
    stim[1] = 45'h1f4d934846e0;
    stim[2] = 45'h0613c92ae7b7;
    stim[3] = 45'h019e3f574e47;
    stim[4] = 45'h0badee1a4723;
    stim[5] = 45'h0266d0eef29c;
    stim[6] = 45'h013c8974f934;
    stim[7] = 45'h0a61fc89973e;
    stim[8] = 45'h0eb1cbb3dc87;
    stim[9] = 45'h0d1a17a58d54;
    stim[10] = 45'h0c6cd880fd42;
    stim[11] = 45'h0fcf9afabef5;
    stim[12] = 45'h16e16ceb1b59;
    stim[13] = 45'h0e9ffde8e1a2;
    stim[14] = 45'h0c4eca90aee5;
    stim[15] = 45'h008124515c9b;
    stim[16] = 45'h082abe963e0b;
    stim[17] = 45'h0ab6cdc21a04;
    stim[18] = 45'h026799408e8f;
    stim[19] = 45'h0215df72993a;
    stim[20] = 45'h07fc16bb7eda;
    stim[21] = 45'h07b422fbcada;
    stim[22] = 45'h0259a1641c24;
    stim[23] = 45'h0e82d1e405bf;
    stim[24] = 45'h07885e584f05;
    stim[25] = 45'h04b6ecdf7517;
    stim[26] = 45'h06c4446c6c16;
    stim[27] = 45'h0da25d611e07;
    stim[28] = 45'h085665abbf43;
    stim[29] = 45'h022fc40f0e7f;
    stim[30] = 45'h0ef54d6b1f35;
    stim[31] = 45'h0529f5eedb8d;
    stim[32] = 45'h080070caec80;
    stim[33] = 45'h09b812353bcd;
    stim[34] = 45'h06636b77da0e;
    stim[35] = 45'h08769267a83c;
    stim[36] = 45'h025d470a200f;
    stim[37] = 45'h0472989aeb38;
    stim[38] = 45'h080ca7e27463;
    stim[39] = 45'h04ae8226b2a7;
    stim[40] = 45'h020cd02c06a6;
    stim[41] = 45'h0b04edf077db;
    stim[42] = 45'h0c1939ec7dc3;
    stim[43] = 45'h0022573905d7;
    stim[44] = 45'h08d60cb29dfd;
    stim[45] = 45'h088b7669d8db;
    stim[46] = 45'h0c85abfe0497;
    stim[47] = 45'h09246625b19a;
    stim[48] = 45'h0d5e247669af;
    stim[49] = 45'h0097a0323a27;
    stim[50] = 45'h0ddd50256d2f;
    stim[51] = 45'h0053b55ac435;
    stim[52] = 45'h0f3b8d01ce46;
    stim[53] = 45'h09b3b279b47d;
    stim[54] = 45'h0617d7ac030d;
    stim[55] = 45'h018e85f36687;
    stim[56] = 45'h03956cc34b6c;
    stim[57] = 45'h0ef5c78429f2;
    stim[58] = 45'h0744bf1b28cb;
    stim[59] = 45'h0b321d39fd8e;
    stim[60] = 45'h0a213d8ec571;
    stim[61] = 45'h09e36e09b976;
    stim[62] = 45'h0e24bf18caf2;
    stim[63] = 45'h00c04f524d83;
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
      expv[0] = 37'h000000000b;
      expv[1] = 37'h000000000b;
      expv[2] = 37'h000000000b;
      expv[3] = 37'h000000000b;
      expv[4] = 37'h000000000a;
      expv[5] = 37'h0000000004;
      expv[6] = 37'h0000000004;
      expv[7] = 37'h0000000004;
      expv[8] = 37'h0000000004;
      expv[9] = 37'h0000000004;
      expv[10] = 37'h0000000004;
      expv[11] = 37'h0000000004;
      expv[12] = 37'h000000000b;
      expv[13] = 37'h000000000b;
      expv[14] = 37'h000000000a;
      expv[15] = 37'h0000000000;
      expv[16] = 37'h0000000000;
      expv[17] = 37'h0000000000;
      expv[18] = 37'h0000000000;
      expv[19] = 37'h0000000000;
      expv[20] = 37'h0000000000;
      expv[21] = 37'h0000000000;
      expv[22] = 37'h0000000000;
      expv[23] = 37'h0000000000;
      expv[24] = 37'h0000000000;
      expv[25] = 37'h0000000000;
      expv[26] = 37'h0000000000;
      expv[27] = 37'h0000000000;
      expv[28] = 37'h0000000000;
      expv[29] = 37'h0000000000;
      expv[30] = 37'h0000000000;
      expv[31] = 37'h0000000000;
      expv[32] = 37'h0000000000;
      expv[33] = 37'h0000000000;
      expv[34] = 37'h0000000000;
      expv[35] = 37'h0000000000;
      expv[36] = 37'h0000000000;
      expv[37] = 37'h0000000000;
      expv[38] = 37'h0000000000;
      expv[39] = 37'h0000000000;
      expv[40] = 37'h0000000000;
      expv[41] = 37'h0000000000;
      expv[42] = 37'h0000000000;
      expv[43] = 37'h0000000000;
      expv[44] = 37'h0000000000;
      expv[45] = 37'h0000000000;
      expv[46] = 37'h0000000000;
      expv[47] = 37'h0000000000;
      expv[48] = 37'h0000000000;
      expv[49] = 37'h0000000000;
      expv[50] = 37'h0000000000;
      expv[51] = 37'h0000000000;
      expv[52] = 37'h0000000000;
      expv[53] = 37'h0000000000;
      expv[54] = 37'h0000000000;
      expv[55] = 37'h0000000000;
      expv[56] = 37'h0000000000;
      expv[57] = 37'h0000000000;
      expv[58] = 37'h0000000000;
      expv[59] = 37'h0000000000;
      expv[60] = 37'h0000000000;
      expv[61] = 37'h0000000000;
      expv[62] = 37'h0000000000;
      expv[63] = 37'h0000000000;
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
