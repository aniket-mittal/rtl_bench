// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 90;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022917 dut (
    .CLK(clk),
    .RST_N(in_vec[10:10]),
    .ADDR_IN(in_vec[9:0]),
    .ADDR0(out_vec[89:80]),
    .ADDR1(out_vec[79:70]),
    .ADDR2(out_vec[69:60]),
    .ADDR3(out_vec[59:50]),
    .ADDR4(out_vec[49:40]),
    .ADDR5(out_vec[39:30]),
    .ADDR6(out_vec[29:20]),
    .ADDR7(out_vec[19:10]),
    .ADDR8(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h08c;
    stim[1] = 11'h3d5;
    stim[2] = 11'h7f4;
    stim[3] = 11'h493;
    stim[4] = 11'h7b3;
    stim[5] = 11'h4fb;
    stim[6] = 11'h755;
    stim[7] = 11'h430;
    stim[8] = 11'h7c6;
    stim[9] = 11'h4f5;
    stim[10] = 11'h64b;
    stim[11] = 11'h57e;
    stim[12] = 11'h6a3;
    stim[13] = 11'h4ff;
    stim[14] = 11'h6d8;
    stim[15] = 11'h4f8;
    stim[16] = 11'h535;
    stim[17] = 11'h7ea;
    stim[18] = 11'h573;
    stim[19] = 11'h223;
    stim[20] = 11'h4e2;
    stim[21] = 11'h791;
    stim[22] = 11'h43a;
    stim[23] = 11'h705;
    stim[24] = 11'h6ad;
    stim[25] = 11'h40b;
    stim[26] = 11'h7a3;
    stim[27] = 11'h5e6;
    stim[28] = 11'h72b;
    stim[29] = 11'h457;
    stim[30] = 11'h62a;
    stim[31] = 11'h4b2;
    stim[32] = 11'h51b;
    stim[33] = 11'h6a4;
    stim[34] = 11'h662;
    stim[35] = 11'h7ad;
    stim[36] = 11'h53f;
    stim[37] = 11'h560;
    stim[38] = 11'h605;
    stim[39] = 11'h5c7;
    stim[40] = 11'h698;
    stim[41] = 11'h5d2;
    stim[42] = 11'h739;
    stim[43] = 11'h556;
    stim[44] = 11'h680;
    stim[45] = 11'h475;
    stim[46] = 11'h462;
    stim[47] = 11'h78f;
    stim[48] = 11'h693;
    stim[49] = 11'h77e;
    stim[50] = 11'h471;
    stim[51] = 11'h7b6;
    stim[52] = 11'h7f0;
    stim[53] = 11'h535;
    stim[54] = 11'h579;
    stim[55] = 11'h533;
    stim[56] = 11'h691;
    stim[57] = 11'h53c;
    stim[58] = 11'h6de;
    stim[59] = 11'h41c;
    stim[60] = 11'h675;
    stim[61] = 11'h481;
    stim[62] = 11'h7bd;
    stim[63] = 11'h4d2;
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
      expv[0] = 90'h00000000000000000000000;
      expv[1] = 90'h00000000000000000000000;
      expv[2] = 90'h00000000000000000000000;
      expv[3] = 90'h3f400000000000000000000;
      expv[4] = 90'h093fd000000000000000000;
      expv[5] = 90'h3b324ff4000000000000000;
      expv[6] = 90'h0fbecc93fd0000000000000;
      expv[7] = 90'h3553efb324ff40000000000;
      expv[8] = 90'h030d54fbecc93fd00000000;
      expv[9] = 90'h3c60c3553efb324ff400000;
      expv[10] = 90'h0f5f1830d54fbecc93fd000;
      expv[11] = 90'h24b3d7c60c3553efb324ff4;
      expv[12] = 90'h17e92cf5f1830d54fbecc93;
      expv[13] = 90'h2a35fa4b3d7c60c3553efb3;
      expv[14] = 90'h0ffa8d7e92cf5f1830d54fb;
      expv[15] = 90'h2d83fea35fa4b3d7c60c355;
      expv[16] = 90'h0f8b60ffa8d7e92cf5f1830;
      expv[17] = 90'h1353e2d83fea35fa4b3d7c6;
      expv[18] = 90'h3ea4d4f8b60ffa8d7e92cf5;
      expv[19] = 90'h00000000000000000000000;
      expv[20] = 90'h00000000000000000000000;
      expv[21] = 90'h0e200000000000000000000;
      expv[22] = 90'h39138800000000000000000;
      expv[23] = 90'h03ae44e2000000000000000;
      expv[24] = 90'h3050eb91388000000000000;
      expv[25] = 90'h2adc143ae44e20000000000;
      expv[26] = 90'h00bab7050eb913880000000;
      expv[27] = 90'h3a302eadc143ae44e200000;
      expv[28] = 90'h1e6e8c0bab7050eb9138800;
      expv[29] = 90'h32b79ba302eadc143ae44e2;
      expv[30] = 90'h057cade6e8c0bab7050eb91;
      expv[31] = 90'h22a15f2b79ba302eadc143a;
      expv[32] = 90'h0b28a857cade6e8c0bab705;
      expv[33] = 90'h11b2ca2a15f2b79ba302ead;
      expv[34] = 90'h2a446cb28a857cade6e8c0b;
      expv[35] = 90'h262a911b2ca2a15f2b79ba3;
      expv[36] = 90'h3ad98aa446cb28a857cade6;
      expv[37] = 90'h13feb662a911b2ca2a15f2b;
      expv[38] = 90'h1604ffad98aa446cb28a857;
      expv[39] = 90'h2055813feb662a911b2ca2a;
      expv[40] = 90'h1c7815604ffad98aa446cb2;
      expv[41] = 90'h29871e055813feb662a911b;
      expv[42] = 90'h1d2a61c7815604ffad98aa4;
      expv[43] = 90'h33974a9871e055813feb662;
      expv[44] = 90'h156ce5d2a61c7815604ffad;
      expv[45] = 90'h28055b3974a9871e055813f;
      expv[46] = 90'h075a0156ce5d2a61c781560;
      expv[47] = 90'h0621d68055b3974a9871e05;
      expv[48] = 90'h38f18875a0156ce5d2a61c7;
      expv[49] = 90'h293e3c621d68055b3974a98;
      expv[50] = 90'h37ea4f8f18875a0156ce5d2;
      expv[51] = 90'h071dfa93e3c621d68055b39;
      expv[52] = 90'h3b61c77ea4f8f18875a0156;
      expv[53] = 90'h3f0ed871dfa93e3c621d680;
      expv[54] = 90'h135fc3b61c77ea4f8f18875;
      expv[55] = 90'h1794d7f0ed871dfa93e3c62;
      expv[56] = 90'h1335e535fc3b61c77ea4f8f;
      expv[57] = 90'h2914cd794d7f0ed871dfa93;
      expv[58] = 90'h13ca45335e535fc3b61c77e;
      expv[59] = 90'h2de4f2914cd794d7f0ed871;
      expv[60] = 90'h01cb793ca45335e535fc3b6;
      expv[61] = 90'h275072de4f2914cd794d7f0;
      expv[62] = 90'h0819d41cb793ca45335e535;
      expv[63] = 90'h3bd20675072de4f2914cd79;
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
