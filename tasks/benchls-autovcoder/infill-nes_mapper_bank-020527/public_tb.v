// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020527 dut (
    .m2(in_vec[31:31]),
    .romsel(in_vec[30:30]),
    .cpu_rw_in(in_vec[29:29]),
    .cpu_addr_in(in_vec[28:14]),
    .cpu_data_in(in_vec[13:6]),
    .ppu_rd_in(in_vec[5:5]),
    .ppu_wr_in(in_vec[4:4]),
    .ppu_addr_in(in_vec[3:0]),
    .led(out_vec[27:27]),
    .cpu_addr_out(out_vec[26:20]),
    .cpu_wr_out(out_vec[19:19]),
    .cpu_rd_out(out_vec[18:18]),
    .cpu_flash_ce(out_vec[17:17]),
    .cpu_sram_ce(out_vec[16:16]),
    .ppu_addr_out(out_vec[15:7]),
    .ppu_rd_out(out_vec[6:6]),
    .ppu_wr_out(out_vec[5:5]),
    .ppu_flash_ce(out_vec[4:4]),
    .ppu_sram_ce(out_vec[3:3]),
    .ppu_ciram_a10(out_vec[2:2]),
    .ppu_ciram_ce(out_vec[1:1]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h2e022c3a;
    stim[1] = 32'haebf80eb;
    stim[2] = 32'h26dbd5c8;
    stim[3] = 32'h483a0347;
    stim[4] = 32'hf123fcce;
    stim[5] = 32'hc9fba5f3;
    stim[6] = 32'hb6cc314c;
    stim[7] = 32'hf8d3cc4a;
    stim[8] = 32'ha2d4d2df;
    stim[9] = 32'hc98599ee;
    stim[10] = 32'h1a0cadd1;
    stim[11] = 32'h70919079;
    stim[12] = 32'h7c9f170c;
    stim[13] = 32'h775f454d;
    stim[14] = 32'h86cb1d63;
    stim[15] = 32'ha45a90d0;
    stim[16] = 32'h6099e226;
    stim[17] = 32'h7dceef40;
    stim[18] = 32'hc6ae843b;
    stim[19] = 32'h580f3776;
    stim[20] = 32'hc6bd65bf;
    stim[21] = 32'h795870d1;
    stim[22] = 32'h07f2841a;
    stim[23] = 32'h17e449c0;
    stim[24] = 32'h8a75886d;
    stim[25] = 32'h0e0cc83e;
    stim[26] = 32'h10a159a7;
    stim[27] = 32'h4423baa7;
    stim[28] = 32'ha79502aa;
    stim[29] = 32'h64a9a9f5;
    stim[30] = 32'h607a169b;
    stim[31] = 32'hd372d981;
    stim[32] = 32'h0cbbb1af;
    stim[33] = 32'hff35374c;
    stim[34] = 32'hb6c87b81;
    stim[35] = 32'h35507275;
    stim[36] = 32'hdae418a4;
    stim[37] = 32'h9d4632ef;
    stim[38] = 32'h4dbede89;
    stim[39] = 32'h07950a5b;
    stim[40] = 32'hae8fc63c;
    stim[41] = 32'h512647eb;
    stim[42] = 32'h5f0d7250;
    stim[43] = 32'h63815a7b;
    stim[44] = 32'hb8d74e8c;
    stim[45] = 32'h9ed7c9c6;
    stim[46] = 32'h04ada91c;
    stim[47] = 32'h9e574156;
    stim[48] = 32'hc6128e51;
    stim[49] = 32'h6e17d90c;
    stim[50] = 32'hfbd156af;
    stim[51] = 32'he358815e;
    stim[52] = 32'h58333dcb;
    stim[53] = 32'he709efd4;
    stim[54] = 32'h8e0a47f5;
    stim[55] = 32'h3f8fcd9f;
    stim[56] = 32'hfbebd415;
    stim[57] = 32'h55cc5be2;
    stim[58] = 32'h85fd581a;
    stim[59] = 32'h7728f852;
    stim[60] = 32'h5cfe4149;
    stim[61] = 32'h2b21e8e2;
    stim[62] = 32'ha417f085;
    stim[63] = 32'h345011e1;
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
      expv[0] = 28'h8390x7x;
      expv[1] = 28'h8390xfx;
      expv[2] = 28'h8190x3x;
      expv[3] = 28'h02f07ax;
      expv[4] = 28'h04b073x;
      expv[5] = 28'h02f05ex;
      expv[6] = 28'h859063x;
      expv[7] = 28'h06b053x;
      expv[8] = 28'h80907bx;
      expv[9] = 28'h02f0f7x;
      expv[10] = 28'h86d0cax;
      expv[11] = 28'h04b0cfx;
      expv[12] = 28'h07b0e3x;
      expv[13] = 28'h05b0ebx;
      expv[14] = 28'h81d0dex;
      expv[15] = 28'h8190c2x;
      expv[16] = 28'h00b0f6x;
      expv[17] = 28'h07b0c2x;
      expv[18] = 28'h01f0dfx;
      expv[19] = 28'h06f0f6x;
      expv[20] = 28'h01f0ffx;
      expv[21] = 28'h06b0cax;
      expv[22] = 28'h81d0d3x;
      expv[23] = 28'h85d0c2x;
      expv[24] = 28'h82d0efx;
      expv[25] = 28'h83d0f7x;
      expv[26] = 28'h84d0fex;
      expv[27] = 28'h01f0bex;
      expv[28] = 28'h819097x;
      expv[29] = 28'h01b0aex;
      expv[30] = 28'h00b09bx;
      expv[31] = 28'h04f08ax;
      expv[32] = 28'h83d0bfx;
      expv[33] = 28'h07b0a3x;
      expv[34] = 28'h85908ax;
      expv[35] = 28'h8590aex;
      expv[36] = 28'h06f0a6x;
      expv[37] = 28'h87d0bfx;
      expv[38] = 28'h03f08bx;
      expv[39] = 28'h81d09bx;
      expv[40] = 28'h8390a7x;
      expv[41] = 28'h04f0dfx;
      expv[42] = 28'h07f0c2x;
      expv[43] = 28'h00b0dfx;
      expv[44] = 28'h8690e3x;
      expv[45] = 28'h87d0f2x;
      expv[46] = 28'h81d0e3x;
      expv[47] = 28'h87d0f2x;
      expv[48] = 28'h01f04ax;
      expv[49] = 28'h03b063x;
      expv[50] = 28'h06b07fx;
      expv[51] = 28'h00b073x;
      expv[52] = 28'h06f05bx;
      expv[53] = 28'h01b062x;
      expv[54] = 28'h83d06ex;
      expv[55] = 28'h87907bx;
      expv[56] = 28'h06b06ax;
      expv[57] = 28'h05f056x;
      expv[58] = 28'h81d053x;
      expv[59] = 28'h05b052x;
      expv[60] = 28'h07f04bx;
      expv[61] = 28'h829056x;
      expv[62] = 28'h81906ax;
      expv[63] = 28'h85904ex;
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
