// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061184 dut (
    .SW(in_vec[21:4]),
    .KEY(in_vec[3:0]),
    .LEDG(out_vec[26:18]),
    .LEDR(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h3632ec;
    stim[1] = 22'h3de5b9;
    stim[2] = 22'h3dc95e;
    stim[3] = 22'h07cffa;
    stim[4] = 22'h1e64ba;
    stim[5] = 22'h3a16c0;
    stim[6] = 22'h32301b;
    stim[7] = 22'h339e6c;
    stim[8] = 22'h306b6b;
    stim[9] = 22'h0baef4;
    stim[10] = 22'h3895de;
    stim[11] = 22'h1c3dc0;
    stim[12] = 22'h1368d2;
    stim[13] = 22'h1e4e68;
    stim[14] = 22'h003a3c;
    stim[15] = 22'h1f249c;
    stim[16] = 22'h3cd75c;
    stim[17] = 22'h2e5552;
    stim[18] = 22'h1504b7;
    stim[19] = 22'h3da6c4;
    stim[20] = 22'h1e743a;
    stim[21] = 22'h3dc5c5;
    stim[22] = 22'h056b67;
    stim[23] = 22'h35ece4;
    stim[24] = 22'h0d41f2;
    stim[25] = 22'h0e61b3;
    stim[26] = 22'h37eb50;
    stim[27] = 22'h27e92d;
    stim[28] = 22'h37d52c;
    stim[29] = 22'h046f8d;
    stim[30] = 22'h1107de;
    stim[31] = 22'h203397;
    stim[32] = 22'h1c3660;
    stim[33] = 22'h2c5950;
    stim[34] = 22'h25ead5;
    stim[35] = 22'h1532ab;
    stim[36] = 22'h00479d;
    stim[37] = 22'h3f67d6;
    stim[38] = 22'h08bee6;
    stim[39] = 22'h337a91;
    stim[40] = 22'h322c06;
    stim[41] = 22'h1c82b6;
    stim[42] = 22'h0c7a75;
    stim[43] = 22'h218bc6;
    stim[44] = 22'h39fb14;
    stim[45] = 22'h02e5c5;
    stim[46] = 22'h0cdc5c;
    stim[47] = 22'h32e658;
    stim[48] = 22'h0842fa;
    stim[49] = 22'h26b8a8;
    stim[50] = 22'h3484bd;
    stim[51] = 22'h0a9f08;
    stim[52] = 22'h0474cf;
    stim[53] = 22'h2e7975;
    stim[54] = 22'h12e6cf;
    stim[55] = 22'h15c2ed;
    stim[56] = 22'h014a59;
    stim[57] = 22'h194a75;
    stim[58] = 22'h0daa12;
    stim[59] = 22'h05f8ed;
    stim[60] = 22'h248b0a;
    stim[61] = 22'h366991;
    stim[62] = 22'h340ae3;
    stim[63] = 22'h162dad;
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
      expv[0] = 27'h00x0000;
      expv[1] = 27'h00x0000;
      expv[2] = 27'h00x0000;
      expv[3] = 27'h00x0000;
      expv[4] = 27'h00x0000;
      expv[5] = 27'h00x0000;
      expv[6] = 27'h00x0000;
      expv[7] = 27'h00x0000;
      expv[8] = 27'h00x0000;
      expv[9] = 27'h00x0000;
      expv[10] = 27'h00x0000;
      expv[11] = 27'h00x0000;
      expv[12] = 27'h00x0000;
      expv[13] = 27'h00x0000;
      expv[14] = 27'h00x0000;
      expv[15] = 27'h00x0000;
      expv[16] = 27'h00x0000;
      expv[17] = 27'h00x0000;
      expv[18] = 27'h00x0000;
      expv[19] = 27'h00x0000;
      expv[20] = 27'h00x0000;
      expv[21] = 27'h00xdc5c;
      expv[22] = 27'h00xdc5c;
      expv[23] = 27'h00x0000;
      expv[24] = 27'h00x0000;
      expv[25] = 27'h00x0000;
      expv[26] = 27'h00x0000;
      expv[27] = 27'h00x0000;
      expv[28] = 27'h00x0000;
      expv[29] = 27'h00x0000;
      expv[30] = 27'h00x0000;
      expv[31] = 27'h00x0000;
      expv[32] = 27'h00x0000;
      expv[33] = 27'h00x0000;
      expv[34] = 27'h00x0000;
      expv[35] = 27'h00x0000;
      expv[36] = 27'h00x0479;
      expv[37] = 27'h00x0000;
      expv[38] = 27'h00x0000;
      expv[39] = 27'h00x37a9;
      expv[40] = 27'h00x0000;
      expv[41] = 27'h00x0000;
      expv[42] = 27'h00xc7a7;
      expv[43] = 27'h00x0000;
      expv[44] = 27'h00x0000;
      expv[45] = 27'h00x0000;
      expv[46] = 27'h00x0000;
      expv[47] = 27'h00x0000;
      expv[48] = 27'h00x0000;
      expv[49] = 27'h00x0000;
      expv[50] = 27'h00x0000;
      expv[51] = 27'h00x0000;
      expv[52] = 27'h00x0000;
      expv[53] = 27'h00xe797;
      expv[54] = 27'h00xe797;
      expv[55] = 27'h14x5c2e;
      expv[56] = 27'h14x5c2e;
      expv[57] = 27'h14x5c2e;
      expv[58] = 27'h00x0000;
      expv[59] = 27'h00x5f8e;
      expv[60] = 27'h00x0000;
      expv[61] = 27'h00x6699;
      expv[62] = 27'h00x6699;
      expv[63] = 27'h33x62da;
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
