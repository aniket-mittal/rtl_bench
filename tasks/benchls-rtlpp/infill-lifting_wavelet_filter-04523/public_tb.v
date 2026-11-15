// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04523 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .clk2(out_vec[52:52]),
    .x_e(out_vec[51:35]),
    .x_o(out_vec[34:18]),
    .g(out_vec[17:9]),
    .h(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h160;
    stim[1] = 9'h180;
    stim[2] = 9'h044;
    stim[3] = 9'h03a;
    stim[4] = 9'h113;
    stim[5] = 9'h0e0;
    stim[6] = 9'h024;
    stim[7] = 9'h060;
    stim[8] = 9'h09a;
    stim[9] = 9'h0bc;
    stim[10] = 9'h0f8;
    stim[11] = 9'h084;
    stim[12] = 9'h0e7;
    stim[13] = 9'h074;
    stim[14] = 9'h039;
    stim[15] = 9'h05f;
    stim[16] = 9'h033;
    stim[17] = 9'h0d9;
    stim[18] = 9'h099;
    stim[19] = 9'h033;
    stim[20] = 9'h095;
    stim[21] = 9'h07b;
    stim[22] = 9'h08f;
    stim[23] = 9'h0c9;
    stim[24] = 9'h08c;
    stim[25] = 9'h08c;
    stim[26] = 9'h07f;
    stim[27] = 9'h0b1;
    stim[28] = 9'h002;
    stim[29] = 9'h050;
    stim[30] = 9'h0b0;
    stim[31] = 9'h0f0;
    stim[32] = 9'h013;
    stim[33] = 9'h055;
    stim[34] = 9'h056;
    stim[35] = 9'h09a;
    stim[36] = 9'h005;
    stim[37] = 9'h0d7;
    stim[38] = 9'h0d2;
    stim[39] = 9'h07c;
    stim[40] = 9'h0ca;
    stim[41] = 9'h045;
    stim[42] = 9'h0ba;
    stim[43] = 9'h09c;
    stim[44] = 9'h0e8;
    stim[45] = 9'h049;
    stim[46] = 9'h015;
    stim[47] = 9'h052;
    stim[48] = 9'h033;
    stim[49] = 9'h0a1;
    stim[50] = 9'h005;
    stim[51] = 9'h094;
    stim[52] = 9'h001;
    stim[53] = 9'h0cc;
    stim[54] = 9'h02d;
    stim[55] = 9'h037;
    stim[56] = 9'h0bb;
    stim[57] = 9'h083;
    stim[58] = 9'h0e7;
    stim[59] = 9'h08e;
    stim[60] = 9'h0a2;
    stim[61] = 9'h07e;
    stim[62] = 9'h091;
    stim[63] = 9'h0a0;
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
      expv[0] = 53'hxxxxxxxxxxxxxx;
      expv[1] = 53'hxxxxxxxxxxxxxx;
      expv[2] = 53'hxxxxxxxxxxxxxx;
      expv[3] = 53'h11078xxxxxxxxx;
      expv[4] = 53'h01078xxxxxxxxx;
      expv[5] = 53'h01078xxxxxxxxx;
      expv[6] = 53'h1f8400706xxxxx;
      expv[7] = 53'h0f8400706xxxxx;
      expv[8] = 53'h11740045cxxxxx;
      expv[9] = 53'h01740045c07a4b;
      expv[10] = 53'h1ef8873a607a4b;
      expv[11] = 53'h0ef8873a6335a1;
      expv[12] = 53'h1e1f87f08335a1;
      expv[13] = 53'h0e1f87f08377f5;
      expv[14] = 53'h11c187cf9377f5;
      expv[15] = 53'h01c187cf90106d;
      expv[16] = 53'h1170206e70106d;
      expv[17] = 53'h0170206e70f7ab;
      expv[18] = 53'h1f68e062d0f7ab;
      expv[19] = 53'h0f68e062d04bd2;
      expv[20] = 53'h10c5a738704bd2;
      expv[21] = 53'h00c5a738736428;
      expv[22] = 53'h11dca730b36428;
      expv[23] = 53'h01dca730b3f59b;
      expv[24] = 53'h1f2ae72513f59b;
      expv[25] = 53'h0f2ae725136144;
      expv[26] = 53'h1e3e871f436144;
      expv[27] = 53'h0e3e871f42d1ce;
      expv[28] = 53'h1ecde0f612d1ce;
      expv[29] = 53'h0ecde0f610723b;
      expv[30] = 53'h11360003e0723b;
      expv[31] = 53'h01360003e00c8a;
      expv[32] = 53'h1fc20765000c8a;
      expv[33] = 53'h0fc20765038fa9;
      expv[34] = 53'h11496024d38fa9;
      expv[35] = 53'h01496024d07ff6;
      expv[36] = 53'h1e74c0a6a07ff6;
      expv[37] = 53'h0e74c0a6a04fc8;
      expv[38] = 53'h1f612009b04fc8;
      expv[39] = 53'h0f612009b39c7a;
      expv[40] = 53'h11e087a6e39c7a;
      expv[41] = 53'h01e087a6e0162a;
      expv[42] = 53'h110b679760162a;
      expv[43] = 53'h010b6797602d7e;
      expv[44] = 53'h1e7c8778602d7e;
      expv[45] = 53'h0e7c877863578f;
      expv[46] = 53'h111ae7d183578f;
      expv[47] = 53'h011ae7d1800236;
      expv[48] = 53'h113dc028b00236;
      expv[49] = 53'h013dc028b099c6;
      expv[50] = 53'h1e8fe062d099c6;
      expv[51] = 53'h0e8fe062d019c4;
      expv[52] = 53'h1e5d8009b019c4;
      expv[53] = 53'h0e5d8009b3665b;
      expv[54] = 53'h1f368001f3665b;
      expv[55] = 53'h0f368001f39c56;
      expv[56] = 53'h10d52057339c56;
      expv[57] = 53'h00d5205730683d;
      expv[58] = 53'h1e1ba77a50683d;
      expv[59] = 53'h0e1ba77a5321c7;
      expv[60] = 53'h1e4647cf9321c7;
      expv[61] = 53'h0e4647cf934032;
      expv[62] = 53'h11e84749e34032;
      expv[63] = 53'h01e84749e3ae4e;
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
