// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141635 dut (
    .clk(clk),
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .reset(in_vec[0:0]),
    .result(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0c9806c5f30e4db87;
    stim[1] = 65'h043093beb73d1cc43;
    stim[2] = 65'h1e44e4b69b0e9037a;
    stim[3] = 65'h18cff0c115bbd1d06;
    stim[4] = 65'h18a2c08df7ff46852;
    stim[5] = 65'h0fc4540d29bab8e42;
    stim[6] = 65'h0f7a8c19165f4d946;
    stim[7] = 65'h05c2f34b6c15ae506;
    stim[8] = 65'h10901d6bc07eebfee;
    stim[9] = 65'h07dbd495a83bc7a4c;
    stim[10] = 65'h0468a62358a8b0dd0;
    stim[11] = 65'h198a89705efc794b6;
    stim[12] = 65'h08690da7177e183ee;
    stim[13] = 65'h0c0af3e935a038308;
    stim[14] = 65'h083659eb2d24db292;
    stim[15] = 65'h058398d73bce49b22;
    stim[16] = 65'h052ebb1b39073a828;
    stim[17] = 65'h01d30673d0e987fb2;
    stim[18] = 65'h0cb0fa98ce064ae04;
    stim[19] = 65'h1d5efd860f1f7c4f0;
    stim[20] = 65'h192bfd71242f75654;
    stim[21] = 65'h1ad2d2096ef5f9740;
    stim[22] = 65'h15a63893b9da552cc;
    stim[23] = 65'h0d3da37faca0b5bea;
    stim[24] = 65'h1d6cf4aafff72f05e;
    stim[25] = 65'h08083d86ff9b6b064;
    stim[26] = 65'h123fe7c1b9350319a;
    stim[27] = 65'h0280fe2c3cbf262ba;
    stim[28] = 65'h0af48a29078b74acc;
    stim[29] = 65'h00bb28a38157e3808;
    stim[30] = 65'h1147bcf961f6e125a;
    stim[31] = 65'h1772c49c2252c5b4a;
    stim[32] = 65'h19a3a44f7c95e8c58;
    stim[33] = 65'h1e8bbecc57e66b622;
    stim[34] = 65'h1ad45a9f718899ce2;
    stim[35] = 65'h15e674abcc053a840;
    stim[36] = 65'h04d32d9cb80769730;
    stim[37] = 65'h1ecc8f47787aa09e2;
    stim[38] = 65'h15ab73c248cef7272;
    stim[39] = 65'h13d96aa9c334102aa;
    stim[40] = 65'h136f747e19e00910e;
    stim[41] = 65'h12b9f1f214572e54a;
    stim[42] = 65'h12f40577349ef490a;
    stim[43] = 65'h1909a0b4929247ca0;
    stim[44] = 65'h09a6f06703fc55102;
    stim[45] = 65'h0ea33e7b56b3a28f0;
    stim[46] = 65'h1b3228ec09362baae;
    stim[47] = 65'h0ebca4c3d86d78454;
    stim[48] = 65'h00842925094a256a2;
    stim[49] = 65'h1093947adb72ac922;
    stim[50] = 65'h0e7533d2c94ca4ee0;
    stim[51] = 65'h076db8b1015f26da4;
    stim[52] = 65'h1defc958501995826;
    stim[53] = 65'h0c5072ec2c8d1c9e6;
    stim[54] = 65'h0d2d219dcaaa381c2;
    stim[55] = 65'h033e786a0290ab4dc;
    stim[56] = 65'h101fc9cc0bf712474;
    stim[57] = 65'h14065d1e2850bd40c;
    stim[58] = 65'h00e2a4951463079ba;
    stim[59] = 65'h083a0569c4a7b9a84;
    stim[60] = 65'h19a40693ede01d702;
    stim[61] = 65'h1d5724235c831e5b0;
    stim[62] = 65'h1b0b95b550a2d2dc2;
    stim[63] = 65'h13ff84e25053fc4b6;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h7;
      expv[4] = 4'h5;
      expv[5] = 4'h6;
      expv[6] = 4'h8;
      expv[7] = 4'hb;
      expv[8] = 4'h8;
      expv[9] = 4'hb;
      expv[10] = 4'h9;
      expv[11] = 4'he;
      expv[12] = 4'h9;
      expv[13] = 4'h1;
      expv[14] = 4'hd;
      expv[15] = 4'h0;
      expv[16] = 4'ha;
      expv[17] = 4'h3;
      expv[18] = 4'h9;
      expv[19] = 4'hc;
      expv[20] = 4'h8;
      expv[21] = 4'hd;
      expv[22] = 4'hb;
      expv[23] = 4'h9;
      expv[24] = 4'h8;
      expv[25] = 4'h8;
      expv[26] = 4'h9;
      expv[27] = 4'h0;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h8;
      expv[31] = 4'h8;
      expv[32] = 4'ha;
      expv[33] = 4'h1;
      expv[34] = 4'h1;
      expv[35] = 4'ha;
      expv[36] = 4'he;
      expv[37] = 4'h3;
      expv[38] = 4'ha;
      expv[39] = 4'h5;
      expv[40] = 4'hd;
      expv[41] = 4'h7;
      expv[42] = 4'h5;
      expv[43] = 4'hc;
      expv[44] = 4'h4;
      expv[45] = 4'h7;
      expv[46] = 4'h2;
      expv[47] = 4'h7;
      expv[48] = 4'h8;
      expv[49] = 4'h9;
      expv[50] = 4'hb;
      expv[51] = 4'h6;
      expv[52] = 4'h6;
      expv[53] = 4'hf;
      expv[54] = 4'h2;
      expv[55] = 4'hd;
      expv[56] = 4'h2;
      expv[57] = 4'h6;
      expv[58] = 4'h9;
      expv[59] = 4'hb;
      expv[60] = 4'hc;
      expv[61] = 4'h0;
      expv[62] = 4'h2;
      expv[63] = 4'h9;
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
