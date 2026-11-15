// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127916 dut (
    .v1_reg_0(in_vec[8:4]),
    .wr_rst_busy(in_vec[3:3]),
    .out(in_vec[2:2]),
    .wr_en(in_vec[1:1]),
    .comp1(in_vec[0:0]),
    .ram_full_fb_i_reg(out_vec[22:22]),
    .carrynet_0(out_vec[21:21]),
    .carrynet_1(out_vec[20:20]),
    .carrynet_2(out_vec[19:19]),
    .carrynet_3(out_vec[18:18]),
    .comp2(out_vec[17:17]),
    .NLW_gmux_gm_0_gm1_m1_CARRY4_O_UNCONNECTED(out_vec[16:13]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_CO_UNCONNECTED(out_vec[12:10]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_DI_UNCONNECTED(out_vec[9:7]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_O_UNCONNECTED(out_vec[6:3]),
    .NLW_gmux_gm_4_gms_ms_CARRY4_S_UNCONNECTED(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h03a;
    stim[1] = 9'h118;
    stim[2] = 9'h092;
    stim[3] = 9'h1e6;
    stim[4] = 9'h0e3;
    stim[5] = 9'h091;
    stim[6] = 9'h167;
    stim[7] = 9'h163;
    stim[8] = 9'h061;
    stim[9] = 9'h085;
    stim[10] = 9'h112;
    stim[11] = 9'h084;
    stim[12] = 9'h013;
    stim[13] = 9'h093;
    stim[14] = 9'h102;
    stim[15] = 9'h081;
    stim[16] = 9'h176;
    stim[17] = 9'h1a1;
    stim[18] = 9'h032;
    stim[19] = 9'h1c2;
    stim[20] = 9'h1c7;
    stim[21] = 9'h124;
    stim[22] = 9'h095;
    stim[23] = 9'h012;
    stim[24] = 9'h0e5;
    stim[25] = 9'h1d0;
    stim[26] = 9'h123;
    stim[27] = 9'h007;
    stim[28] = 9'h1a3;
    stim[29] = 9'h1a1;
    stim[30] = 9'h011;
    stim[31] = 9'h034;
    stim[32] = 9'h173;
    stim[33] = 9'h1a4;
    stim[34] = 9'h0a4;
    stim[35] = 9'h070;
    stim[36] = 9'h1c7;
    stim[37] = 9'h143;
    stim[38] = 9'h1e3;
    stim[39] = 9'h003;
    stim[40] = 9'h182;
    stim[41] = 9'h0b4;
    stim[42] = 9'h1c7;
    stim[43] = 9'h141;
    stim[44] = 9'h1b7;
    stim[45] = 9'h163;
    stim[46] = 9'h124;
    stim[47] = 9'h1ab;
    stim[48] = 9'h1d6;
    stim[49] = 9'h087;
    stim[50] = 9'h1a7;
    stim[51] = 9'h1f0;
    stim[52] = 9'h034;
    stim[53] = 9'h120;
    stim[54] = 9'h1c2;
    stim[55] = 9'h136;
    stim[56] = 9'h181;
    stim[57] = 9'h0a5;
    stim[58] = 9'h042;
    stim[59] = 9'h1c7;
    stim[60] = 9'h0f1;
    stim[61] = 9'h161;
    stim[62] = 9'h1f4;
    stim[63] = 9'h155;
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
      expv[0] = 23'hxx0000;
      expv[1] = 23'hxx0000;
      expv[2] = 23'hxx0000;
      expv[3] = 23'hxx0000;
      expv[4] = 23'hxx0000;
      expv[5] = 23'hxx0000;
      expv[6] = 23'hxx0000;
      expv[7] = 23'hxx0000;
      expv[8] = 23'hxx0000;
      expv[9] = 23'hxx0000;
      expv[10] = 23'hxx0000;
      expv[11] = 23'hxx0000;
      expv[12] = 23'hxx0000;
      expv[13] = 23'hxx0000;
      expv[14] = 23'hxx0000;
      expv[15] = 23'hxx0000;
      expv[16] = 23'hxx0000;
      expv[17] = 23'hxx0000;
      expv[18] = 23'hxx0000;
      expv[19] = 23'hxx0000;
      expv[20] = 23'hxx0000;
      expv[21] = 23'hxx0000;
      expv[22] = 23'hxx0000;
      expv[23] = 23'hxx0000;
      expv[24] = 23'hxx0000;
      expv[25] = 23'hxx0000;
      expv[26] = 23'hxx0000;
      expv[27] = 23'hxx0000;
      expv[28] = 23'hxx0000;
      expv[29] = 23'hxx0000;
      expv[30] = 23'hxx0000;
      expv[31] = 23'hxx0000;
      expv[32] = 23'hxx0000;
      expv[33] = 23'hxx0000;
      expv[34] = 23'hxx0000;
      expv[35] = 23'hxx0000;
      expv[36] = 23'hxx0000;
      expv[37] = 23'hxx0000;
      expv[38] = 23'hxx0000;
      expv[39] = 23'hxx0000;
      expv[40] = 23'hxx0000;
      expv[41] = 23'hxx0000;
      expv[42] = 23'hxx0000;
      expv[43] = 23'hxx0000;
      expv[44] = 23'hxx0000;
      expv[45] = 23'hxx0000;
      expv[46] = 23'hxx0000;
      expv[47] = 23'hxx0000;
      expv[48] = 23'hxx0000;
      expv[49] = 23'hxx0000;
      expv[50] = 23'hxx0000;
      expv[51] = 23'hxx0000;
      expv[52] = 23'hxx0000;
      expv[53] = 23'hxx0000;
      expv[54] = 23'hxx0000;
      expv[55] = 23'hxx0000;
      expv[56] = 23'hxx0000;
      expv[57] = 23'hxx0000;
      expv[58] = 23'hxx0000;
      expv[59] = 23'hxx0000;
      expv[60] = 23'hxx0000;
      expv[61] = 23'hxx0000;
      expv[62] = 23'hxx0000;
      expv[63] = 23'hxx0000;
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
