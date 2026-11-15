// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154490 dut (
    .clk(clk),
    .rst_n(in_vec[107:107]),
    .cpu_wr(in_vec[106:106]),
    .cpu_rd(in_vec[105:105]),
    .cpu_byte(in_vec[104:101]),
    .cpu_addr(in_vec[100:69]),
    .cpu_wdata(in_vec[68:37]),
    .a_ready(in_vec[36:36]),
    .d_ready(in_vec[35:35]),
    .d_valid(in_vec[34:34]),
    .d_opcode(in_vec[33:32]),
    .d_data(in_vec[31:0]),
    .cpu_rdata_v(out_vec[104:104]),
    .cpu_rdata(out_vec[103:72]),
    .a_valid(out_vec[71:71]),
    .a_opcode(out_vec[70:69]),
    .a_mask(out_vec[68:65]),
    .a_address(out_vec[64:33]),
    .a_data(out_vec[32:1]),
    .trans_over(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h787360f35de03e2f8d8628a1c7e;
    stim[1] = 108'h46457fc8587d1468f6779802c08;
    stim[2] = 108'h999852267c9b2c40b0595f3b764;
    stim[3] = 108'h9a6d33e6a018b9c076a87de83a7;
    stim[4] = 108'hef6a67973e9f21cdb341f4c44e0;
    stim[5] = 108'hf832fc18405d6fb9a64ad29e2e6;
    stim[6] = 108'h9d8ac858459bee348661d6d6820;
    stim[7] = 108'hbb3633bc4516d79ecedc9dcdb72;
    stim[8] = 108'hfb88d0f719bba33b387305ef2af;
    stim[9] = 108'h910f8f68e75e4f5189251abae1f;
    stim[10] = 108'hbea9e1ce04d1025e395cea8f267;
    stim[11] = 108'h9aca40f7e7f6ef2acc3ec8c2d4e;
    stim[12] = 108'h9aac7a6851103acc07d8a89f430;
    stim[13] = 108'h8dd46ae966bc7ab82d77d331922;
    stim[14] = 108'hd36b7d9624d7ecd16c837db7dad;
    stim[15] = 108'ha60e65ceeeab371eadb599e76ef;
    stim[16] = 108'he3b05e4521ec48ada8bda7c252b;
    stim[17] = 108'hf9313844885ece20406fb7cd916;
    stim[18] = 108'hea8e12ee36917669a615413ec30;
    stim[19] = 108'hf3da3aa237fb6065ef5979ed0f3;
    stim[20] = 108'h8bd0b38e05be757dfb08b0a611b;
    stim[21] = 108'hee4f646c1419995c41e481d87c6;
    stim[22] = 108'hc44832b9260b57e0e4cc0e3bd78;
    stim[23] = 108'hed20410ebff60f89cb5af3a55f1;
    stim[24] = 108'h97768b58d61ab97659ae2b1d6b7;
    stim[25] = 108'hbaec3dfee0eaa463075110ee5bb;
    stim[26] = 108'h9a14291f5d4a3b714fb8554aa01;
    stim[27] = 108'he4975d498490a96352c841ee9f7;
    stim[28] = 108'hce53f3df979aa30007750b50560;
    stim[29] = 108'h97a7f7a3991758d6050e9099db1;
    stim[30] = 108'hf08e099bde985de6bb539a2aeaa;
    stim[31] = 108'he19b6bb6f3f59e51ae96fdc31d3;
    stim[32] = 108'hb114ba512ac6f07887122095c26;
    stim[33] = 108'h87db2ae7a37422ffd1ab9911188;
    stim[34] = 108'hbeb232ae58b8619545be5ae3593;
    stim[35] = 108'hf2fc3a6b88a3a6213923efb6fdc;
    stim[36] = 108'hfe51103a92ba2366e98fe47803b;
    stim[37] = 108'hbb9a835539c4f1c9206c735efe1;
    stim[38] = 108'hbaf07efe3dbe5297f2e7f3d8c84;
    stim[39] = 108'hda8e0c858d2546f6193170056d5;
    stim[40] = 108'hd4115c2edef21c78a288904efe9;
    stim[41] = 108'hd976eb62d9f620acb746e71b110;
    stim[42] = 108'he57d8a3d2c39fa4e803b24af38d;
    stim[43] = 108'hdc4b7fc166678f4c619e6fae747;
    stim[44] = 108'he9cbc255b5081970c44d6cae6ff;
    stim[45] = 108'hb0def17cf37d474c3bbd97b7b16;
    stim[46] = 108'h97452ef02ba8fd3ee345201456f;
    stim[47] = 108'h646307b1852df4f0ce245485aa7;
    stim[48] = 108'hdbeeed79a2e55c985fb445205e9;
    stim[49] = 108'he25db2e0dea8c1ad71ca698859c;
    stim[50] = 108'h83719ff0ca03f0d3cf3d46ff415;
    stim[51] = 108'h8c4b073c5ec2e500ee4a4c47003;
    stim[52] = 108'hc35c397371d586b759bed13e5f8;
    stim[53] = 108'h871e98c531e0fe4988f88991e60;
    stim[54] = 108'hf3c6353b73f68270545f341e85c;
    stim[55] = 108'h9e9b32b5126c8065b5dae5b8b51;
    stim[56] = 108'h9b80045d3316ad9b231c0fc4bd9;
    stim[57] = 108'hfb6d0fcf5b82be5b416f79edc8c;
    stim[58] = 108'hed9b3f6bb9ed93762885d5ce234;
    stim[59] = 108'ha80c59300e515a02aea2a26e993;
    stim[60] = 108'h9e52fab5fa69541fcc35561e168;
    stim[61] = 108'h822a90a1456d994d9abb7c8e9de;
    stim[62] = 108'h86d114cefb16674e8c65827d5ca;
    stim[63] = 108'hfba0e268c08454285d471b4c473;
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
      expv[0] = 105'h000000000000000000000000000;
      expv[1] = 105'h000000000000000000000000000;
      expv[2] = 105'h000000000000000000000000000;
      expv[3] = 105'h000000000000000000000000000;
      expv[4] = 105'h000000000000000000000000000;
      expv[5] = 105'h000000000af6a67973e9f21cdb2;
      expv[6] = 105'h000000000af6a67973e9f21cdb2;
      expv[7] = 105'h000000000af6a67973e9f21cdb2;
      expv[8] = 105'h1c9dcdb72af6a67973e9f21cdb3;
      expv[9] = 105'h1c9dcdb72af6a67973e9f21cdb3;
      expv[10] = 105'h0c9dcdb722f6a67973e9f21cdb2;
      expv[11] = 105'h0c9dcdb729ea9e1ce049f21cdb2;
      expv[12] = 105'h0c9dcdb729ea9e1ce049f21cdb2;
      expv[13] = 105'h18a89f4309ea9e1ce049f21cdb3;
      expv[14] = 105'h18a89f4309ea9e1ce049f21cdb3;
      expv[15] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[16] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[17] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[18] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[19] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[20] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[21] = 105'h08a89f430b36b7d9624d7ecd16c;
      expv[22] = 105'h1481d87c6b36b7d9624d7ecd16d;
      expv[23] = 105'h1c0e3bd78b36b7d9624d7ecd16d;
      expv[24] = 105'h0c0e3bd78ad20410ebff60f89ca;
      expv[25] = 105'h0c0e3bd78ad20410ebff60f89ca;
      expv[26] = 105'h0c0e3bd78ad20410ebff60f89ca;
      expv[27] = 105'h0c0e3bd78ad20410ebff60f89ca;
      expv[28] = 105'h1841ee9f7ad20410ebff60f89cb;
      expv[29] = 105'h1841ee9f7ad20410ebff60f89cb;
      expv[30] = 105'h0841ee9f72d20410ebff60f89ca;
      expv[31] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[32] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[33] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[34] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[35] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[36] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[37] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[38] = 105'h0841ee9f7b08e099bde985de6ba;
      expv[39] = 105'h17f3d8c84b08e099bde985de6bb;
      expv[40] = 105'h17f3d8c84b08e099bde985de6bb;
      expv[41] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[42] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[43] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[44] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[45] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[46] = 105'h07f3d8c84b4115c2edef21c78a2;
      expv[47] = 105'h000000000000000000000000000;
      expv[48] = 105'h000000000000000000000000000;
      expv[49] = 105'h000000000bbeeed79a2e55c985e;
      expv[50] = 105'h1a698859cbbeeed79a2e55c985f;
      expv[51] = 105'h1a698859cbbeeed79a2e55c985f;
      expv[52] = 105'h0a698859c3beeed79a2e55c985e;
      expv[53] = 105'h0a698859ca35c397371d586b758;
      expv[54] = 105'h188991e60a35c397371d586b759;
      expv[55] = 105'h188991e60a35c397371d586b759;
      expv[56] = 105'h088991e60235c397371d586b758;
      expv[57] = 105'h088991e60235c397371d586b758;
      expv[58] = 105'h088991e60bb6d0fcf5b82be5b40;
      expv[59] = 105'h088991e60bb6d0fcf5b82be5b40;
      expv[60] = 105'h088991e60bb6d0fcf5b82be5b40;
      expv[61] = 105'h088991e60bb6d0fcf5b82be5b40;
      expv[62] = 105'h088991e60bb6d0fcf5b82be5b40;
      expv[63] = 105'h088991e60bb6d0fcf5b82be5b40;
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
