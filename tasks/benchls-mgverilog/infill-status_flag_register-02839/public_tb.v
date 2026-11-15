// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02839 dut (
    .iCLOCK(clk),
    .inRESET(in_vec[35:35]),
    .iRESET_SYNC(in_vec[34:34]),
    .iCTRL_HOLD(in_vec[33:33]),
    .iPFLAGR_VALID(in_vec[32:32]),
    .iPFLAGR(in_vec[31:27]),
    .iPREV_INST_VALID(in_vec[26:26]),
    .iPREV_BUSY(in_vec[25:25]),
    .iPREV_FLAG_WRITE(in_vec[24:24]),
    .iSHIFT_VALID(in_vec[23:23]),
    .iSHIFT_FLAG(in_vec[22:18]),
    .iADDER_VALID(in_vec[17:17]),
    .iADDER_FLAG(in_vec[16:12]),
    .iMUL_VALID(in_vec[11:11]),
    .iMUL_FLAG(in_vec[10:6]),
    .iLOGIC_VALID(in_vec[5:5]),
    .iLOGIC_FLAG(in_vec[4:0]),
    .oFLAG(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'he237c8ab0;
    stim[1] = 36'ha79b9b8ac;
    stim[2] = 36'h7d7721056;
    stim[3] = 36'h7d711253b;
    stim[4] = 36'h1b6247205;
    stim[5] = 36'h5c7bdc54a;
    stim[6] = 36'h24bc183ae;
    stim[7] = 36'h54be08a66;
    stim[8] = 36'h24bc2ffa7;
    stim[9] = 36'h3e18c0bcf;
    stim[10] = 36'h7dcabf802;
    stim[11] = 36'h04b6d6f54;
    stim[12] = 36'h7cc3a19e5;
    stim[13] = 36'h7f2fa5fbc;
    stim[14] = 36'h1e2063f95;
    stim[15] = 36'h48fbed94d;
    stim[16] = 36'h43418db88;
    stim[17] = 36'h3c89ec8f0;
    stim[18] = 36'h118f93c4b;
    stim[19] = 36'h6faada9c9;
    stim[20] = 36'h63c59bc47;
    stim[21] = 36'h7e6152340;
    stim[22] = 36'h7ec4e8850;
    stim[23] = 36'h436f75cdc;
    stim[24] = 36'h2b80ee860;
    stim[25] = 36'h6f8122365;
    stim[26] = 36'h1508527bb;
    stim[27] = 36'h2cfac151f;
    stim[28] = 36'h3569adb27;
    stim[29] = 36'h1c49ba7d9;
    stim[30] = 36'h188b1198a;
    stim[31] = 36'h0c4ebdaac;
    stim[32] = 36'h6acf65174;
    stim[33] = 36'h12bfb4aa0;
    stim[34] = 36'hf9a357e43;
    stim[35] = 36'h5c415a37e;
    stim[36] = 36'h36741cab7;
    stim[37] = 36'h71c308cba;
    stim[38] = 36'h5a48534d4;
    stim[39] = 36'h5c8188b8b;
    stim[40] = 36'h1bb408e32;
    stim[41] = 36'h0f9cf299b;
    stim[42] = 36'h7c5b7cec8;
    stim[43] = 36'h236da5a40;
    stim[44] = 36'h44ce8a4d5;
    stim[45] = 36'h57e944e0c;
    stim[46] = 36'h7444e27cd;
    stim[47] = 36'h72fb7c78f;
    stim[48] = 36'h50db4fdb2;
    stim[49] = 36'h65f49de11;
    stim[50] = 36'h0bdd167aa;
    stim[51] = 36'h675de9f43;
    stim[52] = 36'h15362bf31;
    stim[53] = 36'h5ec759a52;
    stim[54] = 36'h2d8e57ab4;
    stim[55] = 36'h2af06e9c9;
    stim[56] = 36'h2a6b05930;
    stim[57] = 36'h7048d3501;
    stim[58] = 36'h5558fa85d;
    stim[59] = 36'h3250a6149;
    stim[60] = 36'h37ff0cc0d;
    stim[61] = 36'h7343c9752;
    stim[62] = 36'h61e6feaff;
    stim[63] = 36'h0293cfdbf;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
