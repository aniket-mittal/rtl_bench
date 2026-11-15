// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158734 dut (
    .clk(clk),
    .in_A(in_vec[33:18]),
    .in_B(in_vec[17:2]),
    .in_En(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .out_Out(out_vec[16:1]),
    .out_Ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3425b6747;
    stim[1] = 34'h237160f37;
    stim[2] = 34'h04a5b0878;
    stim[3] = 34'h2cc26e1c8;
    stim[4] = 34'h1bdc70548;
    stim[5] = 34'h3d6851a56;
    stim[6] = 34'h35e5da64a;
    stim[7] = 34'h139ff28e2;
    stim[8] = 34'h05d8c203a;
    stim[9] = 34'h298790b76;
    stim[10] = 34'h0081ca904;
    stim[11] = 34'h33f0245c4;
    stim[12] = 34'h139ddfa8a;
    stim[13] = 34'h02a5858f8;
    stim[14] = 34'h39263d200;
    stim[15] = 34'h2d2c2f3f6;
    stim[16] = 34'h1a662a930;
    stim[17] = 34'h251ecb550;
    stim[18] = 34'h162a64a42;
    stim[19] = 34'h37ef79c0c;
    stim[20] = 34'h209fa4e36;
    stim[21] = 34'h07b273c50;
    stim[22] = 34'h0710e9370;
    stim[23] = 34'h387af6cec;
    stim[24] = 34'h1350e58d2;
    stim[25] = 34'h06c940d7a;
    stim[26] = 34'h1420885fa;
    stim[27] = 34'h3c585e8d8;
    stim[28] = 34'h145601368;
    stim[29] = 34'h042fea706;
    stim[30] = 34'h3448eb83a;
    stim[31] = 34'h3ac4acfa0;
    stim[32] = 34'h1911f00ee;
    stim[33] = 34'h20b16eb04;
    stim[34] = 34'h38740add2;
    stim[35] = 34'h17d8941ac;
    stim[36] = 34'h388ea19fe;
    stim[37] = 34'h2629261e4;
    stim[38] = 34'h143ea24a0;
    stim[39] = 34'h31f708ed8;
    stim[40] = 34'h0fff1bfd0;
    stim[41] = 34'h0aa28dfcc;
    stim[42] = 34'h1fade0bd4;
    stim[43] = 34'h09f695c60;
    stim[44] = 34'h02413ca64;
    stim[45] = 34'h287188e04;
    stim[46] = 34'h271ebc4fc;
    stim[47] = 34'h0e6eb77ca;
    stim[48] = 34'h2f6da685c;
    stim[49] = 34'h2593dc76a;
    stim[50] = 34'h2cc10a4ca;
    stim[51] = 34'h217b71e9e;
    stim[52] = 34'h0dcc497ce;
    stim[53] = 34'h14e95c330;
    stim[54] = 34'h35ed79c9c;
    stim[55] = 34'h3e0e28244;
    stim[56] = 34'h38c3502c6;
    stim[57] = 34'h229f92a1a;
    stim[58] = 34'h05ac222f8;
    stim[59] = 34'h1f335fbba;
    stim[60] = 34'h332dc5962;
    stim[61] = 34'h355983aa6;
    stim[62] = 34'h2a514218a;
    stim[63] = 34'h3abd44118;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h1fa1b;
      expv[7] = 17'h102d1;
      expv[8] = 17'h1b2c5;
      expv[9] = 17'h0c017;
      expv[10] = 17'h15307;
      expv[11] = 17'h15307;
      expv[12] = 17'h15307;
      expv[13] = 17'h01b3f;
      expv[14] = 17'h01b3f;
      expv[15] = 17'h01b3f;
      expv[16] = 17'h06857;
      expv[17] = 17'h06857;
      expv[18] = 17'h06857;
      expv[19] = 17'h158d9;
      expv[20] = 17'h158d9;
      expv[21] = 17'h0ac6d;
      expv[22] = 17'h0ac6d;
      expv[23] = 17'h0ac6d;
      expv[24] = 17'h0ac6d;
      expv[25] = 17'h14963;
      expv[26] = 17'h0bd4b;
      expv[27] = 17'h06861;
      expv[28] = 17'h06861;
      expv[29] = 17'h06861;
      expv[30] = 17'h1f8a7;
      expv[31] = 17'h0812b;
      expv[32] = 17'h0812b;
      expv[33] = 17'h1d009;
      expv[34] = 17'h1d009;
      expv[35] = 17'h19b21;
      expv[36] = 17'h19b21;
      expv[37] = 17'h052c7;
      expv[38] = 17'h052c7;
      expv[39] = 17'h052c7;
      expv[40] = 17'h052c7;
      expv[41] = 17'h052c7;
      expv[42] = 17'h052c7;
      expv[43] = 17'h052c7;
      expv[44] = 17'h052c7;
      expv[45] = 17'h052c7;
      expv[46] = 17'h052c7;
      expv[47] = 17'h052c7;
      expv[48] = 17'h1b1ad;
      expv[49] = 17'h1b1ad;
      expv[50] = 17'h19223;
      expv[51] = 17'h139cd;
      expv[52] = 17'h01b85;
      expv[53] = 17'h03b1d;
      expv[54] = 17'h03b1d;
      expv[55] = 17'h03b1d;
      expv[56] = 17'h03b1d;
      expv[57] = 17'h1c90d;
      expv[58] = 17'h12b25;
      expv[59] = 17'h12b25;
      expv[60] = 17'h0792d;
      expv[61] = 17'h148d7;
      expv[62] = 17'h149dd;
      expv[63] = 17'h1e83f;
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
