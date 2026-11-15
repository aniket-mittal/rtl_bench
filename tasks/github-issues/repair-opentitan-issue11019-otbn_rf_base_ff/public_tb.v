// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 79;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  otbn_rf_base_ff dut (
    .clk_i(clk),
    .rst_ni(in_vec[55:55]),
    .wr_addr_i(in_vec[54:50]),
    .wr_en_i(in_vec[49:49]),
    .wr_data_i(in_vec[48:10]),
    .rd_addr_a_i(in_vec[9:5]),
    .rd_addr_b_i(in_vec[4:0]),
    .rd_data_a_o(out_vec[78:40]),
    .rd_data_b_o(out_vec[39:1]),
    .we_err_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h41f887b8ee33af;
    stim[1] = 56'h7463e24e098d03;
    stim[2] = 56'hf70d7dd29e4f69;
    stim[3] = 56'he0a668b710482d;
    stim[4] = 56'hd75dd0c4bee767;
    stim[5] = 56'ha3074ef1ec9a92;
    stim[6] = 56'h82f5eb398c46da;
    stim[7] = 56'hc7e56401c77e97;
    stim[8] = 56'h90f8ea49c300e3;
    stim[9] = 56'hce400307d53cda;
    stim[10] = 56'hb4784d626f8821;
    stim[11] = 56'ha4e874685c8cc1;
    stim[12] = 56'hc306786b18b63b;
    stim[13] = 56'ha3f32f27f24090;
    stim[14] = 56'hf7c28ee51a84d0;
    stim[15] = 56'hcee532707d720f;
    stim[16] = 56'hffc96516ed5284;
    stim[17] = 56'h94642282833dc9;
    stim[18] = 56'hf6974ab909076c;
    stim[19] = 56'h8674a2147a03f5;
    stim[20] = 56'hb860783bde70e2;
    stim[21] = 56'ha67b077d225667;
    stim[22] = 56'ha87d30eb01576d;
    stim[23] = 56'hea2101787b825f;
    stim[24] = 56'h87c4ae4f6de289;
    stim[25] = 56'h9e9adfc00ec7c9;
    stim[26] = 56'hc89be1501cccc6;
    stim[27] = 56'h8f2becfb2d0895;
    stim[28] = 56'hd0af3f62fcf645;
    stim[29] = 56'h8ea678842a517f;
    stim[30] = 56'hbbb619a0c026b2;
    stim[31] = 56'hb9ea1e0d165799;
    stim[32] = 56'hd39bf87bb39082;
    stim[33] = 56'h7d6b9276cbfa84;
    stim[34] = 56'hfb67f1e96f3279;
    stim[35] = 56'hae9900ef27a392;
    stim[36] = 56'hf82356595aace7;
    stim[37] = 56'hf8549367365563;
    stim[38] = 56'hf2d983c0f9b922;
    stim[39] = 56'hbb3af56c03424f;
    stim[40] = 56'h83b9e959399855;
    stim[41] = 56'hf1f6b97d34ed0e;
    stim[42] = 56'hd542dfa8e206f5;
    stim[43] = 56'hd25d75daab047c;
    stim[44] = 56'h971b01be0abd40;
    stim[45] = 56'h8609ca037bb444;
    stim[46] = 56'ha25bf2b707aafe;
    stim[47] = 56'hfb8d96da024e19;
    stim[48] = 56'ha2d84ad067d1c1;
    stim[49] = 56'hfeb6595199b064;
    stim[50] = 56'hcfc323f75bad57;
    stim[51] = 56'ha94b39e51a279e;
    stim[52] = 56'hfb3a9fb24dc55c;
    stim[53] = 56'h96d3f453d373a5;
    stim[54] = 56'hbee282b6eff6cc;
    stim[55] = 56'hcbeb1397fc2835;
    stim[56] = 56'ha0caa3d6e39fb1;
    stim[57] = 56'h9980a615d4e592;
    stim[58] = 56'hb34b0cb6c4b302;
    stim[59] = 56'h94232b84520ae2;
    stim[60] = 56'hb27266d3178712;
    stim[61] = 56'h9da0705fe3e93c;
    stim[62] = 56'hb35d1062bcc0c6;
    stim[63] = 56'hc1e05c455dae1d;
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
      expv[0] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 79'h79590071dfxxxxxxxxxx;
      expv[13] = 79'hxxxxxxxxxx833c358c5a;
      expv[14] = 79'hxxxxxxxxxx833c358c5a;
      expv[15] = 79'h419e1ac62dxxxxxxxxxx;
      expv[16] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 79'h725945bb54aee8625f72;
      expv[20] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 79'h394c9c1f5cxxxxxxxxxx;
      expv[22] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 79'hxxxxxxxxxxe4b28b76a8;
      expv[24] = 79'hxxxxxxxxxx3d83be912a;
      expv[25] = 79'hxxxxxxxxxx3d83be912a;
      expv[26] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 79'hxxxxxxxxxxaee8625f72;
      expv[28] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 79'hxxxxxxxxxxe4b28b76a8;
      expv[30] = 79'h5774312fb9xxxxxxxxxx;
      expv[31] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 79'h66fe1eece4xxxxxxxxxx;
      expv[34] = 79'h394c9c1f5cxxxxxxxxxx;
      expv[35] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 79'h26b7f003b14d6fe00762;
      expv[37] = 79'h26403bc9e8533c421528;
      expv[38] = 79'h1ec1df4895xxxxxxxxxx;
      expv[39] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 79'hxxxxxxxxxxaee8625f72;
      expv[41] = 79'h7ccbc9fc909d7ab601a0;
      expv[42] = 79'hxxxxxxxxxxaee8625f72;
      expv[43] = 79'h299e210a946cc1e07cdc;
      expv[44] = 79'hxxxxxxxxxx0000000000;
      expv[45] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 79'hxxxxxxxxxxb3f8f4b798;
      expv[47] = 79'h419e1ac62dxxxxxxxxxx;
      expv[48] = 79'h4ebd5b00d004e501bdda;
      expv[49] = 79'h299e210a94xxxxxxxxxx;
      expv[50] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 79'h3660f03e6ec6cb6d0126;
      expv[52] = 79'hxxxxxxxxxx6cc1e07cdc;
      expv[53] = 79'h25d2ae42418d80df055e;
      expv[54] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 79'h027280deedaee8625f72;
      expv[56] = 79'h25d2ae4241f2b200e3be;
      expv[57] = 79'hxxxxxxxxxxf589cbfe14;
      expv[58] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 79'hxxxxxxxxxxf589cbfe14;
      expv[61] = 79'h1ec1df48956cc1e07cdc;
      expv[62] = 79'hxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 79'h419e1ac62d4ba55c8482;
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
