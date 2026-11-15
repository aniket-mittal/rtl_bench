// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 143;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052936 dut (
    .clk(clk),
    .reset(in_vec[142:142]),
    .addra(in_vec[141:110]),
    .clka(in_vec[109:109]),
    .dina(in_vec[108:77]),
    .ena(in_vec[76:76]),
    .rsta(in_vec[75:75]),
    .wea(in_vec[74:71]),
    .addrb(in_vec[70:39]),
    .clkb(in_vec[38:38]),
    .dinb(in_vec[37:6]),
    .enb(in_vec[5:5]),
    .rstb(in_vec[4:4]),
    .web(in_vec[3:0]),
    .douta(out_vec[63:32]),
    .doutb(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 143'h5b6d55e230a2c21b98b05c5754ff2fc8ef55;
    stim[1] = 143'h783c73d7c5bad49e7b52b6a61c9e10f22ac7;
    stim[2] = 143'h0c5f85a6ce8686e8d2c17a269dac81ec222c;
    stim[3] = 143'h3d376b4bc20972cfde139e1b544112a321ac;
    stim[4] = 143'h0fe64ec7b16c340b2b81c6163f35d86e380d;
    stim[5] = 143'h3f22c50498a6bab95e8e45c083409380b002;
    stim[6] = 143'h329f12399b645fd6caf001475d989199b217;
    stim[7] = 143'h385a43aef94268b2969eca1b40dc8e338fc6;
    stim[8] = 143'h0c983c94e5e779ef61a7408479d3caa48088;
    stim[9] = 143'h2668b2854889927baded2f3382fda857a7b7;
    stim[10] = 143'h29c414cd9874c91cf462b2e7f26a452bf3aa;
    stim[11] = 143'h09d09ca980f31d5c0a8add0b20f0327177af;
    stim[12] = 143'h38d138d57a60765c47d2eb1c9655f526cd38;
    stim[13] = 143'h14e2409225992bdbccfb4a588305d955f257;
    stim[14] = 143'h0172a904e85b7c890689afb911520ee47cfc;
    stim[15] = 143'h288ca95d0fcf8d698f5618bbee4b7e9aa3a5;
    stim[16] = 143'h386563979c415a3ffca303ab90e5b9ac4192;
    stim[17] = 143'h288d371655f66c5ab88906466c76d1ea1a85;
    stim[18] = 143'h0b70c9585dc85d83bb17e58b335cf8c7d934;
    stim[19] = 143'h3bf8e5c4b998d3dfd4f1099b1454efa0f7ed;
    stim[20] = 143'h0244e56263d4d00bf1e826b3628e2629e6e5;
    stim[21] = 143'h1147fba8d5b899e2c4ca8fd58372cbc4888f;
    stim[22] = 143'h2f9ba610f051ab53efbe8a4be41b6a6faa8f;
    stim[23] = 143'h12cc21e7bb694766f25950bce9cc8f750ad0;
    stim[24] = 143'h1c56023082437f7551ab2da312eb2e987af1;
    stim[25] = 143'h17a5a06651309e95e3a4b82aaa67f0c6c702;
    stim[26] = 143'h1837c53436556468183da9ac62d90c161400;
    stim[27] = 143'h1168d5a074983df8e8b9b0da351cafa4ee9a;
    stim[28] = 143'h2b292b36cd525cbf98f1d42301dbb964bc97;
    stim[29] = 143'h3af7a98c9e36912e05bec62d1ed1f8059214;
    stim[30] = 143'h0998a228794d0dd8dd9eae9a428cf737c720;
    stim[31] = 143'h3c025a689a24199068ebe8d91f75dac37836;
    stim[32] = 143'h399291624942b5219a6f02eb12ea6d759b4f;
    stim[33] = 143'h218a8096ec3dd041aab8d76bfffe7d1f50dd;
    stim[34] = 143'h0e5508992044698d0756f64509044bac09c1;
    stim[35] = 143'h17537b1e135a05fcd5b2114bd0fd6b4ed5d9;
    stim[36] = 143'h00822219ecc78c304d28a40b353a65a8c368;
    stim[37] = 143'h13021a238656333b4f4020ec6da537484661;
    stim[38] = 143'h07b01cf2a7141650e0e4e9068bc50dbceb5f;
    stim[39] = 143'h204dc847a7501318d281661ce20ef5d31772;
    stim[40] = 143'h350a5864a1a98cf5f217138cdb1bd7e85cac;
    stim[41] = 143'h356a80ca0e5b8d5e0b4d45d6d09991726263;
    stim[42] = 143'h0c12034b9643aad2970292d4b3225724b1cd;
    stim[43] = 143'h23ddb4e95597e61ce427f4175db4afe5b2d8;
    stim[44] = 143'h255d047bce8bf33b6e086876715c46ca0649;
    stim[45] = 143'h0b4ef89138c51a3af84a729288f56a0e7646;
    stim[46] = 143'h09ec3ba656f98440b93a40e8b2051cb93bcf;
    stim[47] = 143'h077a11fb2565d72edb633ab8c0937a802445;
    stim[48] = 143'h27b5eac7e330caa3e6f838c405a9b66ee7fa;
    stim[49] = 143'h3b2fd87f6e3620c717bcaae811c288dfdcdb;
    stim[50] = 143'h3d33202c0b88afbd5df9b52f2a80a2c1b83f;
    stim[51] = 143'h30f9c9149ab9dca7e123741d78b75558bee6;
    stim[52] = 143'h2890a5d0c6a6157b5dbf2ff318ddd5a7fc1b;
    stim[53] = 143'h0f63a0cb11d8be0b3917ff253ab16b5e2687;
    stim[54] = 143'h137943ade1d090e55ed360fa39564fa0a571;
    stim[55] = 143'h2e48e96679d1bf45c27977a35d7c8c312121;
    stim[56] = 143'h31de108a41e0c361051a8a64f07b7c557c78;
    stim[57] = 143'h3e587a742b8960eccac0cd42fcaf810d182f;
    stim[58] = 143'h27c886b3235f21312f5470ef7eb4789f76d7;
    stim[59] = 143'h00a5f55f9f73617c6319b99a8ce1efa80d37;
    stim[60] = 143'h3d05dd8972d78733b93ded4fb9faa600ff22;
    stim[61] = 143'h23db49d654d6ed6c8ae1376c38e6229b4d34;
    stim[62] = 143'h2079ea3b44610617150f7eb6d091e3d57e65;
    stim[63] = 143'h104ea9de16ac1d7d8381a43af0660f55ae40;
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
      expv[0] = 64'hxxxxxxxx00000000;
      expv[1] = 64'hxxxxxxxx00000000;
      expv[2] = 64'hxxxxxxxx00000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'hxxxxxxxx00000000;
      expv[5] = 64'hxxxxxxxx00000000;
      expv[6] = 64'hxxxxxxxx00000000;
      expv[7] = 64'hxxxxxxxx00000000;
      expv[8] = 64'hxxxxxxxx00000000;
      expv[9] = 64'hxxxxxxxx00000000;
      expv[10] = 64'hxxxxxxxx00000000;
      expv[11] = 64'hxxxxxxxx00000000;
      expv[12] = 64'hxxxxxxxx00000000;
      expv[13] = 64'hxxxxxxxx00000000;
      expv[14] = 64'hxxxxxxxx00000000;
      expv[15] = 64'hxxxxxxxx00000000;
      expv[16] = 64'hxxxxxxxx00000000;
      expv[17] = 64'hxxxxxxxx00000000;
      expv[18] = 64'hxxxxxxxx00000000;
      expv[19] = 64'hxxxxxxxx00000000;
      expv[20] = 64'hxxxxxxxx00000000;
      expv[21] = 64'hxxxxxxxx00000000;
      expv[22] = 64'hxxxxxxxx00000000;
      expv[23] = 64'hxxxxxxxx00000000;
      expv[24] = 64'hxxxxxxxx00000000;
      expv[25] = 64'hxxxxxxxx00000000;
      expv[26] = 64'hxxxxxxxx00000000;
      expv[27] = 64'hxxxxxxxx00000000;
      expv[28] = 64'hxxxxxxxx00000000;
      expv[29] = 64'hxxxxxxxx00000000;
      expv[30] = 64'hxxxxxxxx00000000;
      expv[31] = 64'hxxxxxxxx00000000;
      expv[32] = 64'hxxxxxxxx00000000;
      expv[33] = 64'hxxxxxxxx00000000;
      expv[34] = 64'hxxxxxxxx00000000;
      expv[35] = 64'hxxxxxxxx00000000;
      expv[36] = 64'hxxxxxxxx00000000;
      expv[37] = 64'hxxxxxxxx00000000;
      expv[38] = 64'hxxxxxxxx00000000;
      expv[39] = 64'hxxxxxxxx00000000;
      expv[40] = 64'hxxxxxxxx00000000;
      expv[41] = 64'hxxxxxxxx00000000;
      expv[42] = 64'hxxxxxxxx00000000;
      expv[43] = 64'hxxxxxxxx00000000;
      expv[44] = 64'hxxxxxxxx00000000;
      expv[45] = 64'hxxxxxxxx00000000;
      expv[46] = 64'hxxxxxxxx00000000;
      expv[47] = 64'hxxxxxxxx00000000;
      expv[48] = 64'hxxxxxxxx00000000;
      expv[49] = 64'hxxxxxxxx00000000;
      expv[50] = 64'hxxxxxxxx00000000;
      expv[51] = 64'hxxxxxxxx00000000;
      expv[52] = 64'hxxxxxxxx00000000;
      expv[53] = 64'hxxxxxxxx00000000;
      expv[54] = 64'hxxxxxxxx00000000;
      expv[55] = 64'hxxxxxxxx00000000;
      expv[56] = 64'hxxxxxxxx00000000;
      expv[57] = 64'hxxxxxxxx00000000;
      expv[58] = 64'hxxxxxxxx00000000;
      expv[59] = 64'hxxxxxxxx00000000;
      expv[60] = 64'hxxxxxxxx00000000;
      expv[61] = 64'hxxxxxxxx00000000;
      expv[62] = 64'hxxxxxxxx00000000;
      expv[63] = 64'hxxxxxxxx00000000;
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
