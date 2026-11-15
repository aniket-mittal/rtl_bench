// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01291 dut (
    .ap_clk(clk),
    .ap_rst_n(in_vec[77:77]),
    .s_axilite_AWVALID(in_vec[76:76]),
    .s_axilite_AWADDR(in_vec[75:71]),
    .s_axilite_WVALID(in_vec[70:70]),
    .s_axilite_WDATA(in_vec[69:38]),
    .s_axilite_WSTRB(in_vec[37:34]),
    .s_axilite_BREADY(in_vec[33:33]),
    .s_axilite_ARVALID(in_vec[32:32]),
    .s_axilite_ARADDR(in_vec[31:27]),
    .s_axilite_RREADY(in_vec[26:26]),
    .in0_V_TVALID(in_vec[25:25]),
    .in0_V_TDATA(in_vec[24:1]),
    .out_V_TREADY(in_vec[0:0]),
    .s_axilite_AWREADY(out_vec[66:66]),
    .s_axilite_WREADY(out_vec[65:65]),
    .s_axilite_BVALID(out_vec[64:64]),
    .s_axilite_BRESP(out_vec[63:62]),
    .s_axilite_ARREADY(out_vec[61:61]),
    .s_axilite_RVALID(out_vec[60:60]),
    .s_axilite_RDATA(out_vec[59:28]),
    .s_axilite_RRESP(out_vec[27:26]),
    .in0_V_TREADY(out_vec[25:25]),
    .out_V_TVALID(out_vec[24:24]),
    .out_V_TDATA(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h135a6c765a9104b1c568;
    stim[1] = 78'h05b3b7a9bc3bbcefbf3e;
    stim[2] = 78'h3fc263390351ce03489c;
    stim[3] = 78'h284f14f95e0f3c79d0e5;
    stim[4] = 78'h2d929dc2867a0e39d237;
    stim[5] = 78'h0a248b99167435a3b90e;
    stim[6] = 78'h24fbe51f557b0da11c61;
    stim[7] = 78'h3d8803d5f0cc780ac1c9;
    stim[8] = 78'h3cfb3a5dc0a31694babc;
    stim[9] = 78'h3c2a71b312ce6ab9e4be;
    stim[10] = 78'h3e076af647da9a7b1d28;
    stim[11] = 78'h254dfc76e4abd627fc54;
    stim[12] = 78'h0574665283569d84ecf8;
    stim[13] = 78'h27084413a20992e79691;
    stim[14] = 78'h3b9f979477ea4df9bb42;
    stim[15] = 78'h2879b4987554fa488f13;
    stim[16] = 78'h31cca7cb912d02d5c776;
    stim[17] = 78'h3c4d2944192d8128d40e;
    stim[18] = 78'h36623d313bf542ef51ac;
    stim[19] = 78'h2f8adf5fe6e5d042a419;
    stim[20] = 78'h2cd0d902e3d3857ba0e8;
    stim[21] = 78'h35e457994c9b0614b607;
    stim[22] = 78'h33a98e736dc69f14d19e;
    stim[23] = 78'h295dd2b3cb8d34774f3f;
    stim[24] = 78'h3990c4da46a0c42c9496;
    stim[25] = 78'h2638a42d1bbe2605545a;
    stim[26] = 78'h2bd35aff6df61f31524a;
    stim[27] = 78'h2da27123abc87750a931;
    stim[28] = 78'h23dfad4bff3232348afb;
    stim[29] = 78'h3254663ecc97dc6d6317;
    stim[30] = 78'h20d4b2b4e66402442ea3;
    stim[31] = 78'h303b2a6bc8b0a0b7eee5;
    stim[32] = 78'h2f22003f07440c384ad6;
    stim[33] = 78'h26c8bf5a9352fa90d567;
    stim[34] = 78'h223e7e3e358211f51ed5;
    stim[35] = 78'h210df38ee95c81338748;
    stim[36] = 78'h310edb462ff60a12a6c0;
    stim[37] = 78'h2db498a1538e10f169e7;
    stim[38] = 78'h2baee74d14930822e34c;
    stim[39] = 78'h2326d293fb5504d09748;
    stim[40] = 78'h2e1cccc44c8dbb72000e;
    stim[41] = 78'h31c7fafe98b302e94eaa;
    stim[42] = 78'h32b9fbb7290bb2e4fbd7;
    stim[43] = 78'h211b137c62605d4633e7;
    stim[44] = 78'h372eb98d9bae2d795b53;
    stim[45] = 78'h2a56aa632ad81f096ec5;
    stim[46] = 78'h26c00d5760b36ea4e13c;
    stim[47] = 78'h3f70211d324157ff9787;
    stim[48] = 78'h2139be080f5088a97a09;
    stim[49] = 78'h33d39c456bbe100e0a8a;
    stim[50] = 78'h306fcbe66ed9fd32c72e;
    stim[51] = 78'h255fbd38fabac5f6e8f1;
    stim[52] = 78'h246f105ac995477ee64b;
    stim[53] = 78'h2e0b4ab09e27096b722f;
    stim[54] = 78'h30981647de5147383aaa;
    stim[55] = 78'h3d57288703a884d4bd7f;
    stim[56] = 78'h213781dcc66e908c3a83;
    stim[57] = 78'h3b6c6a18e8549bcbc818;
    stim[58] = 78'h20fb8b4dc9524c08747e;
    stim[59] = 78'h31d615d1336ed9b7fe89;
    stim[60] = 78'h2c10d2c3fda6de416501;
    stim[61] = 78'h2e2e959bac8276598813;
    stim[62] = 78'h3af8738b93e891777d7d;
    stim[63] = 78'h266d8bae51a5e2b6f4da;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h73000000002000000;
      expv[4] = 67'h22000000002000000;
      expv[5] = 67'h000000000031ce91b;
      expv[6] = 67'h00000000000000000;
      expv[7] = 67'h23000000002000000;
      expv[8] = 67'h40000000002000000;
      expv[9] = 67'h730000000034a5d5e;
      expv[10] = 67'h400000000035cf25f;
      expv[11] = 67'h400000000033d8e94;
      expv[12] = 67'h2300000000313fe2a;
      expv[13] = 67'h00000000000000000;
      expv[14] = 67'h03000000002000000;
      expv[15] = 67'h40000000002000000;
      expv[16] = 67'h20000000003244789;
      expv[17] = 67'h730000000036ae3bb;
      expv[18] = 67'h620000000026ae3bb;
      expv[19] = 67'h7300000000377a8d6;
      expv[20] = 67'h0200000000277a8d6;
      expv[21] = 67'h2300000000277a8d6;
      expv[22] = 67'h720000000030a5b03;
      expv[23] = 67'h400000000038a68cf;
      expv[24] = 67'h230000000028a68cf;
      expv[25] = 67'h400000000028a68cf;
      expv[26] = 67'h0000000000302aa2d;
      expv[27] = 67'h2000000000398a925;
      expv[28] = 67'h00000000003a85498;
      expv[29] = 67'h200000000031a457d;
      expv[30] = 67'h730000000021a457d;
      expv[31] = 67'h20000000003221751;
      expv[32] = 67'h40000000002221751;
      expv[33] = 67'h00000000002221751;
      expv[34] = 67'h20000000003486ab3;
      expv[35] = 67'h00000000002486ab3;
      expv[36] = 67'h00000000002486ab3;
      expv[37] = 67'h40000000003095360;
      expv[38] = 67'h00000000002095360;
      expv[39] = 67'h03000000002095360;
      expv[40] = 67'h02000000002095360;
      expv[41] = 67'h03000000003b90007;
      expv[42] = 67'h7200000000374a755;
      expv[43] = 67'h43000000003727deb;
      expv[44] = 67'h00000000002727deb;
      expv[45] = 67'h40000000002727deb;
      expv[46] = 67'h2000000000384b762;
      expv[47] = 67'h2300000000352709e;
      expv[48] = 67'h72000000003ffcbc3;
      expv[49] = 67'h00000000002ffcbc3;
      expv[50] = 67'h70000000002ffcbc3;
      expv[51] = 67'h63000000002ffcbc3;
      expv[52] = 67'h20000000002ffcbc3;
      expv[53] = 67'h23000000003bf7325;
      expv[54] = 67'h02000000002bf7325;
      expv[55] = 67'h430000000039c1d55;
      expv[56] = 67'h700000000029c1d55;
      expv[57] = 67'h000000000029c1d55;
      expv[58] = 67'h70000000003e5e40c;
      expv[59] = 67'h20000000002e5e40c;
      expv[60] = 67'h70000000002e5e40c;
      expv[61] = 67'h0000000000320b280;
      expv[62] = 67'h000000000032cc409;
      expv[63] = 67'h700000000022cc409;
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
