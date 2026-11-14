// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fixed_point_adder dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h4ab21f550f38e1f0;
    stim[1] = 64'h1ca86e3c6eb6816f;
    stim[2] = 64'h8aeddab0a9cebc7c;
    stim[3] = 64'hdc0c5db7c306905a;
    stim[4] = 64'hca3f6893866a6eb3;
    stim[5] = 64'h06c904e7444aaa4a;
    stim[6] = 64'hd1ac562fa2bc774e;
    stim[7] = 64'h8e118ee3dc13653c;
    stim[8] = 64'hed7255f35c92f4d1;
    stim[9] = 64'h8a4b0b315b741bcd;
    stim[10] = 64'haadbb98d37831f60;
    stim[11] = 64'hd73fe688797f44c4;
    stim[12] = 64'h1fad1bc36b593ccf;
    stim[13] = 64'h3c820fbdf595cc86;
    stim[14] = 64'hc98379570dd8b7bd;
    stim[15] = 64'hc02380727ceda745;
    stim[16] = 64'h7a832cf4259b31dd;
    stim[17] = 64'hf7c2ed6b0535125e;
    stim[18] = 64'hb20a959dfc69aab1;
    stim[19] = 64'h14614a25f647713e;
    stim[20] = 64'h3dcb88a2ef10fadc;
    stim[21] = 64'h6b0edba9f7053b7e;
    stim[22] = 64'hc884d656dfedccb8;
    stim[23] = 64'hf6085d9fb37d4603;
    stim[24] = 64'h1d7b8540181cbe29;
    stim[25] = 64'h263b44443836cc25;
    stim[26] = 64'hb62094826f9b68cc;
    stim[27] = 64'hf92d25ec2ef24806;
    stim[28] = 64'h2fa014bc41ec0ba8;
    stim[29] = 64'h559ce5c418868315;
    stim[30] = 64'hc415490fcf8f64ca;
    stim[31] = 64'h035c0705ed687046;
    stim[32] = 64'h4bef28360287104e;
    stim[33] = 64'h9945bbdd5f9a4ae2;
    stim[34] = 64'h6f78eba272a462b3;
    stim[35] = 64'h5cea75eff8c814aa;
    stim[36] = 64'h176039a5e1049490;
    stim[37] = 64'heeead9876054f1cf;
    stim[38] = 64'hb9f1c7c01cc8360c;
    stim[39] = 64'h4af4324a6d3ea347;
    stim[40] = 64'h605548c3870b3ba7;
    stim[41] = 64'h1bb448e477aa07c0;
    stim[42] = 64'he65a4519c24da80f;
    stim[43] = 64'hda62c86160e95669;
    stim[44] = 64'h89de2bf925b2f72b;
    stim[45] = 64'hc74d9c3cff5bf4f1;
    stim[46] = 64'h09fb3679443d3f4c;
    stim[47] = 64'h796a8ad7b478e864;
    stim[48] = 64'h6e1a7520c2f34b37;
    stim[49] = 64'he0e219ad9d788205;
    stim[50] = 64'h349eafe3cc4fdf95;
    stim[51] = 64'h1bbdbd0bdf2003c8;
    stim[52] = 64'h18d1793967b2b1a3;
    stim[53] = 64'h4230eabad6821abe;
    stim[54] = 64'h277da17707be4443;
    stim[55] = 64'hcd81dce95e7e5e36;
    stim[56] = 64'hc42ae6bc3b6639b4;
    stim[57] = 64'h07ad1b76b6692cce;
    stim[58] = 64'hb9c3e63363ff86e0;
    stim[59] = 64'hf1f77bb6ac504a59;
    stim[60] = 64'hd69d669eb620ec63;
    stim[61] = 64'he67f7177eee1569a;
    stim[62] = 64'hefabb61a901f9477;
    stim[63] = 64'h139895e041ef79c6;
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
      expv[0] = 32'h59eb0145;
      expv[1] = 32'h0b5eefab;
      expv[2] = 32'hb4bc972c;
      expv[3] = 32'h9f12ee11;
      expv[4] = 32'hd0a9d746;
      expv[5] = 32'h4b13af31;
      expv[6] = 32'hf468cd7d;
      expv[7] = 32'hea24f41f;
      expv[8] = 32'h90df6122;
      expv[9] = 32'h5129109c;
      expv[10] = 32'h0ca765d3;
      expv[11] = 32'h223f5e3c;
      expv[12] = 32'h0b065892;
      expv[13] = 32'hb913bcc9;
      expv[14] = 32'hbbaac19a;
      expv[15] = 32'h3cca26d3;
      expv[16] = 32'h201e5ed1;
      expv[17] = 32'hf28ddb0d;
      expv[18] = 32'hae74404e;
      expv[19] = 32'he1e62719;
      expv[20] = 32'hb145723a;
      expv[21] = 32'h8bf65fd5;
      expv[22] = 32'ha872a30e;
      expv[23] = 32'ha985a3a2;
      expv[24] = 32'h35984369;
      expv[25] = 32'h5e721069;
      expv[26] = 32'h397ad44a;
      expv[27] = 32'hca3adde6;
      expv[28] = 32'h718c2064;
      expv[29] = 32'h6e2368d9;
      expv[30] = 32'h93a4add9;
      expv[31] = 32'hea0c6941;
      expv[32] = 32'h4e763884;
      expv[33] = 32'h46548f05;
      expv[34] = 32'h621d4e55;
      expv[35] = 32'h9bdd9ebb;
      expv[36] = 32'hc9a45aeb;
      expv[37] = 32'h8e95e7b8;
      expv[38] = 32'h9d2991b4;
      expv[39] = 32'h3832d591;
      expv[40] = 32'h594a0d1c;
      expv[41] = 32'h135e50a4;
      expv[42] = 32'ha8a7ed28;
      expv[43] = 32'h06868e08;
      expv[44] = 32'h1bd4cb32;
      expv[45] = 32'hc6a9912d;
      expv[46] = 32'h4e3875c5;
      expv[47] = 32'h44f1a273;
      expv[48] = 32'h2b2729e9;
      expv[49] = 32'hfe5a9bb2;
      expv[50] = 32'h97b12fb2;
      expv[51] = 32'hc36246bd;
      expv[52] = 32'h00842adc;
      expv[53] = 32'h94513004;
      expv[54] = 32'h2f3be5ba;
      expv[55] = 32'h10fc814d;
      expv[56] = 32'h88c4ad08;
      expv[57] = 32'haebc1158;
      expv[58] = 32'h2a3ba0ad;
      expv[59] = 32'h9e47c60f;
      expv[60] = 32'h8cbe5301;
      expv[61] = 32'hd560c811;
      expv[62] = 32'hffcb4a91;
      expv[63] = 32'h55880fa6;
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
