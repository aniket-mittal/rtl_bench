// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018511 dut (
    .CLK(clk),
    .RST(in_vec[33:33]),
    .write(in_vec[32:32]),
    .Tao_Q(in_vec[31:0]),
    .Tao_cnt(out_vec[97:66]),
    .data(out_vec[65:34]),
    .tmp_cnt(out_vec[33:2]),
    .ready(out_vec[1:1]),
    .read_for_slave(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h268338903;
    stim[1] = 34'h3a35d984f;
    stim[2] = 34'h1f16e43c7;
    stim[3] = 34'h08a5a8924;
    stim[4] = 34'h0cea8670b;
    stim[5] = 34'h0c6b1d141;
    stim[6] = 34'h149b5e583;
    stim[7] = 34'h08ce299c2;
    stim[8] = 34'h027f99259;
    stim[9] = 34'h12f338507;
    stim[10] = 34'h0a53dfde5;
    stim[11] = 34'h1577b7a12;
    stim[12] = 34'h1c97b5dc0;
    stim[13] = 34'h0b7203a54;
    stim[14] = 34'h1415329b5;
    stim[15] = 34'h03a1368b1;
    stim[16] = 34'h08feb9c6d;
    stim[17] = 34'h146ef0e1a;
    stim[18] = 34'h3993d90f2;
    stim[19] = 34'h065a9b623;
    stim[20] = 34'h1319e90c1;
    stim[21] = 34'h023e3f2b0;
    stim[22] = 34'h24e1c389e;
    stim[23] = 34'h167461b06;
    stim[24] = 34'h029ce8180;
    stim[25] = 34'h0d343fb62;
    stim[26] = 34'h19ec3c5ec;
    stim[27] = 34'h1a24c0b37;
    stim[28] = 34'h0ddc32c20;
    stim[29] = 34'h11620bca2;
    stim[30] = 34'h0f0aa68c8;
    stim[31] = 34'h1c97335ca;
    stim[32] = 34'h0eae3495f;
    stim[33] = 34'h007e93fcc;
    stim[34] = 34'h054aa3a4a;
    stim[35] = 34'h123080c5b;
    stim[36] = 34'h15c221b06;
    stim[37] = 34'h099e63d46;
    stim[38] = 34'h0b53cc4a1;
    stim[39] = 34'h12dc5f16e;
    stim[40] = 34'h1f46f4124;
    stim[41] = 34'h1547e5029;
    stim[42] = 34'h1bbfd3731;
    stim[43] = 34'h00e8c5ba6;
    stim[44] = 34'h17f3c764e;
    stim[45] = 34'h031b593f4;
    stim[46] = 34'h107788381;
    stim[47] = 34'h143b6ebde;
    stim[48] = 34'h1f5d42e18;
    stim[49] = 34'h188184c27;
    stim[50] = 34'h0beba4974;
    stim[51] = 34'h0bcf075b4;
    stim[52] = 34'h06e5ea3e8;
    stim[53] = 34'h172d44fc8;
    stim[54] = 34'h119063873;
    stim[55] = 34'h16a435448;
    stim[56] = 34'h1c0b6e8eb;
    stim[57] = 34'h016997862;
    stim[58] = 34'h010934bc2;
    stim[59] = 34'h0e134ccc6;
    stim[60] = 34'h0a5e9c551;
    stim[61] = 34'h1d1b816d1;
    stim[62] = 34'h075f629e8;
    stim[63] = 34'h1a927beae;
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
      expv[0] = 98'h0000003fc0000000000000000;
      expv[1] = 98'h0000003fc0000000000000000;
      expv[2] = 98'h0000003fc0000000000000000;
      expv[3] = 98'h3c5b90f1c0000000000000000;
      expv[4] = 98'h3c5b90f1c0000000000000004;
      expv[5] = 98'h3c5b90f1c0000000000000008;
      expv[6] = 98'h3c5b90f1c000000000000000c;
      expv[7] = 98'h126d7960c0000000000000000;
      expv[8] = 98'h126d7960c0000000000000004;
      expv[9] = 98'h126d7960c0000000000000008;
      expv[10] = 98'h0bcce141c0000000000000000;
      expv[11] = 98'h0bcce141c0000000000000004;
      expv[12] = 98'h15dede8480000000000000000;
      expv[13] = 98'h325ed77000000000000000000;
      expv[14] = 98'h325ed77000000000000000004;
      expv[15] = 98'h1054ca6d40000000000000000;
      expv[16] = 98'h1054ca6d40000000000000004;
      expv[17] = 98'h1054ca6d40000000000000008;
      expv[18] = 98'h11bbc38680000000000000000;
      expv[19] = 98'h11bbc38680000000000000000;
      expv[20] = 98'h11bbc38680000000000000004;
      expv[21] = 98'h0c67a43040000000000000000;
      expv[22] = 98'h0c67a43040000000000000000;
      expv[23] = 98'h0c67a43040000000000000000;
      expv[24] = 98'h19d186c180000000000000000;
      expv[25] = 98'h19d186c180000000000000004;
      expv[26] = 98'h19d186c180000000000000008;
      expv[27] = 98'h27b0f17b00000000000000000;
      expv[28] = 98'h289302cdc0000000000000000;
      expv[29] = 98'h289302cdc0000000000000004;
      expv[30] = 98'h05882f2880000000000000000;
      expv[31] = 98'h05882f2880000000000000004;
      expv[32] = 98'h325ccd7280000000000000000;
      expv[33] = 98'h325ccd7280000000000000004;
      expv[34] = 98'h325ccd7280000000000000008;
      expv[35] = 98'h325ccd728000000000000000c;
      expv[36] = 98'h08c20316c0000000000000000;
      expv[37] = 98'h170886c180000000000000000;
      expv[38] = 98'h170886c180000000000000004;
      expv[39] = 98'h170886c180000000000000008;
      expv[40] = 98'h0b717c5b80000000000000000;
      expv[41] = 98'h3d1bd04900000000000000000;
      expv[42] = 98'h151f940a40000000000000000;
      expv[43] = 98'h2eff4dcc40000000000000000;
      expv[44] = 98'h2eff4dcc40000000000000004;
      expv[45] = 98'h1fcf1d9380000000000000000;
      expv[46] = 98'h1fcf1d9380000000000000004;
      expv[47] = 98'h01de20e040000000000000000;
      expv[48] = 98'h10edbaf780000000000000000;
      expv[49] = 98'h3d750b8600000000000000000;
      expv[50] = 98'h22061309c0000000000000000;
      expv[51] = 98'h22061309c0000000000000004;
      expv[52] = 98'h22061309c0000000000000008;
      expv[53] = 98'h22061309c000000000000000c;
      expv[54] = 98'h1cb513f200000000000000000;
      expv[55] = 98'h06418e1cc0000000000000000;
      expv[56] = 98'h1a90d51200000000000000000;
      expv[57] = 98'h302dba3ac0000000000000000;
      expv[58] = 98'h302dba3ac0000000000000004;
      expv[59] = 98'h302dba3ac0000000000000008;
      expv[60] = 98'h302dba3ac000000000000000c;
      expv[61] = 98'h302dba3ac0000000000000010;
      expv[62] = 98'h346e05b440000000000000000;
      expv[63] = 98'h346e05b440000000000000004;
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
