// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_171252 dut (
    .V_ex(in_vec[15:15]),
    .eip_change(in_vec[14:14]),
    .AF_needed(in_vec[13:13]),
    .DF_needed(in_vec[12:12]),
    .CF_needed(in_vec[11:11]),
    .v_wb_ld_flag_AF(in_vec[10:10]),
    .v_wb_ld_flag_DF(in_vec[9:9]),
    .v_wb_ld_flag_CF(in_vec[8:8]),
    .wb_mem_stall(in_vec[7:7]),
    .ld_reg1(in_vec[6:6]),
    .ld_reg2(in_vec[5:5]),
    .ld_reg3(in_vec[4:4]),
    .ld_flag_ZF(in_vec[3:3]),
    .ld_seg(in_vec[2:2]),
    .ld_mm(in_vec[1:1]),
    .ld_mem(in_vec[0:0]),
    .v_ro_ld_reg1(out_vec[10:10]),
    .v_ro_ld_reg2(out_vec[9:9]),
    .v_ro_ld_reg3(out_vec[8:8]),
    .v_ro_ld_flag_ZF(out_vec[7:7]),
    .v_ro_ld_seg(out_vec[6:6]),
    .v_ro_ld_mm(out_vec[5:5]),
    .v_ro_ld_mem(out_vec[4:4]),
    .dep_stall(out_vec[3:3]),
    .br_stall(out_vec[2:2]),
    .V_wb(out_vec[1:1]),
    .ld_wb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hd148;
    stim[1] = 16'h0401;
    stim[2] = 16'h096b;
    stim[3] = 16'he37b;
    stim[4] = 16'h27e2;
    stim[5] = 16'hfb45;
    stim[6] = 16'hd785;
    stim[7] = 16'hada5;
    stim[8] = 16'h6e76;
    stim[9] = 16'h08d9;
    stim[10] = 16'h66c9;
    stim[11] = 16'h40a3;
    stim[12] = 16'hd4b6;
    stim[13] = 16'h3442;
    stim[14] = 16'h4648;
    stim[15] = 16'h247b;
    stim[16] = 16'h7e60;
    stim[17] = 16'h21e2;
    stim[18] = 16'hd9eb;
    stim[19] = 16'h89f9;
    stim[20] = 16'he737;
    stim[21] = 16'h533b;
    stim[22] = 16'hdd16;
    stim[23] = 16'h9ed1;
    stim[24] = 16'h43b3;
    stim[25] = 16'h6576;
    stim[26] = 16'h4ffb;
    stim[27] = 16'h97f7;
    stim[28] = 16'hb50c;
    stim[29] = 16'h3a3c;
    stim[30] = 16'h7bc2;
    stim[31] = 16'hd9bc;
    stim[32] = 16'h04ca;
    stim[33] = 16'h0d4b;
    stim[34] = 16'hae94;
    stim[35] = 16'h7bac;
    stim[36] = 16'h2259;
    stim[37] = 16'h550e;
    stim[38] = 16'h38d3;
    stim[39] = 16'hb80f;
    stim[40] = 16'hf68e;
    stim[41] = 16'ha748;
    stim[42] = 16'h61cc;
    stim[43] = 16'h42d6;
    stim[44] = 16'h0ae8;
    stim[45] = 16'h5ae3;
    stim[46] = 16'hffc5;
    stim[47] = 16'hf8df;
    stim[48] = 16'h25d5;
    stim[49] = 16'h3554;
    stim[50] = 16'h1d5a;
    stim[51] = 16'h5dfb;
    stim[52] = 16'ha09c;
    stim[53] = 16'h7c88;
    stim[54] = 16'h925a;
    stim[55] = 16'he0a5;
    stim[56] = 16'h2ba3;
    stim[57] = 16'hf221;
    stim[58] = 16'h80c9;
    stim[59] = 16'h47f6;
    stim[60] = 16'h7a6c;
    stim[61] = 16'h72fa;
    stim[62] = 16'hae8a;
    stim[63] = 16'h294a;
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
      expv[0] = 11'h487;
      expv[1] = 11'h000;
      expv[2] = 11'h008;
      expv[3] = 11'h7b7;
      expv[4] = 11'h008;
      expv[5] = 11'h45c;
      expv[6] = 11'h05c;
      expv[7] = 11'h258;
      expv[8] = 11'h008;
      expv[9] = 11'h000;
      expv[10] = 11'h008;
      expv[11] = 11'h000;
      expv[12] = 11'h366;
      expv[13] = 11'h008;
      expv[14] = 11'h000;
      expv[15] = 11'h008;
      expv[16] = 11'h008;
      expv[17] = 11'h000;
      expv[18] = 11'h6bc;
      expv[19] = 11'h798;
      expv[20] = 11'h37c;
      expv[21] = 11'h008;
      expv[22] = 11'h16c;
      expv[23] = 11'h518;
      expv[24] = 11'h000;
      expv[25] = 11'h008;
      expv[26] = 11'h008;
      expv[27] = 11'h778;
      expv[28] = 11'h0c8;
      expv[29] = 11'h008;
      expv[30] = 11'h008;
      expv[31] = 11'h3cc;
      expv[32] = 11'h000;
      expv[33] = 11'h008;
      expv[34] = 11'h148;
      expv[35] = 11'h008;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h0f3;
      expv[40] = 11'h0ec;
      expv[41] = 11'h488;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h008;
      expv[46] = 11'h45c;
      expv[47] = 11'h5f6;
      expv[48] = 11'h008;
      expv[49] = 11'h008;
      expv[50] = 11'h008;
      expv[51] = 11'h008;
      expv[52] = 11'h1c2;
      expv[53] = 11'h008;
      expv[54] = 11'h5a8;
      expv[55] = 11'h256;
      expv[56] = 11'h008;
      expv[57] = 11'h21c;
      expv[58] = 11'h492;
      expv[59] = 11'h000;
      expv[60] = 11'h008;
      expv[61] = 11'h008;
      expv[62] = 11'h0a8;
      expv[63] = 11'h008;
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
