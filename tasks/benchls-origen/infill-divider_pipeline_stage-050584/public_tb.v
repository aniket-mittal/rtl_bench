// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050584 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[131:131]),
    .iREMOVE(in_vec[130:130]),
    .iPREVIOUS_VALID(in_vec[129:129]),
    .iPREVIOUS_SIGN(in_vec[128:128]),
    .iPREVIOUS_DIVISOR(in_vec[127:96]),
    .iPREVIOUS_DIVIDEND(in_vec[95:64]),
    .iPREVIOUS_Q(in_vec[63:32]),
    .iPREVIOUS_R(in_vec[31:1]),
    .iNEXT_BUSY(in_vec[0:0]),
    .oPREVIOUS_BUSY(out_vec[129:129]),
    .oNEXT_VALID(out_vec[128:128]),
    .oNEXT_SIGN(out_vec[127:127]),
    .oNEXT_DIVISOR(out_vec[126:95]),
    .oNEXT_DIVIDEND(out_vec[94:63]),
    .oNEXT_Q(out_vec[62:31]),
    .oNEXT_R(out_vec[30:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'h85ea807ceb621dcaabb5cce12168f34ff;
    stim[1] = 132'h95159fa3966af464dbecc668bd5b23295;
    stim[2] = 132'h04527125b8cca147425269a02f850c64f;
    stim[3] = 132'h692cecd03aeb659dcaf3e217fe367bfa6;
    stim[4] = 132'h0c23edafdda44ca4033e341d523e20bca;
    stim[5] = 132'h35eae2b48779066f3bb64e5d2999b51bc;
    stim[6] = 132'h0232697c6c5bc5538059954022dacd3cb;
    stim[7] = 132'h7077b1fc5413799c9ce46c39165e9e367;
    stim[8] = 132'hbd6a2ee59882807e7a3c1529f6b58f770;
    stim[9] = 132'h2f2bf5df63f65f06bf277843c4ccae1fb;
    stim[10] = 132'h4824fc306693cfa2a8522f334fe42aa7d;
    stim[11] = 132'h555a31f5f916ace76d96fb87e5c7c3e7d;
    stim[12] = 132'h0564a457623c74654823e99445b34188f;
    stim[13] = 132'h61659823a3ce363ad08ca377f841a0cd7;
    stim[14] = 132'h34721540f1291ef1430e359b1a288b436;
    stim[15] = 132'h5e04dd260594cd3e3ffa7304193c01fb5;
    stim[16] = 132'h629c15cb182f91f2c256dec1564181ac3;
    stim[17] = 132'h3f5a81944dabf83827dd2f4ca6fd1db58;
    stim[18] = 132'h73cf7935096e5e73922aecc204110dbbc;
    stim[19] = 132'h6ac8e2f7aae8f6624e3f91f4610f744ee;
    stim[20] = 132'h2bdf0e543101a6a8cb5c338644744b492;
    stim[21] = 132'h58d1c59efd6b294cdbedf8bffc61c02f7;
    stim[22] = 132'h7a109fa9b616c2b407c34abc3e28173fa;
    stim[23] = 132'h16acfff256c0b4a3cc693783f24e58836;
    stim[24] = 132'h451155e6e8814f0c0b8d139a2b73d8d9d;
    stim[25] = 132'h5a68c816d3cc720d29a8e337cdaedb7f6;
    stim[26] = 132'h61195f59db09f248b9a51830e8db1ffe5;
    stim[27] = 132'h4a516a9447e541659c190e015500a3b41;
    stim[28] = 132'h299841ea9ec4dc4617dec6cc448ab0af7;
    stim[29] = 132'h3ef917f4d549718ad27fb4e8f135f3abe;
    stim[30] = 132'h6bc91d2baaec6c6998817e012bc361976;
    stim[31] = 132'h74b20cc337d5747b86cd3bd0a7aafecd7;
    stim[32] = 132'h68a1657935e9110d8290535a4ea85cd91;
    stim[33] = 132'h0c383fd7e451775c2ff0a7bc440c5181f;
    stim[34] = 132'h36b631981f41e991c069a819429f62da4;
    stim[35] = 132'h67409a4271ff0733f95cf1ef819670bd9;
    stim[36] = 132'h3c63669a853a0bf069f7a4a7e2e6af288;
    stim[37] = 132'h78e3964785e04f719e0979955a31e9e11;
    stim[38] = 132'h39c821c1be866fe5591162d43d6161b3b;
    stim[39] = 132'h2e462a57fcc6a3e3e8ccaf9d69b80f678;
    stim[40] = 132'h3c2c257824fc9f25a7cc3d18859885734;
    stim[41] = 132'h396f358d11db4cc2dd5d160eaa0dff4b4;
    stim[42] = 132'h186b16271308b02f4018c18a902f10235;
    stim[43] = 132'h310e25959a3d8f487760848a029fca166;
    stim[44] = 132'h74958b18a40f214ef39a928027769645c;
    stim[45] = 132'h4d804999949ceeb96a14bb53d55b713b7;
    stim[46] = 132'h3027e6fc1bd3fd929fd7017371efb2116;
    stim[47] = 132'h1abb6539abfc323c9ccbc6fed167c6929;
    stim[48] = 132'h6deab67feeae5b0bbb46e112d75bc8857;
    stim[49] = 132'h61450fe66d8e5d9a3649b624d9999aaea;
    stim[50] = 132'h1554f80f7e5c926fe75cba2ad79a1664e;
    stim[51] = 132'h6c4663a4dadbbfcdbb528a2db48dbe28f;
    stim[52] = 132'h4fcd10e917f26dd1a40122a267a17da2f;
    stim[53] = 132'h0d41e398b62bec19c84a757007596e210;
    stim[54] = 132'h0b1e5ba10bbbab0868e9a98ff6ab09ba2;
    stim[55] = 132'h3a5e3e0464aec2e38d937e3f28e01b23d;
    stim[56] = 132'h540d5959da650f6293146c72bd0cf79c8;
    stim[57] = 132'h0ff15eb42c57ee598efb8616de8bf89cd;
    stim[58] = 132'h4138970b7b86cceb2237d3e6f55b3c57a;
    stim[59] = 132'h34fd1cac7d82212ad86affd634b39c774;
    stim[60] = 132'he9a568ee7243c6cd55b5c8c70d041f361;
    stim[61] = 132'h1d751df1d1be23279f14009efbb397e6e;
    stim[62] = 132'h67047604c7633d6e11fac6a74dc1e6ece;
    stim[63] = 132'h302ed711718ea872c760c9b18590404da;
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
      expv[0] = 130'h200000000000000000000000000000000;
      expv[1] = 130'h200000000000000000000000000000000;
      expv[2] = 130'h200000000000000000000000000000000;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h000000000000000000000000000000000;
      expv[5] = 130'h000000000000000000000000000000000;
      expv[6] = 130'h200000000000000000000000000000000;
      expv[7] = 130'h200000000000000000000000000000000;
      expv[8] = 130'h000000000000000000000000000000000;
      expv[9] = 130'h200000000000000000000000000000000;
      expv[10] = 130'h200000000000000000000000000000000;
      expv[11] = 130'h200000000000000000000000000000000;
      expv[12] = 130'h200000000000000000000000000000000;
      expv[13] = 130'h200000000000000000000000000000000;
      expv[14] = 130'h000000000000000000000000000000000;
      expv[15] = 130'h200000000000000000000000000000000;
      expv[16] = 130'h200000000000000000000000000000000;
      expv[17] = 130'h000000000000000000000000000000000;
      expv[18] = 130'h000000000000000000000000000000000;
      expv[19] = 130'h000000000000000000000000000000000;
      expv[20] = 130'h000000000000000000000000000000000;
      expv[21] = 130'h200000000000000000000000000000000;
      expv[22] = 130'h000000000000000000000000000000000;
      expv[23] = 130'h000000000000000000000000000000000;
      expv[24] = 130'h200000000000000000000000000000000;
      expv[25] = 130'h000000000000000000000000000000000;
      expv[26] = 130'h200000000000000000000000000000000;
      expv[27] = 130'h200000000000000000000000000000000;
      expv[28] = 130'h200000000000000000000000000000000;
      expv[29] = 130'h000000000000000000000000000000000;
      expv[30] = 130'h000000000000000000000000000000000;
      expv[31] = 130'h200000000000000000000000000000000;
      expv[32] = 130'h200000000000000000000000000000000;
      expv[33] = 130'h200000000000000000000000000000000;
      expv[34] = 130'h000000000000000000000000000000000;
      expv[35] = 130'h200000000000000000000000000000000;
      expv[36] = 130'h000000000000000000000000000000000;
      expv[37] = 130'h200000000000000000000000000000000;
      expv[38] = 130'h200000000000000000000000000000000;
      expv[39] = 130'h000000000000000000000000000000000;
      expv[40] = 130'h000000000000000000000000000000000;
      expv[41] = 130'h000000000000000000000000000000000;
      expv[42] = 130'h200000000000000000000000000000000;
      expv[43] = 130'h000000000000000000000000000000000;
      expv[44] = 130'h000000000000000000000000000000000;
      expv[45] = 130'h200000000000000000000000000000000;
      expv[46] = 130'h000000000000000000000000000000000;
      expv[47] = 130'h200000000000000000000000000000000;
      expv[48] = 130'h200000000000000000000000000000000;
      expv[49] = 130'h000000000000000000000000000000000;
      expv[50] = 130'h000000000000000000000000000000000;
      expv[51] = 130'h200000000000000000000000000000000;
      expv[52] = 130'h200000000000000000000000000000000;
      expv[53] = 130'h000000000000000000000000000000000;
      expv[54] = 130'h000000000000000000000000000000000;
      expv[55] = 130'h200000000000000000000000000000000;
      expv[56] = 130'h000000000000000000000000000000000;
      expv[57] = 130'h200000000000000000000000000000000;
      expv[58] = 130'h000000000000000000000000000000000;
      expv[59] = 130'h000000000000000000000000000000000;
      expv[60] = 130'h200000000000000000000000000000000;
      expv[61] = 130'h000000000000000000000000000000000;
      expv[62] = 130'h000000000000000000000000000000000;
      expv[63] = 130'h000000000000000000000000000000000;
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
