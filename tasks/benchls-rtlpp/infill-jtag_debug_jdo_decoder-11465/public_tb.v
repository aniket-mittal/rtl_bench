// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11465 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h25e80c9bf31;
    stim[1] = 42'h049f5af2eb4;
    stim[2] = 42'h03ba42be509;
    stim[3] = 42'h2c19788a699;
    stim[4] = 42'h0ab27f49918;
    stim[5] = 42'h3382689e37e;
    stim[6] = 42'h35eb5dbf53f;
    stim[7] = 42'h2cc9e0519f8;
    stim[8] = 42'h03a9d53b710;
    stim[9] = 42'h2c2f7b02b0e;
    stim[10] = 42'h0cf9b4751f5;
    stim[11] = 42'h3642f3a8b22;
    stim[12] = 42'h0a3e0d64225;
    stim[13] = 42'h0a1cd469635;
    stim[14] = 42'h30eff08332e;
    stim[15] = 42'h375af8c5509;
    stim[16] = 42'h13d22d9b076;
    stim[17] = 42'h2f2f6561dca;
    stim[18] = 42'h1f490007eb3;
    stim[19] = 42'h29d1b4c616b;
    stim[20] = 42'h1ee74389a47;
    stim[21] = 42'h26055a208ca;
    stim[22] = 42'h359b856e579;
    stim[23] = 42'h2b793a8c6ff;
    stim[24] = 42'h1a3ffc11abe;
    stim[25] = 42'h0b3bef6c902;
    stim[26] = 42'h2a40a25f6df;
    stim[27] = 42'h20adfb81ef4;
    stim[28] = 42'h39ee5d56b57;
    stim[29] = 42'h201c52ed82f;
    stim[30] = 42'h383ba9901fd;
    stim[31] = 42'h338ba4e2cec;
    stim[32] = 42'h11baa7b15e0;
    stim[33] = 42'h156e07df7f3;
    stim[34] = 42'h3dfd014ad61;
    stim[35] = 42'h21feaac1495;
    stim[36] = 42'h3f6164fc8ab;
    stim[37] = 42'h3a92ca2746b;
    stim[38] = 42'h0226bf7d645;
    stim[39] = 42'h2353cd21cb1;
    stim[40] = 42'h149f2132399;
    stim[41] = 42'h161e4b28a47;
    stim[42] = 42'h3235ab18db3;
    stim[43] = 42'h0f577011264;
    stim[44] = 42'h1900fe05f72;
    stim[45] = 42'h279499bc49a;
    stim[46] = 42'h1541274585f;
    stim[47] = 42'h2ba84bce4c5;
    stim[48] = 42'h2e20766acc3;
    stim[49] = 42'h37c9ae0449b;
    stim[50] = 42'h09a635f8c95;
    stim[51] = 42'h21f78bdc6b8;
    stim[52] = 42'h2eff99c19e3;
    stim[53] = 42'h0dd9cfd193b;
    stim[54] = 42'h11d309a939d;
    stim[55] = 42'h13ca80009d8;
    stim[56] = 42'h32b38a17b44;
    stim[57] = 42'h2c6d3be1379;
    stim[58] = 42'h21674779337;
    stim[59] = 42'h3d8e9081a60;
    stim[60] = 42'h00e534530d4;
    stim[61] = 42'h02b527b68f6;
    stim[62] = 42'h09a5d50a4f7;
    stim[63] = 42'h0a3fa976e7a;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxx00;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hxxxxxxxxxx00;
      expv[7] = 48'hxxxxxxxxxx00;
      expv[8] = 48'hxxxxxxxxxx00;
      expv[9] = 48'h3a9d53b71010;
      expv[10] = 48'h3a9d53b71000;
      expv[11] = 48'h3a9d53b71000;
      expv[12] = 48'h3a9d53b71000;
      expv[13] = 48'ha3e0d6422600;
      expv[14] = 48'ha3e0d6422400;
      expv[15] = 48'h0eff08332c01;
      expv[16] = 48'h0eff08332c00;
      expv[17] = 48'h0eff08332c00;
      expv[18] = 48'hf2f6561dc810;
      expv[19] = 48'hf2f6561dc800;
      expv[20] = 48'h9d1b4c616800;
      expv[21] = 48'h9d1b4c616800;
      expv[22] = 48'h9d1b4c616800;
      expv[23] = 48'h9d1b4c616800;
      expv[24] = 48'h9d1b4c616800;
      expv[25] = 48'h9d1b4c616800;
      expv[26] = 48'h9d1b4c616800;
      expv[27] = 48'ha40a25f6dc20;
      expv[28] = 48'ha40a25f6dc00;
      expv[29] = 48'ha40a25f6dc00;
      expv[30] = 48'ha40a25f6dc00;
      expv[31] = 48'ha40a25f6dc00;
      expv[32] = 48'h38ba4e2cec10;
      expv[33] = 48'h38ba4e2cec00;
      expv[34] = 48'h38ba4e2cec00;
      expv[35] = 48'h38ba4e2cec00;
      expv[36] = 48'h38ba4e2cec00;
      expv[37] = 48'hf6164fc8a810;
      expv[38] = 48'hf6164fc8a800;
      expv[39] = 48'hf6164fc8a800;
      expv[40] = 48'h353cd21cb010;
      expv[41] = 48'h353cd21cb000;
      expv[42] = 48'h353cd21cb000;
      expv[43] = 48'h353cd21cb000;
      expv[44] = 48'h353cd21cb000;
      expv[45] = 48'h900fe05f7000;
      expv[46] = 48'h900fe05f7000;
      expv[47] = 48'h900fe05f7000;
      expv[48] = 48'hba84bce4c400;
      expv[49] = 48'hba84bce4c400;
      expv[50] = 48'hba84bce4c400;
      expv[51] = 48'hba84bce4c400;
      expv[52] = 48'h1f78bdc6b800;
      expv[53] = 48'h1f78bdc6b800;
      expv[54] = 48'h1f78bdc6b800;
      expv[55] = 48'h1f78bdc6b800;
      expv[56] = 48'h3ca80009d800;
      expv[57] = 48'h3ca80009d800;
      expv[58] = 48'h3ca80009d800;
      expv[59] = 48'h3ca80009d800;
      expv[60] = 48'h3ca80009d800;
      expv[61] = 48'h3ca80009d800;
      expv[62] = 48'h2b527b68f420;
      expv[63] = 48'h2b527b68f400;
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
