// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09457 dut (
    .clk(clk),
    .reset(in_vec[105:105]),
    .valid_wb_pipe_reg_i(in_vec[104:104]),
    .reg_wr_wb_pipe_reg_i(in_vec[103:103]),
    .mem_to_reg_wb_pipe_reg_i(in_vec[102:102]),
    .rd_wb_pipe_reg_i(in_vec[101:97]),
    .res_alu_wb_pipe_reg_i(in_vec[96:65]),
    .read_data_wb_pipe_reg_i(in_vec[64:33]),
    .use_link_reg_wb_pipe_reg_i(in_vec[32:32]),
    .next_seq_pc_wb_pipe_reg_i(in_vec[31:0]),
    .instr_retired_wb_pipe_reg_o(out_vec[104:104]),
    .reg_wr_wb_pipe_reg_o(out_vec[103:103]),
    .mem_to_reg_wb_pipe_reg_o(out_vec[102:102]),
    .rd_wb_pipe_reg_o(out_vec[101:97]),
    .res_alu_wb_pipe_reg_o(out_vec[96:65]),
    .read_data_wb_pipe_reg_o(out_vec[64:33]),
    .use_link_reg_wb_pipe_reg_o(out_vec[32:32]),
    .next_seq_pc_wb_pipe_reg_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h28d81b2431abe1291b4dda419ff;
    stim[1] = 106'h2c78087221f90938e3bd27ef68c;
    stim[2] = 106'h0dc53ff6e441849ca4bfa814353;
    stim[3] = 106'h17902112a28776bd0fc6e7320f5;
    stim[4] = 106'h11942d8c67436bed4c2f7a4c045;
    stim[5] = 106'h01cb9c8632414efbd5a744e72d9;
    stim[6] = 106'h162ac541def9f2cb7920f1b1346;
    stim[7] = 106'h18ada97b34e642c6335da9a0281;
    stim[8] = 106'h1fd2ddfacd345334343b492830e;
    stim[9] = 106'h043aab05c08a495ebbdecfd56c7;
    stim[10] = 106'h1c10a8e5972d476baa506d54d9b;
    stim[11] = 106'h10ae415219597bdf5d0bbf4eda2;
    stim[12] = 106'h0f461e0dc3960f07fabf62eb47c;
    stim[13] = 106'h0b890c75b98e273a965b9f005b1;
    stim[14] = 106'h1d6323e74badbc9b2aac6342bad;
    stim[15] = 106'h0c4578bd377462eedf8a9a6c967;
    stim[16] = 106'h150bb3945bfe71d966d86c03b80;
    stim[17] = 106'h1c1a5023578e08a2e57b6931d82;
    stim[18] = 106'h0d6fd0f5a183252b0ed2a2c3986;
    stim[19] = 106'h009220577a033ddc1bdf12620ef;
    stim[20] = 106'h064b30b24f03b8de3c8612190e5;
    stim[21] = 106'h0f5aefacb15e9d3d304066c8842;
    stim[22] = 106'h00d4c47423213af31c26f93d59c;
    stim[23] = 106'h1c09ed87c41c2fbc2fefe5b1da6;
    stim[24] = 106'h020429c6deb4a0c1c7f6cf57363;
    stim[25] = 106'h10a33929e33321b11a0fbdb387c;
    stim[26] = 106'h1dd716f0bfe88426398fcc4b5ee;
    stim[27] = 106'h2541cdbe15e8e29cf5915dc50ca;
    stim[28] = 106'h005b443435512ac8fa046317d87;
    stim[29] = 106'h12981c32353616f046b4216538b;
    stim[30] = 106'h1ae2326813f5fdd03adbd7b538d;
    stim[31] = 106'h17356bc8d4673b51cfde50694dd;
    stim[32] = 106'h0ff385f58198d2b7e3664fde168;
    stim[33] = 106'h1b61cca151ea546f34dec40fa6a;
    stim[34] = 106'h1de87f0d3e51040c1baee537b1c;
    stim[35] = 106'h1a67b1f674d99afb2fb7c89b0bd;
    stim[36] = 106'h07cab116913c5e9c8048d31c918;
    stim[37] = 106'h05d05537ab891aae5876921276f;
    stim[38] = 106'h0644019527aaf00a823404ab2fa;
    stim[39] = 106'h0ab5e3b32bed2038740eb20f6f7;
    stim[40] = 106'h0a746e2b72f075cc4feff53236f;
    stim[41] = 106'h12996ce7b385a6efcd07fdc47d3;
    stim[42] = 106'h1449d443cb8e4de07981a955e78;
    stim[43] = 106'h1647bd73c2f9dd9e2c220fce30a;
    stim[44] = 106'h0293015babeeff6ef60adebeecb;
    stim[45] = 106'h07f3d4d88218407ad8724f0cbc4;
    stim[46] = 106'h08e3b1d8cff68ca182ef57796dd;
    stim[47] = 106'h0c6afc0e624146324681b1bf2e7;
    stim[48] = 106'h012ee8c6b5794b98c19ce784d33;
    stim[49] = 106'h30207098732b551ca2cd58acbfd;
    stim[50] = 106'h02ca5c9d095802461b11f17fa50;
    stim[51] = 106'h060de2761de2573136a68ea30d0;
    stim[52] = 106'h0b18c873f533587eb85f42d42cf;
    stim[53] = 106'h108cd39123cced1326d664b509f;
    stim[54] = 106'h03cbdae3f47621470acb1dbd872;
    stim[55] = 106'h191f72b858464047ae1f4d1a0b3;
    stim[56] = 106'h0e69fcf759e35e7b087d94978d1;
    stim[57] = 106'h124cf7329a7a80e7dd9aaae8c14;
    stim[58] = 106'h0c012842cf4e358cc5a2bc57f7a;
    stim[59] = 106'h17e6528c25c8e398e8d05052e43;
    stim[60] = 106'h0006c48859def5345ceefc1b2ee;
    stim[61] = 106'h11fd58b4372b733734a9189bd24;
    stim[62] = 106'h2cee6d83761cf516855c503c3c6;
    stim[63] = 106'h0cd2f6d3ab024474d0ff3b33d30;
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
      expv[0] = 105'h000000000000000000000000000;
      expv[1] = 105'h000000000000000000000000000;
      expv[2] = 105'h000000000000000000000000000;
      expv[3] = 105'h0dc53ff6e441849ca4bfa814353;
      expv[4] = 105'h17902112a28776bd0fc6e7320f5;
      expv[5] = 105'h11942d8c67436bed4c2f7a4c045;
      expv[6] = 105'h01cb9c8632414efbd5a744e72d9;
      expv[7] = 105'h162ac541def9f2cb7920f1b1346;
      expv[8] = 105'h18ada97b34e642c6335da9a0281;
      expv[9] = 105'h1fd2ddfacd345334343b492830e;
      expv[10] = 105'h043aab05c08a495ebbdecfd56c7;
      expv[11] = 105'h1c10a8e5972d476baa506d54d9b;
      expv[12] = 105'h10ae415219597bdf5d0bbf4eda2;
      expv[13] = 105'h0f461e0dc3960f07fabf62eb47c;
      expv[14] = 105'h0b890c75b98e273a965b9f005b1;
      expv[15] = 105'h1d6323e74badbc9b2aac6342bad;
      expv[16] = 105'h0c4578bd377462eedf8a9a6c967;
      expv[17] = 105'h150bb3945bfe71d966d86c03b80;
      expv[18] = 105'h1c1a5023578e08a2e57b6931d82;
      expv[19] = 105'h0d6fd0f5a183252b0ed2a2c3986;
      expv[20] = 105'h009220577a033ddc1bdf12620ef;
      expv[21] = 105'h064b30b24f03b8de3c8612190e5;
      expv[22] = 105'h0f5aefacb15e9d3d304066c8842;
      expv[23] = 105'h00d4c47423213af31c26f93d59c;
      expv[24] = 105'h1c09ed87c41c2fbc2fefe5b1da6;
      expv[25] = 105'h020429c6deb4a0c1c7f6cf57363;
      expv[26] = 105'h10a33929e33321b11a0fbdb387c;
      expv[27] = 105'h000000000000000000000000000;
      expv[28] = 105'h000000000000000000000000000;
      expv[29] = 105'h005b443435512ac8fa046317d87;
      expv[30] = 105'h12981c32353616f046b4216538b;
      expv[31] = 105'h1ae2326813f5fdd03adbd7b538d;
      expv[32] = 105'h17356bc8d4673b51cfde50694dd;
      expv[33] = 105'h0ff385f58198d2b7e3664fde168;
      expv[34] = 105'h1b61cca151ea546f34dec40fa6a;
      expv[35] = 105'h1de87f0d3e51040c1baee537b1c;
      expv[36] = 105'h1a67b1f674d99afb2fb7c89b0bd;
      expv[37] = 105'h07cab116913c5e9c8048d31c918;
      expv[38] = 105'h05d05537ab891aae5876921276f;
      expv[39] = 105'h0644019527aaf00a823404ab2fa;
      expv[40] = 105'h0ab5e3b32bed2038740eb20f6f7;
      expv[41] = 105'h0a746e2b72f075cc4feff53236f;
      expv[42] = 105'h12996ce7b385a6efcd07fdc47d3;
      expv[43] = 105'h1449d443cb8e4de07981a955e78;
      expv[44] = 105'h1647bd73c2f9dd9e2c220fce30a;
      expv[45] = 105'h0293015babeeff6ef60adebeecb;
      expv[46] = 105'h07f3d4d88218407ad8724f0cbc4;
      expv[47] = 105'h08e3b1d8cff68ca182ef57796dd;
      expv[48] = 105'h0c6afc0e624146324681b1bf2e7;
      expv[49] = 105'h000000000000000000000000000;
      expv[50] = 105'h000000000000000000000000000;
      expv[51] = 105'h02ca5c9d095802461b11f17fa50;
      expv[52] = 105'h060de2761de2573136a68ea30d0;
      expv[53] = 105'h0b18c873f533587eb85f42d42cf;
      expv[54] = 105'h108cd39123cced1326d664b509f;
      expv[55] = 105'h03cbdae3f47621470acb1dbd872;
      expv[56] = 105'h191f72b858464047ae1f4d1a0b3;
      expv[57] = 105'h0e69fcf759e35e7b087d94978d1;
      expv[58] = 105'h124cf7329a7a80e7dd9aaae8c14;
      expv[59] = 105'h0c012842cf4e358cc5a2bc57f7a;
      expv[60] = 105'h17e6528c25c8e398e8d05052e43;
      expv[61] = 105'h0006c48859def5345ceefc1b2ee;
      expv[62] = 105'h000000000000000000000000000;
      expv[63] = 105'h000000000000000000000000000;
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
