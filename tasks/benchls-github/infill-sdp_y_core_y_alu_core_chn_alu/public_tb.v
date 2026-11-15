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

  SDP_Y_CORE_Y_alu_core_chn_alu_in_rsci_chn_alu_in_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[131:131]),
    .chn_alu_in_rsci_oswt(in_vec[130:130]),
    .chn_alu_in_rsci_biwt(in_vec[129:129]),
    .chn_alu_in_rsci_bdwt(in_vec[128:128]),
    .chn_alu_in_rsci_d(in_vec[127:0]),
    .chn_alu_in_rsci_bawt(out_vec[129:129]),
    .chn_alu_in_rsci_wen_comp(out_vec[128:128]),
    .chn_alu_in_rsci_d_mxwt(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'h3cc58eda8f06b83e59f26f9c20f2d9b08;
    stim[1] = 132'h7abe451505a0b7f45037966f25e7f13ee;
    stim[2] = 132'hb7ca8aac8287da34917ac465080ca5f01;
    stim[3] = 132'h9893156001f969dc1b60048a81701d8fa;
    stim[4] = 132'h94b41493484301166a017bbcf1e05eb98;
    stim[5] = 132'hf5f1d05064b25fc1590072e5f0e0aa4a1;
    stim[6] = 132'ha5c26d8f6ee0be38649bb42494e1bbadf;
    stim[7] = 132'h9e4314c506295e37b29840572b7827f83;
    stim[8] = 132'ha73c24db01bdbd95a4ce9d40df9194ea6;
    stim[9] = 132'he29351318a405ca515eb799332040d77f;
    stim[10] = 132'h414fe180de7837fa546663acc748d16df;
    stim[11] = 132'h81e895aa73a96a52eeeeb6500dc1d98f5;
    stim[12] = 132'hf01842abf0afe9a7bdc18b05325e17017;
    stim[13] = 132'hf06260037dbffa1e7ecc2002703ce7ee6;
    stim[14] = 132'h8f497f6a3374a1fb6cd79bfb86ae45666;
    stim[15] = 132'hd1d1a9c4b117e226f79f112250a807f65;
    stim[16] = 132'hf5e15e60d815444b2e8046324ec9f7629;
    stim[17] = 132'heedfb3e52ab35bfc652d31f8cdc7765c0;
    stim[18] = 132'hf7682b289e3f3bbfcb182a0b68a63df69;
    stim[19] = 132'hfe66bce68b85c142a41c5df0779e34dd2;
    stim[20] = 132'hec0faa0dc0b6ee80f58333ceb3e6154c9;
    stim[21] = 132'hd636bc2e8b8702cb796ca0c4453e17a6e;
    stim[22] = 132'h84990ff96c56e01cc6c7ed94f1e4659da;
    stim[23] = 132'h9ff5aeca939960810a7e892b97db41185;
    stim[24] = 132'hbc35479412c602f98d9b1bd4fb8c18c64;
    stim[25] = 132'h8e72b460a7a278694000cf3b745e68c78;
    stim[26] = 132'hb3e1b632eb9e42d0470d7b34de8e0be49;
    stim[27] = 132'h95b27489720cbea0cdb633261e5cc5eba;
    stim[28] = 132'hace1ebeee95d91dcde82bf9a5492ad796;
    stim[29] = 132'h96b758ed966829306e3d68f50154ec965;
    stim[30] = 132'h912a6b84eb59345e05ac69b69208fbb7f;
    stim[31] = 132'ha0c2ebce99d5d0ec0686e2e507cdae2b8;
    stim[32] = 132'hff033b457e843a99090c0c0b500635014;
    stim[33] = 132'hc82292abc9608583b01b58e6309667862;
    stim[34] = 132'hd02b328f388810dbfbfacdc08433d3657;
    stim[35] = 132'hd6b0db7e937cc020aebd4e40067313c94;
    stim[36] = 132'hf6af4e76324cb68a051f3ea35daa04e84;
    stim[37] = 132'h86a2ee7f9477f08f207f4f9a75ae34051;
    stim[38] = 132'he8b38be27ad84d7d292fb76fbd3352a3e;
    stim[39] = 132'hb95b123614707cedd9223e7d19d6fcabc;
    stim[40] = 132'h89bbaf34b1d4d7f9b2ab136467972e61d;
    stim[41] = 132'h802756ea96193b5c1e786e376e7972bef;
    stim[42] = 132'h9b0a58a77ac3f7300c7bcc76893a16836;
    stim[43] = 132'ha1ce3ad32a4307fb8a8308f50f6b3437e;
    stim[44] = 132'hcb7bf4f096a9ab3f4bef6db1deacf60e8;
    stim[45] = 132'h923c946362f267d5b7f3be37b8f07b294;
    stim[46] = 132'h85bbbc0b51450b11d9ea2928c25724e79;
    stim[47] = 132'hf813b37b9237a5167625acc196c90c091;
    stim[48] = 132'hbf3eb3cdc35af5a1513d7ab99bdf803b0;
    stim[49] = 132'hc96b0348507ba00d6e0f4b36bd1c6befe;
    stim[50] = 132'hf06bef4d070954b2c8cdddfb24ca9316d;
    stim[51] = 132'hbd16e4e133b1ea63f6128ab28d0c6f519;
    stim[52] = 132'hb0ef10158c64486b9d9d05569039fafa2;
    stim[53] = 132'h99c1e3e8837801d709d79feb900278f59;
    stim[54] = 132'h9cd909b94a8a16f1794d5227164186ad4;
    stim[55] = 132'hf96f6213870a21b5168733e32ad4f37d1;
    stim[56] = 132'he7700185c4287f06b254dc8a091a29d00;
    stim[57] = 132'hf4e25efaa00d6790e546e2283690877d8;
    stim[58] = 132'hcf4bafaa9bf21d32916ea035c13fd7345;
    stim[59] = 132'hf7fd09ab83cff3eeb10ca0123e9ae5f34;
    stim[60] = 132'hf2ddcbae4eb8307f2269644f6e8d35dd2;
    stim[61] = 132'hf1b0b0af0620214aee68507760afe44a4;
    stim[62] = 132'h8c7a946dfb22e75e5304412b4917a295c;
    stim[63] = 132'hfbc07d3cfa3ea21c6e63c4b3a01426c17;
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
      expv[0] = 130'h3cc58eda8f06b83e59f26f9c20f2d9b08;
      expv[1] = 130'h3abe451505a0b7f45037966f25e7f13ee;
      expv[2] = 130'h37ca8aac8287da34917ac465080ca5f01;
      expv[3] = 130'h1893156001f969dc1b60048a81701d8fa;
      expv[4] = 130'h14b41493484301166a017bbcf1e05eb98;
      expv[5] = 130'h35f1d05064b25fc1590072e5f0e0aa4a1;
      expv[6] = 130'h35c26d8f6ee0be38649bb42494e1bbadf;
      expv[7] = 130'h35c26d8f6ee0be38649bb42494e1bbadf;
      expv[8] = 130'h373c24db01bdbd95a4ce9d40df9194ea6;
      expv[9] = 130'h373c24db01bdbd95a4ce9d40df9194ea6;
      expv[10] = 130'h014fe180de7837fa546663acc748d16df;
      expv[11] = 130'h11e895aa73a96a52eeeeb6500dc1d98f5;
      expv[12] = 130'h301842abf0afe9a7bdc18b05325e17017;
      expv[13] = 130'h306260037dbffa1e7ecc2002703ce7ee6;
      expv[14] = 130'h1f497f6a3374a1fb6cd79bfb86ae45666;
      expv[15] = 130'h01d1a9c4b117e226f79f112250a807f65;
      expv[16] = 130'h35e15e60d815444b2e8046324ec9f7629;
      expv[17] = 130'h3edfb3e52ab35bfc652d31f8cdc7765c0;
      expv[18] = 130'h3edfb3e52ab35bfc652d31f8cdc7765c0;
      expv[19] = 130'h3e66bce68b85c142a41c5df0779e34dd2;
      expv[20] = 130'h3c0faa0dc0b6ee80f58333ceb3e6154c9;
      expv[21] = 130'h3c0faa0dc0b6ee80f58333ceb3e6154c9;
      expv[22] = 130'h14990ff96c56e01cc6c7ed94f1e4659da;
      expv[23] = 130'h1ff5aeca939960810a7e892b97db41185;
      expv[24] = 130'h3c35479412c602f98d9b1bd4fb8c18c64;
      expv[25] = 130'h1e72b460a7a278694000cf3b745e68c78;
      expv[26] = 130'h33e1b632eb9e42d0470d7b34de8e0be49;
      expv[27] = 130'h15b27489720cbea0cdb633261e5cc5eba;
      expv[28] = 130'h3ce1ebeee95d91dcde82bf9a5492ad796;
      expv[29] = 130'h3ce1ebeee95d91dcde82bf9a5492ad796;
      expv[30] = 130'h112a6b84eb59345e05ac69b69208fbb7f;
      expv[31] = 130'h30c2ebce99d5d0ec0686e2e507cdae2b8;
      expv[32] = 130'h30c2ebce99d5d0ec0686e2e507cdae2b8;
      expv[33] = 130'h082292abc9608583b01b58e6309667862;
      expv[34] = 130'h002b328f388810dbfbfacdc08433d3657;
      expv[35] = 130'h06b0db7e937cc020aebd4e40067313c94;
      expv[36] = 130'h36af4e76324cb68a051f3ea35daa04e84;
      expv[37] = 130'h16a2ee7f9477f08f207f4f9a75ae34051;
      expv[38] = 130'h38b38be27ad84d7d292fb76fbd3352a3e;
      expv[39] = 130'h38b38be27ad84d7d292fb76fbd3352a3e;
      expv[40] = 130'h19bbaf34b1d4d7f9b2ab136467972e61d;
      expv[41] = 130'h102756ea96193b5c1e786e376e7972bef;
      expv[42] = 130'h1b0a58a77ac3f7300c7bcc76893a16836;
      expv[43] = 130'h31ce3ad32a4307fb8a8308f50f6b3437e;
      expv[44] = 130'h31ce3ad32a4307fb8a8308f50f6b3437e;
      expv[45] = 130'h31ce3ad32a4307fb8a8308f50f6b3437e;
      expv[46] = 130'h15bbbc0b51450b11d9ea2928c25724e79;
      expv[47] = 130'h3813b37b9237a5167625acc196c90c091;
      expv[48] = 130'h3f3eb3cdc35af5a1513d7ab99bdf803b0;
      expv[49] = 130'h096b0348507ba00d6e0f4b36bd1c6befe;
      expv[50] = 130'h306bef4d070954b2c8cdddfb24ca9316d;
      expv[51] = 130'h3d16e4e133b1ea63f6128ab28d0c6f519;
      expv[52] = 130'h30ef10158c64486b9d9d05569039fafa2;
      expv[53] = 130'h19c1e3e8837801d709d79feb900278f59;
      expv[54] = 130'h1cd909b94a8a16f1794d5227164186ad4;
      expv[55] = 130'h396f6213870a21b5168733e32ad4f37d1;
      expv[56] = 130'h37700185c4287f06b254dc8a091a29d00;
      expv[57] = 130'h37700185c4287f06b254dc8a091a29d00;
      expv[58] = 130'h0f4bafaa9bf21d32916ea035c13fd7345;
      expv[59] = 130'h37fd09ab83cff3eeb10ca0123e9ae5f34;
      expv[60] = 130'h32ddcbae4eb8307f2269644f6e8d35dd2;
      expv[61] = 130'h31b0b0af0620214aee68507760afe44a4;
      expv[62] = 130'h1c7a946dfb22e75e5304412b4917a295c;
      expv[63] = 130'h3bc07d3cfa3ea21c6e63c4b3a01426c17;
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
