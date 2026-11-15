// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 135;
  localparam OW = 154;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059966 dut (
    .clock(clk),
    .reset(in_vec[134:134]),
    .en(in_vec[133:133]),
    .flush(in_vec[132:132]),
    .ins(in_vec[131:100]),
    .PC8F(in_vec[99:68]),
    .PCF(in_vec[67:36]),
    .eret(in_vec[35:35]),
    .Likely(in_vec[34:34]),
    .npc(in_vec[33:2]),
    .jumpD(in_vec[1:1]),
    .GeneralFlush(in_vec[0:0]),
    .reg_ins(out_vec[153:122]),
    .rs(out_vec[121:117]),
    .rt(out_vec[116:112]),
    .rd(out_vec[111:107]),
    .imm16(out_vec[106:91]),
    .imm26(out_vec[90:65]),
    .PC8D(out_vec[64:33]),
    .PCD(out_vec[32:1]),
    .DelaySlotD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 135'h639d93d47a98f2722ee7b885ef07079d13;
    stim[1] = 135'h52cc5f7721734b40d4a5e815786f24e705;
    stim[2] = 135'h352f323be72c1a016b30dbf0ac41ccfe4b;
    stim[3] = 135'h133d5945b1232927bb3380e7cf752f6184;
    stim[4] = 135'h38d14a730c8565f0db2f860142b73f3f42;
    stim[5] = 135'h3dcf680d28004b89769c353f633a0bd0dd;
    stim[6] = 135'h31422021a00b1946a7c7dcbca58ed6b63e;
    stim[7] = 135'h3b62aacf59f5624b2331be91e64e1de698;
    stim[8] = 135'h1e10582935962ddf5f9aadeea05d821bd0;
    stim[9] = 135'h073be8045a9eacbb9f25f0c770b55fab00;
    stim[10] = 135'h096e56d5180eaa94f10cf002ba74ed2bf4;
    stim[11] = 135'h3a7a6629b534e48fe0866207e6a3154850;
    stim[12] = 135'h209a473b90820fd6c0a5ac5cbbc222b214;
    stim[13] = 135'h1af2f58a5c530731f7b676c82d31a8448b;
    stim[14] = 135'h2bbb9b56359461bf388ff46b9c87864d6b;
    stim[15] = 135'h2129d05c9440236ef951eac65fe62cf228;
    stim[16] = 135'h12079d6418d8aac9c6a057b5661cf06b32;
    stim[17] = 135'h2de9c04da2ca356757aea6fc4bba0b2027;
    stim[18] = 135'h0a4da63f7dd553a8aa1c1b875a3bbbc913;
    stim[19] = 135'h261e8bed018b36ac5feeb87ed888b8a514;
    stim[20] = 135'h18d6dbb9dbe21292aa791ecac99341a004;
    stim[21] = 135'h1708737200c2ceeedfbe7f40b09cdff8e4;
    stim[22] = 135'h0d2d58c4beb5363d2b1354d3cab4996a16;
    stim[23] = 135'h0968d8db343b88f0522dad29f2933aa2c1;
    stim[24] = 135'h38d73d010e0c8ffbb9639cb4318c6bbfe7;
    stim[25] = 135'h236279e8915a3fc9b62531dc5f2be1c2df;
    stim[26] = 135'h3e61559da06e9732a03c37ac1e5f87df59;
    stim[27] = 135'h1c9f006d5143b2ad299c9953fc7aaac12c;
    stim[28] = 135'h0fe222073cf5c184fcc74136155bc6eeba;
    stim[29] = 135'h1bf47ff93ddf27f7bf3a5182974536261c;
    stim[30] = 135'h2dd9635229906fcdfb1a5ee4027194ed0b;
    stim[31] = 135'h235e3a801a22fa07e69ec94802f8798237;
    stim[32] = 135'h256cedcc64669f65bf3068f2619e4d5315;
    stim[33] = 135'h35f26a1e3f1a74a450fa9b60c0456c9656;
    stim[34] = 135'h213a4bd423d178710cd6436a9b36fe6944;
    stim[35] = 135'h20b27d21534b2bc81f47eae5266f821c4f;
    stim[36] = 135'h26e4b9e7ef4cf2b9fd8d8bd2a0db0fa052;
    stim[37] = 135'h45abd6d5de542a667cf988e7270703828c;
    stim[38] = 135'h03733d86927b6ac1aadcfa6a1aeed1a6c8;
    stim[39] = 135'h36ca704475d6288e22eada910693f5de5c;
    stim[40] = 135'h2457e9e9f3382677c433179835f7797f91;
    stim[41] = 135'h127392acf219771b9efdfc429022af2a24;
    stim[42] = 135'h0494e3d1e8bd22e60d4f879e89dd36a08c;
    stim[43] = 135'h0bff7ba6346ec343628bd0b633f79f250b;
    stim[44] = 135'h3b7d14ff6ea0a258af868e1bdd22a26259;
    stim[45] = 135'h203b672d494981b8cfb0754478b236d32b;
    stim[46] = 135'h3c7c8d99e9047f300e4d2b8141d6859448;
    stim[47] = 135'h3f3be9deca29d7dc102f25afa0d6f59014;
    stim[48] = 135'h1196b3f0b3913766c5aa8678f7259b4d8a;
    stim[49] = 135'h3fe493c240347f4fbdec2ce43b9d1f3872;
    stim[50] = 135'h15c5ec083f56a493c33608297ed7662195;
    stim[51] = 135'h0e052f6f1d670803a2951a4af552a8f502;
    stim[52] = 135'h1fd5ad4c72f594be80a7dbfdd3dde24c5a;
    stim[53] = 135'h03b027b3c85d31d64dc36f08a063883bd2;
    stim[54] = 135'h27a168db215f80f97cba5e4b4852f491d8;
    stim[55] = 135'h1a31368d3e1af5be71b2748ac7bacda7ac;
    stim[56] = 135'h3aeffc6043819680ec79007c990c31d13e;
    stim[57] = 135'h2b7e3e1c4165a984e8772088155c7d77dc;
    stim[58] = 135'h2175b41cfb511a59cf17ae45bf42aa151d;
    stim[59] = 135'h2c3f8231105a73b839a9ae064294e68f99;
    stim[60] = 135'h03bb55ba7a31d521060148fa4539c802c4;
    stim[61] = 135'h1d760cc24ea6fd63d564896cd52ee8c75e;
    stim[62] = 135'h183b1e9d2cac160b93d57029b06391a2d9;
    stim[63] = 135'h23eb1c2bbab82ddb4fd25dd7314637e05f;
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
      expv[0] = 154'h000000000000000000000000000000000000000;
      expv[1] = 154'h000000000000000000000000000000000000000;
      expv[2] = 154'h000000000000000000000000000000000000000;
      expv[3] = 154'h000000000000000000000000000000020e67f24;
      expv[4] = 154'h0000000000000000000000000000001ba97b0c2;
      expv[5] = 154'h000000000000000000000000000000000000000;
      expv[6] = 154'h000000000000000000000000000000000000000;
      expv[7] = 154'h0000000000000000000000000000000c76b5b1e;
      expv[8] = 154'h0000000000000000000000000000001270ef34c;
      expv[9] = 154'h000000000000000000000000000000000000000;
      expv[10] = 154'h000000000000000000000000000000000000000;
      expv[11] = 154'h000000000000000000000000000000000000000;
      expv[12] = 154'h0000000000000000000000000000001518aa428;
      expv[13] = 154'h02691cee5a4739dcb48e7721041fad814b58b96;
      expv[14] = 154'h000000000000000000000000000000098d42244;
      expv[15] = 154'h000000000000000000000000000000043c326b4;
      expv[16] = 154'h04a7417269d002e4d3a0b9288046ddf2a3d58ca;
      expv[17] = 154'h00000000000000000000000000000010e783598;
      expv[18] = 154'h0000000000000000000000000000001dd059012;
      expv[19] = 154'h00000000000000000000000000000011ddde488;
      expv[20] = 154'h187a2fb41e8bdf683d17da03166d58bfdd70fda;
      expv[21] = 154'h0000000000000000000000000000000c9a0d002;
      expv[22] = 154'h000000000000000000000000000000000000000;
      expv[23] = 154'h000000000000000000000000000000000000000;
      expv[24] = 154'h000000000000000000000000000000000000000;
      expv[25] = 154'h000000000000000000000000000000000000000;
      expv[26] = 154'h000000000000000000000000000000195f0e16e;
      expv[27] = 154'h00000000000000000000000000000012fc3efac;
      expv[28] = 154'h00000000000000000000000000000003d556096;
      expv[29] = 154'h00000000000000000000000000000003d556096;
      expv[30] = 154'h0000000000000000000000000000001a29b130e;
      expv[31] = 154'h000000000000000000000000000000000000000;
      expv[32] = 154'h000000000000000000000000000000000000000;
      expv[33] = 154'h000000000000000000000000000000000000000;
      expv[34] = 154'h000000000000000000000000000000000000000;
      expv[35] = 154'h04e92f50ba4bdea17497a847a2f0e219ac86d52;
      expv[36] = 154'h000000000000000000000000000000137c10e26;
      expv[37] = 154'h000000000000000000000000000000000000000;
      expv[38] = 154'h000000000000000000000000000000000000000;
      expv[39] = 154'h000000000000000000000000000000000000000;
      expv[40] = 154'h000000000000000000000000000000149faef2e;
      expv[41] = 154'h0000000000000000000000000000000fbbcbfc8;
      expv[42] = 154'h000000000000000000000000000000000000000;
      expv[43] = 154'h000000000000000000000000000000000000000;
      expv[44] = 154'h000000000000000000000000000000000000000;
      expv[45] = 154'h00000000000000000000000000000009151312c;
      expv[46] = 154'h0000000000000000000000000000000591b6994;
      expv[47] = 154'h000000000000000000000000000000000000000;
      expv[48] = 154'h000000000000000000000000000000000000000;
      expv[49] = 154'h000000000000000000000000000000192cda6c4;
      expv[50] = 154'h0000000000000000000000000000001ce8f9c38;
      expv[51] = 154'h00000000000000000000000000000016bb310ca;
      expv[52] = 154'h00000000000000000000000000000016bb310ca;
      expv[53] = 154'h000000000000000000000000000000000000000;
      expv[54] = 154'h000000000000000000000000000000000000000;
      expv[55] = 154'h1e85a36ca168c6d942d1b642bf01f2f974bc968;
      expv[56] = 154'h0000000000000000000000000000001dd66d3d6;
      expv[57] = 154'h00000000000000000000000000000008618e89e;
      expv[58] = 154'h2df8f8713e3e70e27c7c3882cb5309d0ee41102;
      expv[59] = 154'h0000000000000000000000000000001a1550a8e;
      expv[60] = 154'h000000000000000000000000000000000000000;
      expv[61] = 154'h000000000000000000000000000000000000000;
      expv[62] = 154'h0000000000000000000000000000000977463ae;
      expv[63] = 154'h000000000000000000000000000000000000000;
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
