// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020377 dut (
    .cam_pclk(clk),
    .rst_n(in_vec[10:10]),
    .cam_vsync(in_vec[9:9]),
    .cam_href(in_vec[8:8]),
    .cam_data(in_vec[7:0]),
    .cmos_frame_vsync(out_vec[18:18]),
    .cmos_frame_href(out_vec[17:17]),
    .cmos_frame_valid(out_vec[16:16]),
    .cmos_frame_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h04e;
    stim[1] = 11'h042;
    stim[2] = 11'h7fe;
    stim[3] = 11'h46a;
    stim[4] = 11'h4f0;
    stim[5] = 11'h739;
    stim[6] = 11'h4b8;
    stim[7] = 11'h6e8;
    stim[8] = 11'h78c;
    stim[9] = 11'h798;
    stim[10] = 11'h4ce;
    stim[11] = 11'h451;
    stim[12] = 11'h7ed;
    stim[13] = 11'h6d3;
    stim[14] = 11'h4e5;
    stim[15] = 11'h4a5;
    stim[16] = 11'h6c1;
    stim[17] = 11'h7f2;
    stim[18] = 11'h684;
    stim[19] = 11'h693;
    stim[20] = 11'h514;
    stim[21] = 11'h564;
    stim[22] = 11'h77a;
    stim[23] = 11'h461;
    stim[24] = 11'h6c2;
    stim[25] = 11'h426;
    stim[26] = 11'h602;
    stim[27] = 11'h57d;
    stim[28] = 11'h6de;
    stim[29] = 11'h446;
    stim[30] = 11'h4b3;
    stim[31] = 11'h7e6;
    stim[32] = 11'h41c;
    stim[33] = 11'h641;
    stim[34] = 11'h448;
    stim[35] = 11'h750;
    stim[36] = 11'h681;
    stim[37] = 11'h4fa;
    stim[38] = 11'h66e;
    stim[39] = 11'h670;
    stim[40] = 11'h48f;
    stim[41] = 11'h72d;
    stim[42] = 11'h4f1;
    stim[43] = 11'h7e8;
    stim[44] = 11'h53b;
    stim[45] = 11'h577;
    stim[46] = 11'h6b8;
    stim[47] = 11'h4c5;
    stim[48] = 11'h5b6;
    stim[49] = 11'h6e9;
    stim[50] = 11'h6cf;
    stim[51] = 11'h670;
    stim[52] = 11'h4f1;
    stim[53] = 11'h772;
    stim[54] = 11'h4db;
    stim[55] = 11'h71e;
    stim[56] = 11'h718;
    stim[57] = 11'h48a;
    stim[58] = 11'h776;
    stim[59] = 11'h516;
    stim[60] = 11'h615;
    stim[61] = 11'h599;
    stim[62] = 11'h5ba;
    stim[63] = 11'h46f;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h41464;
      expv[36] = 19'h01464;
      expv[37] = 19'h71464;
      expv[38] = 19'h41464;
      expv[39] = 19'h01464;
      expv[40] = 19'h41464;
      expv[41] = 19'h41464;
      expv[42] = 19'h01464;
      expv[43] = 19'h71464;
      expv[44] = 19'h01464;
      expv[45] = 19'h7e83b;
      expv[46] = 19'h2e83b;
      expv[47] = 19'h3e83b;
      expv[48] = 19'h4e83b;
      expv[49] = 19'h0e83b;
      expv[50] = 19'h3e83b;
      expv[51] = 19'h4e83b;
      expv[52] = 19'h4e83b;
      expv[53] = 19'h4e83b;
      expv[54] = 19'h0e83b;
      expv[55] = 19'h7e83b;
      expv[56] = 19'h0e83b;
      expv[57] = 19'h71e18;
      expv[58] = 19'h61e18;
      expv[59] = 19'h01e18;
      expv[60] = 19'h77616;
      expv[61] = 19'h27616;
      expv[62] = 19'h47616;
      expv[63] = 19'h399ba;
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
