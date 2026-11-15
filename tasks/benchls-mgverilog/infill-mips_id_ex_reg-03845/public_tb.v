// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 121;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03845 dut (
    .clk(clk),
    .rst(in_vec[121:121]),
    .wb_reg_write(in_vec[120:120]),
    .wb_memtoreg(in_vec[119:119]),
    .mem_memread(in_vec[118:118]),
    .mem_memwrite(in_vec[117:117]),
    .mem_ll_mem(in_vec[116:116]),
    .mem_sc_mem(in_vec[115:115]),
    .regdst(in_vec[114:114]),
    .aluop(in_vec[113:112]),
    .alusrc(in_vec[111:111]),
    .regread1(in_vec[110:79]),
    .regread2(in_vec[78:47]),
    .sign_extend(in_vec[46:15]),
    .reg_rs(in_vec[14:10]),
    .reg_rt(in_vec[9:5]),
    .reg_rd(in_vec[4:0]),
    .ex_wb_reg_write(out_vec[120:120]),
    .ex_wb_memtoreg(out_vec[119:119]),
    .ex_mem_memread(out_vec[118:118]),
    .ex_mem_memwrite(out_vec[117:117]),
    .ex_mem_ll_mem(out_vec[116:116]),
    .ex_mem_sc_mem(out_vec[115:115]),
    .ex_regdst(out_vec[114:114]),
    .ex_aluop(out_vec[113:112]),
    .ex_alusrc(out_vec[111:111]),
    .ex_regread1(out_vec[110:79]),
    .ex_regread2(out_vec[78:47]),
    .ex_sign_extend(out_vec[46:15]),
    .ex_reg_rs(out_vec[14:10]),
    .ex_reg_rt(out_vec[9:5]),
    .ex_reg_rd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h3b56244c977f0bde3295043b6979a78;
    stim[1] = 122'h280ab00fc6dac315de5d24a28bdde62;
    stim[2] = 122'h031dafba9e1a7e4eabb8388c9b2fb94;
    stim[3] = 122'h1048f5654cc77ea12b198f5a7b00fa0;
    stim[4] = 122'h01dc860e80b034e6ca13e7865f4c25d;
    stim[5] = 122'h0a324940d403125bf7de165597dfc00;
    stim[6] = 122'h0bd105b63d4e8685ae422273570b17a;
    stim[7] = 122'h1ab9c6592da773a36437ac973b12dba;
    stim[8] = 122'h2b77ff69f342b8ea97dd9f2e3afbf20;
    stim[9] = 122'h35b24d6545556885f96b498043d729d;
    stim[10] = 122'h1db6e7b482b877f5294c8f2c49f85ce;
    stim[11] = 122'h031be3ccbfe3da3636de77c5806c0e3;
    stim[12] = 122'h140ab4dc5d7dcf2e82af33837625f26;
    stim[13] = 122'h1230ab9033ee5cc885f12cb75f1702a;
    stim[14] = 122'h119c313d9d2a5eec226a114e9a2ca47;
    stim[15] = 122'h0406b7fbbd2bba15651bb29a576466b;
    stim[16] = 122'h12a7b53d344f5533219e394bad488e7;
    stim[17] = 122'h024f291f3a5d759f2bcb58a5a799448;
    stim[18] = 122'h1b257b9e18551c26340cd273c4efb73;
    stim[19] = 122'h092399b705a7bbeed8ca3b4bb5d46b8;
    stim[20] = 122'h29aae529a75590a634bec110a29c5cc;
    stim[21] = 122'h0dc0a4ebd5d3e1a08bdac416767c4cb;
    stim[22] = 122'h129ee92188723e5902272781dea40cd;
    stim[23] = 122'h1a4ea22ff7b1e41d8ac98c95c95119a;
    stim[24] = 122'h058ff7fd6cdf9bce1ff25b82f099e39;
    stim[25] = 122'h0a2a758fd6792320c024b8494f1a6dd;
    stim[26] = 122'h1cfb9867ed94c7a0f2b7d0f894bffe6;
    stim[27] = 122'h0df8d543965f70e321539a5d4c98289;
    stim[28] = 122'h1c71e66d459c2584dbb78235a1dcb7d;
    stim[29] = 122'h0a1da5023fbbaa0962aa910469fb303;
    stim[30] = 122'h18dda07429a2dabf2cc91cea774626e;
    stim[31] = 122'h1193162243ff1bbad1e8107e56c5451;
    stim[32] = 122'h05f8ed6fa126dafdeb0d64a42bfe89a;
    stim[33] = 122'h1dec6cb0caa9b28b251d9fde12211ac;
    stim[34] = 122'h0d2457bc5150063a25b83753107163e;
    stim[35] = 122'h116103fe81173c9e075ac1fec9fec91;
    stim[36] = 122'h19accfdf8ab5001183bc4e34bbe25d2;
    stim[37] = 122'h00719e911313c5fc9583da450a5e4c5;
    stim[38] = 122'h0f8f3cd6e492eb6961697e46a79aa28;
    stim[39] = 122'h0f22b6d46266e8fcf1c336ec0d5f44c;
    stim[40] = 122'h15552f7488273d40c71c24abd7825c3;
    stim[41] = 122'h12e2faad3b060f4bb7982cf655ffe6c;
    stim[42] = 122'h13c7b38a19170c659ba624f929df70b;
    stim[43] = 122'h06105338b48cb7f6121a2e428327cc6;
    stim[44] = 122'h17b0f1dcfb1713428a1c751324537ef;
    stim[45] = 122'h030959e19fb604dad50c44d02afcf71;
    stim[46] = 122'h0d74c09f461744c0141b9d23ad5d033;
    stim[47] = 122'h2b0550691078258bd7250945ea3ab13;
    stim[48] = 122'h1172e5215f5b48388bf8bb492bf8d71;
    stim[49] = 122'h1565d5c1b0e2a0172e0ae44bc5c9a19;
    stim[50] = 122'h0037bbe445997cae6aa206dc0d26dc1;
    stim[51] = 122'h1f096f7d7cfc47891abd7e02dbb8004;
    stim[52] = 122'h17c7683b7023565b313d8e08921af63;
    stim[53] = 122'h02e3fec9cbde5f6f90dc0210d96ef5a;
    stim[54] = 122'h1cdb882d2fd838d94258ad384bc1752;
    stim[55] = 122'h090dc50984f5516664c63d0f7a04c45;
    stim[56] = 122'h17db4b5571b174869b222d24d12afca;
    stim[57] = 122'h1cf4f15ed46f581f4c88bbe8f8001a7;
    stim[58] = 122'h1acf5cf23c425602d77fb6f8b0c05d7;
    stim[59] = 122'h107990de9630f45d357dace6a5b742e;
    stim[60] = 122'h14829a6ab7a1ca1ac913df754a2878c;
    stim[61] = 122'h1bee5d80c0cfbd0753e9e397f03411e;
    stim[62] = 122'h180da87b6e8c675f5a4b82058a040c7;
    stim[63] = 122'h024aa8caf93b2759788ea54f0785e06;
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
      expv[0] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 121'h0000000000000000000000000000000;
      expv[2] = 121'h0000000000000000000000000000000;
      expv[3] = 121'h031dafba9e1a7e4eabb8388c9b2fb94;
      expv[4] = 121'h1048f5654cc77ea12b198f5a7b00fa0;
      expv[5] = 121'h01dc860e80b034e6ca13e7865f4c25d;
      expv[6] = 121'h0a324940d403125bf7de165597dfc00;
      expv[7] = 121'h0bd105b63d4e8685ae422273570b17a;
      expv[8] = 121'h1ab9c6592da773a36437ac973b12dba;
      expv[9] = 121'h0000000000000000000000000000000;
      expv[10] = 121'h0000000000000000000000000000000;
      expv[11] = 121'h1db6e7b482b877f5294c8f2c49f85ce;
      expv[12] = 121'h031be3ccbfe3da3636de77c5806c0e3;
      expv[13] = 121'h140ab4dc5d7dcf2e82af33837625f26;
      expv[14] = 121'h1230ab9033ee5cc885f12cb75f1702a;
      expv[15] = 121'h119c313d9d2a5eec226a114e9a2ca47;
      expv[16] = 121'h0406b7fbbd2bba15651bb29a576466b;
      expv[17] = 121'h12a7b53d344f5533219e394bad488e7;
      expv[18] = 121'h024f291f3a5d759f2bcb58a5a799448;
      expv[19] = 121'h1b257b9e18551c26340cd273c4efb73;
      expv[20] = 121'h092399b705a7bbeed8ca3b4bb5d46b8;
      expv[21] = 121'h0000000000000000000000000000000;
      expv[22] = 121'h0dc0a4ebd5d3e1a08bdac416767c4cb;
      expv[23] = 121'h129ee92188723e5902272781dea40cd;
      expv[24] = 121'h1a4ea22ff7b1e41d8ac98c95c95119a;
      expv[25] = 121'h058ff7fd6cdf9bce1ff25b82f099e39;
      expv[26] = 121'h0a2a758fd6792320c024b8494f1a6dd;
      expv[27] = 121'h1cfb9867ed94c7a0f2b7d0f894bffe6;
      expv[28] = 121'h0df8d543965f70e321539a5d4c98289;
      expv[29] = 121'h1c71e66d459c2584dbb78235a1dcb7d;
      expv[30] = 121'h0a1da5023fbbaa0962aa910469fb303;
      expv[31] = 121'h18dda07429a2dabf2cc91cea774626e;
      expv[32] = 121'h1193162243ff1bbad1e8107e56c5451;
      expv[33] = 121'h05f8ed6fa126dafdeb0d64a42bfe89a;
      expv[34] = 121'h1dec6cb0caa9b28b251d9fde12211ac;
      expv[35] = 121'h0d2457bc5150063a25b83753107163e;
      expv[36] = 121'h116103fe81173c9e075ac1fec9fec91;
      expv[37] = 121'h19accfdf8ab5001183bc4e34bbe25d2;
      expv[38] = 121'h00719e911313c5fc9583da450a5e4c5;
      expv[39] = 121'h0f8f3cd6e492eb6961697e46a79aa28;
      expv[40] = 121'h0f22b6d46266e8fcf1c336ec0d5f44c;
      expv[41] = 121'h15552f7488273d40c71c24abd7825c3;
      expv[42] = 121'h12e2faad3b060f4bb7982cf655ffe6c;
      expv[43] = 121'h13c7b38a19170c659ba624f929df70b;
      expv[44] = 121'h06105338b48cb7f6121a2e428327cc6;
      expv[45] = 121'h17b0f1dcfb1713428a1c751324537ef;
      expv[46] = 121'h030959e19fb604dad50c44d02afcf71;
      expv[47] = 121'h0d74c09f461744c0141b9d23ad5d033;
      expv[48] = 121'h0000000000000000000000000000000;
      expv[49] = 121'h1172e5215f5b48388bf8bb492bf8d71;
      expv[50] = 121'h1565d5c1b0e2a0172e0ae44bc5c9a19;
      expv[51] = 121'h0037bbe445997cae6aa206dc0d26dc1;
      expv[52] = 121'h1f096f7d7cfc47891abd7e02dbb8004;
      expv[53] = 121'h17c7683b7023565b313d8e08921af63;
      expv[54] = 121'h02e3fec9cbde5f6f90dc0210d96ef5a;
      expv[55] = 121'h1cdb882d2fd838d94258ad384bc1752;
      expv[56] = 121'h090dc50984f5516664c63d0f7a04c45;
      expv[57] = 121'h17db4b5571b174869b222d24d12afca;
      expv[58] = 121'h1cf4f15ed46f581f4c88bbe8f8001a7;
      expv[59] = 121'h1acf5cf23c425602d77fb6f8b0c05d7;
      expv[60] = 121'h107990de9630f45d357dace6a5b742e;
      expv[61] = 121'h14829a6ab7a1ca1ac913df754a2878c;
      expv[62] = 121'h1bee5d80c0cfbd0753e9e397f03411e;
      expv[63] = 121'h180da87b6e8c675f5a4b82058a040c7;
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
