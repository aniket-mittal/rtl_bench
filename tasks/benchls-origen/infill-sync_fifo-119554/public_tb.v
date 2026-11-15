// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119554 dut (
    .clk_i(clk),
    .rst_ni(in_vec[35:35]),
    .clr_i(in_vec[34:34]),
    .wvalid_i(in_vec[33:33]),
    .wdata_i(in_vec[32:1]),
    .rready_i(in_vec[0:0]),
    .wready_o(out_vec[36:36]),
    .rvalid_o(out_vec[35:35]),
    .rdata_o(out_vec[34:3]),
    .depth_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h73fa39fd3;
    stim[1] = 36'h3230b1613;
    stim[2] = 36'hca686ec5c;
    stim[3] = 36'hdbdfa3cc8;
    stim[4] = 36'hb3820188d;
    stim[5] = 36'hbc503946b;
    stim[6] = 36'h94ec6baac;
    stim[7] = 36'hf765ab32a;
    stim[8] = 36'hc0cdb4546;
    stim[9] = 36'hcdef8d76c;
    stim[10] = 36'hbcc000597;
    stim[11] = 36'hd8cd9290a;
    stim[12] = 36'hcb1a70b98;
    stim[13] = 36'ha3b8e04bf;
    stim[14] = 36'hb9ce08f56;
    stim[15] = 36'hf5086cc21;
    stim[16] = 36'h8af98d783;
    stim[17] = 36'h9dcb5dc40;
    stim[18] = 36'h885422ca0;
    stim[19] = 36'h8ad942d79;
    stim[20] = 36'he78ad7930;
    stim[21] = 36'hde16ba5af;
    stim[22] = 36'hf4ab49c1a;
    stim[23] = 36'hd25f7fc45;
    stim[24] = 36'hf54f5bc4b;
    stim[25] = 36'h992bdcf07;
    stim[26] = 36'hb14c2d291;
    stim[27] = 36'ha2f0ed2c6;
    stim[28] = 36'he2aff4d67;
    stim[29] = 36'hf5686ee3b;
    stim[30] = 36'hd2d5b25e2;
    stim[31] = 36'h86563b413;
    stim[32] = 36'hc686f269d;
    stim[33] = 36'hcb0725929;
    stim[34] = 36'hebe05b201;
    stim[35] = 36'h81650f16f;
    stim[36] = 36'hb9027c8f2;
    stim[37] = 36'hb8f495556;
    stim[38] = 36'hd1b8ae1bf;
    stim[39] = 36'h662f7a9ea;
    stim[40] = 36'hb587ffdc4;
    stim[41] = 36'hc71362785;
    stim[42] = 36'hde4f7f1bb;
    stim[43] = 36'hbaae1a2b5;
    stim[44] = 36'hf80426497;
    stim[45] = 36'hea90811c7;
    stim[46] = 36'hce67d71e8;
    stim[47] = 36'hd22134379;
    stim[48] = 36'hf7d5df646;
    stim[49] = 36'had2b9e5ac;
    stim[50] = 36'he83400aa2;
    stim[51] = 36'hd726411f4;
    stim[52] = 36'heb1bf4852;
    stim[53] = 36'h91c368dde;
    stim[54] = 36'hd135fd987;
    stim[55] = 36'he5e3181b8;
    stim[56] = 36'hbde79ae5c;
    stim[57] = 36'hd4bfb3f60;
    stim[58] = 36'hfabf0c55d;
    stim[59] = 36'hff32dd8f3;
    stim[60] = 36'he539e4835;
    stim[61] = 36'hc2bcc212e;
    stim[62] = 36'he81e775fb;
    stim[63] = 36'h9710bdbb9;
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
      expv[0] = 37'h1xxxxxxxxx;
      expv[1] = 37'h14fe8e7f48;
      expv[2] = 37'h148c2c5848;
      expv[3] = 37'h148c2c5848;
      expv[4] = 37'h148c2c5848;
      expv[5] = 37'h1ce0806231;
      expv[6] = 37'h1f140e51a9;
      expv[7] = 37'h1f140e51a9;
      expv[8] = 37'h14e0806230;
      expv[9] = 37'h14e0806230;
      expv[10] = 37'h14e0806230;
      expv[11] = 37'h1f30001659;
      expv[12] = 37'h1730001658;
      expv[13] = 37'h1730001658;
      expv[14] = 37'h18ee3812f9;
      expv[15] = 37'h18ee3812fa;
      expv[16] = 37'h10ee3812f8;
      expv[17] = 37'h10ee3812f8;
      expv[18] = 37'h10ee3812f8;
      expv[19] = 37'h10ee3812f8;
      expv[20] = 37'h10ee3812f8;
      expv[21] = 37'h11e2b5e4c0;
      expv[22] = 37'h11e2b5e4c0;
      expv[23] = 37'h152ad27068;
      expv[24] = 37'h152ad27068;
      expv[25] = 37'h1553d6f128;
      expv[26] = 37'h1553d6f128;
      expv[27] = 37'h1c530b4a41;
      expv[28] = 37'h1c530b4a42;
      expv[29] = 37'h14530b4a40;
      expv[30] = 37'h155a1bb8e8;
      expv[31] = 37'h155a1bb8e8;
      expv[32] = 37'h155a1bb8e8;
      expv[33] = 37'h155a1bb8e8;
      expv[34] = 37'h155a1bb8e8;
      expv[35] = 37'h12f816c800;
      expv[36] = 37'h12f816c800;
      expv[37] = 37'h1e409f23c9;
      expv[38] = 37'h1e409f23ca;
      expv[39] = 37'h16409f23c8;
      expv[40] = 37'h118bdea7a8;
      expv[41] = 37'h1d61fff711;
      expv[42] = 37'h1561fff710;
      expv[43] = 37'h1561fff710;
      expv[44] = 37'h1eab868ad1;
      expv[45] = 37'h16ab868ad0;
      expv[46] = 37'h12a4204718;
      expv[47] = 37'h12a4204718;
      expv[48] = 37'h12a4204718;
      expv[49] = 37'h15f577d918;
      expv[50] = 37'h1b4ae796b1;
      expv[51] = 37'h134ae796b0;
      expv[52] = 37'h134ae796b0;
      expv[53] = 37'h12c6fd2148;
      expv[54] = 37'h12c6fd2148;
      expv[55] = 37'h12c6fd2148;
      expv[56] = 37'h1178c606e0;
      expv[57] = 37'h1f79e6b971;
      expv[58] = 37'h1779e6b970;
      expv[59] = 37'h16afc31570;
      expv[60] = 37'h17ccb763c8;
      expv[61] = 37'h114e7920d0;
      expv[62] = 37'h114e7920d0;
      expv[63] = 37'h12079dd7e8;
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
