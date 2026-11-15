// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04943 dut (
    .clk(clk),
    .ui_in(in_vec[17:10]),
    .uio_in(in_vec[9:2]),
    .ena(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .uo_out(out_vec[23:16]),
    .uio_out(out_vec[15:8]),
    .uio_oe(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h25292;
    stim[1] = 18'h11e78;
    stim[2] = 18'h08337;
    stim[3] = 18'h167e5;
    stim[4] = 18'h22e91;
    stim[5] = 18'h30d5d;
    stim[6] = 18'h01a8d;
    stim[7] = 18'h22799;
    stim[8] = 18'h3e24d;
    stim[9] = 18'h0055b;
    stim[10] = 18'h026ab;
    stim[11] = 18'h129ab;
    stim[12] = 18'h3e415;
    stim[13] = 18'h220b9;
    stim[14] = 18'h23523;
    stim[15] = 18'h07447;
    stim[16] = 18'h07e61;
    stim[17] = 18'h01bdd;
    stim[18] = 18'h2c6db;
    stim[19] = 18'h08dff;
    stim[20] = 18'h0fb01;
    stim[21] = 18'h13f19;
    stim[22] = 18'h2237f;
    stim[23] = 18'h24fcd;
    stim[24] = 18'h08893;
    stim[25] = 18'h01615;
    stim[26] = 18'h14ac7;
    stim[27] = 18'h20321;
    stim[28] = 18'h392c7;
    stim[29] = 18'h3d3d5;
    stim[30] = 18'h3f7cb;
    stim[31] = 18'h167d5;
    stim[32] = 18'h18d95;
    stim[33] = 18'h1e221;
    stim[34] = 18'h239f9;
    stim[35] = 18'h295ad;
    stim[36] = 18'h2331b;
    stim[37] = 18'h24ac7;
    stim[38] = 18'h004c5;
    stim[39] = 18'h1104d;
    stim[40] = 18'h0aaab;
    stim[41] = 18'h3137d;
    stim[42] = 18'h2cfa7;
    stim[43] = 18'h2e7ab;
    stim[44] = 18'h3ad7b;
    stim[45] = 18'h1d54d;
    stim[46] = 18'h1b9d3;
    stim[47] = 18'h1db8f;
    stim[48] = 18'h3908b;
    stim[49] = 18'h1d7e9;
    stim[50] = 18'h0406d;
    stim[51] = 18'h1c242;
    stim[52] = 18'h2bd51;
    stim[53] = 18'h2ccc1;
    stim[54] = 18'h39943;
    stim[55] = 18'h28b15;
    stim[56] = 18'h04bd1;
    stim[57] = 18'h09f8b;
    stim[58] = 18'h3f3e9;
    stim[59] = 18'h1a93b;
    stim[60] = 18'h18f3d;
    stim[61] = 18'h26045;
    stim[62] = 18'h035f1;
    stim[63] = 18'h00947;
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
      expv[0] = 24'hxx0xff;
      expv[1] = 24'hxx0xff;
      expv[2] = 24'hxf1xff;
      expv[3] = 24'hxf1xff;
      expv[4] = 24'hxf1xff;
      expv[5] = 24'hxf1xff;
      expv[6] = 24'hxx0xff;
      expv[7] = 24'hxf1xff;
      expv[8] = 24'hxf1xff;
      expv[9] = 24'hff1xff;
      expv[10] = 24'hff1xff;
      expv[11] = 24'hxf1xff;
      expv[12] = 24'hxf1xff;
      expv[13] = 24'hxf1xff;
      expv[14] = 24'hxx0xff;
      expv[15] = 24'hxx0xff;
      expv[16] = 24'hxx0xff;
      expv[17] = 24'hxx0xff;
      expv[18] = 24'hxf17ff;
      expv[19] = 24'hff17ff;
      expv[20] = 24'hx607ff;
      expv[21] = 24'hx607ff;
      expv[22] = 24'h7f1eff;
      expv[23] = 24'h7f1eff;
      expv[24] = 24'hff1eff;
      expv[25] = 24'hc80eff;
      expv[26] = 24'h7f1dff;
      expv[27] = 24'hff1dff;
      expv[28] = 24'h480dff;
      expv[29] = 24'h480dff;
      expv[30] = 24'h480dff;
      expv[31] = 24'hff17ff;
      expv[32] = 24'hff17ff;
      expv[33] = 24'hff17ff;
      expv[34] = 24'h0107ff;
      expv[35] = 24'h0107ff;
      expv[36] = 24'h0107ff;
      expv[37] = 24'hff1eff;
      expv[38] = 24'hff1eff;
      expv[39] = 24'h4c0eff;
      expv[40] = 24'hff1eff;
      expv[41] = 24'h800eff;
      expv[42] = 24'h7f1dff;
      expv[43] = 24'h7f1dff;
      expv[44] = 24'hff1dff;
      expv[45] = 24'h010dff;
      expv[46] = 24'h810dff;
      expv[47] = 24'h010dff;
      expv[48] = 24'h810dff;
      expv[49] = 24'h010dff;
      expv[50] = 24'h7f1eff;
      expv[51] = 24'h7f1eff;
      expv[52] = 24'hc80eff;
      expv[53] = 24'h7f1dff;
      expv[54] = 24'h840dff;
      expv[55] = 24'hff17ff;
      expv[56] = 24'h7f17ff;
      expv[57] = 24'h8607ff;
      expv[58] = 24'h0607ff;
      expv[59] = 24'hff1eff;
      expv[60] = 24'hff1eff;
      expv[61] = 24'h7f1eff;
      expv[62] = 24'hc80eff;
      expv[63] = 24'hff1dff;
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
