// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041270 dut (
    .original_data(in_vec[36:5]),
    .loadtype(in_vec[4:2]),
    .addr_low(in_vec[1:0]),
    .final_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1bef383f25;
    stim[1] = 37'h0a3d0f519e;
    stim[2] = 37'h1f1c7de6ad;
    stim[3] = 37'h152dac471f;
    stim[4] = 37'h06c1dcbae2;
    stim[5] = 37'h127f749800;
    stim[6] = 37'h1f33e99aca;
    stim[7] = 37'h11a44d0be6;
    stim[8] = 37'h1c3f7f26a5;
    stim[9] = 37'h1e0db63118;
    stim[10] = 37'h1edc1e2966;
    stim[11] = 37'h1a83bc4543;
    stim[12] = 37'h03cd7d2f00;
    stim[13] = 37'h003b3f9cdb;
    stim[14] = 37'h1f6738a920;
    stim[15] = 37'h1bb599cb7d;
    stim[16] = 37'h0c6c0f649f;
    stim[17] = 37'h111fc4d6c5;
    stim[18] = 37'h1ac198b867;
    stim[19] = 37'h1e091d0e2e;
    stim[20] = 37'h10a20ffcd2;
    stim[21] = 37'h0eacdb7198;
    stim[22] = 37'h143eb4ae46;
    stim[23] = 37'h0db8119a6b;
    stim[24] = 37'h0fab25883f;
    stim[25] = 37'h0c39294980;
    stim[26] = 37'h1b3a6f28c4;
    stim[27] = 37'h1226d505cb;
    stim[28] = 37'h06ddeebb3b;
    stim[29] = 37'h112a291337;
    stim[30] = 37'h001c5b1dd5;
    stim[31] = 37'h0ca6d56277;
    stim[32] = 37'h18cd09b806;
    stim[33] = 37'h013875a70a;
    stim[34] = 37'h175cbfc478;
    stim[35] = 37'h1f88f9605b;
    stim[36] = 37'h1edab2fea7;
    stim[37] = 37'h0b47c07618;
    stim[38] = 37'h0cb05d1563;
    stim[39] = 37'h0293ed97ba;
    stim[40] = 37'h1ef74f7d1e;
    stim[41] = 37'h15fb8b8d41;
    stim[42] = 37'h0d0cd16e7e;
    stim[43] = 37'h1db1a51c7a;
    stim[44] = 37'h09db9d88b2;
    stim[45] = 37'h098484a485;
    stim[46] = 37'h1a71067b7d;
    stim[47] = 37'h087c2ef339;
    stim[48] = 37'h01a577ed1f;
    stim[49] = 37'h11973a34ec;
    stim[50] = 37'h054a230c50;
    stim[51] = 37'h1ab35ed747;
    stim[52] = 37'h03d7d3ca25;
    stim[53] = 37'h0b9ffad61b;
    stim[54] = 37'h18a36a278f;
    stim[55] = 37'h1c927dfd60;
    stim[56] = 37'h0ff5394024;
    stim[57] = 37'h1b173f90d8;
    stim[58] = 37'h1c8aa5570c;
    stim[59] = 37'h13d32a289a;
    stim[60] = 37'h091fe0de48;
    stim[61] = 37'h0bdb60e756;
    stim[62] = 37'h13bc1f087a;
    stim[63] = 37'h155c6b0b01;
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
      expv[0] = 32'h000000c1;
      expv[1] = 32'h00000000;
      expv[2] = 32'h0000ef35;
      expv[3] = 32'h00000000;
      expv[4] = 32'h0000000e;
      expv[5] = 32'hffffffc0;
      expv[6] = 32'hfffff99f;
      expv[7] = 32'h00000022;
      expv[8] = 32'h000000f9;
      expv[9] = 32'h00000000;
      expv[10] = 32'h000000e0;
      expv[11] = 32'hffffffd4;
      expv[12] = 32'h00000078;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000049;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000026;
      expv[18] = 32'h000000d6;
      expv[19] = 32'h0000f048;
      expv[20] = 32'h85107fe6;
      expv[21] = 32'h00000000;
      expv[22] = 32'h000000f5;
      expv[23] = 32'h00006dc0;
      expv[24] = 32'h00000000;
      expv[25] = 32'h0000004c;
      expv[26] = 32'h00000046;
      expv[27] = 32'hffff9136;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000068;
      expv[33] = 32'h000009c3;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h000000f6;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000065;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h0000005c;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h4edcec45;
      expv[45] = 32'h00000025;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h0000d1a7;
      expv[50] = 32'h2a511862;
      expv[51] = 32'h000000d5;
      expv[52] = 32'h0000009e;
      expv[53] = 32'h00000000;
      expv[54] = 32'h0000c51b;
      expv[55] = 32'hffffffeb;
      expv[56] = 32'h00000001;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00002ab8;
      expv[59] = 32'h00000000;
      expv[60] = 32'h000006f2;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000058;
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
