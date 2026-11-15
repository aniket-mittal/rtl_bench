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

  autovcoder_043999 dut (
    .i_c0(in_vec[33:33]),
    .i_pk(in_vec[32:17]),
    .i_gk(in_vec[16:1]),
    .i_p_addn(in_vec[0:0]),
    .o_s(out_vec[16:1]),
    .o_carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h16812b072;
    stim[1] = 34'h38be8fe1a;
    stim[2] = 34'h164f07674;
    stim[3] = 34'h093144af0;
    stim[4] = 34'h0dc074b50;
    stim[5] = 34'h0722f5de8;
    stim[6] = 34'h2b1994160;
    stim[7] = 34'h06cc79b1c;
    stim[8] = 34'h34cc53939;
    stim[9] = 34'h07be66fbb;
    stim[10] = 34'h2811c714e;
    stim[11] = 34'h373f409db;
    stim[12] = 34'h1d30e4a0b;
    stim[13] = 34'h0310f5831;
    stim[14] = 34'h2ce51599a;
    stim[15] = 34'h25d61c45e;
    stim[16] = 34'h2f410d1a2;
    stim[17] = 34'h2c907c5b2;
    stim[18] = 34'h07d2a1d9e;
    stim[19] = 34'h124895088;
    stim[20] = 34'h00ae4e6b5;
    stim[21] = 34'h219b910e4;
    stim[22] = 34'h3dddb6041;
    stim[23] = 34'h388839367;
    stim[24] = 34'h22b62e514;
    stim[25] = 34'h32cf8aa7c;
    stim[26] = 34'h351ea3338;
    stim[27] = 34'h1e1eae0b2;
    stim[28] = 34'h2eee21583;
    stim[29] = 34'h040cba762;
    stim[30] = 34'h1cedf5d68;
    stim[31] = 34'h0660d48b1;
    stim[32] = 34'h0fd433ca6;
    stim[33] = 34'h223ec550e;
    stim[34] = 34'h389c96e00;
    stim[35] = 34'h06098d179;
    stim[36] = 34'h15a4e09f3;
    stim[37] = 34'h3bb749bf6;
    stim[38] = 34'h109a1508d;
    stim[39] = 34'h0d8e646da;
    stim[40] = 34'h235f54b5a;
    stim[41] = 34'h1f2c5c169;
    stim[42] = 34'h17250a472;
    stim[43] = 34'h0b38ade58;
    stim[44] = 34'h249a6f191;
    stim[45] = 34'h3df2a3831;
    stim[46] = 34'h17923a0c0;
    stim[47] = 34'h04e5fe054;
    stim[48] = 34'h390b62a36;
    stim[49] = 34'h354d7f31b;
    stim[50] = 34'h1297b61e0;
    stim[51] = 34'h013588dc4;
    stim[52] = 34'h3f862bbe5;
    stim[53] = 34'h0c84225f0;
    stim[54] = 34'h1c5cfc103;
    stim[55] = 34'h08fa4dcb4;
    stim[56] = 34'h284839cb1;
    stim[57] = 34'h3c304ec78;
    stim[58] = 34'h1137ca9b7;
    stim[59] = 34'h0ff4fb36f;
    stim[60] = 34'h12c8c6be4;
    stim[61] = 34'h19abb5e24;
    stim[62] = 34'h328e5db56;
    stim[63] = 34'h354cf094a;
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
      expv[0] = 17'h008f6;
      expv[1] = 17'h077de;
      expv[2] = 17'h18818;
      expv[3] = 17'h006f4;
      expv[4] = 17'h04aa7;
      expv[5] = 17'h0c9ff;
      expv[6] = 17'h0335b;
      expv[7] = 17'h15aff;
      expv[8] = 17'h13eb7;
      expv[9] = 17'h0a492;
      expv[10] = 17'h06382;
      expv[11] = 17'h16043;
      expv[12] = 17'h1471a;
      expv[13] = 17'h0816f;
      expv[14] = 17'h07d67;
      expv[15] = 17'h1d5df;
      expv[16] = 17'h15756;
      expv[17] = 17'h14261;
      expv[18] = 17'h04616;
      expv[19] = 17'h18599;
      expv[20] = 17'h1c78c;
      expv[21] = 17'h03873;
      expv[22] = 17'h11d59;
      expv[23] = 17'h0ae4d;
      expv[24] = 17'h1e148;
      expv[25] = 17'h07802;
      expv[26] = 17'h13798;
      expv[27] = 17'h0208e;
      expv[28] = 17'h0c5e5;
      expv[29] = 17'h10e0f;
      expv[30] = 17'h1740f;
      expv[31] = 17'h0f76d;
      expv[32] = 17'h0840f;
      expv[33] = 17'h089f2;
      expv[34] = 17'h155cb;
      expv[35] = 17'h1c268;
      expv[36] = 17'h149aa;
      expv[37] = 17'h08c9a;
      expv[38] = 17'h1a8b9;
      expv[39] = 17'h05552;
      expv[40] = 17'h0a343;
      expv[41] = 17'h07015;
      expv[42] = 17'h03ab4;
      expv[43] = 17'h10f3a;
      expv[44] = 17'h1aa85;
      expv[45] = 17'h1af49;
      expv[46] = 17'h038a3;
      expv[47] = 17'h18ef7;
      expv[48] = 17'h1c4d8;
      expv[49] = 17'h0b2e1;
      expv[50] = 17'h1eabb;
      expv[51] = 17'h108d0;
      expv[52] = 17'h08fa9;
      expv[53] = 17'h083a2;
      expv[54] = 17'h047cb;
      expv[55] = 17'h136cc;
      expv[56] = 17'h1bde1;
      expv[57] = 17'h01bf6;
      expv[58] = 17'h04010;
      expv[59] = 17'h19993;
      expv[60] = 17'h1fb44;
      expv[61] = 17'h126f3;
      expv[62] = 17'h09e4b;
      expv[63] = 17'h14659;
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
