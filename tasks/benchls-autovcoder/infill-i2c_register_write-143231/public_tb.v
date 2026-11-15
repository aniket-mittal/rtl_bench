// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_143231 dut (
    .clk(clk),
    .reset(in_vec[24:24]),
    .start(in_vec[23:23]),
    .slave_addr(in_vec[22:16]),
    .reg_addr(in_vec[15:8]),
    .data(in_vec[7:0]),
    .scl(out_vec[2:2]),
    .sda(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1502190;
    stim[1] = 25'h11be338;
    stim[2] = 25'h020c706;
    stim[3] = 25'h0f50cd9;
    stim[4] = 25'h0e7eafa;
    stim[5] = 25'h0e1e445;
    stim[6] = 25'h01b7a67;
    stim[7] = 25'h0fad4e8;
    stim[8] = 25'h0f9ed9d;
    stim[9] = 25'h011cdf5;
    stim[10] = 25'h0132023;
    stim[11] = 25'h0d72d6f;
    stim[12] = 25'h02bacb6;
    stim[13] = 25'h03aa4bf;
    stim[14] = 25'h0582703;
    stim[15] = 25'h03b5fba;
    stim[16] = 25'h07eec74;
    stim[17] = 25'h090ed26;
    stim[18] = 25'h01f9423;
    stim[19] = 25'h0b390d2;
    stim[20] = 25'h07f969b;
    stim[21] = 25'h0bd6047;
    stim[22] = 25'h0e0538d;
    stim[23] = 25'h0b7bc4f;
    stim[24] = 25'h0a15414;
    stim[25] = 25'h0c49e26;
    stim[26] = 25'h0ce6002;
    stim[27] = 25'h0b924d4;
    stim[28] = 25'h0220f2b;
    stim[29] = 25'h0a49f61;
    stim[30] = 25'h0413aa5;
    stim[31] = 25'h09b8773;
    stim[32] = 25'h0c15da4;
    stim[33] = 25'h0c0367a;
    stim[34] = 25'h05ff94c;
    stim[35] = 25'h067a751;
    stim[36] = 25'h03ae4f4;
    stim[37] = 25'h0d6d5b7;
    stim[38] = 25'h0c6e8bc;
    stim[39] = 25'h0ed264d;
    stim[40] = 25'h0f9a756;
    stim[41] = 25'h0622a67;
    stim[42] = 25'h0d39bae;
    stim[43] = 25'h00f7da9;
    stim[44] = 25'h058a031;
    stim[45] = 25'h01d4660;
    stim[46] = 25'h0db3220;
    stim[47] = 25'h009fb3c;
    stim[48] = 25'h078b075;
    stim[49] = 25'h023380c;
    stim[50] = 25'h0562c5a;
    stim[51] = 25'h033a473;
    stim[52] = 25'h003cefc;
    stim[53] = 25'h06457fb;
    stim[54] = 25'h0740533;
    stim[55] = 25'h047b6f8;
    stim[56] = 25'h0545f98;
    stim[57] = 25'h03a1f11;
    stim[58] = 25'h0379338;
    stim[59] = 25'h06ff7b6;
    stim[60] = 25'h083623e;
    stim[61] = 25'h003a4b7;
    stim[62] = 25'h0d6eb18;
    stim[63] = 25'h00d6621;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h6;
      expv[4] = 3'h6;
      expv[5] = 3'h4;
      expv[6] = 3'h6;
      expv[7] = 3'h6;
      expv[8] = 3'h4;
      expv[9] = 3'h6;
      expv[10] = 3'h6;
      expv[11] = 3'h4;
      expv[12] = 3'h6;
      expv[13] = 3'hx;
      expv[14] = 3'hx;
      expv[15] = 3'h6;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h6;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h6;
      expv[25] = 3'h4;
      expv[26] = 3'h6;
      expv[27] = 3'h4;
      expv[28] = 3'h6;
      expv[29] = 3'h6;
      expv[30] = 3'h6;
      expv[31] = 3'h6;
      expv[32] = 3'h6;
      expv[33] = 3'h7;
      expv[34] = 3'h6;
      expv[35] = 3'h4;
      expv[36] = 3'hx;
      expv[37] = 3'hx;
      expv[38] = 3'hx;
      expv[39] = 3'hx;
      expv[40] = 3'hx;
      expv[41] = 3'hx;
      expv[42] = 3'hx;
      expv[43] = 3'hx;
      expv[44] = 3'h6;
      expv[45] = 3'h4;
      expv[46] = 3'h6;
      expv[47] = 3'h6;
      expv[48] = 3'h4;
      expv[49] = 3'h6;
      expv[50] = 3'h4;
      expv[51] = 3'hx;
      expv[52] = 3'hx;
      expv[53] = 3'h4;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h4;
      expv[57] = 3'h6;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h6;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'h4;
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
