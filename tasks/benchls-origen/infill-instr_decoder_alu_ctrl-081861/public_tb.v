// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081861 dut (
    .opcode(in_vec[12:9]),
    .func(in_vec[8:1]),
    .zero_flag(in_vec[0:0]),
    .alu_operation(out_vec[13:11]),
    .next_sel(out_vec[10:10]),
    .ld_window(out_vec[9:9]),
    .branch_sel(out_vec[8:8]),
    .jump_sel(out_vec[7:7]),
    .R_sel(out_vec[6:6]),
    .imm_sel(out_vec[5:5]),
    .mem_sel(out_vec[4:4]),
    .alu_sel(out_vec[3:3]),
    .reg_write(out_vec[2:2]),
    .mem_read(out_vec[1:1]),
    .mem_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0545;
    stim[1] = 13'h1420;
    stim[2] = 13'h1df2;
    stim[3] = 13'h1b08;
    stim[4] = 13'h11be;
    stim[5] = 13'h044b;
    stim[6] = 13'h1a4d;
    stim[7] = 13'h1bf9;
    stim[8] = 13'h1a41;
    stim[9] = 13'h1325;
    stim[10] = 13'h1485;
    stim[11] = 13'h06e7;
    stim[12] = 13'h1c77;
    stim[13] = 13'h1201;
    stim[14] = 13'h1f2a;
    stim[15] = 13'h0667;
    stim[16] = 13'h1202;
    stim[17] = 13'h1f39;
    stim[18] = 13'h09cd;
    stim[19] = 13'h016d;
    stim[20] = 13'h06f9;
    stim[21] = 13'h0da6;
    stim[22] = 13'h051b;
    stim[23] = 13'h08ca;
    stim[24] = 13'h07f4;
    stim[25] = 13'h0feb;
    stim[26] = 13'h0f5d;
    stim[27] = 13'h1899;
    stim[28] = 13'h0a2c;
    stim[29] = 13'h0155;
    stim[30] = 13'h1d14;
    stim[31] = 13'h0b15;
    stim[32] = 13'h0335;
    stim[33] = 13'h18f4;
    stim[34] = 13'h01dc;
    stim[35] = 13'h0362;
    stim[36] = 13'h158b;
    stim[37] = 13'h184e;
    stim[38] = 13'h13dd;
    stim[39] = 13'h1d28;
    stim[40] = 13'h1b04;
    stim[41] = 13'h177c;
    stim[42] = 13'h1567;
    stim[43] = 13'h0c32;
    stim[44] = 13'h1a88;
    stim[45] = 13'h1fc2;
    stim[46] = 13'h18c2;
    stim[47] = 13'h113b;
    stim[48] = 13'h120a;
    stim[49] = 13'h1a0f;
    stim[50] = 13'h03ad;
    stim[51] = 13'h108d;
    stim[52] = 13'h1205;
    stim[53] = 13'h1624;
    stim[54] = 13'h1f8a;
    stim[55] = 13'h0ad2;
    stim[56] = 13'h18dc;
    stim[57] = 13'h1eaa;
    stim[58] = 13'h1e22;
    stim[59] = 13'h0216;
    stim[60] = 13'h0b6d;
    stim[61] = 13'h065f;
    stim[62] = 13'h0966;
    stim[63] = 13'h10a6;
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
      expv[0] = 14'h0836;
      expv[1] = 14'h3800;
      expv[2] = 14'h182c;
      expv[3] = 14'h102c;
      expv[4] = 14'h3a4c;
      expv[5] = 14'h0836;
      expv[6] = 14'h102c;
      expv[7] = 14'h102c;
      expv[8] = 14'h102c;
      expv[9] = 14'h3800;
      expv[10] = 14'h3800;
      expv[11] = 14'h0821;
      expv[12] = 14'h182c;
      expv[13] = 14'h3800;
      expv[14] = 14'h202c;
      expv[15] = 14'h0821;
      expv[16] = 14'h3800;
      expv[17] = 14'h202c;
      expv[18] = 14'h1540;
      expv[19] = 14'h3c80;
      expv[20] = 14'h0821;
      expv[21] = 14'h3800;
      expv[22] = 14'h0836;
      expv[23] = 14'h1040;
      expv[24] = 14'h0821;
      expv[25] = 14'h3800;
      expv[26] = 14'h3800;
      expv[27] = 14'h082c;
      expv[28] = 14'h3800;
      expv[29] = 14'h3c80;
      expv[30] = 14'h182c;
      expv[31] = 14'h3800;
      expv[32] = 14'h3800;
      expv[33] = 14'h082c;
      expv[34] = 14'h3c80;
      expv[35] = 14'h3800;
      expv[36] = 14'h3800;
      expv[37] = 14'h082c;
      expv[38] = 14'h3800;
      expv[39] = 14'h182c;
      expv[40] = 14'h102c;
      expv[41] = 14'h3800;
      expv[42] = 14'h3800;
      expv[43] = 14'h3800;
      expv[44] = 14'h102c;
      expv[45] = 14'h202c;
      expv[46] = 14'h082c;
      expv[47] = 14'h2a4c;
      expv[48] = 14'h3800;
      expv[49] = 14'h102c;
      expv[50] = 14'h3800;
      expv[51] = 14'h3a4c;
      expv[52] = 14'h3800;
      expv[53] = 14'h3800;
      expv[54] = 14'h202c;
      expv[55] = 14'h3800;
      expv[56] = 14'h082c;
      expv[57] = 14'h202c;
      expv[58] = 14'h202c;
      expv[59] = 14'h3800;
      expv[60] = 14'h3800;
      expv[61] = 14'h0821;
      expv[62] = 14'h1040;
      expv[63] = 14'h1a4c;
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
