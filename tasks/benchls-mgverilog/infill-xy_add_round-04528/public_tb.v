// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04528 dut (
    .clk(clk),
    .rst(in_vec[42:42]),
    .arg_0(in_vec[41:41]),
    .arg_1(in_vec[40:40]),
    .arg_2(in_vec[39:25]),
    .arg_3(in_vec[24:10]),
    .arg_4(in_vec[9:2]),
    .arg_5(in_vec[1:1]),
    .arg_6(in_vec[0:0]),
    .ret_0(out_vec[27:12]),
    .ret_1(out_vec[11:11]),
    .ret_2(out_vec[10:10]),
    .ret_3(out_vec[9:2]),
    .ret_4(out_vec[1:1]),
    .ret_5(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h7d8ee8291fe;
    stim[1] = 43'h6a7edb69f01;
    stim[2] = 43'h7302fc05a60;
    stim[3] = 43'h223bd93d2a0;
    stim[4] = 43'h3572b5ba029;
    stim[5] = 43'h2b4d4bf213f;
    stim[6] = 43'h2ed9a4d114e;
    stim[7] = 43'h2c46695c6a9;
    stim[8] = 43'h24915208afd;
    stim[9] = 43'h1c52a828c23;
    stim[10] = 43'h030972719f9;
    stim[11] = 43'h2b74183f97f;
    stim[12] = 43'h1f5c13cf32e;
    stim[13] = 43'h19d5cc076e0;
    stim[14] = 43'h2c513e1c2b2;
    stim[15] = 43'h78a3e3346a0;
    stim[16] = 43'h0d36625c57d;
    stim[17] = 43'h008a1b1e691;
    stim[18] = 43'h040d438016b;
    stim[19] = 43'h144513ef141;
    stim[20] = 43'h0b5b03196f3;
    stim[21] = 43'h3c36dbdf1c8;
    stim[22] = 43'h0777d7858e7;
    stim[23] = 43'h0d8f23d59a4;
    stim[24] = 43'h180b5004bdc;
    stim[25] = 43'h14f36fd05d5;
    stim[26] = 43'h0647d0f43cf;
    stim[27] = 43'h090a921ed3e;
    stim[28] = 43'h1747a866534;
    stim[29] = 43'h2e849dd78ce;
    stim[30] = 43'h2a45a8c9d8f;
    stim[31] = 43'h3db10ce1bab;
    stim[32] = 43'h31f486880ba;
    stim[33] = 43'h222d15d6c02;
    stim[34] = 43'h19f8d92a13f;
    stim[35] = 43'h2349a96f6fe;
    stim[36] = 43'h2ca1eb9acfd;
    stim[37] = 43'h1839437998c;
    stim[38] = 43'h1b953fbbaf0;
    stim[39] = 43'h14c5ab684f9;
    stim[40] = 43'h2bb7123b66c;
    stim[41] = 43'h04b5b822c74;
    stim[42] = 43'h00ca987d79e;
    stim[43] = 43'h2251f76483b;
    stim[44] = 43'h3fcd0cd4302;
    stim[45] = 43'h36d8712b56b;
    stim[46] = 43'h20396568c6a;
    stim[47] = 43'h1f735827a2d;
    stim[48] = 43'h04164160c6a;
    stim[49] = 43'h23189a2ff16;
    stim[50] = 43'h16f1ed1f6b4;
    stim[51] = 43'h274dfd8cfd3;
    stim[52] = 43'h2ac9d6af2b4;
    stim[53] = 43'h1d90d97b099;
    stim[54] = 43'h2d6529b00c3;
    stim[55] = 43'h2bb8553bae1;
    stim[56] = 43'h0945547be15;
    stim[57] = 43'h17306c4d9fb;
    stim[58] = 43'h19b3b9b2021;
    stim[59] = 43'h2fcf25f485e;
    stim[60] = 43'h082d23bbd20;
    stim[61] = 43'h3a32177d1e4;
    stim[62] = 43'h2da592d1a45;
    stim[63] = 43'h3f43140fc17;
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
      expv[0] = 28'h8d1cdfe;
      expv[1] = 28'hc19eb01;
      expv[2] = 28'h882de60;
      expv[3] = 28'h76d2aa0;
      expv[4] = 28'h827ec29;
      expv[5] = 28'h8a3293f;
      expv[6] = 28'h8a1294e;
      expv[7] = 28'h87a5aa9;
      expv[8] = 28'h6cadafd;
      expv[9] = 28'h8338423;
      expv[10] = 28'h62121f9;
      expv[11] = 28'hbc9e97f;
      expv[12] = 28'hca1d72e;
      expv[13] = 28'h7ecb6e0;
      expv[14] = 28'hdafaab2;
      expv[15] = 28'h51f0ea0;
      expv[16] = 28'h732517d;
      expv[17] = 28'h70ca291;
      expv[18] = 28'h2e6a16b;
      expv[19] = 28'h71e5541;
      expv[20] = 28'h673d2f3;
      expv[21] = 28'hd132dc8;
      expv[22] = 28'h99d40e7;
      expv[23] = 28'h7bcf1a4;
      expv[24] = 28'h806c7dc;
      expv[25] = 28'h66dd5d5;
      expv[26] = 28'h760e3cf;
      expv[27] = 28'h90d013e;
      expv[28] = 28'h5bd6534;
      expv[29] = 28'heb838ce;
      expv[30] = 28'h755498f;
      expv[31] = 28'ha10efab;
      expv[32] = 28'h29c5cba;
      expv[33] = 28'h68c4802;
      expv[34] = 28'hb46e53f;
      expv[35] = 28'h400bafe;
      expv[36] = 28'h937b8fd;
      expv[37] = 28'h4fb058c;
      expv[38] = 28'hdb976f0;
      expv[39] = 28'h53cf4f9;
      expv[40] = 28'ha6a5a6c;
      expv[41] = 28'h8638074;
      expv[42] = 28'h684a39e;
      expv[43] = 28'h702183b;
      expv[44] = 28'hb1b9f02;
      expv[45] = 28'h7b70d6b;
      expv[46] = 28'h176f86a;
      expv[47] = 28'hdc3962d;
      expv[48] = 28'h263606a;
      expv[49] = 28'h8184b16;
      expv[50] = 28'h6c0c6b4;
      expv[51] = 28'hb0a2bd3;
      expv[52] = 28'hb10aab4;
      expv[53] = 28'hd273499;
      expv[54] = 28'h91e98c3;
      expv[55] = 28'hb2b1ae1;
      expv[56] = 28'h9c1a215;
      expv[57] = 28'h6ab95fb;
      expv[58] = 28'hb466421;
      expv[59] = 28'h964c85e;
      expv[60] = 28'h5058120;
      expv[61] = 28'haf84de4;
      expv[62] = 28'hb873a45;
      expv[63] = 28'hca57c17;
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
