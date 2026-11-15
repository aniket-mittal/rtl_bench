// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 186;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02409 dut (
    .clk(clk),
    .reset(in_vec[185:185]),
    .vl(in_vec[184:176]),
    .vcsr_quant(in_vec[175:174]),
    .I_clear(in_vec[173:173]),
    .I_id(in_vec[172:170]),
    .proc_addr(in_vec[169:138]),
    .proc_din(in_vec[137:106]),
    .proc_we(in_vec[105:105]),
    .I_start(in_vec[104:104]),
    .I_vs1(in_vec[103:99]),
    .I_vs2(in_vec[98:94]),
    .I_vd(in_vec[93:89]),
    .I_RS1(in_vec[88:57]),
    .I_RS2(in_vec[56:25]),
    .I_uimm5(in_vec[24:20]),
    .I_funct(in_vec[19:12]),
    .I_permute(in_vec[11:10]),
    .I_mask_en(in_vec[9:9]),
    .I_ALUSrc(in_vec[8:7]),
    .I_dmr(in_vec[6:6]),
    .I_dmw(in_vec[5:5]),
    .I_reg_we(in_vec[4:4]),
    .I_mem_reg(in_vec[3:3]),
    .I_Xout(in_vec[2:2]),
    .I_mode_lsu(in_vec[1:0]),
    .ALU_mon(out_vec[72:72]),
    .stall(out_vec[71:71]),
    .DONE(out_vec[70:70]),
    .proc_dout(out_vec[69:38]),
    .XRF_ADDR(out_vec[37:33]),
    .XRF_DATAWR(out_vec[32:1]),
    .XRF_WE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 186'h3fa024e4f273db72665e23aa5af95f023a22e7a7b75d371;
    stim[1] = 186'h2a1b5f3f04fe0ad78165fe548b107d9eba9185e399ee459;
    stim[2] = 186'h062b6db2441ffe635a7886fef4f3e08d5ce481bed56d591;
    stim[3] = 186'h1e6362f2fd3e88cc8fe3f408ef492f7cca058ef257acd4e;
    stim[4] = 186'h13a85dda6e7b8e4cacc8054f15f04037092b1525ba0164e;
    stim[5] = 186'h111ab72f3c8a865e521f9ba0784e70fd527744aecd7881e;
    stim[6] = 186'h0d83fb985fc54816ac13c955c1d4bba7974f369a9535008;
    stim[7] = 186'h03c2258b421818858af82f61642498cf9e85080080d1af2;
    stim[8] = 186'h13068c7e7ca739ff16cf1691522d6006b1b0bb7c2e97f19;
    stim[9] = 186'h12abb61861ea9319a4ea03386d2767e380e8ec794adc7ed;
    stim[10] = 186'h1e97d4452b562739dda2e0cced111b9111d66e84953598a;
    stim[11] = 186'h143d1df9b646b634408ef310517acbcb46cfe9c943d7a85;
    stim[12] = 186'h0ff6eddf19cd4845f391645572b9a3ebe7702e326f1310a;
    stim[13] = 186'h1717f944ff0fe2a80a81bc1cd3014cf83ff62bc4f4ffcad;
    stim[14] = 186'h11a621283f86f3a85cb3ba06a85728c09f74c04fd131cd0;
    stim[15] = 186'h120aeab2da7f560700bcb66b37dae5974f0bd07d0a80056;
    stim[16] = 186'h0fc4dc4fd0268597ecabcc72af644e12679d04858faecf9;
    stim[17] = 186'h0cf0da6f18fa2bec9ffd5e0810ec9b08ef0f3e926979c31;
    stim[18] = 186'h18bb5553aebc054465c9eec0d4c37d43d72bceb2caf8bcc;
    stim[19] = 186'h0e3a72f8b14628eb5da8441eb54da480cd55f96c01edead;
    stim[20] = 186'h1e3f2d9a71b8b6cab1dc67b9e7a6f2cc8a5e3a4e014f45c;
    stim[21] = 186'h09fd0e32e0b5a7879970dbe0838bec5b1e0649fbee2f380;
    stim[22] = 186'h1cf47cae5a4c93dd1ead638a6de59ea63a572be05329791;
    stim[23] = 186'h1921a92009130ad563ddd0b329031f993ae7c5aa4caa5fa;
    stim[24] = 186'h117c0ed03d1532dd4c5dea9f9876167b99e096aa3294626;
    stim[25] = 186'h0ebf2503c73e3ddbc941e49b867fc04ef3bce161913d433;
    stim[26] = 186'h088947a6856e2251db23deca8681cc3dbc0b8d7bc0ea199;
    stim[27] = 186'h04f2aaf355d0ca9d6f75df971362c7932a160d008001d57;
    stim[28] = 186'h090d6b323dd41e3d501419dedbad3c26116520b6eed396d;
    stim[29] = 186'h0b3f3c244287526c5640e2a72bf9869c41021815449741b;
    stim[30] = 186'h109a4816f43f0b239a82d2eb9c945b654c356d4bcefc2fd;
    stim[31] = 186'h1980804856c26ea6d2ec5d2e51386bd06cd672b95fdc704;
    stim[32] = 186'h1d07d58243e94bf04e60556d5fe8ff882c5f66a3d044145;
    stim[33] = 186'h0d3be6a60f31e5c82f078e244b56e7edbfca3b796a1c38c;
    stim[34] = 186'h0d1673987e524265e19404b9039302a7acdf7b8927d60ef;
    stim[35] = 186'h188f51cdf1b906a611920b63e6ded1f1ef03df25dd26e06;
    stim[36] = 186'h1519e78977b5735196ab50a977e7a28365a78f993b0247b;
    stim[37] = 186'h0abc3392b20bc45019730e24e703a5c094335789c0367be;
    stim[38] = 186'h11aec0b176a4d4a9bf6e935793696e7829a083ec66ad799;
    stim[39] = 186'h16882562741698cb731106966e0c4b9ada42c96ade540ee;
    stim[40] = 186'h196fa137c7c466177b31bd199016bb57645bb7597ce1e0f;
    stim[41] = 186'h131260e14e1d3a85632660c5cf16fc5609f0947e8e5a54e;
    stim[42] = 186'h09be28b6097385272b2f67f05d72de9ca492802ec59d7fc;
    stim[43] = 186'h1a952aa2d4956646402844fe7202de8bfeaa9499b3762c9;
    stim[44] = 186'h1f001dafeae0198c59e3721f99a89cabd600ebddb534611;
    stim[45] = 186'h08d6dbeac40720409e803c180a8fb1ead81342c7d3898e2;
    stim[46] = 186'h0b603e2f5ca60ad20705fcdecb57efe13fbb3a884347261;
    stim[47] = 186'h0e627a6c714b8bc979fdcc2d8bc5c3b71b6a6238829b552;
    stim[48] = 186'h0e007de8251ccaf232a60ee7ec2ce26e469b868d67a6ce8;
    stim[49] = 186'h1e687388a94e6f451e0ffed402b3cc3b1d010f4fab374bb;
    stim[50] = 186'h075bc75b2f18003306c248246826b6a95a3720f7db922ec;
    stim[51] = 186'h138d0d96e77ea5634dfb6f125021c4d5a84484892ac4171;
    stim[52] = 186'h176897fe2126ea28fdbdff945dcfd1d165270fe231d04df;
    stim[53] = 186'h168554f5c7a359faa9096e4303d9bd91e8c1aa71f55c06f;
    stim[54] = 186'h13d0feaab71df5463606e6b6bdf0fd1b0d99b7c511aa881;
    stim[55] = 186'h04e3a16812b324a4c4027f2c4deefe4d04455054a602ff8;
    stim[56] = 186'h07a037f4a62ffc80a2eb665abff73e2d4eefaf7e9ceb318;
    stim[57] = 186'h00c4d5ea09eaac38e273753cabe2274aa72e4618fb865ec;
    stim[58] = 186'h0da55b9fd14cd4aadcecbfeb1dfec69cbae668d1b1f0d79;
    stim[59] = 186'h0550eee1d1d605accfd4c073aa760d9cee62ec6d97986c4;
    stim[60] = 186'h352c8a27641fb44b57f513f68ac8f88bdaf63a6d2945a6e;
    stim[61] = 186'h0e1b177cfde980188c9c41e79e90575f95fbee088dc7ca4;
    stim[62] = 186'h10ba825e3e4af739f0256e3eb88407ab3144a3649b62e72;
    stim[63] = 186'h067217900bcba07d3b48cafd841925218ff39fede667488;
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
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h1400000000000000000;
      expv[4] = 73'h048cc8fe3d0f492f7cc;
      expv[5] = 73'h088cc8fe3c000000000;
      expv[6] = 73'h048cc8fe3ef84e70fd5;
      expv[7] = 73'h048cc8fe3c000000000;
      expv[8] = 73'h1d8858af80000000000;
      expv[9] = 73'h0d8858af81b22d6006b;
      expv[10] = 73'h1d8858af80000000000;
      expv[11] = 73'h16739dda2c000000000;
      expv[12] = 73'h1b634408ecd17acbcb4;
      expv[13] = 73'h04845f3914000000000;
      expv[14] = 73'h162a80a81b13014cf82;
      expv[15] = 73'h173a85cb3a885728c09;
      expv[16] = 73'h0560700bc997dae5975;
      expv[17] = 73'h1160700bc8000000000;
      expv[18] = 73'h0160700bcb90ec9b08f;
      expv[19] = 73'h1c54465c9c000000000;
      expv[20] = 73'h1c54465c9c000000000;
      expv[21] = 73'h076cab1dc4000000000;
      expv[22] = 73'h1b6cab1dc6e38bec5b0;
      expv[23] = 73'h193dd1ead4000000000;
      expv[24] = 73'h113dd1ead429031f993;
      expv[25] = 73'h0b2dd4c5dc000000000;
      expv[26] = 73'h07ddbc941c000000000;
      expv[27] = 73'h13ddbc941fa681cc3db;
      expv[28] = 73'h07ddbc941ff362c7933;
      expv[29] = 73'h03ddbc941e7bad3c260;
      expv[30] = 73'h0526c5640c000000000;
      expv[31] = 73'h1d26c5640cbc945b655;
      expv[32] = 73'h0926c5640f51386bd06;
      expv[33] = 73'h0526c5640d5fe8ff882;
      expv[34] = 73'h1d26c5640c000000000;
      expv[35] = 73'h1526c5640c000000000;
      expv[36] = 73'h0d26c5640c000000000;
      expv[37] = 73'h0126c5640c37e7a2837;
      expv[38] = 73'h1926c5640c000000000;
      expv[39] = 73'h1d26c5640cd3696e783;
      expv[40] = 73'h1126c5640c000000000;
      expv[41] = 73'h0e6177b31b5016bb576;
      expv[42] = 73'h07a8563264000000000;
      expv[43] = 73'h1c5272b2f4000000000;
      expv[44] = 73'h185272b2f4000000000;
      expv[45] = 73'h0998c59e3499a89cabd;
      expv[46] = 73'h160409e8030a8fb1eac;
      expv[47] = 73'h08ad20705f2b57efe12;
      expv[48] = 73'h04ad20705c000000000;
      expv[49] = 73'h10ad20705c000000000;
      expv[50] = 73'h12f451e0ffa2b3cc3b1;
      expv[51] = 73'h1ef451e0fc000000000;
      expv[52] = 73'h025634dfb4000000000;
      expv[53] = 73'h12a28fdbdffdcfd1d17;
      expv[54] = 73'h019faa9094000000000;
      expv[55] = 73'h135463606c000000000;
      expv[56] = 73'h1e4a4c4027cdeefe4d1;
      expv[57] = 73'h0bc80a2eb4000000000;
      expv[58] = 73'h12c38e27354be2274aa;
      expv[59] = 73'h014aadcecbfdfec69cb;
      expv[60] = 73'h0000000000000000000;
      expv[61] = 73'h0000000000000000000;
      expv[62] = 73'h1400000000000000000;
      expv[63] = 73'h0f739f0254000000000;
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
