// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09037 dut (
    .clk(clk),
    .regwrite(in_vec[47:47]),
    .data_in(in_vec[46:15]),
    .reg_addr1(in_vec[14:10]),
    .reg_addr2(in_vec[9:5]),
    .write_addr(in_vec[4:0]),
    .reg_out1(out_vec[63:32]),
    .reg_out2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h267e4a94d5eb;
    stim[1] = 48'hfa2b0891488e;
    stim[2] = 48'h097f5a3db5f4;
    stim[3] = 48'h28be3080fe8c;
    stim[4] = 48'hd04ee4899692;
    stim[5] = 48'haf43f9c09061;
    stim[6] = 48'hc11f922c7deb;
    stim[7] = 48'h51953664265d;
    stim[8] = 48'h7cf1cfc6be92;
    stim[9] = 48'haf990c39e048;
    stim[10] = 48'hc1a79e958e5c;
    stim[11] = 48'h61f8ad8e9799;
    stim[12] = 48'ha9c9d5c6e168;
    stim[13] = 48'ha2bda0fdf99d;
    stim[14] = 48'hbaee3a3bba39;
    stim[15] = 48'hbdeab186c6d4;
    stim[16] = 48'h300d2afdb7be;
    stim[17] = 48'h46b93814b073;
    stim[18] = 48'ha3088e32940e;
    stim[19] = 48'hb6a7440536b1;
    stim[20] = 48'h2b13aa874aff;
    stim[21] = 48'hc975e377673f;
    stim[22] = 48'h1dbb34b040b9;
    stim[23] = 48'h83d13e87b539;
    stim[24] = 48'h64b9bb8ad8f2;
    stim[25] = 48'h830c26972421;
    stim[26] = 48'hc87825ae17a0;
    stim[27] = 48'h3606ace82fea;
    stim[28] = 48'h1d0db8850ae4;
    stim[29] = 48'h4a02c83504b7;
    stim[30] = 48'h4dd3d0e83abb;
    stim[31] = 48'hc8f0d5e4544e;
    stim[32] = 48'h9378c7bae3b1;
    stim[33] = 48'h3ea00c00764e;
    stim[34] = 48'h39339d4ef721;
    stim[35] = 48'h89da5b5adbe4;
    stim[36] = 48'h555d90f94f69;
    stim[37] = 48'h2e64480352c3;
    stim[38] = 48'h4ed2f52f9f29;
    stim[39] = 48'h02aba72524e0;
    stim[40] = 48'hfa4f046bf8cd;
    stim[41] = 48'hb07443e96c4d;
    stim[42] = 48'hde501240f027;
    stim[43] = 48'h25d02a007b07;
    stim[44] = 48'hd8402c76d9c9;
    stim[45] = 48'h9634a8c25b8f;
    stim[46] = 48'h3a989bf86333;
    stim[47] = 48'h5c0268845dcd;
    stim[48] = 48'h1082948d539d;
    stim[49] = 48'h8f44366654dc;
    stim[50] = 48'h3bf0bb204a86;
    stim[51] = 48'hb1f43cf8a9cc;
    stim[52] = 48'hbd0fbec29fd7;
    stim[53] = 48'h164453f650b6;
    stim[54] = 48'he3fce8db7cb7;
    stim[55] = 48'h2b2454db8393;
    stim[56] = 48'ha317f5bd2667;
    stim[57] = 48'hc55566e4ed56;
    stim[58] = 48'hbab8610d3bbb;
    stim[59] = 48'hab84ef93ab50;
    stim[60] = 48'h83c803f87f95;
    stim[61] = 48'hfa56f60e5faf;
    stim[62] = 48'h3c40fb8f5518;
    stim[63] = 48'hb33bcb4fc0db;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxa09dc913;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxa09dc913;
      expv[11] = 64'hxxxxxxxx834f3d2b;
      expv[12] = 64'hxxxxxxxx823f2458;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hf4561122xxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxx457b41fb;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxx00000000;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'ha09dc913xxxxxxxx;
      expv[21] = 64'h75dc747775dc7477;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxx5e87f381;
      expv[26] = 64'hxxxxxxxx457b41fb;
      expv[27] = 64'h823f245892ebc6ee;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h06184d2exxxxxxxx;
      expv[30] = 64'h46111c65xxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxx457b41fb;
      expv[33] = 64'h457b41fba09dc913;
      expv[34] = 64'h457b41fb07a27d0f;
      expv[35] = 64'hxxxxxxxx92ebc6ee;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'h7bd5630dxxxxxxxx;
      expv[38] = 64'hxxxxxxxx07a27d0f;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'h834f3d2b06184d2e;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxx91e1abc8;
      expv[45] = 64'hxxxxxxxx834f3d2b;
      expv[46] = 64'hxxxxxxxx07a27d0f;
      expv[47] = 64'hxxxxxxxx91e1abc8;
      expv[48] = 64'h7bd5630d834f3d2b;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'ha09dc9137bd5630d;
      expv[51] = 64'hxxxxxxxx91e1abc8;
      expv[52] = 64'hbca02481xxxxxxxx;
      expv[53] = 64'h7bd5630dxxxxxxxx;
      expv[54] = 64'h92ebc6eexxxxxxxx;
      expv[55] = 64'h000000001e886ccc;
      expv[56] = 64'hb08058edxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'h91e1abc8457b41fb;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'h92ebc6ee1e886ccc;
      expv[61] = 64'hc7f9d1b6457b41fb;
      expv[62] = 64'h079007f05393ab8d;
      expv[63] = 64'h5709df27xxxxxxxx;
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
