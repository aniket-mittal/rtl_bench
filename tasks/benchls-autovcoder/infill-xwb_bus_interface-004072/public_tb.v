// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 90;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004072 dut (
    .gclk(clk),
    .xwb_dat_i(in_vec[89:58]),
    .xwb_ack_i(in_vec[57:57]),
    .imm_of(in_vec[56:41]),
    .opc_of(in_vec[40:35]),
    .opa_of(in_vec[34:3]),
    .grst(in_vec[2:2]),
    .dena(in_vec[1:1]),
    .gpha(in_vec[0:0]),
    .xwb_adr_o(out_vec[73:73]),
    .xwb_dat_o(out_vec[72:41]),
    .xwb_sel_o(out_vec[40:37]),
    .xwb_tag_o(out_vec[36:36]),
    .xwb_stb_o(out_vec[35:35]),
    .xwb_cyc_o(out_vec[34:34]),
    .xwb_wre_o(out_vec[33:33]),
    .xwb_fb(out_vec[32:32]),
    .xwb_mx(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 90'h3d144842d657ed1848441d4;
    stim[1] = 90'h24cdba2a5d9cafbe40a39fd;
    stim[2] = 90'h0e694edb1c08abc9314af69;
    stim[3] = 90'h0adb0be0651b3defc30d088;
    stim[4] = 90'h33717b8a57539695ba60c11;
    stim[5] = 90'h364511573da4e8fff08f3f8;
    stim[6] = 90'h0886fc9a77131fcc7ea8779;
    stim[7] = 90'h0f0c2940779233a239048b8;
    stim[8] = 90'h3f1e10fd676e3a37dec90da;
    stim[9] = 90'h38c861a8c78db847d59c543;
    stim[10] = 90'h19975037ca54a1dadb875f0;
    stim[11] = 90'h1a1b75ea6f039cc9da32352;
    stim[12] = 90'h242e2bac9c012dc972b503a;
    stim[13] = 90'h0b0b0d7ce29478b73ab945b;
    stim[14] = 90'h2a8d81231d2bca6de5af8ba;
    stim[15] = 90'h1fcccc42507263699f0e378;
    stim[16] = 90'h23008f7f9890209ea381e58;
    stim[17] = 90'h25e39d9beb4b251840b6a8b;
    stim[18] = 90'h2c143593cf02e612c29cb11;
    stim[19] = 90'h0d1be248c3669cf194dfd88;
    stim[20] = 90'h1ae03b55048c2dd539682d2;
    stim[21] = 90'h1ac52d2254082552b6c6105;
    stim[22] = 90'h2fba842613012a2905e8080;
    stim[23] = 90'h1a3cd3a0642dc4325632001;
    stim[24] = 90'h08d86c45d24cb707df52cb2;
    stim[25] = 90'h0f86aed2f0c1f273a5d7f1b;
    stim[26] = 90'h1a986ef8af1ff2f6362ed89;
    stim[27] = 90'h2d890b8e4968929e3b2932b;
    stim[28] = 90'h273ccf9a3c3226fdb01c6c2;
    stim[29] = 90'h087b43e2a089e3fced35620;
    stim[30] = 90'h3b4e4ae04534ee430275f51;
    stim[31] = 90'h255135eaf39f07f1aaf71c2;
    stim[32] = 90'h112c251c8b1f8e4ea3bc961;
    stim[33] = 90'h108d6025651e83703e0f5f9;
    stim[34] = 90'h1fba0200250478c8f8aa091;
    stim[35] = 90'h0bce7689cb2563bb6a0fdf3;
    stim[36] = 90'h13ab422de5470782ce297d8;
    stim[37] = 90'h17f6908e8d8ff5741aaca39;
    stim[38] = 90'h329b9cddc99fbc10b8c014b;
    stim[39] = 90'h0fe8bbcb323354cd028bc93;
    stim[40] = 90'h30f575c021b8f10ed8030cb;
    stim[41] = 90'h1935fb28aa00c74e5f5a098;
    stim[42] = 90'h19823cbe6139453f7a8a441;
    stim[43] = 90'h25ca8f349c8bbb9be0cc3aa;
    stim[44] = 90'h02e686482d295b90d3fef2a;
    stim[45] = 90'h0abf145f9d59bac561fa0fd;
    stim[46] = 90'h13dc80d9eaab3064209bc92;
    stim[47] = 90'h1f478cab3995ec12974195b;
    stim[48] = 90'h13430abb7772ec44464edab;
    stim[49] = 90'h051e47daebe66fc4f4a9b91;
    stim[50] = 90'h26748c27548c0654872a889;
    stim[51] = 90'h09aa251e3f0605f4f684cf8;
    stim[52] = 90'h31c7b9da4d1fc44145853ec;
    stim[53] = 90'h112f94ad37503c0e0a9bf98;
    stim[54] = 90'h091d38fe0753042911f3379;
    stim[55] = 90'h275e090492d1eeac51f5671;
    stim[56] = 90'h0f071f7d3b76670552fd1d0;
    stim[57] = 90'h371424d9deb2566ecdd4d78;
    stim[58] = 90'h3ff44e6cf2100f6e274de6b;
    stim[59] = 90'h33c2fffbc068f9b337d129a;
    stim[60] = 90'h0f3f63cfeb9537ad1cf4d03;
    stim[61] = 90'h178e75b7445e1c08f4e7c53;
    stim[62] = 90'h1cda8cd6cb509d1f6a9c872;
    stim[63] = 90'h3bbb9ba9ecbef65cb330ca2;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h000000001e100000000;
      expv[2] = 74'h000000001e100000000;
      expv[3] = 74'h000000001e000000000;
      expv[4] = 74'h000000001e100000000;
      expv[5] = 74'h000000001e000000000;
      expv[6] = 74'h000000001e000000000;
      expv[7] = 74'h000000001e000000000;
      expv[8] = 74'h000000001e000000000;
      expv[9] = 74'h2df7b2437f1fc7843f5;
      expv[10] = 74'h31f567151f1fc7843f5;
      expv[11] = 74'h31f567151f0fc7843f5;
      expv[12] = 74'h12768c8d5f1686dd7a9;
      expv[13] = 74'h325cad40fff686dd7a9;
      expv[14] = 74'h2dceae517e12c2c35f3;
      expv[15] = 74'h1b796be2ff32c2c35f3;
      expv[16] = 74'h1b796be2ff32c2c35f3;
      expv[17] = 74'h1b796be2ff22c2c35f3;
      expv[18] = 74'h26102daa3e1978e766f;
      expv[19] = 74'h26102daa3e1978e766f;
      expv[20] = 74'h26102daa3e1978e766f;
      expv[21] = 74'h354e5a0b5fc978e766f;
      expv[22] = 74'h000000001e100000000;
      expv[23] = 74'h000000001e000000000;
      expv[24] = 74'h000000001e100000000;
      expv[25] = 74'h21f7d4b2de268f34e81;
      expv[26] = 74'h3ce975fc7e23e1abb4b;
      expv[27] = 74'h3ce975fc7e33e1abb4b;
      expv[28] = 74'h078eca4cbe06a61bbe2;
      expv[29] = 74'h3f6c071b1f29cf33e68;
      expv[30] = 74'h3f6c071b1f39cf33e68;
      expv[31] = 74'h3f6c071b1f29cf33e68;
      expv[32] = 74'h1c6abdc71e39544d7ab;
      expv[33] = 74'h1c6abdc71e29544d7ab;
      expv[34] = 74'h1c6abdc71e29544d7ab;
      expv[35] = 74'h1c6abdc71e39544d7ab;
      expv[36] = 74'h2eda83f7de07ee80800;
      expv[37] = 74'h2eda83f7de17ee80800;
      expv[38] = 74'h2eda83f7de17ee80800;
      expv[39] = 74'h242e30053e04ead08b7;
      expv[40] = 74'h1340a2f25e23fa2ef2c;
      expv[41] = 74'h23b600c33e0c3d5d700;
      expv[42] = 74'h23b600c33e0c3d5d700;
      expv[43] = 74'h23b600c33e1c3d5d700;
      expv[44] = 74'h26f8330ebf26608f2f9;
      expv[45] = 74'h0434ffbcbf10b9a1920;
      expv[46] = 74'h000000001e000000000;
      expv[47] = 74'h390826f25e04f720367;
      expv[48] = 74'h24a5d0657e27d1e32ac;
      expv[49] = 74'h311193b6bf24d0c2aed;
      expv[50] = 74'h311193b6bf34d0c2aed;
      expv[51] = 74'h311193b6bf24d0c2aed;
      expv[52] = 74'h311193b6bf34d0c2aed;
      expv[53] = 74'h000000001e000000000;
      expv[54] = 74'h000000001e100000000;
      expv[55] = 74'h000000001e100000000;
      expv[56] = 74'h000000001e000000000;
      expv[57] = 74'h000000001e100000000;
      expv[58] = 74'h000000001e000000000;
      expv[59] = 74'h1b89d379be3ffd139b3;
      expv[60] = 74'h2ccdf44a7e0ffd139b3;
      expv[61] = 74'h2b473d341e13cfd8f3f;
      expv[62] = 74'h023d39f15f13cfd8f3f;
      expv[63] = 74'h07daa721de03cfd8f3f;
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
