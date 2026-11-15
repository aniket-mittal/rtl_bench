// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 150;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07040 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[75:75]),
    .iRESET_SYNC(in_vec[74:74]),
    .iSYSREG_IDTR(in_vec[73:42]),
    .iRD_START(in_vec[41:41]),
    .iRD_IRQ_NUM(in_vec[40:34]),
    .iLDST_BUSY(in_vec[33:33]),
    .iLDST_REQ(in_vec[32:32]),
    .iLDST_DATA(in_vec[31:0]),
    .oRD_FINISH(out_vec[149:149]),
    .oRD_HUNDLER(out_vec[148:117]),
    .oLDST_USE(out_vec[116:116]),
    .oLDST_REQ(out_vec[115:115]),
    .oLDST_ORDER(out_vec[114:113]),
    .oLDST_RW(out_vec[112:112]),
    .oLDST_ASID(out_vec[111:98]),
    .oLDST_MMUMOD(out_vec[97:96]),
    .oLDST_PDT(out_vec[95:64]),
    .oLDST_ADDR(out_vec[63:32]),
    .oLDST_DATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hab7984f55f06518a634;
    stim[1] = 76'he1c35c3dc33be924528;
    stim[2] = 76'h2137349891e10b4b9d4;
    stim[3] = 76'h7a0393ea8657045ed11;
    stim[4] = 76'h0c93d7c516dd3b6adf8;
    stim[5] = 76'h1e96ab238204e89027e;
    stim[6] = 76'ha8914200dbad4a425ea;
    stim[7] = 76'h792f85f4636d3568a10;
    stim[8] = 76'h04d73c49fe6f26ca18d;
    stim[9] = 76'h308fb7cf4a8293b39f3;
    stim[10] = 76'h7968f0b464cffd9f0b5;
    stim[11] = 76'h16fb896d1bd05486b6b;
    stim[12] = 76'h2c21fb61258b80dcfdf;
    stim[13] = 76'h573d45e07e162949147;
    stim[14] = 76'h42aa978c9a711fa68ba;
    stim[15] = 76'h7223e24eb2f5749ebbf;
    stim[16] = 76'h0312dcee72b3d3762c9;
    stim[17] = 76'h0483b137a5ca5113ecb;
    stim[18] = 76'h3524e26a43d660f3462;
    stim[19] = 76'h0abd0846b49fffc4cd2;
    stim[20] = 76'h36161dea74cf18b69a7;
    stim[21] = 76'h6b710ae9fc0db808931;
    stim[22] = 76'h0de46305005eacc99fd;
    stim[23] = 76'h5fb412d1b4815c70fa3;
    stim[24] = 76'h6a8eef60ea307c01458;
    stim[25] = 76'h7ba0728ce6f5da1548b;
    stim[26] = 76'h39b17e2f7ec2bf199f4;
    stim[27] = 76'h1697f207f4035f6958b;
    stim[28] = 76'h040ed32f8d479f498a4;
    stim[29] = 76'h670bda28eeef3774c20;
    stim[30] = 76'h2cae0473207a354decb;
    stim[31] = 76'h6eec986309898fc9355;
    stim[32] = 76'h22f08ab1f9d64239c26;
    stim[33] = 76'h0a5dbe7fea9066811c9;
    stim[34] = 76'h4a8f7ba58542d6cd947;
    stim[35] = 76'h301f6939b233d427f1f;
    stim[36] = 76'h437395f37175e955e61;
    stim[37] = 76'h04798a3eacc4c51b7e2;
    stim[38] = 76'h4a5d135f89e25dfce3b;
    stim[39] = 76'h4e2b4463f13b39363d1;
    stim[40] = 76'h32b9ec16684dac38b30;
    stim[41] = 76'h7d536e2a7d26d22c345;
    stim[42] = 76'h34cf99d86716993cdc3;
    stim[43] = 76'h31f520de3424e093897;
    stim[44] = 76'h3ab6444750fdbe7c97a;
    stim[45] = 76'h6e68d54f87eb5e31300;
    stim[46] = 76'h18d91750fe01ceb6de9;
    stim[47] = 76'h228f3a10f60ab0c2435;
    stim[48] = 76'h4e1b401a80856c18fdb;
    stim[49] = 76'h04c2e70b9c4f37a633c;
    stim[50] = 76'h02110457172fa2d0f79;
    stim[51] = 76'h6beefdd23a979fb0d0f;
    stim[52] = 76'h0009e277ee7c53acb43;
    stim[53] = 76'h6f2c272ef9a15bb8fdd;
    stim[54] = 76'h3b23e6fdd99937689f4;
    stim[55] = 76'h0eaa5b3602e9500ca29;
    stim[56] = 76'h4fb27f5eadf805cc1b9;
    stim[57] = 76'h0e0bf82b7748f644845;
    stim[58] = 76'h26ec292c902c2752cd6;
    stim[59] = 76'h68966471ffa9689a013;
    stim[60] = 76'h506ee3c98d88da4657c;
    stim[61] = 76'h5b102c9725f5395e482;
    stim[62] = 76'h2fe3865c6baaccdbdbe;
    stim[63] = 76'h16f2e2e323424e71f9a;
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
      expv[0] = 150'h0000000004000000000000ade617b900000000;
      expv[1] = 150'h0000000004000000000000870d715b00000000;
      expv[2] = 150'h000000000400000000000084dcd49e00000000;
      expv[3] = 150'h0000000004000000000000e80e507600000000;
      expv[4] = 150'h0000000004000000000000324f61f000000000;
      expv[5] = 150'h00000000040000000000007a5aacd200000000;
      expv[6] = 150'h0000000004000000000000a2450b7700000000;
      expv[7] = 150'h0000000004000000000000e4be183d00000000;
      expv[8] = 150'h0000000004000000000000135cf4f300000000;
      expv[9] = 150'h0000000004000000000000c23ee09100000000;
      expv[10] = 150'h0000000004000000000000e5a3c36d00000000;
      expv[11] = 150'h00000000040000000000005bee293000000000;
      expv[12] = 150'h0000000004000000000000b087ee3800000000;
      expv[13] = 150'h00000000040000000000005cf51b4500000000;
      expv[14] = 150'h00000000040000000000000aaa617e00000000;
      expv[15] = 150'h0000000004000000000000c88f8b9600000000;
      expv[16] = 150'h00000000040000000000000c4b760d00000000;
      expv[17] = 150'h0000000004000000000000120ec59a00000000;
      expv[18] = 150'h0000000004000000000000d4938a2500000000;
      expv[19] = 150'h00000000040000000000002af423ae00000000;
      expv[20] = 150'h0000000004000000000000d8587a4500000000;
      expv[21] = 150'h0000000004000000000000adc42f2b00000000;
      expv[22] = 150'h000000000400000000000037918c2000000000;
      expv[23] = 150'h00000000040000000000007ed04dda00000000;
      expv[24] = 150'h0000000004000000000000aa3bbec700000000;
      expv[25] = 150'h0000000004000000000000ee81cb0f00000000;
      expv[26] = 150'h0000000004000000000000e6c5fc9900000000;
      expv[27] = 150'h00000000040000000000005a5fcaa300000000;
      expv[28] = 150'h0000000004000000000000103b4e6a00000000;
      expv[29] = 150'h00000000040000000000009c2f6a7f00000000;
      expv[30] = 150'h0000000004000000000000b2b811d800000000;
      expv[31] = 150'h0000000004000000000000bbb262c000000000;
      expv[32] = 150'h00000000040000000000008bc22e0300000000;
      expv[33] = 150'h00000000040000000000002976fb5300000000;
      expv[34] = 150'h00000000040000000000002a3def4200000000;
      expv[35] = 150'h0000000004000000000000c07da72a00000000;
      expv[36] = 150'h00000000040000000000000dce59f900000000;
      expv[37] = 150'h000000000400000000000011e62a9600000000;
      expv[38] = 150'h000000000400000000000029744eba00000000;
      expv[39] = 150'h000000000400000000000038ad13b300000000;
      expv[40] = 150'h0000000004000000000000cae7b16500000000;
      expv[41] = 150'h0000000004000000000000f54dbc4d00000000;
      expv[42] = 150'h0000000004000000000000d33e684500000000;
      expv[43] = 150'h0000000004000000000000c7d485fc00000000;
      expv[44] = 150'h0000000004000000000000ead9133900000000;
      expv[45] = 150'h0000000004000000000000b9a3563a00000000;
      expv[46] = 150'h00000000040000000000006364610700000000;
      expv[47] = 150'h00000000040000000000008a3ceb0700000000;
      expv[48] = 150'h0000000004000000000000386d007e00000000;
      expv[49] = 150'h0000000004000000000000130b9fba00000000;
      expv[50] = 150'h00000000040000000000000844144000000000;
      expv[51] = 150'h0000000004000000000000afbbfa9c00000000;
      expv[52] = 150'h000000000400000000000000278bab00000000;
      expv[53] = 150'h0000000004000000000000bcb09fef00000000;
      expv[54] = 150'h0000000004000000000000ec8f9f2b00000000;
      expv[55] = 150'h00000000040000000000003aa96d3400000000;
      expv[56] = 150'h00000000040000000000003ec9ff3600000000;
      expv[57] = 150'h0000000004000000000000382fe39900000000;
      expv[58] = 150'h00000000040000000000009bb0a6b600000000;
      expv[59] = 150'h0000000004000000000000a25995bb00000000;
      expv[60] = 150'h000000000400000000000041bb90da00000000;
      expv[61] = 150'h00000000040000000000006c40b31800000000;
      expv[62] = 150'h0000000004000000000000bf8e1ae500000000;
      expv[63] = 150'h00000000040000000000005bcb8bf800000000;
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
