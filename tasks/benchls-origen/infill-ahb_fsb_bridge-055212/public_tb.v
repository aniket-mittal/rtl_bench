// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 123;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055212 dut (
    .hclk(clk),
    .hreset_n(in_vec[122:122]),
    .hsel(in_vec[121:121]),
    .hsize(in_vec[120:118]),
    .htrans(in_vec[117:116]),
    .hwrite(in_vec[115:115]),
    .haddr(in_vec[114:83]),
    .hwdata(in_vec[82:19]),
    .rdy_n(in_vec[18:18]),
    .error_n(in_vec[17:17]),
    .irq_n(in_vec[16:16]),
    .AD_in(in_vec[15:0]),
    .hrdata(out_vec[89:26]),
    .hresp(out_vec[25:24]),
    .hready(out_vec[23:23]),
    .clk(out_vec[22:22]),
    .rst_n(out_vec[21:21]),
    .aen(out_vec[20:20]),
    .size(out_vec[19:18]),
    .wr_n(out_vec[17:17]),
    .AD_out(out_vec[16:1]),
    .FSB_irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 123'h106cf62361a5218c85e13b0c709ece1;
    stim[1] = 123'h07a6002ca40f5436862714653d5575b;
    stim[2] = 123'h7a2cb31d3907ca88a30bc26455ceb4d;
    stim[3] = 123'h5932a649493be263647067b5ed6cec2;
    stim[4] = 123'h7ec7f2bcd44801e388758e361a9bb04;
    stim[5] = 123'h5433305bb2125458db9d989cb308d88;
    stim[6] = 123'h563848aba98c70bdca77d459027d958;
    stim[7] = 123'h5ec4d9bb9a1827d05b31893a6ba5d36;
    stim[8] = 123'h70efbc9515e80dec628b0655c14334d;
    stim[9] = 123'h5146a9c10cdb163de61f0964fe5b9c5;
    stim[10] = 123'h4e9ebb387c2f3beb02f92169bfd3f76;
    stim[11] = 123'h574e077896e8b5097479a6ed6fe9579;
    stim[12] = 123'h50571a52ba762a33563063423edc682;
    stim[13] = 123'h6d9c6f979a30f0c45f5f6ea1c94af7b;
    stim[14] = 123'h5196878ce635125af7740e581124cae;
    stim[15] = 123'h48e8667abb738dac0848f4faa88dcdc;
    stim[16] = 123'h492ced3a8a5315aa452f3ea5d0a7b87;
    stim[17] = 123'h76082877c6d060910d11900212516f9;
    stim[18] = 123'h6f932b63a1d515f5a25b716faf33d2d;
    stim[19] = 123'h4bfc3dc163e726b499ff24888dac230;
    stim[20] = 123'h454900d173d1d210d37972db608b06a;
    stim[21] = 123'h5994070c71cd02bf34ed952987cfc50;
    stim[22] = 123'h7edbb14cfb88752c38be5738497a665;
    stim[23] = 123'h64e003d20cbe63755be54505c03b2ff;
    stim[24] = 123'h497e1e8e3586e9f6000ad2c678da93e;
    stim[25] = 123'h7b83d46ac02e6a01cf84e5210c2de91;
    stim[26] = 123'h7716f533fa9dc0a5e93bf2dd536595f;
    stim[27] = 123'h6c6a8b29a3192de5d27d7ffbf0b111d;
    stim[28] = 123'h460151744de366cc8399632621b2a5e;
    stim[29] = 123'h51ea3a1ef379a7cbdef2f6fa9e3a569;
    stim[30] = 123'h486f66d373193af721018cf45327f91;
    stim[31] = 123'h4863f46e323b2c419cc5f60cb402a1c;
    stim[32] = 123'h7d6789f84cff77a7f7f2b016b5919db;
    stim[33] = 123'h6a42708c83eb19701b761a0820cdab5;
    stim[34] = 123'h75398244449522b5107eb89b882fcbf;
    stim[35] = 123'h7b69bacfcf3d1cff8aeb05caf70c89b;
    stim[36] = 123'h5220e55461fa3029db7b457f728bc9a;
    stim[37] = 123'h5d50f0f4be9d5eb69277f800e816742;
    stim[38] = 123'h51a713c311998dd6e35067636bd4212;
    stim[39] = 123'h52ccdf929a223e988d0af5fb2a5853b;
    stim[40] = 123'h5dee14e04ab091e7c2411888c6933c9;
    stim[41] = 123'h410a7279f907da05b8df1eef0e56103;
    stim[42] = 123'h5b7379a83fc4c823e783598cbd3e134;
    stim[43] = 123'h5088fb15b23a2fc7ab440de641c6901;
    stim[44] = 123'h7f4be47c69a329da0dd60875d847861;
    stim[45] = 123'h55ca61551cb237fdf080a7734f70faf;
    stim[46] = 123'h455ff0aed131aae01d965b7d6c03a97;
    stim[47] = 123'h7c47da34052a462f94d5ca2693f7180;
    stim[48] = 123'h486465958fe222da8370bfd3e01a045;
    stim[49] = 123'h73b8f789c7f66288a0ac6d0022276f7;
    stim[50] = 123'h57f1220520a655ce11bdf94b148eb8a;
    stim[51] = 123'h4eb53109268102bbd9a23bba0c5176b;
    stim[52] = 123'h66feceb8130508694afd4b6e2fb8753;
    stim[53] = 123'h70ca2ffc1fe15373f40861d1ad0779c;
    stim[54] = 123'h6f281bf7d55579295d86f428a48c9c2;
    stim[55] = 123'h4e410d21d5a7f8ca45b229690662a46;
    stim[56] = 123'h62a649cd57622691bfb9532d01237c5;
    stim[57] = 123'h7f89fc8e3bb27ab42efb74ff33aa70a;
    stim[58] = 123'h4babdc704e5e0579c3d3010a4e718d7;
    stim[59] = 123'h4ce8a26f72d8ee2533b9738d1070a5a;
    stim[60] = 123'h427985761761eb200297e33a32da78b;
    stim[61] = 123'h70fceeaef343d649c9ebcf587477b81;
    stim[62] = 123'h5476188a91ac1c80491105ce9269951;
    stim[63] = 123'h70bb0e20d98757b9d443b99d04163ca;
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
      expv[0] = 90'h00000000000000000820000;
      expv[1] = 90'h00000000000000000820000;
      expv[2] = 90'h00000000000000000a20001;
      expv[3] = 90'h00000000000000000aa0001;
      expv[4] = 90'h000000000000000003ab2cc;
      expv[5] = 90'h000000000000000003a74e5;
      expv[6] = 90'h000000000000000002a74e4;
      expv[7] = 90'h000000000000000002a74e5;
      expv[8] = 90'h000000000000174d8aa74e5;
      expv[9] = 90'h000000000000174d8aa74e4;
      expv[10] = 90'h000000000000174d8aa74e4;
      expv[11] = 90'h000000000000174d8aa74e5;
      expv[12] = 90'h000000000000174d8aa74e4;
      expv[13] = 90'h000000000000174d8aa74e5;
      expv[14] = 90'h000000000000174d8ae74e5;
      expv[15] = 90'h000000000000174d83e71bf;
      expv[16] = 90'h000000000000174d83e5e69;
      expv[17] = 90'h000000000000174d8bc9742;
      expv[18] = 90'h000000000000174d8a69742;
      expv[19] = 90'h000000000000174d83620a1;
      expv[20] = 90'h000000000000174d837df1b;
      expv[21] = 90'h000000000000174d827df1b;
      expv[22] = 90'h000000000000174d9a7df1a;
      expv[23] = 90'h000000000000174d9a7df1a;
      expv[24] = 90'h0000000000002cbfda7df1a;
      expv[25] = 90'h0000000000002cbfda7df1b;
      expv[26] = 90'h0000000000002cbfdabdf1b;
      expv[27] = 90'h0000000000002cbfd3a0f50;
      expv[28] = 90'h0000000000002cbfd3bab00;
      expv[29] = 90'h0000000000002cbfdb89886;
      expv[30] = 90'h0000000000002cbfdaa9887;
      expv[31] = 90'h0000000000002cbfdaa9887;
      expv[32] = 90'h0000000000002cbfdaa9886;
      expv[33] = 90'h0000000000002cbfdae9887;
      expv[34] = 90'h0000000000002cbfd3f9e27;
      expv[35] = 90'h0000000000002cbfd3fe133;
      expv[36] = 90'h0000000000002cbfd2fe133;
      expv[37] = 90'h0000000000002f269afe132;
      expv[38] = 90'h0000000000002f269afe132;
      expv[39] = 90'h0000000000002f269afe132;
      expv[40] = 90'h0000000000002f269afe132;
      expv[41] = 90'h0000000000002f269afe132;
      expv[42] = 90'h0000000000002f269afe132;
      expv[43] = 90'h0000000000002f269afe133;
      expv[44] = 90'h0000000000002f269afe133;
      expv[45] = 90'h0000000000002f269afe132;
      expv[46] = 90'h0000000000002f2693f2f91;
      expv[47] = 90'h0000000000002f2693ff1a6;
      expv[48] = 90'h0000000000002f2692ff1a6;
      expv[49] = 90'h00000000000028115aff1a7;
      expv[50] = 90'h00000000000028115a3f1a7;
      expv[51] = 90'h0000000000002811532e3de;
      expv[52] = 90'h0000000000002811532271e;
      expv[53] = 90'h00000000000028115b1b8bf;
      expv[54] = 90'h00000000000028115a3b8bf;
      expv[55] = 90'h00000000000028115afb8bf;
      expv[56] = 90'h000000000000281153ea06f;
      expv[57] = 90'h000000000000281153fdf55;
      expv[58] = 90'h000000000000281152fdf54;
      expv[59] = 90'h000000000000281152fdf54;
      expv[60] = 90'h000000000000281152fdf54;
      expv[61] = 90'h00000000000028115afdf54;
      expv[62] = 90'h00000000000028115afdf55;
      expv[63] = 90'h00000000000028115afdf54;
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
