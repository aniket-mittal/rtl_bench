// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103266 dut (
    .instr_x(in_vec[33:18]),
    .instr_rfw(in_vec[17:2]),
    .n(in_vec[1:1]),
    .z(in_vec[0:0]),
    .alu_op(out_vec[15:13]),
    .alu_a_sel(out_vec[12:12]),
    .alu_b_sel(out_vec[11:11]),
    .alu_ld_n(out_vec[10:10]),
    .alu_ld_z(out_vec[9:9]),
    .alu_A_ld(out_vec[8:8]),
    .rfx_wr_ld(out_vec[7:7]),
    .rfy_wr_ld(out_vec[6:6]),
    .rfx_wr_sel(out_vec[5:5]),
    .rfy_wr_sel(out_vec[4:4]),
    .ldst_rd(out_vec[3:3]),
    .ldst_wr(out_vec[2:2]),
    .ldst_addr_sel(out_vec[1:1]),
    .ldst_wrdata_sel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h38c74c9c2;
    stim[1] = 34'h05cc36f47;
    stim[2] = 34'h0f3a5eb5a;
    stim[3] = 34'h170437328;
    stim[4] = 34'h25b8c9dc7;
    stim[5] = 34'h0aa1a2398;
    stim[6] = 34'h3b6629e90;
    stim[7] = 34'h3d12d05fc;
    stim[8] = 34'h3df0dd2e3;
    stim[9] = 34'h2f29ef1bc;
    stim[10] = 34'h0c11114de;
    stim[11] = 34'h0f3453ea2;
    stim[12] = 34'h3283622a6;
    stim[13] = 34'h19b6496a8;
    stim[14] = 34'h124fcdfe6;
    stim[15] = 34'h0ce9d77fc;
    stim[16] = 34'h151faedf5;
    stim[17] = 34'h2e3fc7c00;
    stim[18] = 34'h3f321eab9;
    stim[19] = 34'h3fab4ff85;
    stim[20] = 34'h0570e8a12;
    stim[21] = 34'h2b1fdaea8;
    stim[22] = 34'h2af530ca0;
    stim[23] = 34'h3197a5095;
    stim[24] = 34'h38f96e82b;
    stim[25] = 34'h3507ab6a1;
    stim[26] = 34'h3148aba63;
    stim[27] = 34'h3c48f2038;
    stim[28] = 34'h356950d58;
    stim[29] = 34'h36ce6acd4;
    stim[30] = 34'h17883dfc4;
    stim[31] = 34'h1ed03ed66;
    stim[32] = 34'h202544cee;
    stim[33] = 34'h0f3d0b20e;
    stim[34] = 34'h1912035b0;
    stim[35] = 34'h0dfed8e21;
    stim[36] = 34'h0d0e6dfa2;
    stim[37] = 34'h004a343fc;
    stim[38] = 34'h3322e0235;
    stim[39] = 34'h2896ea1de;
    stim[40] = 34'h0db7b2209;
    stim[41] = 34'h35a679a8a;
    stim[42] = 34'h200a26c41;
    stim[43] = 34'h2355fd6a0;
    stim[44] = 34'h08cc2c0d7;
    stim[45] = 34'h2a38663fe;
    stim[46] = 34'h1ee4674ed;
    stim[47] = 34'h051300822;
    stim[48] = 34'h1359af592;
    stim[49] = 34'h19e5fe80d;
    stim[50] = 34'h2ee012a08;
    stim[51] = 34'h04e61259e;
    stim[52] = 34'h1a314f06b;
    stim[53] = 34'h35d91eeb0;
    stim[54] = 34'h1f19f8dd3;
    stim[55] = 34'h1d1acc242;
    stim[56] = 34'h38b3a65a3;
    stim[57] = 34'h178e3be46;
    stim[58] = 34'h34fbf10b1;
    stim[59] = 34'h1c6033ea6;
    stim[60] = 34'h12c2be17d;
    stim[61] = 34'h0662592fd;
    stim[62] = 34'h2465b0547;
    stim[63] = 34'h2fcd6c77e;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h7680;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h6680;
      expv[9] = 16'h0000;
      expv[10] = 16'h00a8;
      expv[11] = 16'h2680;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0100;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h01c0;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h6600;
      expv[21] = 16'h01c0;
      expv[22] = 16'h00a8;
      expv[23] = 16'h0000;
      expv[24] = 16'h0004;
      expv[25] = 16'h0000;
      expv[26] = 16'h4680;
      expv[27] = 16'h6680;
      expv[28] = 16'h0004;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0004;
      expv[33] = 16'h00a8;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h3e80;
      expv[46] = 16'h2680;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0004;
      expv[53] = 16'h00a8;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h01c0;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0004;
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
