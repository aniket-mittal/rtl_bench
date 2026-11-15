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

  rtlpp_04928 dut (
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
    stim[0] = 18'h152da;
    stim[1] = 18'h22b34;
    stim[2] = 18'h1acf1;
    stim[3] = 18'h2ef8d;
    stim[4] = 18'h22289;
    stim[5] = 18'h00aa1;
    stim[6] = 18'h0a3ef;
    stim[7] = 18'h01657;
    stim[8] = 18'h1f6cf;
    stim[9] = 18'h2bfc1;
    stim[10] = 18'h16a5f;
    stim[11] = 18'h0a135;
    stim[12] = 18'h0844f;
    stim[13] = 18'h0af91;
    stim[14] = 18'h2c601;
    stim[15] = 18'h21337;
    stim[16] = 18'h10329;
    stim[17] = 18'h39be9;
    stim[18] = 18'h321b1;
    stim[19] = 18'h24e77;
    stim[20] = 18'h15775;
    stim[21] = 18'h123eb;
    stim[22] = 18'h1fee5;
    stim[23] = 18'h01e53;
    stim[24] = 18'h06e3d;
    stim[25] = 18'h318c3;
    stim[26] = 18'h01c97;
    stim[27] = 18'h0111d;
    stim[28] = 18'h0da09;
    stim[29] = 18'h0ed90;
    stim[30] = 18'h35909;
    stim[31] = 18'h14911;
    stim[32] = 18'h06177;
    stim[33] = 18'h1d953;
    stim[34] = 18'h14a59;
    stim[35] = 18'h3241d;
    stim[36] = 18'h11e23;
    stim[37] = 18'h1b69d;
    stim[38] = 18'h1a2fd;
    stim[39] = 18'h3f781;
    stim[40] = 18'h158cf;
    stim[41] = 18'h30943;
    stim[42] = 18'h3686f;
    stim[43] = 18'h3620b;
    stim[44] = 18'h02607;
    stim[45] = 18'h1930b;
    stim[46] = 18'h02fe3;
    stim[47] = 18'h3ce65;
    stim[48] = 18'h26391;
    stim[49] = 18'h2c165;
    stim[50] = 18'h26bb7;
    stim[51] = 18'h39867;
    stim[52] = 18'h1229d;
    stim[53] = 18'h0ecd3;
    stim[54] = 18'h0d119;
    stim[55] = 18'h0c127;
    stim[56] = 18'h1d97a;
    stim[57] = 18'h00055;
    stim[58] = 18'h319bd;
    stim[59] = 18'h3cbea;
    stim[60] = 18'h19cb7;
    stim[61] = 18'h0353d;
    stim[62] = 18'h161ad;
    stim[63] = 18'h291e9;
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
      expv[1] = 24'hxf1xff;
      expv[2] = 24'hxf1xff;
      expv[3] = 24'hxf1xff;
      expv[4] = 24'hxf1xff;
      expv[5] = 24'hff1xff;
      expv[6] = 24'hxf1xff;
      expv[7] = 24'hxx0xff;
      expv[8] = 24'hxx0xff;
      expv[9] = 24'hxx0xff;
      expv[10] = 24'hxf1xff;
      expv[11] = 24'hxf1xff;
      expv[12] = 24'hxf1xff;
      expv[13] = 24'hxf1xff;
      expv[14] = 24'hxf1xff;
      expv[15] = 24'hxf0xff;
      expv[16] = 24'hxf1xff;
      expv[17] = 24'hx20xff;
      expv[18] = 24'hxf1eff;
      expv[19] = 24'hxf1eff;
      expv[20] = 24'hx40eff;
      expv[21] = 24'hxf1eff;
      expv[22] = 24'hx80eff;
      expv[23] = 24'hc80eff;
      expv[24] = 24'h7f1bff;
      expv[25] = 24'hc80bff;
      expv[26] = 24'hc80bff;
      expv[27] = 24'hc80bff;
      expv[28] = 24'h480bff;
      expv[29] = 24'hff17ff;
      expv[30] = 24'h4807ff;
      expv[31] = 24'hff17ff;
      expv[32] = 24'hff17ff;
      expv[33] = 24'h4807ff;
      expv[34] = 24'hff17ff;
      expv[35] = 24'h7f17ff;
      expv[36] = 24'h8f07ff;
      expv[37] = 24'h8f07ff;
      expv[38] = 24'hff1dff;
      expv[39] = 24'h480dff;
      expv[40] = 24'hc80dff;
      expv[41] = 24'hff17ff;
      expv[42] = 24'hff17ff;
      expv[43] = 24'hff17ff;
      expv[44] = 24'hff17ff;
      expv[45] = 24'h0407ff;
      expv[46] = 24'hff17ff;
      expv[47] = 24'h7f17ff;
      expv[48] = 24'h7f17ff;
      expv[49] = 24'h7f17ff;
      expv[50] = 24'h7f17ff;
      expv[51] = 24'h1207ff;
      expv[52] = 24'hff1bff;
      expv[53] = 24'hff1bff;
      expv[54] = 24'ha40bff;
      expv[55] = 24'hff1eff;
      expv[56] = 24'hc80eff;
      expv[57] = 24'hff1dff;
      expv[58] = 24'h240dff;
      expv[59] = 24'h7f1bff;
      expv[60] = 24'hc80bff;
      expv[61] = 24'hc80bff;
      expv[62] = 24'h7f1bff;
      expv[63] = 24'hc80bff;
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
