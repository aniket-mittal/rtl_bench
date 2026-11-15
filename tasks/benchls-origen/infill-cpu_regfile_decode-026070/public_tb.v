// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026070 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .ins(in_vec[34:19]),
    .data_alu(in_vec[18:3]),
    .rd_alu(in_vec[2:0]),
    .r1_data(out_vec[40:25]),
    .r2_data(out_vec[24:9]),
    .rd(out_vec[8:6]),
    .aluop(out_vec[5:3]),
    .imm_data(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h9223ae5bd;
    stim[1] = 36'he403e85cb;
    stim[2] = 36'h0d815f56c;
    stim[3] = 36'h6d992d2cc;
    stim[4] = 36'h009be7fcd;
    stim[5] = 36'h6a1f03be3;
    stim[6] = 36'h726640a30;
    stim[7] = 36'h6be246500;
    stim[8] = 36'h300059540;
    stim[9] = 36'h75457aa3b;
    stim[10] = 36'h71d8876d9;
    stim[11] = 36'h4db0347b8;
    stim[12] = 36'h6e2c2e3d3;
    stim[13] = 36'h69ddac362;
    stim[14] = 36'h3d419667b;
    stim[15] = 36'h6bd3c8deb;
    stim[16] = 36'h4d2c5e0ee;
    stim[17] = 36'h4ef17f654;
    stim[18] = 36'h515f30920;
    stim[19] = 36'h44f2f22b8;
    stim[20] = 36'h2217639a6;
    stim[21] = 36'h7b5f5273e;
    stim[22] = 36'h79e361dca;
    stim[23] = 36'h1787111f1;
    stim[24] = 36'ha5a053082;
    stim[25] = 36'h3091309ca;
    stim[26] = 36'h0890dcbbd;
    stim[27] = 36'h19a4db5fd;
    stim[28] = 36'h37b6f4486;
    stim[29] = 36'h4870eaba9;
    stim[30] = 36'h4ca71da6b;
    stim[31] = 36'h7dbd53560;
    stim[32] = 36'h28b373dfb;
    stim[33] = 36'h29366cebb;
    stim[34] = 36'h773c99a2b;
    stim[35] = 36'h6b5b71830;
    stim[36] = 36'h5f8a6151f;
    stim[37] = 36'h501fde58f;
    stim[38] = 36'h04b58cf77;
    stim[39] = 36'h6be199cdd;
    stim[40] = 36'h1a5bd763b;
    stim[41] = 36'h6cdf261e2;
    stim[42] = 36'h275ef1123;
    stim[43] = 36'h3dd90398a;
    stim[44] = 36'h48ceaace3;
    stim[45] = 36'h3fc93da90;
    stim[46] = 36'h3da16d66d;
    stim[47] = 36'h49c25887f;
    stim[48] = 36'h34045daea;
    stim[49] = 36'h0dc8261ef;
    stim[50] = 36'h383fb75eb;
    stim[51] = 36'h559f3608c;
    stim[52] = 36'h4bdfdaac1;
    stim[53] = 36'h07d2ca610;
    stim[54] = 36'h0afa11828;
    stim[55] = 36'h65d7f704a;
    stim[56] = 36'h0d77a1223;
    stim[57] = 36'h33edfe081;
    stim[58] = 36'h8ffe5ee3f;
    stim[59] = 36'h490b95f7b;
    stim[60] = 36'h4ff7ea5fa;
    stim[61] = 36'h726d6f560;
    stim[62] = 36'h62935932c;
    stim[63] = 36'h04cdf7f9f;
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
      expv[0] = 41'hxxxxxxxxx0x;
      expv[1] = 41'h0000a000001;
      expv[2] = 41'h0000a000022;
      expv[3] = 41'h000000000e6;
      expv[4] = 41'h000000000c6;
      expv[5] = 41'h00000000ac0;
      expv[6] = 41'h19ff2000105;
      expv[7] = 41'h0000a000b01;
      expv[8] = 41'h19ff200001d;
      expv[9] = 41'h16551655000;
      expv[10] = 41'h0000b9ff2c2;
      expv[11] = 41'h16550000180;
      expv[12] = 41'h00000000146;
      expv[13] = 41'h00000d1eec7;
      expv[14] = 41'h0b4b200001c;
      expv[15] = 41'h000019ff286;
      expv[16] = 41'h19ff2000145;
      expv[17] = 41'h1783ab4b3a6;
      expv[18] = 41'h00001237ac7;
      expv[19] = 41'h0c2499ff380;
      expv[20] = 41'h0b0d9237a92;
      expv[21] = 41'h01db7c8aec1;
      expv[22] = 41'h19ff39ff305;
      expv[23] = 41'h1fd9400000c;
      expv[24] = 41'h1237b49cf13;
      expv[25] = 41'h1877349ceba;
      expv[26] = 41'h1c8aec27280;
      expv[27] = 41'h1fd94c2730c;
      expv[28] = 41'h1fd9549cf9c;
      expv[29] = 41'h1237bd12183;
      expv[30] = 41'h1fd95aaeb04;
      expv[31] = 41'h1d120c273c6;
      expv[32] = 41'h1d121d12196;
      expv[33] = 41'h1fd94c27394;
      expv[34] = 41'h1fd95fd95c4;
      expv[35] = 41'h0668bfd94c3;
      expv[36] = 41'h16d7f6d7e45;
      expv[37] = 41'h18547d120c7;
      expv[38] = 41'h1c60dc60d80;
      expv[39] = 41'h0c272c27302;
      expv[40] = 41'h0673633dccd;
      expv[41] = 41'h06737aaeac5;
      expv[42] = 41'h1d1215d8ed6;
      expv[43] = 41'h1c4486736fb;
      expv[44] = 41'h1d12033dc46;
      expv[45] = 41'h1fd94ab387c;
      expv[46] = 41'h033dc33dd3f;
      expv[47] = 41'h1d121d12006;
      expv[48] = 41'h1fd95621e1c;
      expv[49] = 41'h176baf6a442;
      expv[50] = 41'h1d120987bde;
      expv[51] = 41'h1fd94f6a4c4;
      expv[52] = 41'h176bbd120c2;
      expv[53] = 41'h1b59a987a85;
      expv[54] = 41'h0dd7a987bc3;
      expv[55] = 41'h1b59add7a85;
      expv[56] = 41'h1dc12987b82;
      expv[57] = 41'h1d121b59b5e;
      expv[58] = 41'h1f820987bc1;
      expv[59] = 41'h0987a987a47;
      expv[60] = 41'h0d822d82384;
      expv[61] = 41'h0987a987b47;
      expv[62] = 41'h1f821f82081;
      expv[63] = 41'h1f821a97e41;
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
