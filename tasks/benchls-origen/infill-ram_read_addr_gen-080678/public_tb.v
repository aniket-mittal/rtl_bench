// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_080678 dut (
    .i_clk(clk),
    .i_rst_n(in_vec[18:18]),
    .i_out_x_length(in_vec[17:10]),
    .i_output_layers(in_vec[9:2]),
    .i_calc_en(in_vec[1:1]),
    .i_npe_dat_vld(in_vec[0:0]),
    .o_ram_addr(out_vec[7:1]),
    .o_ram_rd_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h323c6;
    stim[1] = 19'h13a7b;
    stim[2] = 19'h70de2;
    stim[3] = 19'h454cd;
    stim[4] = 19'h7c36c;
    stim[5] = 19'h557b0;
    stim[6] = 19'h49137;
    stim[7] = 19'h512bf;
    stim[8] = 19'h4f47a;
    stim[9] = 19'h59cb2;
    stim[10] = 19'h6f331;
    stim[11] = 19'h6100a;
    stim[12] = 19'h6ab17;
    stim[13] = 19'h428c6;
    stim[14] = 19'h75de3;
    stim[15] = 19'h40914;
    stim[16] = 19'h60722;
    stim[17] = 19'h6ffb8;
    stim[18] = 19'h5f375;
    stim[19] = 19'h45721;
    stim[20] = 19'h734f1;
    stim[21] = 19'h58ac3;
    stim[22] = 19'h6c366;
    stim[23] = 19'h45646;
    stim[24] = 19'h69c00;
    stim[25] = 19'h5f134;
    stim[26] = 19'h54b51;
    stim[27] = 19'h6a31b;
    stim[28] = 19'h638f3;
    stim[29] = 19'h46169;
    stim[30] = 19'h769e5;
    stim[31] = 19'h5c027;
    stim[32] = 19'h7efaa;
    stim[33] = 19'h40506;
    stim[34] = 19'h61fc4;
    stim[35] = 19'h60333;
    stim[36] = 19'h44233;
    stim[37] = 19'h624ad;
    stim[38] = 19'h71c9b;
    stim[39] = 19'h48ff1;
    stim[40] = 19'h67b6f;
    stim[41] = 19'h73c91;
    stim[42] = 19'h67a1f;
    stim[43] = 19'h4d40c;
    stim[44] = 19'h67659;
    stim[45] = 19'h4f2b5;
    stim[46] = 19'h5fc95;
    stim[47] = 19'h45127;
    stim[48] = 19'h47679;
    stim[49] = 19'h637ef;
    stim[50] = 19'h4bf72;
    stim[51] = 19'h61982;
    stim[52] = 19'h61c38;
    stim[53] = 19'h4f393;
    stim[54] = 19'h69fec;
    stim[55] = 19'h54f59;
    stim[56] = 19'h72cba;
    stim[57] = 19'h46b09;
    stim[58] = 19'h587c9;
    stim[59] = 19'h6b547;
    stim[60] = 19'h5768e;
    stim[61] = 19'h7e123;
    stim[62] = 19'h7e6c3;
    stim[63] = 19'h63fa2;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h01;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h01;
      expv[8] = 8'h01;
      expv[9] = 8'h01;
      expv[10] = 8'h01;
      expv[11] = 8'h00;
      expv[12] = 8'h01;
      expv[13] = 8'h01;
      expv[14] = 8'h01;
      expv[15] = 8'h01;
      expv[16] = 8'h00;
      expv[17] = 8'h01;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h01;
      expv[23] = 8'h01;
      expv[24] = 8'h01;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h01;
      expv[29] = 8'h01;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h01;
      expv[33] = 8'h01;
      expv[34] = 8'h01;
      expv[35] = 8'h00;
      expv[36] = 8'h01;
      expv[37] = 8'h01;
      expv[38] = 8'h00;
      expv[39] = 8'h01;
      expv[40] = 8'h00;
      expv[41] = 8'h01;
      expv[42] = 8'h00;
      expv[43] = 8'h01;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h01;
      expv[49] = 8'h00;
      expv[50] = 8'h01;
      expv[51] = 8'h01;
      expv[52] = 8'h01;
      expv[53] = 8'h00;
      expv[54] = 8'h01;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h01;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h01;
      expv[61] = 8'h01;
      expv[62] = 8'h01;
      expv[63] = 8'h01;
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
