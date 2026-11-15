// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024099 dut (
    .cp0_iu_cache_inv_done(in_vec[12:12]),
    .ctrl_special_ex_data_sel(in_vec[11:11]),
    .ctrl_special_ex_sel(in_vec[10:10]),
    .ctrl_special_expt_vec(in_vec[9:5]),
    .ctrl_special_expt_vld(in_vec[4:4]),
    .decd_special_fencei(in_vec[3:3]),
    .decd_special_icall(in_vec[2:2]),
    .decd_special_icpa(in_vec[1:1]),
    .wb_special_st_uncmplt(in_vec[0:0]),
    .special_ctrl_stall(out_vec[11:11]),
    .special_ctrl_stall_noinput(out_vec[10:10]),
    .special_pcgen_chgflw_vld(out_vec[9:9]),
    .special_rbus_expt_vec(out_vec[8:4]),
    .special_rbus_expt_vld(out_vec[3:3]),
    .special_rbus_flush(out_vec[2:2]),
    .special_rbus_req(out_vec[1:1]),
    .special_retire_inst_wsc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0a2d;
    stim[1] = 13'h127f;
    stim[2] = 13'h0efd;
    stim[3] = 13'h05a8;
    stim[4] = 13'h15d0;
    stim[5] = 13'h1a03;
    stim[6] = 13'h1fbe;
    stim[7] = 13'h1f70;
    stim[8] = 13'h043f;
    stim[9] = 13'h051d;
    stim[10] = 13'h0e9c;
    stim[11] = 13'h05d3;
    stim[12] = 13'h0cac;
    stim[13] = 13'h0a75;
    stim[14] = 13'h0b4d;
    stim[15] = 13'h0b3a;
    stim[16] = 13'h0ef8;
    stim[17] = 13'h0545;
    stim[18] = 13'h11a2;
    stim[19] = 13'h1c1b;
    stim[20] = 13'h0c40;
    stim[21] = 13'h0e2a;
    stim[22] = 13'h1e26;
    stim[23] = 13'h1a3e;
    stim[24] = 13'h022c;
    stim[25] = 13'h13d2;
    stim[26] = 13'h137d;
    stim[27] = 13'h162f;
    stim[28] = 13'h0f1b;
    stim[29] = 13'h19d5;
    stim[30] = 13'h1e12;
    stim[31] = 13'h06b7;
    stim[32] = 13'h1799;
    stim[33] = 13'h1363;
    stim[34] = 13'h07ef;
    stim[35] = 13'h1dc9;
    stim[36] = 13'h17e4;
    stim[37] = 13'h1cad;
    stim[38] = 13'h18e7;
    stim[39] = 13'h0344;
    stim[40] = 13'h0d7d;
    stim[41] = 13'h15d9;
    stim[42] = 13'h139c;
    stim[43] = 13'h1331;
    stim[44] = 13'h1f3f;
    stim[45] = 13'h12d1;
    stim[46] = 13'h0e2b;
    stim[47] = 13'h1ec1;
    stim[48] = 13'h0ecb;
    stim[49] = 13'h06f6;
    stim[50] = 13'h1329;
    stim[51] = 13'h098d;
    stim[52] = 13'h1c21;
    stim[53] = 13'h1688;
    stim[54] = 13'h1517;
    stim[55] = 13'h1f58;
    stim[56] = 13'h1e6d;
    stim[57] = 13'h0fd5;
    stim[58] = 13'h018f;
    stim[59] = 13'h0391;
    stim[60] = 13'h0f5d;
    stim[61] = 13'h06d6;
    stim[62] = 13'h0c2a;
    stim[63] = 13'h144f;
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
      expv[0] = 12'hd10;
      expv[1] = 12'h130;
      expv[2] = 12'hd78;
      expv[3] = 12'h0d0;
      expv[4] = 12'h0ea;
      expv[5] = 12'hd00;
      expv[6] = 12'h7de;
      expv[7] = 12'h1ba;
      expv[8] = 12'h018;
      expv[9] = 12'h088;
      expv[10] = 12'hd48;
      expv[11] = 12'h0e8;
      expv[12] = 12'hc50;
      expv[13] = 12'hd30;
      expv[14] = 12'hda0;
      expv[15] = 12'hd90;
      expv[16] = 12'hd78;
      expv[17] = 12'h0a0;
      expv[18] = 12'h0d0;
      expv[19] = 12'hc08;
      expv[20] = 12'h022;
      expv[21] = 12'hd10;
      expv[22] = 12'h716;
      expv[23] = 12'h510;
      expv[24] = 12'h110;
      expv[25] = 12'h1e0;
      expv[26] = 12'h1b0;
      expv[27] = 12'h110;
      expv[28] = 12'hd88;
      expv[29] = 12'hce0;
      expv[30] = 12'h70e;
      expv[31] = 12'h158;
      expv[32] = 12'h1c8;
      expv[33] = 12'h1b0;
      expv[34] = 12'h1f0;
      expv[35] = 12'hce0;
      expv[36] = 12'h3f6;
      expv[37] = 12'hc50;
      expv[38] = 12'hc70;
      expv[39] = 12'h1a0;
      expv[40] = 12'hcb8;
      expv[41] = 12'h0e8;
      expv[42] = 12'h1c0;
      expv[43] = 12'h190;
      expv[44] = 12'hd98;
      expv[45] = 12'h160;
      expv[46] = 12'hd10;
      expv[47] = 12'h162;
      expv[48] = 12'hd60;
      expv[49] = 12'h178;
      expv[50] = 12'h190;
      expv[51] = 12'hcc0;
      expv[52] = 12'h012;
      expv[53] = 12'h346;
      expv[54] = 12'h088;
      expv[55] = 12'h7ae;
      expv[56] = 12'hd30;
      expv[57] = 12'hde8;
      expv[58] = 12'h0c0;
      expv[59] = 12'h1c0;
      expv[60] = 12'hda8;
      expv[61] = 12'h168;
      expv[62] = 12'hc10;
      expv[63] = 12'h020;
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
