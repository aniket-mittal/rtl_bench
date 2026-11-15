// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026719 dut (
    .instr(in_vec[35:4]),
    .flag(in_vec[3:0]),
    .jmp_en(out_vec[55:55]),
    .jmp_reg_en(out_vec[54:54]),
    .flag_en(out_vec[53:53]),
    .data_w_en(out_vec[52:52]),
    .data_mem(out_vec[51:51]),
    .data_mem_en(out_vec[50:50]),
    .op(out_vec[49:48]),
    .cmd(out_vec[47:44]),
    .src_addr(out_vec[43:40]),
    .dest_reg(out_vec[39:36]),
    .imm_instr_mem(out_vec[35:24]),
    .imm_instr(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hd7c9e08c9;
    stim[1] = 36'h61c6af8d7;
    stim[2] = 36'hacc3edad5;
    stim[3] = 36'hefb322257;
    stim[4] = 36'h1ce9ce152;
    stim[5] = 36'h16aa2f44b;
    stim[6] = 36'hd7e106186;
    stim[7] = 36'hdf945f8bb;
    stim[8] = 36'ha747917d6;
    stim[9] = 36'h7fa0789af;
    stim[10] = 36'hbf3fc2757;
    stim[11] = 36'h412798dff;
    stim[12] = 36'hd5300b616;
    stim[13] = 36'h3fd4cf7c8;
    stim[14] = 36'h90a5f4a05;
    stim[15] = 36'hf93c8fa12;
    stim[16] = 36'h0d44e9a40;
    stim[17] = 36'hba0b2d6aa;
    stim[18] = 36'h97a1293f9;
    stim[19] = 36'h3357ed213;
    stim[20] = 36'h0be336bc5;
    stim[21] = 36'hfef2bd80e;
    stim[22] = 36'h8f29a9b0f;
    stim[23] = 36'h9fe5feb83;
    stim[24] = 36'h6accff691;
    stim[25] = 36'hd2bfe0102;
    stim[26] = 36'hc3fdf7510;
    stim[27] = 36'hf7e52c739;
    stim[28] = 36'h3f555cf5c;
    stim[29] = 36'h020bb1aeb;
    stim[30] = 36'h8e2d5d0bc;
    stim[31] = 36'hfe0d15daa;
    stim[32] = 36'hcb0865467;
    stim[33] = 36'heb20095e5;
    stim[34] = 36'h23cac4c49;
    stim[35] = 36'h6ad590d96;
    stim[36] = 36'h2709f67da;
    stim[37] = 36'hd1bf6a55c;
    stim[38] = 36'h167f527dd;
    stim[39] = 36'h27fee1ba7;
    stim[40] = 36'h6004b2099;
    stim[41] = 36'h44a615309;
    stim[42] = 36'h2506bf9d8;
    stim[43] = 36'he249a420e;
    stim[44] = 36'hd1c952d6c;
    stim[45] = 36'h8c7735614;
    stim[46] = 36'h7b2b77776;
    stim[47] = 36'h1b88b6f42;
    stim[48] = 36'hc71eb394e;
    stim[49] = 36'hfbd45b900;
    stim[50] = 36'h97ac1cb01;
    stim[51] = 36'hc91a5c509;
    stim[52] = 36'hb1e34758c;
    stim[53] = 36'h82ab26ad4;
    stim[54] = 36'h2d2e465e8;
    stim[55] = 36'h044bb8a56;
    stim[56] = 36'hacc9e862c;
    stim[57] = 36'h99fd6b0a3;
    stim[58] = 36'habc45c775;
    stim[59] = 36'h7f3e74578;
    stim[60] = 36'h8a3a1960e;
    stim[61] = 36'hae631913e;
    stim[62] = 36'he9e42e5f1;
    stim[63] = 36'h3a07708b0;
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
      expv[0] = 56'h01e9e08c000000;
      expv[1] = 56'h10e6a000000000;
      expv[2] = 56'h03600000000000;
      expv[3] = 56'h03d00000000000;
      expv[4] = 56'h03700000000000;
      expv[5] = 56'h015a2f44000000;
      expv[6] = 56'h01f10618000000;
      expv[7] = 56'h03c00000000000;
      expv[8] = 56'h01a7917d000000;
      expv[9] = 56'h03d00000000000;
      expv[10] = 56'h03900000000000;
      expv[11] = 56'h10979000000000;
      expv[12] = 56'h0d900000000000;
      expv[13] = 56'h03e00000000000;
      expv[14] = 56'h1055f000000000;
      expv[15] = 56'hc29000003c8fa1;
      expv[16] = 56'h03a00000000000;
      expv[17] = 56'hc20000000b2d6a;
      expv[18] = 56'h01d1293f000000;
      expv[19] = 56'h20a7e000000000;
      expv[20] = 56'hc2f00000e336bc;
      expv[21] = 56'h03700000000000;
      expv[22] = 56'h03900000000000;
      expv[23] = 56'h03f00000000000;
      expv[24] = 56'hc2600000ccff69;
      expv[25] = 56'h305fe000000000;
      expv[26] = 56'h30fdf000000000;
      expv[27] = 56'h01f52c73000000;
      expv[28] = 56'h03a00000000000;
      expv[29] = 56'h100bb000000000;
      expv[30] = 56'h03100000000000;
      expv[31] = 56'h03000000000000;
      expv[32] = 56'hc2800000086546;
      expv[33] = 56'hc290000020095e;
      expv[34] = 56'h10eac000000000;
      expv[35] = 56'hc2600000d590d9;
      expv[36] = 56'h0189f67d000000;
      expv[37] = 56'h30df6000000000;
      expv[38] = 56'h0d3f527d000000;
      expv[39] = 56'h0dfee1ba000000;
      expv[40] = 56'h1004b000000000;
      expv[41] = 56'h01561000000000;
      expv[42] = 56'h0186b000000000;
      expv[43] = 56'h1029a000000000;
      expv[44] = 56'h10e95000000000;
      expv[45] = 56'h03300000000000;
      expv[46] = 56'hc29000002b7777;
      expv[47] = 56'hc2c0000088b6f4;
      expv[48] = 56'h0d8eb394000000;
      expv[49] = 56'hc2e00000d45b90;
      expv[50] = 56'h01dc1cb0000000;
      expv[51] = 56'hc28000001a5c50;
      expv[52] = 56'h10f34000000000;
      expv[53] = 56'h105b2000000000;
      expv[54] = 56'h03900000000000;
      expv[55] = 56'h012bb000000000;
      expv[56] = 56'h03600000000000;
      expv[57] = 56'hc2f00000fd6b0a;
      expv[58] = 56'hc2e00000c45c77;
      expv[59] = 56'h03900000000000;
      expv[60] = 56'hc21000003a1960;
      expv[61] = 56'h03300000000000;
      expv[62] = 56'hc2f00000e42e5f;
      expv[63] = 56'hc200000007708b;
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
