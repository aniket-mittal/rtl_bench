// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 131;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01089 dut (
    .clk_i(clk),
    .opa_i(in_vec[130:99]),
    .opb_i(in_vec[98:67]),
    .qutnt_i(in_vec[66:40]),
    .rmndr_i(in_vec[39:13]),
    .exp_10_i(in_vec[12:3]),
    .sign_i(in_vec[2:2]),
    .rmode_i(in_vec[1:0]),
    .output_o(out_vec[32:1]),
    .ine_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 131'h5327758a61bb52dcbe4f5b44b6b3911c5;
    stim[1] = 131'h5e4e488ac695706652e1d4c55bf6e8ab4;
    stim[2] = 131'h7d906616f50bc7b238b463b192678d197;
    stim[3] = 131'h03a06e30f739e7e2d5f570d3880d5cfb2;
    stim[4] = 131'h711c28d616eab50cfa2a39f3b7f83c2d9;
    stim[5] = 131'h3cc83558f7b99576e8104ab71d8c1bbc6;
    stim[6] = 131'h5616b1bdd26ce98901ff4a056ac6c8fef;
    stim[7] = 131'h6caabea30e6bebb5c8658e6b540d2fb8c;
    stim[8] = 131'h77a64a700d028f4d9602d379eff9127ce;
    stim[9] = 131'h080f3d3eb37fd0d904310db5b7c359635;
    stim[10] = 131'h11dfebc64c7fe2bf4bbb1c4286e50e3d0;
    stim[11] = 131'h517e932066ccdb1e6cfb61f8356cbc1b7;
    stim[12] = 131'h47c35469c4096fd00013b97a1a43dd2a7;
    stim[13] = 131'h254db23c1f6867c0e6582dc784ac6252d;
    stim[14] = 131'h38362e80d4b176ef05ef810b488db3aed;
    stim[15] = 131'h0d68cc44c0948ce21b0495bb64cc1a718;
    stim[16] = 131'h60ab83e2f46711ee8f77f8848543d6c73;
    stim[17] = 131'h67f219125ae153216b175048c8e1a2e58;
    stim[18] = 131'h679271d9c22ab4c5193b1d4963c957efc;
    stim[19] = 131'h762ecaf3855e8574247884964aabc9d10;
    stim[20] = 131'h28b83d72f1ae2c1864fd14a0cd709b94b;
    stim[21] = 131'h192b137a71e3dd4efa0aeb3eb4fac5b78;
    stim[22] = 131'h265235aef66cfb38ef2940cbea7410ddb;
    stim[23] = 131'h4f3e098a2ea919d4cd5a04f72e54dec5e;
    stim[24] = 131'h05eaa1958a01136d7df0413bab36906bd;
    stim[25] = 131'h765ff91b36a1f57cb7c3ed9371c137150;
    stim[26] = 131'h5840efda2056c5a37150a577369ffd0d4;
    stim[27] = 131'h53c9b15277f7d1977d5fd1426bbef4b87;
    stim[28] = 131'h74f3428e33073bcfb2dd5c46f111a3c08;
    stim[29] = 131'h5cf9c2f0256f8a7ff67eb37f28aa9ac45;
    stim[30] = 131'h6427acaf4a1dad1aceb6c664ce7367c76;
    stim[31] = 131'h529b10bf33e1cf1dfbe4986568288491a;
    stim[32] = 131'h71953a4cfe8a37af825dafd6ab3a37b84;
    stim[33] = 131'h7e841c270a5231dbb408eebbe565532dc;
    stim[34] = 131'h071e5b95a3e5a5999c79779e115258089;
    stim[35] = 131'h15245bdf7469636aaab3e384d008fd6d9;
    stim[36] = 131'h6145cd3a6e9e5c9894391b08857dbd0ab;
    stim[37] = 131'h0ccc8ab7112cecabd6f7afea1232ce14d;
    stim[38] = 131'h5b065580da732f46ac23d2cb90278acdd;
    stim[39] = 131'h2935a88a1f06d5f8e145f752164b032ac;
    stim[40] = 131'h41914af32acadb636f7114c2d7c122b50;
    stim[41] = 131'h54343a0bee49ad1f926a54dfd623acb8e;
    stim[42] = 131'h12711b2f8abd1f4ec0aa89403a252ce5e;
    stim[43] = 131'h32903a86c30bf9ef072b77566a4386b90;
    stim[44] = 131'h62358dbb14300aff11712655feaa273bf;
    stim[45] = 131'h514404095b23938bd966a24a1b87690b5;
    stim[46] = 131'h3e0b10f8b66fc52d1c4a83c391f89146e;
    stim[47] = 131'h15e91b7a7e94d9ac169233d0e16dc32af;
    stim[48] = 131'h1008c0ae6eb8cca6566987b229eceffa4;
    stim[49] = 131'h183812288b644612b42601d713ccc9530;
    stim[50] = 131'h4842207ca1ea26f86b9b62c38bfd19dda;
    stim[51] = 131'h3ada951748edada9b0ab7a93aeaa766d4;
    stim[52] = 131'h6c539a05407e23e44579cbcd0e016b1fa;
    stim[53] = 131'h55fa5547f696893d3ae3e2d77d4c8e235;
    stim[54] = 131'h3f46b0fc5f8821b66b730bb94172ae20f;
    stim[55] = 131'h0e5f0206f8499f108581d060add0683c9;
    stim[56] = 131'h33d6b96ceef1457dcec19dbd16754acbe;
    stim[57] = 131'h4c2c2dcc77e17fe1faedb1f246bd0b869;
    stim[58] = 131'h51196856538c0b7a71f86de4637c0b523;
    stim[59] = 131'h0261dab7d1b76815ca54545febd11088d;
    stim[60] = 131'h061bf53b2f76ed5f2e392605ed8490e59;
    stim[61] = 131'h45e5d01c4f16143e1d04100d892591802;
    stim[62] = 131'h1bc59b42a7fb7005eff5348b25105a996;
    stim[63] = 131'h5679ba5f0f778cee21181d47ff96c0aaf;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'h1xxxxxxxx;
      expv[3] = 33'h1xxxxxxxx;
      expv[4] = 33'h1xxxxxxxx;
      expv[5] = 33'h0ff000001;
      expv[6] = 33'h000e2d191;
      expv[7] = 33'h1ff000001;
      expv[8] = 33'h15be8a8e7;
      expv[9] = 33'h101a0412d;
      expv[10] = 33'h1ff000001;
      expv[11] = 33'h101219639;
      expv[12] = 33'h0f7000059;
      expv[13] = 33'h10021886f;
      expv[14] = 33'h179000003;
      expv[15] = 33'h136b3ed89;
      expv[16] = 33'h100004ee5;
      expv[17] = 33'h0a4000001;
      expv[18] = 33'h00017be05;
      expv[19] = 33'h0e1000001;
      expv[20] = 33'h1ff000001;
      expv[21] = 33'h0ff000001;
      expv[22] = 33'h00064ec77;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000001;
      expv[25] = 33'h100000001;
      expv[26] = 33'h1ff000001;
      expv[27] = 33'h0ff000001;
      expv[28] = 33'h1d7f7c105;
      expv[29] = 33'h100df0fb7;
      expv[30] = 33'h000000003;
      expv[31] = 33'h1ff000001;
      expv[32] = 33'h100cb7571;
      expv[33] = 33'h0ff000001;
      expv[34] = 33'h1013adb1b;
      expv[35] = 33'h1ff000001;
      expv[36] = 33'h0000976c1;
      expv[37] = 33'h000000069;
      expv[38] = 33'h00f000001;
      expv[39] = 33'h101559f1d;
      expv[40] = 33'h100000001;
      expv[41] = 33'h128000001;
      expv[42] = 33'h0ff000001;
      expv[43] = 33'h1018517df;
      expv[44] = 33'h1ff000001;
      expv[45] = 33'h0ff000001;
      expv[46] = 33'h1ff000001;
      expv[47] = 33'h1ff000001;
      expv[48] = 33'h10045c499;
      expv[49] = 33'h100005967;
      expv[50] = 33'h100000003;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000001;
      expv[53] = 33'h100000687;
      expv[54] = 33'h000000001;
      expv[55] = 33'h1d8000003;
      expv[56] = 33'h1002bce5f;
      expv[57] = 33'h044000003;
      expv[58] = 33'h1415b985d;
      expv[59] = 33'h077160741;
      expv[60] = 33'h0ff000001;
      expv[61] = 33'h101ebb6c7;
      expv[62] = 33'h000000001;
      expv[63] = 33'h0ff000001;
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
