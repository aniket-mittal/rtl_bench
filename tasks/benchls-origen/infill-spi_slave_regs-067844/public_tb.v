// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067844 dut (
    .sys_clk_25m(clk),
    .sys_rstn(in_vec[11:11]),
    .spi_clk(in_vec[10:10]),
    .spi_cs_n(in_vec[9:9]),
    .spi_mosi(in_vec[8:8]),
    .spi_rd_data(in_vec[7:0]),
    .spi_miso(out_vec[21:21]),
    .spi_out_oe(out_vec[20:20]),
    .spi_rw(out_vec[19:19]),
    .spi_data_start(out_vec[18:18]),
    .spi_sel_start(out_vec[17:17]),
    .spi_sel_end(out_vec[16:16]),
    .spi_reg_addr(out_vec[15:8]),
    .spi_wr_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h4d5;
    stim[1] = 12'h288;
    stim[2] = 12'haac;
    stim[3] = 12'hd26;
    stim[4] = 12'haa2;
    stim[5] = 12'h8e3;
    stim[6] = 12'hbb2;
    stim[7] = 12'hd68;
    stim[8] = 12'h9b7;
    stim[9] = 12'h9c5;
    stim[10] = 12'he6d;
    stim[11] = 12'hf3a;
    stim[12] = 12'ha4c;
    stim[13] = 12'hb01;
    stim[14] = 12'h8c9;
    stim[15] = 12'haa9;
    stim[16] = 12'h979;
    stim[17] = 12'hf19;
    stim[18] = 12'ha02;
    stim[19] = 12'hb02;
    stim[20] = 12'hc42;
    stim[21] = 12'hed9;
    stim[22] = 12'hc8b;
    stim[23] = 12'hb6b;
    stim[24] = 12'h835;
    stim[25] = 12'ha82;
    stim[26] = 12'hf6c;
    stim[27] = 12'he19;
    stim[28] = 12'h964;
    stim[29] = 12'h990;
    stim[30] = 12'ha3e;
    stim[31] = 12'hc93;
    stim[32] = 12'hc31;
    stim[33] = 12'hc8f;
    stim[34] = 12'hd0c;
    stim[35] = 12'hf74;
    stim[36] = 12'hbc4;
    stim[37] = 12'he77;
    stim[38] = 12'hdd8;
    stim[39] = 12'hc37;
    stim[40] = 12'hd4a;
    stim[41] = 12'ha01;
    stim[42] = 12'hc7d;
    stim[43] = 12'hcdb;
    stim[44] = 12'h800;
    stim[45] = 12'ha2b;
    stim[46] = 12'h8a2;
    stim[47] = 12'hab4;
    stim[48] = 12'h85a;
    stim[49] = 12'hb8c;
    stim[50] = 12'ha89;
    stim[51] = 12'had8;
    stim[52] = 12'hf55;
    stim[53] = 12'he12;
    stim[54] = 12'ha4e;
    stim[55] = 12'h9b7;
    stim[56] = 12'h883;
    stim[57] = 12'hf7e;
    stim[58] = 12'h941;
    stim[59] = 12'h39d;
    stim[60] = 12'hd95;
    stim[61] = 12'hd1a;
    stim[62] = 12'hb85;
    stim[63] = 12'he37;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h020000;
      expv[7] = 22'h010000;
      expv[8] = 22'h020000;
      expv[9] = 22'h010000;
      expv[10] = 22'h020000;
      expv[11] = 22'h000000;
      expv[12] = 22'h000000;
      expv[13] = 22'h010000;
      expv[14] = 22'h000000;
      expv[15] = 22'h000000;
      expv[16] = 22'h000000;
      expv[17] = 22'h020000;
      expv[18] = 22'h010000;
      expv[19] = 22'h020000;
      expv[20] = 22'h010000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h020000;
      expv[24] = 22'h010000;
      expv[25] = 22'h020000;
      expv[26] = 22'h010000;
      expv[27] = 22'h020000;
      expv[28] = 22'h010000;
      expv[29] = 22'h000000;
      expv[30] = 22'h000000;
      expv[31] = 22'h020000;
      expv[32] = 22'h000000;
      expv[33] = 22'h010000;
      expv[34] = 22'h020000;
      expv[35] = 22'h000000;
      expv[36] = 22'h000000;
      expv[37] = 22'h000000;
      expv[38] = 22'h010000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h020000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h010000;
      expv[45] = 22'h020000;
      expv[46] = 22'h000000;
      expv[47] = 22'h000000;
      expv[48] = 22'h010000;
      expv[49] = 22'h020000;
      expv[50] = 22'h010000;
      expv[51] = 22'h020000;
      expv[52] = 22'h010000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h020000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h020000;
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
