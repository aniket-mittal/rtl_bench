// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 146;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_piu_other_io_dummy dut (
    .l2cif_piu_read_data_vld(in_vec[2:2]),
    .psel_l2pmp_x(in_vec[1:1]),
    .regs_piu_cmplt(in_vec[0:0]),
    .perr_l2pmp_x(out_vec[145:145]),
    .piu_l2cif_read_data(out_vec[144:144]),
    .piu_l2cif_read_data_ecc(out_vec[143:143]),
    .piu_l2cif_read_index(out_vec[142:122]),
    .piu_l2cif_read_req(out_vec[121:121]),
    .piu_l2cif_read_tag(out_vec[120:120]),
    .piu_l2cif_read_tag_ecc(out_vec[119:119]),
    .piu_l2cif_read_way(out_vec[118:115]),
    .piu_regs_op(out_vec[114:99]),
    .piu_regs_sel(out_vec[98:98]),
    .piu_regs_wdata(out_vec[97:34]),
    .piu_xx_regs_no_op(out_vec[33:33]),
    .pready_l2pmp_x(out_vec[32:32]),
    .x_prdata_l2pmp(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h5;
    stim[1] = 3'h4;
    stim[2] = 3'h5;
    stim[3] = 3'h5;
    stim[4] = 3'h5;
    stim[5] = 3'h5;
    stim[6] = 3'h6;
    stim[7] = 3'h1;
    stim[8] = 3'h1;
    stim[9] = 3'h3;
    stim[10] = 3'h4;
    stim[11] = 3'h4;
    stim[12] = 3'h7;
    stim[13] = 3'h7;
    stim[14] = 3'h5;
    stim[15] = 3'h1;
    stim[16] = 3'h0;
    stim[17] = 3'h5;
    stim[18] = 3'h2;
    stim[19] = 3'h0;
    stim[20] = 3'h1;
    stim[21] = 3'h5;
    stim[22] = 3'h6;
    stim[23] = 3'h6;
    stim[24] = 3'h2;
    stim[25] = 3'h4;
    stim[26] = 3'h0;
    stim[27] = 3'h6;
    stim[28] = 3'h3;
    stim[29] = 3'h4;
    stim[30] = 3'h5;
    stim[31] = 3'h1;
    stim[32] = 3'h4;
    stim[33] = 3'h3;
    stim[34] = 3'h3;
    stim[35] = 3'h7;
    stim[36] = 3'h4;
    stim[37] = 3'h6;
    stim[38] = 3'h6;
    stim[39] = 3'h2;
    stim[40] = 3'h6;
    stim[41] = 3'h0;
    stim[42] = 3'h2;
    stim[43] = 3'h5;
    stim[44] = 3'h4;
    stim[45] = 3'h0;
    stim[46] = 3'h4;
    stim[47] = 3'h3;
    stim[48] = 3'h5;
    stim[49] = 3'h1;
    stim[50] = 3'h4;
    stim[51] = 3'h4;
    stim[52] = 3'h6;
    stim[53] = 3'h0;
    stim[54] = 3'h1;
    stim[55] = 3'h0;
    stim[56] = 3'h2;
    stim[57] = 3'h7;
    stim[58] = 3'h4;
    stim[59] = 3'h2;
    stim[60] = 3'h6;
    stim[61] = 3'h3;
    stim[62] = 3'h2;
    stim[63] = 3'h1;
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
      expv[0] = 146'h0000000000000000000000000000300000000;
      expv[1] = 146'h0000000000000000000000000000300000000;
      expv[2] = 146'h0000000000000000000000000000300000000;
      expv[3] = 146'h0000000000000000000000000000300000000;
      expv[4] = 146'h0000000000000000000000000000300000000;
      expv[5] = 146'h0000000000000000000000000000300000000;
      expv[6] = 146'h0000000000000000000000000000300000000;
      expv[7] = 146'h0000000000000000000000000000300000000;
      expv[8] = 146'h0000000000000000000000000000300000000;
      expv[9] = 146'h0000000000000000000000000000300000000;
      expv[10] = 146'h0000000000000000000000000000300000000;
      expv[11] = 146'h0000000000000000000000000000300000000;
      expv[12] = 146'h0000000000000000000000000000300000000;
      expv[13] = 146'h0000000000000000000000000000300000000;
      expv[14] = 146'h0000000000000000000000000000300000000;
      expv[15] = 146'h0000000000000000000000000000300000000;
      expv[16] = 146'h0000000000000000000000000000300000000;
      expv[17] = 146'h0000000000000000000000000000300000000;
      expv[18] = 146'h0000000000000000000000000000300000000;
      expv[19] = 146'h0000000000000000000000000000300000000;
      expv[20] = 146'h0000000000000000000000000000300000000;
      expv[21] = 146'h0000000000000000000000000000300000000;
      expv[22] = 146'h0000000000000000000000000000300000000;
      expv[23] = 146'h0000000000000000000000000000300000000;
      expv[24] = 146'h0000000000000000000000000000300000000;
      expv[25] = 146'h0000000000000000000000000000300000000;
      expv[26] = 146'h0000000000000000000000000000300000000;
      expv[27] = 146'h0000000000000000000000000000300000000;
      expv[28] = 146'h0000000000000000000000000000300000000;
      expv[29] = 146'h0000000000000000000000000000300000000;
      expv[30] = 146'h0000000000000000000000000000300000000;
      expv[31] = 146'h0000000000000000000000000000300000000;
      expv[32] = 146'h0000000000000000000000000000300000000;
      expv[33] = 146'h0000000000000000000000000000300000000;
      expv[34] = 146'h0000000000000000000000000000300000000;
      expv[35] = 146'h0000000000000000000000000000300000000;
      expv[36] = 146'h0000000000000000000000000000300000000;
      expv[37] = 146'h0000000000000000000000000000300000000;
      expv[38] = 146'h0000000000000000000000000000300000000;
      expv[39] = 146'h0000000000000000000000000000300000000;
      expv[40] = 146'h0000000000000000000000000000300000000;
      expv[41] = 146'h0000000000000000000000000000300000000;
      expv[42] = 146'h0000000000000000000000000000300000000;
      expv[43] = 146'h0000000000000000000000000000300000000;
      expv[44] = 146'h0000000000000000000000000000300000000;
      expv[45] = 146'h0000000000000000000000000000300000000;
      expv[46] = 146'h0000000000000000000000000000300000000;
      expv[47] = 146'h0000000000000000000000000000300000000;
      expv[48] = 146'h0000000000000000000000000000300000000;
      expv[49] = 146'h0000000000000000000000000000300000000;
      expv[50] = 146'h0000000000000000000000000000300000000;
      expv[51] = 146'h0000000000000000000000000000300000000;
      expv[52] = 146'h0000000000000000000000000000300000000;
      expv[53] = 146'h0000000000000000000000000000300000000;
      expv[54] = 146'h0000000000000000000000000000300000000;
      expv[55] = 146'h0000000000000000000000000000300000000;
      expv[56] = 146'h0000000000000000000000000000300000000;
      expv[57] = 146'h0000000000000000000000000000300000000;
      expv[58] = 146'h0000000000000000000000000000300000000;
      expv[59] = 146'h0000000000000000000000000000300000000;
      expv[60] = 146'h0000000000000000000000000000300000000;
      expv[61] = 146'h0000000000000000000000000000300000000;
      expv[62] = 146'h0000000000000000000000000000300000000;
      expv[63] = 146'h0000000000000000000000000000300000000;
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
