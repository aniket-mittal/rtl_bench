// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 84;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05098 dut (
    .clock(clk),
    .idle_NormaliseProd(in_vec[83:83]),
    .zout_NormaliseProd(in_vec[82:50]),
    .productout_NormaliseProd(in_vec[49:0]),
    .FinalProduct(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 84'h60025f038e0e0f565ab32;
    stim[1] = 84'h3f36f762731d8e1c44dbb;
    stim[2] = 84'h510e124cc633b4d593838;
    stim[3] = 84'h59bf693cf319452cc346b;
    stim[4] = 84'hc6b0d29f58ae7a0192f48;
    stim[5] = 84'h78ee19f7382aa71e03947;
    stim[6] = 84'ha344ba166c595487c8245;
    stim[7] = 84'hf94a9d5956ffb22e9617c;
    stim[8] = 84'hc9857c6dce27c3d010729;
    stim[9] = 84'hf4cc6bc48f089ad77e802;
    stim[10] = 84'h5e7bd16b579d33ec04b9f;
    stim[11] = 84'h26bf6fee4d254889d1df7;
    stim[12] = 84'h23c3968c50ee6ee2943cb;
    stim[13] = 84'hd5bd8094e32655e7b7006;
    stim[14] = 84'hd22634a68c1d982923b80;
    stim[15] = 84'h99e0e78c807db313685f5;
    stim[16] = 84'hb65c13fb7bcda9ed40756;
    stim[17] = 84'h8f376b0f23aad25d24f01;
    stim[18] = 84'h2e3fae97daceeafa154d3;
    stim[19] = 84'h0cfbf75028f99eefe8296;
    stim[20] = 84'hd997993b0330ee7a2a42d;
    stim[21] = 84'h9a3786551a32733330364;
    stim[22] = 84'h331be80fff11516407603;
    stim[23] = 84'h45d03edd3489bdf971389;
    stim[24] = 84'hcaa84fbab028b7e986ae8;
    stim[25] = 84'h48652c6fa36bad9ed34c0;
    stim[26] = 84'hdc1609b144d2e7bca5528;
    stim[27] = 84'he54883df29e9126b01795;
    stim[28] = 84'h4dfb9c83adb7a3ca86f6d;
    stim[29] = 84'h356aacc9cca9d744742d8;
    stim[30] = 84'h9717c875835ebfd28e50d;
    stim[31] = 84'h09013a2c698f77fd1cbc8;
    stim[32] = 84'hf3bdcf50ae75aafff12fc;
    stim[33] = 84'h2bed85bd0929c56b43a1f;
    stim[34] = 84'h5eb36be0050f9df6a3088;
    stim[35] = 84'h3de32041ac009d5d79bfe;
    stim[36] = 84'h66ae5b735c9022aca55e7;
    stim[37] = 84'h0f8c5eef2cd52067d850c;
    stim[38] = 84'h081e65893e53af7d3b6a1;
    stim[39] = 84'h6b1db3ed97d8aba72a541;
    stim[40] = 84'hb2cc1ff7687603759035f;
    stim[41] = 84'h2b8e3006c00a81269b614;
    stim[42] = 84'h7156345b331a9ac96bf74;
    stim[43] = 84'h8206446c754540a51d21a;
    stim[44] = 84'hcabbca1b485de559deded;
    stim[45] = 84'h27b66624cbebbd6b450b4;
    stim[46] = 84'h4b11973a7088d7624c593;
    stim[47] = 84'hcf4f9adf8c121f2255343;
    stim[48] = 84'h40367707cfd66c41b8626;
    stim[49] = 84'hd442e92b2dfd938ce9d78;
    stim[50] = 84'hc449ea6721ebb361a53ba;
    stim[51] = 84'h7baea5004c0b349ed5616;
    stim[52] = 84'h973ebf34c1cba2655c267;
    stim[53] = 84'ha96440eeb3a17899f36a1;
    stim[54] = 84'ha470f579f7d40397c636e;
    stim[55] = 84'h5969a52092ea7a3e69781;
    stim[56] = 84'h7f0d3942d499d1f2ab5f0;
    stim[57] = 84'hc335453656a3a398faca0;
    stim[58] = 84'he2f3f63829e9b44509f6a;
    stim[59] = 84'h02fb7a6b70dddc3a8f68d;
    stim[60] = 84'h18840225b3556cbb74144;
    stim[61] = 84'h7e338713e5f24499d6a0c;
    stim[62] = 84'hbb26c46a9407cd16868e1;
    stim[63] = 84'hf8bda9760f9be1ba16210;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hff897c0e;
      expv[2] = 32'h3ddbdd89;
      expv[3] = 32'he1b84933;
      expv[4] = 32'hf2fda4f3;
      expv[5] = 32'h8d61a53e;
      expv[6] = 32'hb13867dc;
      expv[7] = 32'h4689742c;
      expv[8] = 32'hf2953ab2;
      expv[9] = 32'h930af8db;
      expv[10] = 32'he998d789;
      expv[11] = 32'hfc6f45ad;
      expv[12] = 32'h0cfdbfb9;
      expv[13] = 32'h070e5a31;
      expv[14] = 32'hab7b0129;
      expv[15] = 32'ha44c694d;
      expv[16] = 32'h33c1cf19;
      expv[17] = 32'h6cb827f6;
      expv[18] = 32'h1e6ed61e;
      expv[19] = 32'h1bfeba5f;
      expv[20] = 32'h596fdd40;
      expv[21] = 32'hb32f3276;
      expv[22] = 32'h346f0caa;
      expv[23] = 32'h25efa03f;
      expv[24] = 32'hcb40fb74;
      expv[25] = 32'h95509f75;
      expv[26] = 32'hd014b1be;
      expv[27] = 32'hb82c1362;
      expv[28] = 32'hca9107be;
      expv[29] = 32'hdb6e720e;
      expv[30] = 32'h2a2ab327;
      expv[31] = 32'h2e2f90eb;
      expv[32] = 32'h5184e8b1;
      expv[33] = 32'he77b9ea1;
      expv[34] = 32'h173616f4;
      expv[35] = 32'hfccdaf80;
      expv[36] = 32'h3b0c8106;
      expv[37] = 32'h8cb96dcd;
      expv[38] = 32'h5eb17bbc;
      expv[39] = 32'h4ff99624;
      expv[40] = 32'h95f6cfb6;
      expv[41] = 32'h65983fee;
      expv[42] = 32'h16b8c01b;
      expv[43] = 32'ha258d16c;
      expv[44] = 32'h040c88d8;
      expv[45] = 32'h95779436;
      expv[46] = 32'h0ed99893;
      expv[47] = 32'hd5c65ce9;
      expv[48] = 32'h9e9f35bf;
      expv[49] = 32'hbfd9dc1f;
      expv[50] = 32'ha885d256;
      expv[51] = 32'h8893d4ce;
      expv[52] = 32'hb6ba9401;
      expv[53] = 32'h2e7d7e69;
      expv[54] = 32'h52c881dd;
      expv[55] = 32'h48e1eaf3;
      expv[56] = 32'hf2269482;
      expv[57] = 32'hbdb4e50b;
      expv[58] = 32'h866a8a6c;
      expv[59] = 32'hc5e7ec70;
      expv[60] = 32'h456de9ad;
      expv[61] = 32'h70900896;
      expv[62] = 32'hbbce1c4f;
      expv[63] = 32'h764d88d5;
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
