// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085351 dut (
    .iClk(clk),
    .iReset_n(in_vec[7:7]),
    .iRun_MV(in_vec[6:6]),
    .iFF_full(in_vec[5:1]),
    .iSum_finish(in_vec[0:0]),
    .oRun_sum(out_vec[39:39]),
    .oRst_reg(out_vec[38:38]),
    .oRdreq_FF(out_vec[37:33]),
    .oWrreq_FF(out_vec[32:28]),
    .oRd_OM(out_vec[27:27]),
    .oAddr_OM(out_vec[26:14]),
    .oPosition(out_vec[13:1]),
    .oOutput_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h5d;
    stim[1] = 8'h17;
    stim[2] = 8'hab;
    stim[3] = 8'hb2;
    stim[4] = 8'hfa;
    stim[5] = 8'hc2;
    stim[6] = 8'he7;
    stim[7] = 8'hc2;
    stim[8] = 8'hab;
    stim[9] = 8'he4;
    stim[10] = 8'h9c;
    stim[11] = 8'hc9;
    stim[12] = 8'hac;
    stim[13] = 8'hf9;
    stim[14] = 8'h8f;
    stim[15] = 8'h86;
    stim[16] = 8'haf;
    stim[17] = 8'ha8;
    stim[18] = 8'hc4;
    stim[19] = 8'hff;
    stim[20] = 8'h82;
    stim[21] = 8'hda;
    stim[22] = 8'hb7;
    stim[23] = 8'h9c;
    stim[24] = 8'hd7;
    stim[25] = 8'ha4;
    stim[26] = 8'hde;
    stim[27] = 8'ha8;
    stim[28] = 8'h95;
    stim[29] = 8'heb;
    stim[30] = 8'hd3;
    stim[31] = 8'hf0;
    stim[32] = 8'hce;
    stim[33] = 8'hd8;
    stim[34] = 8'haa;
    stim[35] = 8'hd6;
    stim[36] = 8'hdb;
    stim[37] = 8'hd1;
    stim[38] = 8'hce;
    stim[39] = 8'hf9;
    stim[40] = 8'hc9;
    stim[41] = 8'hf9;
    stim[42] = 8'hf4;
    stim[43] = 8'hf7;
    stim[44] = 8'h9e;
    stim[45] = 8'h81;
    stim[46] = 8'ha1;
    stim[47] = 8'h92;
    stim[48] = 8'h96;
    stim[49] = 8'ha2;
    stim[50] = 8'hb8;
    stim[51] = 8'hd0;
    stim[52] = 8'h96;
    stim[53] = 8'ha9;
    stim[54] = 8'hf7;
    stim[55] = 8'hf4;
    stim[56] = 8'h8e;
    stim[57] = 8'hab;
    stim[58] = 8'h82;
    stim[59] = 8'hcb;
    stim[60] = 8'hda;
    stim[61] = 8'hc1;
    stim[62] = 8'h9e;
    stim[63] = 8'ha9;
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
      expv[0] = 40'hxxxxxxxxxx;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0008000000;
      expv[7] = 40'h0018004002;
      expv[8] = 40'h001800800a;
      expv[9] = 40'h001800c00c;
      expv[10] = 40'h0018010014;
      expv[11] = 40'h0018014014;
      expv[12] = 40'h0018018016;
      expv[13] = 40'h001801c01e;
      expv[14] = 40'h0018020020;
      expv[15] = 40'h0018024022;
      expv[16] = 40'h001802802a;
      expv[17] = 40'h001802c02c;
      expv[18] = 40'h0018030034;
      expv[19] = 40'h0018034034;
      expv[20] = 40'h0018038036;
      expv[21] = 40'h001803c03e;
      expv[22] = 40'h001804003e;
      expv[23] = 40'h0018044040;
      expv[24] = 40'h0018048048;
      expv[25] = 40'h001804c04a;
      expv[26] = 40'h0018050052;
      expv[27] = 40'h0018054052;
      expv[28] = 40'h0018058052;
      expv[29] = 40'h001805c054;
      expv[30] = 40'h0018060056;
      expv[31] = 40'h0018064058;
      expv[32] = 40'h0018068060;
      expv[33] = 40'h001806c060;
      expv[34] = 40'h0018070060;
      expv[35] = 40'h0018074060;
      expv[36] = 40'h0018078060;
      expv[37] = 40'h001807c062;
      expv[38] = 40'h0018080064;
      expv[39] = 40'h001808406c;
      expv[40] = 40'h001808806e;
      expv[41] = 40'h001808c070;
      expv[42] = 40'h0018090072;
      expv[43] = 40'h001809407a;
      expv[44] = 40'h001809807c;
      expv[45] = 40'h001809c084;
      expv[46] = 40'h00180a0086;
      expv[47] = 40'h00180a4088;
      expv[48] = 40'h00180a8090;
      expv[49] = 40'h00180ac090;
      expv[50] = 40'h00180b0090;
      expv[51] = 40'h00180b4090;
      expv[52] = 40'h00180b8090;
      expv[53] = 40'h00180bc090;
      expv[54] = 40'h00180c0092;
      expv[55] = 40'h00180c4094;
      expv[56] = 40'h00180c809c;
      expv[57] = 40'h00180cc09c;
      expv[58] = 40'h00180d009e;
      expv[59] = 40'h00180d40a6;
      expv[60] = 40'h00180d80a8;
      expv[61] = 40'h00180dc0b0;
      expv[62] = 40'h00180e00b2;
      expv[63] = 40'h00180e40ba;
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
