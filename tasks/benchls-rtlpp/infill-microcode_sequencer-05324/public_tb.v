// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05324 dut (
    .clk(clk),
    .state_alu(in_vec[67:67]),
    .state_fetch(in_vec[66:66]),
    .state_write(in_vec[65:65]),
    .funct(in_vec[64:61]),
    .ir(in_vec[60:12]),
    .destspc(in_vec[11:11]),
    .dn(in_vec[10:10]),
    .dp(in_vec[9:9]),
    .dr(in_vec[8:8]),
    .irdisp(in_vec[7:7]),
    .irjump(in_vec[6:6]),
    .jcond(in_vec[5:5]),
    .nop11(in_vec[4:4]),
    .srcspc(in_vec[3:3]),
    .srcspcpop(in_vec[2:2]),
    .trap(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .iwrited(out_vec[13:13]),
    .n(out_vec[12:12]),
    .nop(out_vec[11:11]),
    .nopa(out_vec[10:10]),
    .pcs0(out_vec[9:9]),
    .pcs1(out_vec[8:8]),
    .spcdrive(out_vec[7:7]),
    .spcenb(out_vec[6:6]),
    .spcnt(out_vec[5:5]),
    .spop(out_vec[4:4]),
    .spush(out_vec[3:3]),
    .srcspcpopreal(out_vec[2:2]),
    .srp(out_vec[1:1]),
    .swp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hc9a8e1e5154fdf7ad;
    stim[1] = 68'h0dfd604c3c79634e9;
    stim[2] = 68'hca9aa1d526e90c8ac;
    stim[3] = 68'h89381a43a8f4aba9c;
    stim[4] = 68'h5f96c040b47e1fd68;
    stim[5] = 68'h829dff1314737ed30;
    stim[6] = 68'h9afcade08da6b6c18;
    stim[7] = 68'h1d766e51da656ec1a;
    stim[8] = 68'h6a531ed39f656f63a;
    stim[9] = 68'he55d09ee77d1ab7dc;
    stim[10] = 68'h82f6b6c37863ebd84;
    stim[11] = 68'h2bf22198991f34c8e;
    stim[12] = 68'hcda9cd9c0e10cc014;
    stim[13] = 68'hf21258fd6de7ea43c;
    stim[14] = 68'h0f7a605645463df14;
    stim[15] = 68'h507baf07bf14217f0;
    stim[16] = 68'hddf24a5a174ed3970;
    stim[17] = 68'h4063275c28f2fd42e;
    stim[18] = 68'h9d729ac4d3b9c0f92;
    stim[19] = 68'h2382f346903dd465c;
    stim[20] = 68'h18ff7e9e4a4f5d0a6;
    stim[21] = 68'h5b0cdb2faf65e322a;
    stim[22] = 68'h8a6875e31c12affc6;
    stim[23] = 68'h5ad2e1f3aad85dfe4;
    stim[24] = 68'h1e7e83f3620d27fe2;
    stim[25] = 68'had30d399079e602e6;
    stim[26] = 68'h2ac1c067175a12ca4;
    stim[27] = 68'heb1b964f3bb3739ee;
    stim[28] = 68'h41f53149997bb3cca;
    stim[29] = 68'h1992d43686dd71692;
    stim[30] = 68'h3d08eed44cbf649b0;
    stim[31] = 68'h4980428fe4ee8a99c;
    stim[32] = 68'h9992ef358ad853724;
    stim[33] = 68'h6394c3691a3253e4e;
    stim[34] = 68'h758f23e1d0c5e5de8;
    stim[35] = 68'h20958247ab8df6a66;
    stim[36] = 68'h9a0a64ebb3e68d07e;
    stim[37] = 68'h513c31ff8677648d2;
    stim[38] = 68'h2dd58dbae3e0c1d4c;
    stim[39] = 68'h45a111d6f163e16c4;
    stim[40] = 68'h96f68b67a5f9c57d8;
    stim[41] = 68'hf634e635e3c400416;
    stim[42] = 68'hc72cbcf97bc9678ca;
    stim[43] = 68'hbee1c9a71c3dc45ce;
    stim[44] = 68'hd9ffadf76b62f2fb6;
    stim[45] = 68'h59361fc266465fade;
    stim[46] = 68'hcf614eb4f09221032;
    stim[47] = 68'h171efd59ec1184006;
    stim[48] = 68'hdabe40fe5a0cc013a;
    stim[49] = 68'h9662a5300772c5858;
    stim[50] = 68'h7b951464f957b5dc2;
    stim[51] = 68'h6fc455784e88c3faa;
    stim[52] = 68'hceebed1262796241a;
    stim[53] = 68'h179b214ae40bda478;
    stim[54] = 68'hbe4d279e13d17b4fa;
    stim[55] = 68'h7e5eba967893e1726;
    stim[56] = 68'hcb816b2cb3885319c;
    stim[57] = 68'hf90c80dd0b65bc99c;
    stim[58] = 68'h3999e97cc80df9e9a;
    stim[59] = 68'hbef685ca12715bba0;
    stim[60] = 68'h04bfff2741e11b69c;
    stim[61] = 68'h23604349f7497ae50;
    stim[62] = 68'h000a7565f42cc62aa;
    stim[63] = 68'h91ac8e6309d675c1e;
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
      expv[0] = 14'hxxxx;
      expv[1] = 14'h0140;
      expv[2] = 14'h03ec;
      expv[3] = 14'h0fe8;
      expv[4] = 14'h00f8;
      expv[5] = 14'h0f28;
      expv[6] = 14'h0fe8;
      expv[7] = 14'h1f68;
      expv[8] = 14'h1fc2;
      expv[9] = 14'h1fc2;
      expv[10] = 14'h1cf8;
      expv[11] = 14'h1feb;
      expv[12] = 14'h0fc0;
      expv[13] = 14'h0fc2;
      expv[14] = 14'h0f68;
      expv[15] = 14'h1e00;
      expv[16] = 14'h0f28;
      expv[17] = 14'h1bc0;
      expv[18] = 14'h1f28;
      expv[19] = 14'h1eeb;
      expv[20] = 14'h1f40;
      expv[21] = 14'h1fc0;
      expv[22] = 14'h1fe8;
      expv[23] = 14'h0fe8;
      expv[24] = 14'h1a28;
      expv[25] = 14'h1bc2;
      expv[26] = 14'h03ef;
      expv[27] = 14'h1beb;
      expv[28] = 14'h3de8;
      expv[29] = 14'h3d00;
      expv[30] = 14'h3c3b;
      expv[31] = 14'h3cf8;
      expv[32] = 14'h0fc0;
      expv[33] = 14'h1cfb;
      expv[34] = 14'h1cfb;
      expv[35] = 14'h1feb;
      expv[36] = 14'h1cf0;
      expv[37] = 14'h1c28;
      expv[38] = 14'h3cfb;
      expv[39] = 14'h3ce8;
      expv[40] = 14'h3cf8;
      expv[41] = 14'h3cf2;
      expv[42] = 14'h1ce8;
      expv[43] = 14'h1eeb;
      expv[44] = 14'h1fe8;
      expv[45] = 14'h1cf8;
      expv[46] = 14'h1f00;
      expv[47] = 14'h1f40;
      expv[48] = 14'h1fc0;
      expv[49] = 14'h1cf8;
      expv[50] = 14'h1f2b;
      expv[51] = 14'h3cfb;
      expv[52] = 14'h1fc0;
      expv[53] = 14'h0f40;
      expv[54] = 14'h1fc2;
      expv[55] = 14'h1fc2;
      expv[56] = 14'h0fc0;
      expv[57] = 14'h0feb;
      expv[58] = 14'h1feb;
      expv[59] = 14'h003b;
      expv[60] = 14'h1d68;
      expv[61] = 14'h0e2b;
      expv[62] = 14'h1968;
      expv[63] = 14'h1fe8;
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
