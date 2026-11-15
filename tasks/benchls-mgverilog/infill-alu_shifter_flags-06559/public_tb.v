// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06559 dut (
    .inputA(in_vec[67:36]),
    .Bse(in_vec[35:4]),
    .control(in_vec[3:0]),
    .outputBS(out_vec[34:3]),
    .N(out_vec[2:2]),
    .Zero(out_vec[1:1]),
    .C(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h500eb034b476b7234;
    stim[1] = 68'h50d9f1a8bb84054d8;
    stim[2] = 68'ha4750abcf0117de65;
    stim[3] = 68'hf1e2120b5fe79ec4b;
    stim[4] = 68'h710c11c8836805704;
    stim[5] = 68'h6e342512951430604;
    stim[6] = 68'hbb1f7dc0c69732b86;
    stim[7] = 68'hba728b1de1c1e49f7;
    stim[8] = 68'h512fa4f94145c3f23;
    stim[9] = 68'h2e8c5497b4badcd8b;
    stim[10] = 68'hee5e3007e2701242a;
    stim[11] = 68'ha77bc2a6917eea8a6;
    stim[12] = 68'h2935a9920c8969164;
    stim[13] = 68'hf06ac63896431a861;
    stim[14] = 68'hb7b6338021c5965be;
    stim[15] = 68'hd6846e3fd8b2f17be;
    stim[16] = 68'hdbe7e3732dcdae71a;
    stim[17] = 68'h26b86cace777ef31f;
    stim[18] = 68'h6afeb6b1f33677d98;
    stim[19] = 68'h9561b5c7ceec37a0a;
    stim[20] = 68'h2612a29b358626ddf;
    stim[21] = 68'h2b376fa9621ee02ea;
    stim[22] = 68'h9d6982908767ac61f;
    stim[23] = 68'h3fb58d65b0f7a822c;
    stim[24] = 68'hc79b50825488dd604;
    stim[25] = 68'h0fadafcbe8198c6c3;
    stim[26] = 68'h45556865f0a5a0728;
    stim[27] = 68'ha720008b43f21b6fe;
    stim[28] = 68'h7f37a8d8cff255c13;
    stim[29] = 68'h4163899423214d00d;
    stim[30] = 68'h97209ec2915120294;
    stim[31] = 68'h1c36758bd78dbd1f5;
    stim[32] = 68'hea1ac3d28e98ed65f;
    stim[33] = 68'h2ab6593d6307405a2;
    stim[34] = 68'h76007a5571f168003;
    stim[35] = 68'hd2fb05fc3969fcfba;
    stim[36] = 68'hcf5bb9738bc5ceb38;
    stim[37] = 68'h295735573e9539c30;
    stim[38] = 68'hb03701cf7cdd15490;
    stim[39] = 68'h64e30fdaa4ea91fcc;
    stim[40] = 68'hd931bb704d831d714;
    stim[41] = 68'hb89c4bfe66d6afd17;
    stim[42] = 68'hdd89fa9fda97c0db8;
    stim[43] = 68'ha55fd3747abc3467c;
    stim[44] = 68'ha38c8c8e42966cd60;
    stim[45] = 68'h55724e5f286d1c0d1;
    stim[46] = 68'h717376c4c05f3342f;
    stim[47] = 68'h86405a67e7923d18c;
    stim[48] = 68'h08a7d8506d29c825c;
    stim[49] = 68'hb3c743f31b9cef980;
    stim[50] = 68'h5e3a9fc2004735521;
    stim[51] = 68'h678d21fe042a08ef0;
    stim[52] = 68'hc22ab637da0adee9f;
    stim[53] = 68'hf76e18abca3f94c4b;
    stim[54] = 68'hb347e2200e701cd22;
    stim[55] = 68'ha0ab073b14cc848fc;
    stim[56] = 68'h516adbb7db5e06b1a;
    stim[57] = 68'h07a5f82a2cb160de9;
    stim[58] = 68'h6256effe39e3f927f;
    stim[59] = 68'h6c09fb517fc8f84e7;
    stim[60] = 68'h01b737f825fffb39a;
    stim[61] = 68'h56b81885794ac6ddb;
    stim[62] = 68'hd2aa9e6fe20602d02;
    stim[63] = 68'he7221408e6bb001d2;
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
      expv[0] = 35'h000000003;
      expv[1] = 35'h7fffd4788;
      expv[2] = 35'h7948ea155;
      expv[3] = 35'h2ff3cf620;
      expv[4] = 35'h000000003;
      expv[5] = 35'h000000003;
      expv[6] = 35'h603e8fdd8;
      expv[7] = 35'h395d0ec58;
      expv[8] = 35'h000000003;
      expv[9] = 35'h5a5d6e6c0;
      expv[10] = 35'h713809210;
      expv[11] = 35'h53613dd38;
      expv[12] = 35'h000000003;
      expv[13] = 35'h16431a861;
      expv[14] = 35'h10e2cb2d8;
      expv[15] = 35'h6c5978bd8;
      expv[16] = 35'h16e6d7388;
      expv[17] = 35'h73bbf7988;
      expv[18] = 35'h7fffd8db0;
      expv[19] = 35'h67761bd00;
      expv[20] = 35'h1ac3136e8;
      expv[21] = 35'h310f70170;
      expv[22] = 35'h43b3d6308;
      expv[23] = 35'h587bd4110;
      expv[24] = 35'h000000003;
      expv[25] = 35'h000000003;
      expv[26] = 35'h000032b40;
      expv[27] = 35'h21f90db78;
      expv[28] = 35'h000000003;
      expv[29] = 35'h1190a6800;
      expv[30] = 35'h000000003;
      expv[31] = 35'h1c36758b0;
      expv[32] = 35'h474c76b28;
      expv[33] = 35'h000000003;
      expv[34] = 35'h000000003;
      expv[35] = 35'h1cb4fe7d8;
      expv[36] = 35'h000039dc8;
      expv[37] = 35'h1f4a9ce18;
      expv[38] = 35'h3e6e8aa48;
      expv[39] = 35'h527548fe0;
      expv[40] = 35'h000000003;
      expv[41] = 35'h4e5c7f258;
      expv[42] = 35'h7fffcffd0;
      expv[43] = 35'h3d5e1a338;
      expv[44] = 35'h214b366b0;
      expv[45] = 35'h286d1c0d0;
      expv[46] = 35'h602f99a10;
      expv[47] = 35'h73c91e8c0;
      expv[48] = 35'h3694e4128;
      expv[49] = 35'h0dce77cc0;
      expv[50] = 35'h004735520;
      expv[51] = 35'h021504778;
      expv[52] = 35'h6d056f748;
      expv[53] = 35'h651fca620;
      expv[54] = 35'h7fffffffd;
      expv[55] = 35'h0a6642478;
      expv[56] = 35'h6daf03588;
      expv[57] = 35'h1658b06f0;
      expv[58] = 35'h1cf1fc938;
      expv[59] = 35'h04b628fd8;
      expv[60] = 35'h12fffd9c8;
      expv[61] = 35'h3ca5636e8;
      expv[62] = 35'h7fffffffd;
      expv[63] = 35'h7fffffffd;
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
