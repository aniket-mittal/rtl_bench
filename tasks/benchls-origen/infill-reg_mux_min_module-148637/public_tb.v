// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148637 dut (
    .clk(clk),
    .rst(in_vec[42:42]),
    .data_in(in_vec[41:34]),
    .sel_mux1(in_vec[33:33]),
    .sel_mux2(in_vec[32:32]),
    .num1(in_vec[31:24]),
    .num2(in_vec[23:16]),
    .num3(in_vec[15:8]),
    .num4(in_vec[7:0]),
    .final_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h6efee6c4731;
    stim[1] = 43'h58682881df6;
    stim[2] = 43'h2b7f38c05cc;
    stim[3] = 43'h24c58b6626f;
    stim[4] = 43'h263b14b6fbf;
    stim[5] = 43'h31c4739324a;
    stim[6] = 43'h07d0579cf92;
    stim[7] = 43'h3f566a751ab;
    stim[8] = 43'h4a1f673c89f;
    stim[9] = 43'h1547f69ee07;
    stim[10] = 43'h282db9bdf56;
    stim[11] = 43'h1bd51c01d51;
    stim[12] = 43'h3684ae36940;
    stim[13] = 43'h2ec3904360b;
    stim[14] = 43'h315b453b4fb;
    stim[15] = 43'h1362ff840ae;
    stim[16] = 43'h2bd036dbd8d;
    stim[17] = 43'h30e011d4e0f;
    stim[18] = 43'h20c7a11024c;
    stim[19] = 43'h39137217b99;
    stim[20] = 43'h0f935b98fbe;
    stim[21] = 43'h0836aba3f3f;
    stim[22] = 43'h3cdf32ad34e;
    stim[23] = 43'h3c0314a8ae5;
    stim[24] = 43'h2adea197448;
    stim[25] = 43'h016620278b8;
    stim[26] = 43'h1c74e21affc;
    stim[27] = 43'h2b6780178f5;
    stim[28] = 43'h2818af89708;
    stim[29] = 43'h107bf18214c;
    stim[30] = 43'h10098367357;
    stim[31] = 43'h18611ba302a;
    stim[32] = 43'h1065c654613;
    stim[33] = 43'h03873cb1125;
    stim[34] = 43'h3174c0f0a02;
    stim[35] = 43'h01616b8b5c7;
    stim[36] = 43'h30cfe2922a7;
    stim[37] = 43'h1d1d4b09337;
    stim[38] = 43'h37a758058d6;
    stim[39] = 43'h2a1809482fe;
    stim[40] = 43'h025c3eae8f9;
    stim[41] = 43'h14f7cd9ba9b;
    stim[42] = 43'h2deef0746fb;
    stim[43] = 43'h3f3aaed84a5;
    stim[44] = 43'h2d60ea75498;
    stim[45] = 43'h357a940073b;
    stim[46] = 43'h2335d68ba44;
    stim[47] = 43'h3cc59e47000;
    stim[48] = 43'h325b0fbb496;
    stim[49] = 43'h010a866d117;
    stim[50] = 43'h35bc7b64af0;
    stim[51] = 43'h31a21a538bf;
    stim[52] = 43'h34215b8d38c;
    stim[53] = 43'h03f55e6534d;
    stim[54] = 43'h107748e93ec;
    stim[55] = 43'h34c0674c68a;
    stim[56] = 43'h011d6af8e10;
    stim[57] = 43'h0538ed79da1;
    stim[58] = 43'h0bca6137510;
    stim[59] = 43'h2082f005f26;
    stim[60] = 43'h3ea2d75856c;
    stim[61] = 43'h023b6247b9e;
    stim[62] = 43'h0a21dcb3374;
    stim[63] = 43'h25ebc254fbb;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h01;
      expv[18] = 8'h00;
      expv[19] = 8'h21;
      expv[20] = 8'h35;
      expv[21] = 8'h3f;
      expv[22] = 8'h2a;
      expv[23] = 8'h00;
      expv[24] = 8'h19;
      expv[25] = 8'h02;
      expv[26] = 8'h21;
      expv[27] = 8'h01;
      expv[28] = 8'h08;
      expv[29] = 8'h18;
      expv[30] = 8'h36;
      expv[31] = 8'h11;
      expv[32] = 8'h13;
      expv[33] = 8'h11;
      expv[34] = 8'h02;
      expv[35] = 8'h16;
      expv[36] = 8'h22;
      expv[37] = 8'h37;
      expv[38] = 8'h40;
      expv[39] = 8'h80;
      expv[40] = 8'hab;
      expv[41] = 8'h0e;
      expv[42] = 8'h07;
      expv[43] = 8'h84;
      expv[44] = 8'h0e;
      expv[45] = 8'h07;
      expv[46] = 8'h40;
      expv[47] = 8'h00;
      expv[48] = 8'h09;
      expv[49] = 8'h0e;
      expv[50] = 8'h4a;
      expv[51] = 8'h21;
      expv[52] = 8'h15;
      expv[53] = 8'h4d;
      expv[54] = 8'h40;
      expv[55] = 8'h06;
      expv[56] = 8'h10;
      expv[57] = 8'h04;
      expv[58] = 8'h10;
      expv[59] = 8'h00;
      expv[60] = 8'h2d;
      expv[61] = 8'h24;
      expv[62] = 8'h1d;
      expv[63] = 8'h25;
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
