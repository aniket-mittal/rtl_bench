// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_512x52 dut (
    .CLK(clk),
    .A(in_vec[114:106]),
    .CEN(in_vec[105:105]),
    .D(in_vec[104:53]),
    .GWEN(in_vec[52:52]),
    .WEN(in_vec[51:0]),
    .Q(out_vec[51:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 115'h30b7c36a755f7965167bd796fcd70;
    stim[1] = 115'h209aeaf3b7caab3002256bc7eeca9;
    stim[2] = 115'h2cec2eac6e4bc6a20af75bdf8810a;
    stim[3] = 115'h17629ddc9130e52d17df5e02b15e7;
    stim[4] = 115'h62fd0e3e0007923090267569a336c;
    stim[5] = 115'h687474314668aa31b2b6b1893be50;
    stim[6] = 115'h45cd73e9bb468a4441c89296f189f;
    stim[7] = 115'h2d7fe71d60245d0827f6378c99bcf;
    stim[8] = 115'h77106dcdddcf5fbb556c4f66223e1;
    stim[9] = 115'h76b3ff20c6e1bf6afe640a2c6282f;
    stim[10] = 115'h096f2ce791e080b296f4eb4fbfb57;
    stim[11] = 115'h32bc2de0b601cd8116a2c77c672d4;
    stim[12] = 115'h25e906e896017b4da41264b1e6eef;
    stim[13] = 115'h689c5d5ea407916c119b6d4f351f0;
    stim[14] = 115'h07e86a8730f91b5f90785e9ba69c8;
    stim[15] = 115'h312ac4d91fda034aa93a05e7e313c;
    stim[16] = 115'h1a39f0da547de1281742a26f69563;
    stim[17] = 115'h226ed51c0071298124e9b12430eb3;
    stim[18] = 115'h716b6502f86e2d26f136c4c5d8eaf;
    stim[19] = 115'h112a1f46a2de5fbe309794cf53068;
    stim[20] = 115'h17a5c698a1d23afd885c336e1b701;
    stim[21] = 115'h0fb6431573ab43029b7668083a03a;
    stim[22] = 115'h0021327028009437137b51f1815ad;
    stim[23] = 115'h0d096d91b1f0780806a932d4db38a;
    stim[24] = 115'h557b90f6607d17439f2352d655fd5;
    stim[25] = 115'h5dbd099e2d19c8a2f2d1078fde86c;
    stim[26] = 115'h65da8935041e9dd08219116bb52d1;
    stim[27] = 115'h532d003a07bf266c83e444cd4b3ef;
    stim[28] = 115'h32d3726b241d3e40ba459c997236a;
    stim[29] = 115'h1f118f220476fd175d40267795f67;
    stim[30] = 115'h0175563da4b3e01fa8e8d96dee5fa;
    stim[31] = 115'h1beb195864b4f0d54808b04987b88;
    stim[32] = 115'h01fbf062a7e8d46f52fbc957802cc;
    stim[33] = 115'h00002ec32be48bcc7033bc44c1774;
    stim[34] = 115'h4eeba35396e22a8519184a22541de;
    stim[35] = 115'h23cd5eefce028bd4b5c291bf06acc;
    stim[36] = 115'h04c634ea2d887b9601c897c72db15;
    stim[37] = 115'h12fd1745859127ea832eebf7f8199;
    stim[38] = 115'h389870ddc01b57498fc60430fec68;
    stim[39] = 115'h00ca8bc41e30e979c9e175da6a4bd;
    stim[40] = 115'h45e4d99accee642973295e66a089f;
    stim[41] = 115'h584b3c962ef7b831a8e5e883801d2;
    stim[42] = 115'h5d100eb63ca031eaa8bda490929c5;
    stim[43] = 115'h6a23e405e4ae2a043f16ea2b84f7c;
    stim[44] = 115'h785de7cfc01fa2000aee7b95bbb0e;
    stim[45] = 115'h0020729becd8e2d51b146c59f71a5;
    stim[46] = 115'h6d6e0a332d6f02c686bc1c7aabc12;
    stim[47] = 115'h7c965b76840deed5e2168271a937c;
    stim[48] = 115'h63f4ac8f365966b8f2cffd052cb10;
    stim[49] = 115'h7222a95654b79af47cbd45645b936;
    stim[50] = 115'h38bda566305185bfcb377c3d9598a;
    stim[51] = 115'h72d3f7035480efd3cfc4a889d59d2;
    stim[52] = 115'h4e9da622494bfc9607d6658c699d2;
    stim[53] = 115'h2784ff433a57e86006541e2d4d838;
    stim[54] = 115'h64f233c3ec05787b2f270231003c2;
    stim[55] = 115'h55e1324c76a901f65ba672fd35de9;
    stim[56] = 115'h505155b3834e038779374a6c82648;
    stim[57] = 115'h421ead7c9dcb892a35ce87b88210e;
    stim[58] = 115'h4e3c855ce1b5c9fdfa278226a3051;
    stim[59] = 115'h38ca5449d576b07e13291df3655ba;
    stim[60] = 115'h6cd22751a06d975e47fdc898b427f;
    stim[61] = 115'h7e866a22e5758ab2d6ea27c229930;
    stim[62] = 115'h2be46775d61cf53dccd91e4bf5f87;
    stim[63] = 115'h615899566f21ec1815cf2701c8dce;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'hxxxxxxxxxxxxx;
      expv[2] = 52'hd7579dbe55598;
      expv[3] = 52'hd7579dbe55598;
      expv[4] = 52'hd7579dbe55598;
      expv[5] = 52'hd7579dbe55598;
      expv[6] = 52'hd7579dbe55598;
      expv[7] = 52'h6b9f4dda34522;
      expv[8] = 52'h6b9f4dda34522;
      expv[9] = 52'hxxxxxxxxxxxxx;
      expv[10] = 52'hxxxxxxxxxxxxx;
      expv[11] = 52'hxxxxxxxxxxxxx;
      expv[12] = 52'hxxxxxxxxxxxxx;
      expv[13] = 52'hxxxxxxxxxxxxx;
      expv[14] = 52'he2eaf5203c8b6;
      expv[15] = 52'he2eaf5203c8b6;
      expv[16] = 52'he2eaf5203c8b6;
      expv[17] = 52'he2eaf5203c8b6;
      expv[18] = 52'he2eaf5203c8b6;
      expv[19] = 52'he2eaf5203c8b6;
      expv[20] = 52'he2eaf5203c8b6;
      expv[21] = 52'he2eaf5203c8b6;
      expv[22] = 52'he2eaf5203c8b6;
      expv[23] = 52'he2eaf5203c8b6;
      expv[24] = 52'h4b6c8d8f83c04;
      expv[25] = 52'h4b6c8d8f83c04;
      expv[26] = 52'h4b6c8d8f83c04;
      expv[27] = 52'hxxxxxxxxxxxxx;
      expv[28] = 52'hxxxxxxxxxxxxx;
      expv[29] = 52'hxxxxxxx0e9f20;
      expv[30] = 52'hxxxxxxxxxxxxx;
      expv[31] = 52'hxxxxxxxxxxxxx;
      expv[32] = 52'hxxxxxxxxxxxxx;
      expv[33] = 52'hxxxxxxxxxxxxx;
      expv[34] = 52'h0176195f245e6;
      expv[35] = 52'h0176195f245e6;
      expv[36] = 52'hxxxxxxxxxxxxx;
      expv[37] = 52'h31a7516c43dcb;
      expv[38] = 52'h31a7516c43dcb;
      expv[39] = 52'hxxxxxxxxxxxxx;
      expv[40] = 52'hxxxxxxxxxxxxx;
      expv[41] = 52'hxxxxxxxxxxxxx;
      expv[42] = 52'hxxxxxxxxxxxxx;
      expv[43] = 52'hxxxxxxx5018f5;
      expv[44] = 52'hxxxxxxx5018f5;
      expv[45] = 52'hef3e7e00fd100;
      expv[46] = 52'hef3e7e00fd100;
      expv[47] = 52'hef3e7e00fd100;
      expv[48] = 52'hxxxxxxxxxxxxx;
      expv[49] = 52'hxxxxxxxxxxxxx;
      expv[50] = 52'hxxxxxxxxxxxxx;
      expv[51] = 52'hxxxxxxxxxxxxx;
      expv[52] = 52'hxxxxxxxxxxxxx;
      expv[53] = 52'hed31124a5fe4b;
      expv[54] = 52'h27fa19xxxxxxx;
      expv[55] = 52'h27fa19xxxxxxx;
      expv[56] = 52'h27fa19xxxxxxx;
      expv[57] = 52'hxxxxxxxxxxxxx;
      expv[58] = 52'hf56be4xxxxxxx;
      expv[59] = 52'hf56be4xxxxxxx;
      expv[60] = 52'h52a24exxxxxxx;
      expv[61] = 52'h913a8d036cbaf;
      expv[62] = 52'hxxxxxxxbac559;
      expv[63] = 52'hxxxxxxxbac559;
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
