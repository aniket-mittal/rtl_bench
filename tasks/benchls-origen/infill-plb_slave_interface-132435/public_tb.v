// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132435 dut (
    .SPLB_Clk(clk),
    .SPLB_Rst(in_vec[146:146]),
    .PLB_ABus(in_vec[145:114]),
    .PLB_UABus(in_vec[113:82]),
    .PLB_PAValid(in_vec[81:81]),
    .PLB_SAValid(in_vec[80:80]),
    .PLB_rdPrim(in_vec[79:79]),
    .PLB_wrPrim(in_vec[78:78]),
    .PLB_masterID(in_vec[77:75]),
    .PLB_abort(in_vec[74:74]),
    .PLB_busLock(in_vec[73:73]),
    .PLB_RNW(in_vec[72:72]),
    .PLB_BE(in_vec[71:68]),
    .PLB_MSize(in_vec[67:66]),
    .PLB_size(in_vec[65:62]),
    .PLB_type(in_vec[61:59]),
    .PLB_lockErr(in_vec[58:58]),
    .PLB_wrDBus(in_vec[57:26]),
    .PLB_wrBurst(in_vec[25:25]),
    .PLB_rdBurst(in_vec[24:24]),
    .PLB_wrPendReq(in_vec[23:23]),
    .PLB_rdPendReq(in_vec[22:22]),
    .PLB_wrPendPri(in_vec[21:20]),
    .PLB_rdPendPri(in_vec[19:18]),
    .PLB_reqPri(in_vec[17:16]),
    .PLB_TAttribute(in_vec[15:0]),
    .Sl_addrAck(out_vec[54:54]),
    .Sl_SSize(out_vec[53:52]),
    .Sl_wait(out_vec[51:51]),
    .Sl_rearbitrate(out_vec[50:50]),
    .Sl_wrDAck(out_vec[49:49]),
    .Sl_wrComp(out_vec[48:48]),
    .Sl_wrBTerm(out_vec[47:47]),
    .Sl_rdDBus(out_vec[46:15]),
    .Sl_rdWdAddr(out_vec[14:11]),
    .Sl_rdDAck(out_vec[10:10]),
    .Sl_rdComp(out_vec[9:9]),
    .Sl_rdBTerm(out_vec[8:8]),
    .Sl_MBusy(out_vec[7:6]),
    .Sl_MWrErr(out_vec[5:4]),
    .Sl_MRdErr(out_vec[3:2]),
    .Sl_MIRQ(out_vec[1:1]),
    .IP2INTC_Irpt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h79c65fbe42f0117be0b60c78b7c14f4136cf6;
    stim[1] = 147'h5488d958795e6ab70959d43cdbedd8ca7c1a6;
    stim[2] = 147'h11b5b78b5f2fd75e0cf01108ac0bf460c389b;
    stim[3] = 147'h22738f1bb31ee5223d194a52837ba7160147d;
    stim[4] = 147'h2eb09a59e57a9cc1652af10a0c74459b73055;
    stim[5] = 147'h29b344f3fac65dd99c604f650092e9d8f2b60;
    stim[6] = 147'h3cb30de34978cb9bd95d879b035e661b06a6b;
    stim[7] = 147'h3fc313d67aa478d68f9703b96f64db309d19a;
    stim[8] = 147'h2d6178f470a9cde3c5417c81d7d3c3b71596c;
    stim[9] = 147'h2bd43cdd00bdbaa5e0772ea80d4b113758edc;
    stim[10] = 147'h0c4b3b3a38135d93f86e002edd5bc78e5cdaf;
    stim[11] = 147'h18f0b96cf01d6ca5815dd32166be30cb69127;
    stim[12] = 147'h38c63ec72872f06e06bc4074b0448e12f785c;
    stim[13] = 147'h28238d20b1cb7995e0d51080a0e5367cd1e84;
    stim[14] = 147'h03b8bf6bb2ab55aa9238e4791e7b303943fb0;
    stim[15] = 147'h02671c709f03a67d3a8253ae9c21d9ddb6c2d;
    stim[16] = 147'h0e7edeba19d5fb0f644ea067a957ee416a1ab;
    stim[17] = 147'h278c4754127a4da28403f62f5ec8c4a5faff2;
    stim[18] = 147'h0df10dad804d012b49c1e67ebd58301e23d29;
    stim[19] = 147'h260f9599c02593d35121965c12b4b663d12ac;
    stim[20] = 147'h36ec0d7023081afe1157c21394d9bf129b174;
    stim[21] = 147'h005e9e2a44f3f3d76737962f5913bc944a95d;
    stim[22] = 147'h171f191e522e01e17172723d6a966bc60289e;
    stim[23] = 147'h330a41e4e25b535b53d0850aa270ca0d10650;
    stim[24] = 147'h07d42704913d5f9befdb2ff246ce125919b4d;
    stim[25] = 147'h37a85c68be0251f1582e13c7de95c70a89c3c;
    stim[26] = 147'h2190d665cb74a734fa79fdc4d1a333bfd114d;
    stim[27] = 147'h007b2a2d2e48eaf1cd9114552cff758409908;
    stim[28] = 147'h3bf1f5f01a61cb4a4289e3b7a697e0ba85385;
    stim[29] = 147'h3ecc70a6438e56fb2ef6ededb3d278a918b45;
    stim[30] = 147'h353b0e5bfab55148eb87c4b1998eac17fde8b;
    stim[31] = 147'h219a12fc1bfd018c13381c28511c98f22224f;
    stim[32] = 147'h355383db1b0d3e43dddd1b5bb4b42fde77ff7;
    stim[33] = 147'h3f024aaf6f162bf4020d881cbae3c35c1e153;
    stim[34] = 147'h0783f3d4cfea4057175e1ae6f817292841df4;
    stim[35] = 147'h065dd409ae5e622d79b575387c25fbb9d548f;
    stim[36] = 147'h1438dd44882aae3f92097384fc101e7fde4ac;
    stim[37] = 147'h14d44a1b497c17ffcd60cd7c9411ad6f0f888;
    stim[38] = 147'h091d012997acd12327caf90ca1c566521946e;
    stim[39] = 147'h268488ab74cfa56e4f86662cd2068df48c0f7;
    stim[40] = 147'h29b2affe4a40d3579d79bf307431b7db82c69;
    stim[41] = 147'h10800a0dedab825275bb01dd0ddc9c189387b;
    stim[42] = 147'h002d92cd158652056f676fa799d68ccb23f3f;
    stim[43] = 147'h12d10bac6b9c8119edd7dabb88fe7e17593bf;
    stim[44] = 147'h16f6cacd1e16f9263f7b8d6683f94f8b60f8e;
    stim[45] = 147'h1acf11a1aff2f74ab3c12e3c687e511cd84d7;
    stim[46] = 147'h1c83f8e4f38d4f486fda8e5a7e5cf0c6673bc;
    stim[47] = 147'h29aba06d4434b2b2b6aa73e71cb562afc5d9c;
    stim[48] = 147'h6e340dc3e5fa9a5f736d957025e44bc58a980;
    stim[49] = 147'h257563e364d836e2002a187cddc285ce1f8db;
    stim[50] = 147'h021e7c40c9c7c78ff6f7d06f05f8cff5c84ed;
    stim[51] = 147'h1e862cae7bfcb25da41fb47b82faa4fdb57f1;
    stim[52] = 147'h282963b72a42cbc020674d0efc2c4155c7839;
    stim[53] = 147'h384d4589192961fdf58ea5fdbd048e9d3c595;
    stim[54] = 147'h3a578a8623a7c00f4225978532a48702da314;
    stim[55] = 147'h0c6021b672f0524d356e4787de8cea9f59c67;
    stim[56] = 147'h139674116005ac3ec5174204f93bd0cb02f54;
    stim[57] = 147'h1fd767fff8a1bc4764634c76b8973b8aa0f4a;
    stim[58] = 147'h3bf13b0ac75ff399780a1c3b91faeed449934;
    stim[59] = 147'h229eafea2b32fc1bc732094ed2d7084c4d562;
    stim[60] = 147'h3017977c8b07c13aac00fec345cdf4eaf9a7b;
    stim[61] = 147'h3300a552759ecc346b40d069fe20fd633bd44;
    stim[62] = 147'h0c70814446b61cb04401b95bc67e5eed2eae4;
    stim[63] = 147'h3bded7fd3486fbee2be0d977a95570ad66dff;
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
      expv[0] = 55'h40000000000000;
      expv[1] = 55'h00000000000600;
      expv[2] = 55'h00000000000600;
      expv[3] = 55'h40000000000600;
      expv[4] = 55'h43000000000000;
      expv[5] = 55'h03000000000000;
      expv[6] = 55'h00003819330600;
      expv[7] = 55'h00002afb288600;
      expv[8] = 55'h03000000000000;
      expv[9] = 55'h40000000000000;
      expv[10] = 55'h40000000000000;
      expv[11] = 55'h00000000000000;
      expv[12] = 55'h00000000000000;
      expv[13] = 55'h40000000000000;
      expv[14] = 55'h00000000000000;
      expv[15] = 55'h40000000000000;
      expv[16] = 55'h43000000000000;
      expv[17] = 55'h03000000000000;
      expv[18] = 55'h00000000000000;
      expv[19] = 55'h00000000000000;
      expv[20] = 55'h00000000000000;
      expv[21] = 55'h40000000000000;
      expv[22] = 55'h40000000000000;
      expv[23] = 55'h00000000000000;
      expv[24] = 55'h40001ad3d78600;
      expv[25] = 55'h00000000000000;
      expv[26] = 55'h40001ad3d78600;
      expv[27] = 55'h000028b2998600;
      expv[28] = 55'h00000000000000;
      expv[29] = 55'h400028b2998600;
      expv[30] = 55'h40000000000000;
      expv[31] = 55'h00000000000000;
      expv[32] = 55'h000028b2998600;
      expv[33] = 55'h00000000000000;
      expv[34] = 55'h00000000000000;
      expv[35] = 55'h40001ad3d78600;
      expv[36] = 55'h00000000000000;
      expv[37] = 55'h03000000000000;
      expv[38] = 55'h43000000000000;
      expv[39] = 55'h03000000000000;
      expv[40] = 55'h0000241f5d0600;
      expv[41] = 55'h40000000000000;
      expv[42] = 55'h43000000000000;
      expv[43] = 55'h400006f4e20600;
      expv[44] = 55'h40003944398600;
      expv[45] = 55'h40000000000000;
      expv[46] = 55'h40005cf6840600;
      expv[47] = 55'h43000000000000;
      expv[48] = 55'h40000000000000;
      expv[49] = 55'h00000000000000;
      expv[50] = 55'h40000000000000;
      expv[51] = 55'h40000000000000;
      expv[52] = 55'h40000000000000;
      expv[53] = 55'h43000000000000;
      expv[54] = 55'h00000000000000;
      expv[55] = 55'h43000000000000;
      expv[56] = 55'h00000000000000;
      expv[57] = 55'h43000000000000;
      expv[58] = 55'h40000000000000;
      expv[59] = 55'h00000000000000;
      expv[60] = 55'h43000000000000;
      expv[61] = 55'h40000000000000;
      expv[62] = 55'h03000000000000;
      expv[63] = 55'h40000000000000;
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
