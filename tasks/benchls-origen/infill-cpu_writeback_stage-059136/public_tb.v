// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 103;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059136 dut (
    .rd_num_passthrough(in_vec[136:133]),
    .md_passthrough(in_vec[132:101]),
    .result(in_vec[100:69]),
    .cpsr_in(in_vec[68:37]),
    .dmem_val_passthrough(in_vec[36:5]),
    .taken(in_vec[4:4]),
    .is_alu_op_passthrough(in_vec[3:3]),
    .is_cmp_op_passthrough(in_vec[2:2]),
    .is_jmp_op_passthrough(in_vec[1:1]),
    .is_ld_op_passthrough(in_vec[0:0]),
    .reg_num(out_vec[102:99]),
    .reg_write_en(out_vec[98:98]),
    .reg_val(out_vec[97:66]),
    .pc_out(out_vec[65:34]),
    .pc_write_en(out_vec[33:33]),
    .cpsr_out(out_vec[32:1]),
    .cpsr_write_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h1cc2aa949fcb9da107c262c2c1cb37c6113;
    stim[1] = 137'h1ff9c4925f0a295f4d5ca4fa3fb33d63c3c;
    stim[2] = 137'h0f192b5b085aa391fa17c5f142ad4d4c932;
    stim[3] = 137'h1e0e0535ec6755c3642e8f818a4e08ed3c4;
    stim[4] = 137'h04f33c8ac947a9cb316c5e6e428f300c2ed;
    stim[5] = 137'h1eda238ed280e94f386efdb6ca5acfc3c8d;
    stim[6] = 137'h0fcbd8c41d0df4f34591bdfd93d14d5af62;
    stim[7] = 137'h1acb776f7ece3d133566fab84f4df1eedec;
    stim[8] = 137'h19173839b1edd09e84b6afb168540c65b48;
    stim[9] = 137'h103442481bfccd2765f7a6e335ce5746955;
    stim[10] = 137'h1c03f9b4bd6d1cda75cdb67756258b6ebfd;
    stim[11] = 137'h15e3c736a4af907bf18ea7df363d6825fd5;
    stim[12] = 137'h1a85854447ddc2667e90eda7a4cb118c185;
    stim[13] = 137'h0c8af90a204cd90c519bff1ae3c7c4e96f8;
    stim[14] = 137'h1ef6291fba71d7dcdb1a4ee0971a0d2d0dd;
    stim[15] = 137'h1c3d7cc32dfb21fe089dc0ef07c160a8939;
    stim[16] = 137'h1691be8208a87115b1eb149e735ccaecdc0;
    stim[17] = 137'h11dff9b83b4d7afc1060691da61ca5361a8;
    stim[18] = 137'h0cf47ac0bf40a2c76e568098eee077bfdd9;
    stim[19] = 137'h0d42505e5ba5c7e9e621f27679add24ddb6;
    stim[20] = 137'h0b34053217c57de578a219f98830398c5c3;
    stim[21] = 137'h14d50700ffc59b4542927f906a0212f149c;
    stim[22] = 137'h13033768467ca26e81e8a9f7df37e7098ae;
    stim[23] = 137'h03486d2df3d0f3d10c43df6193ed6de336a;
    stim[24] = 137'h16c28151bd6ad601c59e4ebdc042bb92e51;
    stim[25] = 137'h11a14fcd0a9aac576a767af32bf68d4964c;
    stim[26] = 137'h0aa14c6e7434b0a7b8467b1abd3466c8b6e;
    stim[27] = 137'h1e51b3e0083465302092c401b3eb4ad591e;
    stim[28] = 137'h0720fe60993c3d51d339997a8e2f6c9d56f;
    stim[29] = 137'h0d057dee7fc85445e6af163b185049f1383;
    stim[30] = 137'h145d8d660bd00c544478f180b7a486f1204;
    stim[31] = 137'h0b9fef53b80c7ef41a07c4894dcccb3f33f;
    stim[32] = 137'h1ba0dadca185e18a9f78a52291ce05c1f32;
    stim[33] = 137'h00b60e79a52dc9aeca23c2f9ad1f0dc4c00;
    stim[34] = 137'h1059f6ad5f9c440c2abb5d1ad7b6eee8b97;
    stim[35] = 137'h02d9a325aac1d9a59ecf0c689107e657c06;
    stim[36] = 137'h102cedb1563c6f8b04e3fc6c512bc9f6911;
    stim[37] = 137'h07563909165fbc96a156e5876fee75d4fdc;
    stim[38] = 137'h0e641641351b975ff478c8ea3ab34a045be;
    stim[39] = 137'h1417a14f972d91fa13f79435346cf75c0b7;
    stim[40] = 137'h064c009936774ab6e522f9158d0bb965292;
    stim[41] = 137'h0f10e540b36fa715ab8949131b564b39ca9;
    stim[42] = 137'h1284bb9796eeef15c2bbe8151eeda08b564;
    stim[43] = 137'h0b6a3c49ffa852bdd0dc7ea76880dd11d6f;
    stim[44] = 137'h1bf3ff2a2376ba7c2967257396ebdd01c8c;
    stim[45] = 137'h1f018123bc38ce855ae6cd1faa404bb544a;
    stim[46] = 137'h0cdaf7b1daccf92abbb207cd8ecab3bc5c8;
    stim[47] = 137'h1b7208d9ed902538da0be5fa56ee930e172;
    stim[48] = 137'h0a2a4af198145432a12f2e1465d2c99b151;
    stim[49] = 137'h14333772bd87d2000a37b3241a5e9d35b0a;
    stim[50] = 137'h04216e174934f0520fef8df36b446e1c585;
    stim[51] = 137'h021bbbb2ad0110a6473855727d31afcbca7;
    stim[52] = 137'h09405b997a5a5ffcd93c5d20883d91c7621;
    stim[53] = 137'h1d31aab44fc2ec8e7fe2cc5542c86b80f20;
    stim[54] = 137'h0fc40b9b2e746755e71c4f52542aa96008e;
    stim[55] = 137'h11e627a3f15749962bc77040abb7f45f47a;
    stim[56] = 137'h00026999aa9792e7486cfe378119dc3bc54;
    stim[57] = 137'h120a13859529038f39cd35b0e0fa1cc7e41;
    stim[58] = 137'h11a76b5ed8351662c16bd41f8e57af1d90b;
    stim[59] = 137'h1ffcb2de25918a49b8c52eb108e61429808;
    stim[60] = 137'h0d8ca8f53d21d1fd021545f61b28674e35b;
    stim[61] = 137'h11102eba05350b38c6d6a53267fe5abad5e;
    stim[62] = 137'h141c53301424d86332fe815d1047f0fd55e;
    stim[63] = 137'h0d7d0b57ae4646e7165b81fd2f20bcad271;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 103'h0000000003973b420fc262c2c0;
      expv[1] = 103'h7e1452be98000000015ca4fa3e;
      expv[2] = 103'h0000000000b54723f617c5f142;
      expv[3] = 103'h0000000000000000006755c365;
      expv[4] = 103'h168f539660000000016c5e6e42;
      expv[5] = 103'h7d01d29e70000000006efdb6ca;
      expv[6] = 103'h00000000000000000191bdfd92;
      expv[7] = 103'h6d9c7a26680000000166fab84e;
      expv[8] = 103'h67dba13d0800000000b6afb168;
      expv[9] = 103'h000000000000000001fccd2765;
      expv[10] = 103'h76da39b4e800000001cdb67756;
      expv[11] = 103'h000000000000000000af907bf1;
      expv[12] = 103'h000000000000000001ddc2667f;
      expv[13] = 103'h3499b218a0000000019bff1ae2;
      expv[14] = 103'h7ce3afb9b4000000011a4ee096;
      expv[15] = 103'h77f643fc10000000009dc0ef06;
      expv[16] = 103'h000000000000000001eb149e72;
      expv[17] = 103'h469af5f8200000000060691da6;
      expv[18] = 103'h3681458edc00000000568098ee;
      expv[19] = 103'h000000000000000001a5c7e9e7;
      expv[20] = 103'h000000000000000000a219f988;
      expv[21] = 103'h578b368a8400000000927f906a;
      expv[22] = 103'h4cf944dd0000000001e8a9f7de;
      expv[23] = 103'h0fa1e7a2180000000043df6192;
      expv[24] = 103'h5c857725c8000000019e4ebdc0;
      expv[25] = 103'h453558aed400000000767af32a;
      expv[26] = 103'h2c69614f7000000000467b1abc;
      expv[27] = 103'h7c68ca60400000000092c401b2;
      expv[28] = 103'h1e787aa3a40000000139997a8e;
      expv[29] = 103'h000000000000000000af163b18;
      expv[30] = 103'h000000000000000001d00c5445;
      expv[31] = 103'h2c18fde8340000000007c4894c;
      expv[32] = 103'h00000000030bc3153f78a52290;
      expv[33] = 103'h00000000000000000023c2f9ac;
      expv[34] = 103'h0000000000000000019c440c2b;
      expv[35] = 103'h000000000000000000c1d9a59f;
      expv[36] = 103'h465793ed2000000000e3fc6c50;
      expv[37] = 103'h1cbf792d400000000156e5876e;
      expv[38] = 103'h3e372ebfe80000000078c8ea3a;
      expv[39] = 103'h0000000000000000012d91fa13;
      expv[40] = 103'h0000000000ee956dcb22f9158c;
      expv[41] = 103'h3edf4e2b54000000018949131a;
      expv[42] = 103'h000000000000000000eeef15c3;
      expv[43] = 103'h2f50a57ba000000000dc7ea768;
      expv[44] = 103'h6eed74f8500000000167257396;
      expv[45] = 103'h7c719d0ab400000000e6cd1faa;
      expv[46] = 103'h3599f2557400000001b207cd8e;
      expv[47] = 103'h0000000003204a71b60be5fa56;
      expv[48] = 103'h2fa5933628000000012f2e1464;
      expv[49] = 103'h570fa400140000000037b3241a;
      expv[50] = 103'h00000000000000000134f0520f;
      expv[51] = 103'h0000000000000000010110a647;
      expv[52] = 103'h247b238ec4000000013c5d2088;
      expv[53] = 103'h000000000000000001e2cc5542;
      expv[54] = 103'h3ce8ceabcc000000011c4f5254;
      expv[55] = 103'h46ae932c5400000001c77040aa;
      expv[56] = 103'h0000000000000000009792e749;
      expv[57] = 103'h4df4398fc800000001cd35b0e0;
      expv[58] = 103'h446a2cc580000000016bd41f8e;
      expv[59] = 103'h7f2314937000000000c52eb108;
      expv[60] = 103'h3643a3fa04000000001545f61a;
      expv[61] = 103'h466a16718c00000000d6a53266;
      expv[62] = 103'h5449b0c66400000000fe815d10;
      expv[63] = 103'h3641795a4c000000005b81fd2e;
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
