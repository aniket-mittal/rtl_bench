// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134733 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[72:72]),
    .wb_adr_i(in_vec[71:40]),
    .wb_dat_i(in_vec[39:8]),
    .wb_we_i(in_vec[7:7]),
    .wb_stb_i(in_vec[6:6]),
    .wb_cyc_i(in_vec[5:5]),
    .wb_sel_i(in_vec[4:1]),
    .srx_pad_i(in_vec[0:0]),
    .wb_dat_o(out_vec[54:23]),
    .wb_ack_o(out_vec[22:22]),
    .int_o(out_vec[21:21]),
    .stx_pad_o(out_vec[20:20]),
    .state(out_vec[19:16]),
    .debug(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h197a8a705cfef5643a1;
    stim[1] = 73'h1d719257a0678378965;
    stim[2] = 73'h00d9e5b9f8c2d79d5ee;
    stim[3] = 73'h00e8530825ea6ac9478;
    stim[4] = 73'h0dba81827508571f304;
    stim[5] = 73'h0e1544a25759b06fa03;
    stim[6] = 73'h068dd6f894ddd63e5cc;
    stim[7] = 73'h03037f475a4ffbc3a69;
    stim[8] = 73'h027283d3815f10c1063;
    stim[9] = 73'h0afff689cb2d5f9ae08;
    stim[10] = 73'h0dfe130a2621cef848e;
    stim[11] = 73'h034f713c83a8f642485;
    stim[12] = 73'h0230c426c4c1cb20171;
    stim[13] = 73'h0acf4daf9659e54000f;
    stim[14] = 73'h044f695b3b916a06350;
    stim[15] = 73'h0b7565543eae5577a86;
    stim[16] = 73'h01d8b61eacfa3085b70;
    stim[17] = 73'h05ed0643dc9655470be;
    stim[18] = 73'h0ddfd29b111d3555fae;
    stim[19] = 73'h0e16955b32b44e1a402;
    stim[20] = 73'h0071153908e077510c0;
    stim[21] = 73'h05bb5ffda2bc4b54c97;
    stim[22] = 73'h0fc6ae195eab7290b2b;
    stim[23] = 73'h0d1d2bd897eb0eeef9b;
    stim[24] = 73'h0f3b7073f612c147fbb;
    stim[25] = 73'h02a21081e99ecc54d7a;
    stim[26] = 73'h0c6be584e7cd786853f;
    stim[27] = 73'h0255f4e20ecbc627279;
    stim[28] = 73'h0ac3159ccb75d9bac55;
    stim[29] = 73'h0d65f503477bb44939b;
    stim[30] = 73'h0361ddee82e164e2fbc;
    stim[31] = 73'h04166040d2bb0411699;
    stim[32] = 73'h07f0c857c0e4dab83cf;
    stim[33] = 73'h0f665f3f7d7ab1e2af6;
    stim[34] = 73'h08460230df056a7b566;
    stim[35] = 73'h0376468fe5d268e8e8a;
    stim[36] = 73'h0d7ab7e12ce8e7067e9;
    stim[37] = 73'h0eea6d443c8c630bbf9;
    stim[38] = 73'h0c8fc2287af79e7809f;
    stim[39] = 73'h0ae6dca0dae3f15b1a2;
    stim[40] = 73'h035fa2cea310c85bff9;
    stim[41] = 73'h07a92ed6015277f7e43;
    stim[42] = 73'h0b68d95ac79e39ea038;
    stim[43] = 73'h02356aeaa4fc959ce73;
    stim[44] = 73'h0926653f0f4b9ecf0ed;
    stim[45] = 73'h0619d7fc5f594c2321f;
    stim[46] = 73'h056458dc6102c07d55a;
    stim[47] = 73'h0386dd3bbd70e40c4cf;
    stim[48] = 73'h028d29637daacc4dee7;
    stim[49] = 73'h09b3d16456729ed158d;
    stim[50] = 73'h0e8c6ef17e756916dc7;
    stim[51] = 73'h0bcbc253452fbd237cd;
    stim[52] = 73'h01d610855021c14f951;
    stim[53] = 73'h0406b5ff7f008155a91;
    stim[54] = 73'h0beb01dd325223ae215;
    stim[55] = 73'h05308e94711527cef0a;
    stim[56] = 73'h06b89f8b180b6f1b2e4;
    stim[57] = 73'h0cb734c566db8a991ab;
    stim[58] = 73'h04cfeb95664b9e20871;
    stim[59] = 73'h080f41993b2d02f9b6b;
    stim[60] = 73'h025efce2bb063b395ee;
    stim[61] = 73'h0944d0323f2b9981a59;
    stim[62] = 73'h04faf6edf4d159145d2;
    stim[63] = 73'h0b4fb20f5b1ce6248ed;
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
      expv[0] = 55'h000000xxx5xxxx;
      expv[1] = 55'h000000000a0000;
      expv[2] = 55'h000000000f0000;
      expv[3] = 55'h00000000420400;
      expv[4] = 55'h00000000470400;
      expv[5] = 55'h00000000050400;
      expv[6] = 55'h00000002090400;
      expv[7] = 55'h00000000050400;
      expv[8] = 55'h00000002480400;
      expv[9] = 55'h000000004c0400;
      expv[10] = 55'h00000000020400;
      expv[11] = 55'h00000002080400;
      expv[12] = 55'h000000000c0400;
      expv[13] = 55'h00000002490400;
      expv[14] = 55'h00000000030400;
      expv[15] = 55'h00000000030400;
      expv[16] = 55'h000000020a0400;
      expv[17] = 55'h000000004d0400;
      expv[18] = 55'h00000000010400;
      expv[19] = 55'h00000000030400;
      expv[20] = 55'h00000000000400;
      expv[21] = 55'h000000020a0400;
      expv[22] = 55'h00000000050400;
      expv[23] = 55'h00000002090400;
      expv[24] = 55'h000000000f0400;
      expv[25] = 55'h000000000e0400;
      expv[26] = 55'h000000004e0400;
      expv[27] = 55'h00000000000400;
      expv[28] = 55'h000000004c0400;
      expv[29] = 55'h00000000040400;
      expv[30] = 55'h00000002080400;
      expv[31] = 55'h000000000d0400;
      expv[32] = 55'h000000000c0400;
      expv[33] = 55'h00000000070400;
      expv[34] = 55'h000000004d042a;
      expv[35] = 55'h000000006e062a;
      expv[36] = 55'h0000000022062a;
      expv[37] = 55'h00000000630e2a;
      expv[38] = 55'h00000015670e2a;
      expv[39] = 55'h000000002d0e2a;
      expv[40] = 55'h000000032a062a;
      expv[41] = 55'h00000000600e2a;
      expv[42] = 55'h000000002c0e2a;
      expv[43] = 55'h000000032a062a;
      expv[44] = 55'h00000000600e2a;
      expv[45] = 55'h00000015650e2a;
      expv[46] = 55'h00000015260e2a;
      expv[47] = 55'h000000032b062a;
      expv[48] = 55'h00000015270e2a;
      expv[49] = 55'h0000006f650ede;
      expv[50] = 55'h0000006f270ede;
      expv[51] = 55'h0000006f240ede;
      expv[52] = 55'h0000006f250ede;
      expv[53] = 55'h0000006f270ede;
      expv[54] = 55'h00000000230ede;
      expv[55] = 55'h0000006f270ede;
      expv[56] = 55'h000000002106de;
      expv[57] = 55'h0000006f6606de;
      expv[58] = 55'h0000006f260ede;
      expv[59] = 55'h00000000630ede;
      expv[60] = 55'h000000076b0ede;
      expv[61] = 55'h000000006306de;
      expv[62] = 55'h000000002f0ede;
      expv[63] = 55'h0000006f2506de;
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
