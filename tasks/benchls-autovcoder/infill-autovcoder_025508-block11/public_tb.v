// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025508 dut (
    .CLK(clk),
    .RST(in_vec[129:129]),
    .din(in_vec[128:1]),
    .empty(in_vec[0:0]),
    .rd_en(out_vec[13:13]),
    .da1(out_vec[12:7]),
    .da2(out_vec[6:1]),
    .da_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h3e3ce2b3e428eb80e818e3bc01c01c6be;
    stim[1] = 130'h3581f9ce9ae1be88e14a2e3a71f88028e;
    stim[2] = 130'h04eea1f934044e046970bcf63eb410a62;
    stim[3] = 130'h10e4a290b6a2313463b34176d40e9851c;
    stim[4] = 130'h12e96fc26495e076c8d0d9e2ee7e953f7;
    stim[5] = 130'h19e197a808b15814c4c3be9273566ae72;
    stim[6] = 130'h1ab9a5b283e656e5d9d6147de6a254376;
    stim[7] = 130'h04064c9f55e03723b78c87fb55507a6a8;
    stim[8] = 130'h18d84e44fbe50701a003cbb80c828a520;
    stim[9] = 130'h1d3409068f78dcfcd226408b8ecb83059;
    stim[10] = 130'h1ac30fe643fd6c129eea64217464e4327;
    stim[11] = 130'h00295daa950d3c088df5df3a73e3a5f98;
    stim[12] = 130'h08b6dece013aca97049c8d749ec63fe4a;
    stim[13] = 130'h0f925e19136b957ac190b8cef093c6b42;
    stim[14] = 130'h06dfb7321f1b8c78f93001d153b1721fa;
    stim[15] = 130'h0c892bed751471f032f6c9c93ad55ed42;
    stim[16] = 130'h181e55c9d168356be4b1f63d6fccc5713;
    stim[17] = 130'h004e8c35f52a9c5c7a3c82dd43bf6a81d;
    stim[18] = 130'h03d96d8b3869f286a8c2308b1de140462;
    stim[19] = 130'h17b10d3d6034b4c00ad83e8e7e469ab31;
    stim[20] = 130'h1b5cf6d9182adb3a232db20197ae8bbd5;
    stim[21] = 130'h047e6587d2ac7a823afe77ffd70cf12a7;
    stim[22] = 130'h1fd30ed6656a026cc7e9b5130c7cb7068;
    stim[23] = 130'h02bd6b5d77b9a3bf1a195a40982f36ea2;
    stim[24] = 130'h1445cd596d9cfc1afb3d2f694139a93ae;
    stim[25] = 130'h0b4523af07472f6a122ec4617587942f9;
    stim[26] = 130'h117b8bff7e84db94da94febe505dd1394;
    stim[27] = 130'h091f4ddf281527f38e1ae1ce8a1385249;
    stim[28] = 130'h006fc14372681f7e0018f4c0b46994087;
    stim[29] = 130'h1e241c560cb04cf8770cd599435eb869f;
    stim[30] = 130'h0e9aed313ca845f0966d20ebac198b101;
    stim[31] = 130'h160eb898ffe2cd3fbdc894a9973b97736;
    stim[32] = 130'h10a34a9c23575e46d6a94f6ebf5d0d1d9;
    stim[33] = 130'h0fb0e862fa0dddadbf5d56d529b6dcbce;
    stim[34] = 130'h106f00b42a42f35aee1d1afcd691343d2;
    stim[35] = 130'h17a101852be9a2435cc108bde7140ae13;
    stim[36] = 130'h0c587a1af007de517de77723363b3d6a3;
    stim[37] = 130'h0981f9f931a99d309ff9b26c7b0a5db11;
    stim[38] = 130'h18b7fd43d637dd3b6c2c8bee620eb3e24;
    stim[39] = 130'h026ec5f551f2fc0f8a621bc2ccd68a195;
    stim[40] = 130'h10d96ebcc3d1de9722a20584118c5a7ad;
    stim[41] = 130'h12976e76399b0402312bf9667f4da2238;
    stim[42] = 130'h1722526e52ef02c97586adcbc723cf29d;
    stim[43] = 130'h17f014638138313f2e1c307448b90e2d3;
    stim[44] = 130'h108d8804b8888ce83bfccd289bb04c81d;
    stim[45] = 130'h0e09d86dbe95e11b69714571a7425ecd3;
    stim[46] = 130'h1bad51076c39c85eaf585075dafe66b17;
    stim[47] = 130'h14e6e10e2a8e556d0aab3908f106ca874;
    stim[48] = 130'h095566bf4f10e2ec175239de962001cca;
    stim[49] = 130'h1511564022013f8978bfa0256b5a54cdd;
    stim[50] = 130'h00d4f304f5256d52690b8bd22854c181a;
    stim[51] = 130'h1a32ca60072edb136e04eaf65d4a35161;
    stim[52] = 130'h1da1b640ed765687f7714022c1e43e8f0;
    stim[53] = 130'h01d831ec84511993da64a202329f8a9c3;
    stim[54] = 130'h069c04537f241486df4483887d470379e;
    stim[55] = 130'h0b957b9fba87ce0b345327405f9c6fcd5;
    stim[56] = 130'h1a960968718d257401f9309bfaae69a5a;
    stim[57] = 130'h1e0cc1658955bae0ac9352642fd5b90f2;
    stim[58] = 130'h1800ef6c6fdf8f8ab3fe5eb18668c2b85;
    stim[59] = 130'h0012535b0e5436126c23417fc32501fd3;
    stim[60] = 130'h13819e92994be9cb726ceab1f2e89b097;
    stim[61] = 130'h13bb27826510b7af64d7dd0095679d93c;
    stim[62] = 130'h0982ca4ddb37f34682dfbb5bfa5af25c9;
    stim[63] = 130'h1b8077e49367d7651c2393a16bc77373d;
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
      expv[0] = 14'h0000;
      expv[1] = 14'hxxxx;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0000;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
