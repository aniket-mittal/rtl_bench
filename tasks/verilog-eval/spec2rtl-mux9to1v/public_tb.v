// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 148;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[147:132]),
    .b(in_vec[131:116]),
    .c(in_vec[115:100]),
    .d(in_vec[99:84]),
    .e(in_vec[83:68]),
    .f(in_vec[67:52]),
    .g(in_vec[51:36]),
    .h(in_vec[35:20]),
    .i(in_vec[19:4]),
    .sel(in_vec[3:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 148'h445ba949983c5b5ac2307f583a2490e38e1b8;
    stim[1] = 148'h1aba2ed25d875700dbe5bf9faf7f662d42cc3;
    stim[2] = 148'h9a35fdc72eb212f1beb7599192fb331354954;
    stim[3] = 148'h9d200d2c4fab5807ae0bcb3ce3f8b6100804c;
    stim[4] = 148'ha3d71b574320c053c9f19fd29f20af264b965;
    stim[5] = 148'h6d39b8b669fc24272a048442caeb1b81f7234;
    stim[6] = 148'hdb9aab4f357a01d3ff9d185e471c558c6792f;
    stim[7] = 148'he4220cf79983924e00466f924044da55fbb6b;
    stim[8] = 148'haf10714f3dcd45d4195d226c54a88daf78291;
    stim[9] = 148'h47e9867e8c99bd36d8d358f5cb2b80c8e370b;
    stim[10] = 148'h1cf913243e276fb65db9036bcc29c649460ff;
    stim[11] = 148'h110754073da1853210d937a34493d84b84d26;
    stim[12] = 148'hab8aee306ead33ce8db2ffffb2bcbf2d76384;
    stim[13] = 148'h56db5bd99aa4577e551a10b12d9e3802aa897;
    stim[14] = 148'ha134033ee2e5eafdb8a2e52c4877bb7d15962;
    stim[15] = 148'h38330cb44bc315b4af0b489fe7f571997aef0;
    stim[16] = 148'h2c6a4a4869e2234cbcfacec45e5b5f3f6cda7;
    stim[17] = 148'hb1e993434bc5b9810fae432650fa785b9adb5;
    stim[18] = 148'h7f52b30f8b9c4d965b4dcfc34d852a1f3fd28;
    stim[19] = 148'hdf261cfd38c89611993112e328ea524bf0969;
    stim[20] = 148'h14807c91735b824797189b247188763dd6e16;
    stim[21] = 148'h1b2d63b557307ab8d3c9e384228b32ff5aa4c;
    stim[22] = 148'h1a427f786ee90e57bb523a9ede588a9c18221;
    stim[23] = 148'h6090af578d287e25b905ba0700dcb76836443;
    stim[24] = 148'h74f1bb25e0b1c52ff53858e1b49248ac50b5c;
    stim[25] = 148'hd27da524a6651f92aeb971f4b0e12b60c4108;
    stim[26] = 148'h1b7f08383b56735a7a48a540cbc6971f0bbf4;
    stim[27] = 148'h52cbc3a14824e05154d7504c568c4708adc00;
    stim[28] = 148'h2874bb50ea788b4004bfe215c9842f1d406ea;
    stim[29] = 148'hfef5bc92e4f8cb21cd4e1475770d9ff8541dd;
    stim[30] = 148'he87e92f9a9dc323851ec315dfeb446882a4c5;
    stim[31] = 148'h102911427e8b002069d81b80b1c1fabc00894;
    stim[32] = 148'ha357b8eb592dabb0d5e5b142424a1f28b8dd3;
    stim[33] = 148'hefc71996ec42849a81f16914ffeed24984880;
    stim[34] = 148'h17470b07b1116deed2ec9d3faa77dd132f010;
    stim[35] = 148'hd0a6861c6716d6479683aecfb0654cfacb009;
    stim[36] = 148'h749ef6d0c3f0951d6345351d9e4fba3dccdbe;
    stim[37] = 148'hc81fa4a57d97dc41f534b1927780e3d69b64f;
    stim[38] = 148'h38b06450cf37cfe533196070e49fdba80faf3;
    stim[39] = 148'h8de5ce68057d3161032d1b5c81775c299aac7;
    stim[40] = 148'h25a8b9a6c6cf5c2a29c1a9ee1b02a33bd2241;
    stim[41] = 148'h2e7f8732246ebc51fbf9831e0a7f2bad5734c;
    stim[42] = 148'h3b8e10a620fddc11e256ca53113aa0b9be154;
    stim[43] = 148'h9eb8c8595bc4b514c0f22271a618c0641515f;
    stim[44] = 148'h7a6c2f314569aeb44f1b6b6c440909f9ecbcb;
    stim[45] = 148'hf9c5a2d16319bb4b871e8d78f8e845b787748;
    stim[46] = 148'h43a7f2f9d20c2645a6bc67448fff903f63545;
    stim[47] = 148'h5ccd2fe21b0054b332a31c4d6ed83358404f9;
    stim[48] = 148'h98f599d52216ce340ca59d05ee2735203b82c;
    stim[49] = 148'h851eed507e75ac9a996ab9ce1b92a15bd65e4;
    stim[50] = 148'h15db8e376334d6d12dbfeaf267f8e4e6cb38e;
    stim[51] = 148'h71b65385c4620091be54c0322fb5685096de6;
    stim[52] = 148'he48989dd73a82697eff6788031b1b2753fd13;
    stim[53] = 148'hbbb8472683442e9ca397f1fbdbb80e51eba67;
    stim[54] = 148'hdf772390f8c0a145e5afa3791a324c0517125;
    stim[55] = 148'h5fa630e0274eeab55dbb4d7a6a3ad62d33891;
    stim[56] = 148'h0ecf7c2f7763929127dc6bd9e29493cb28b60;
    stim[57] = 148'h20b4f03fa17847b1c562fde392ff992d7c504;
    stim[58] = 148'hb90273382a89e5c7f82c8f5f258f5cd965858;
    stim[59] = 148'h31edaacc2d9477a3b933228c74604f8b8098a;
    stim[60] = 148'h5e0b960037e8089bb4ccb93f3b8a55017c16e;
    stim[61] = 148'hfbb36ae2d759d7515c84eaf8104ecaba62a65;
    stim[62] = 148'h200268a2877313538ff78c6a640b227737740;
    stim[63] = 148'h04545a14de1260e83651d4c224d5811708bc3;
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
      expv[0] = 16'h8e1b;
      expv[1] = 16'h5700;
      expv[2] = 16'hbeb7;
      expv[3] = 16'hffff;
      expv[4] = 16'h9fd2;
      expv[5] = 16'h2a04;
      expv[6] = 16'hffff;
      expv[7] = 16'hffff;
      expv[8] = 16'h714f;
      expv[9] = 16'hffff;
      expv[10] = 16'hffff;
      expv[11] = 16'h4493;
      expv[12] = 16'h8db2;
      expv[13] = 16'h3802;
      expv[14] = 16'he2e5;
      expv[15] = 16'h3833;
      expv[16] = 16'h5f3f;
      expv[17] = 16'h4326;
      expv[18] = 16'h3fd2;
      expv[19] = 16'hffff;
      expv[20] = 16'h7188;
      expv[21] = 16'hffff;
      expv[22] = 16'h7f78;
      expv[23] = 16'h7e25;
      expv[24] = 16'hffff;
      expv[25] = 16'hc410;
      expv[26] = 16'h7a48;
      expv[27] = 16'h52cb;
      expv[28] = 16'hffff;
      expv[29] = 16'hffff;
      expv[30] = 16'h315d;
      expv[31] = 16'h69d8;
      expv[32] = 16'habb0;
      expv[33] = 16'hefc7;
      expv[34] = 16'h1747;
      expv[35] = 16'hffff;
      expv[36] = 16'hffff;
      expv[37] = 16'hffff;
      expv[38] = 16'hcfe5;
      expv[39] = 16'h5c29;
      expv[40] = 16'hb9a6;
      expv[41] = 16'hffff;
      expv[42] = 16'he256;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'h8774;
      expv[46] = 16'h6744;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'h996a;
      expv[50] = 16'hffff;
      expv[51] = 16'h2fb5;
      expv[52] = 16'h2697;
      expv[53] = 16'h0e51;
      expv[54] = 16'ha379;
      expv[55] = 16'h30e0;
      expv[56] = 16'h0ecf;
      expv[57] = 16'hc562;
      expv[58] = 16'h6585;
      expv[59] = 16'hffff;
      expv[60] = 16'hffff;
      expv[61] = 16'heaf8;
      expv[62] = 16'h2002;
      expv[63] = 16'h60e8;
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
