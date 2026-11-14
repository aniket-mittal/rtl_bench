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
    stim[0] = 8'h5b;
    stim[1] = 8'h6b;
    stim[2] = 8'ha4;
    stim[3] = 8'h87;
    stim[4] = 8'haf;
    stim[5] = 8'hfa;
    stim[6] = 8'h84;
    stim[7] = 8'hbd;
    stim[8] = 8'hb7;
    stim[9] = 8'hcf;
    stim[10] = 8'haf;
    stim[11] = 8'hf0;
    stim[12] = 8'hce;
    stim[13] = 8'he8;
    stim[14] = 8'hee;
    stim[15] = 8'hb2;
    stim[16] = 8'h98;
    stim[17] = 8'hdb;
    stim[18] = 8'hda;
    stim[19] = 8'haf;
    stim[20] = 8'h98;
    stim[21] = 8'hc9;
    stim[22] = 8'hcc;
    stim[23] = 8'hab;
    stim[24] = 8'haf;
    stim[25] = 8'hd1;
    stim[26] = 8'h97;
    stim[27] = 8'h95;
    stim[28] = 8'he4;
    stim[29] = 8'hc8;
    stim[30] = 8'h8c;
    stim[31] = 8'hc7;
    stim[32] = 8'h97;
    stim[33] = 8'h8f;
    stim[34] = 8'he6;
    stim[35] = 8'h84;
    stim[36] = 8'hed;
    stim[37] = 8'h97;
    stim[38] = 8'hd4;
    stim[39] = 8'he6;
    stim[40] = 8'h88;
    stim[41] = 8'hd9;
    stim[42] = 8'haf;
    stim[43] = 8'h88;
    stim[44] = 8'ha3;
    stim[45] = 8'hc2;
    stim[46] = 8'hc2;
    stim[47] = 8'hd1;
    stim[48] = 8'hb8;
    stim[49] = 8'hcd;
    stim[50] = 8'hfc;
    stim[51] = 8'hd5;
    stim[52] = 8'h88;
    stim[53] = 8'he0;
    stim[54] = 8'hd2;
    stim[55] = 8'h99;
    stim[56] = 8'hcb;
    stim[57] = 8'h83;
    stim[58] = 8'hb9;
    stim[59] = 8'hd1;
    stim[60] = 8'haa;
    stim[61] = 8'hf6;
    stim[62] = 8'hc6;
    stim[63] = 8'h8c;
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
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0008000000;
      expv[8] = 40'h0018004002;
      expv[9] = 40'h0018008004;
      expv[10] = 40'h001800c006;
      expv[11] = 40'h0018010008;
      expv[12] = 40'h0018014010;
      expv[13] = 40'h0018018010;
      expv[14] = 40'h001801c010;
      expv[15] = 40'h0018020010;
      expv[16] = 40'h0018024010;
      expv[17] = 40'h0018028010;
      expv[18] = 40'h001802c012;
      expv[19] = 40'h001803001a;
      expv[20] = 40'h001803401c;
      expv[21] = 40'h0018038024;
      expv[22] = 40'h001803c026;
      expv[23] = 40'h001804002e;
      expv[24] = 40'h0018044030;
      expv[25] = 40'h0018048032;
      expv[26] = 40'h001804c034;
      expv[27] = 40'h0018050036;
      expv[28] = 40'h0018054038;
      expv[29] = 40'h0018058040;
      expv[30] = 40'h001805c040;
      expv[31] = 40'h0018060040;
      expv[32] = 40'h0018064042;
      expv[33] = 40'h0018068044;
      expv[34] = 40'h001806c046;
      expv[35] = 40'h001807004e;
      expv[36] = 40'h001807404e;
      expv[37] = 40'h0018078050;
      expv[38] = 40'h001807c052;
      expv[39] = 40'h001808005a;
      expv[40] = 40'h001808405a;
      expv[41] = 40'h001808805a;
      expv[42] = 40'h001808c05c;
      expv[43] = 40'h001809005e;
      expv[44] = 40'h0018094066;
      expv[45] = 40'h0018098068;
      expv[46] = 40'h001809c070;
      expv[47] = 40'h00180a0070;
      expv[48] = 40'h00180a4072;
      expv[49] = 40'h00180a807a;
      expv[50] = 40'h00180ac07c;
      expv[51] = 40'h00180b0084;
      expv[52] = 40'h00180b4086;
      expv[53] = 40'h00180b808e;
      expv[54] = 40'h00180bc08e;
      expv[55] = 40'h00180c008e;
      expv[56] = 40'h00180c4090;
      expv[57] = 40'h00180c8092;
      expv[58] = 40'h00180cc094;
      expv[59] = 40'h00180d0096;
      expv[60] = 40'h00180d4098;
      expv[61] = 40'h00180d80a0;
      expv[62] = 40'h00180dc0a0;
      expv[63] = 40'h00180e00a0;
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
