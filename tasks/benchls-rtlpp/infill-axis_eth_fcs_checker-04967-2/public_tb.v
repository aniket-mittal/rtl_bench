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

  rtlpp_04967 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .input_axis_tdata(in_vec[11:4]),
    .input_axis_tvalid(in_vec[3:3]),
    .input_axis_tlast(in_vec[2:2]),
    .input_axis_tuser(in_vec[1:1]),
    .output_axis_tready(in_vec[0:0]),
    .input_axis_tready(out_vec[13:13]),
    .output_axis_tdata(out_vec[12:5]),
    .output_axis_tvalid(out_vec[4:4]),
    .output_axis_tlast(out_vec[3:3]),
    .output_axis_tuser(out_vec[2:2]),
    .busy(out_vec[1:1]),
    .error_bad_fcs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1370;
    stim[1] = 13'h1ce6;
    stim[2] = 13'h0f56;
    stim[3] = 13'h0fe0;
    stim[4] = 13'h0b0a;
    stim[5] = 13'h02c7;
    stim[6] = 13'h04fe;
    stim[7] = 13'h05b6;
    stim[8] = 13'h0596;
    stim[9] = 13'h04cb;
    stim[10] = 13'h076e;
    stim[11] = 13'h0c48;
    stim[12] = 13'h0a34;
    stim[13] = 13'h02b1;
    stim[14] = 13'h0ad9;
    stim[15] = 13'h0996;
    stim[16] = 13'h02cd;
    stim[17] = 13'h04c0;
    stim[18] = 13'h0e60;
    stim[19] = 13'h0df7;
    stim[20] = 13'h0b63;
    stim[21] = 13'h0da2;
    stim[22] = 13'h036c;
    stim[23] = 13'h028d;
    stim[24] = 13'h0dd3;
    stim[25] = 13'h0f60;
    stim[26] = 13'h03dd;
    stim[27] = 13'h0175;
    stim[28] = 13'h03a2;
    stim[29] = 13'h031e;
    stim[30] = 13'h070b;
    stim[31] = 13'h006b;
    stim[32] = 13'h02fe;
    stim[33] = 13'h09b6;
    stim[34] = 13'h05fa;
    stim[35] = 13'h06bf;
    stim[36] = 13'h003b;
    stim[37] = 13'h0b73;
    stim[38] = 13'h005d;
    stim[39] = 13'h03ff;
    stim[40] = 13'h0112;
    stim[41] = 13'h01cc;
    stim[42] = 13'h06a9;
    stim[43] = 13'h088e;
    stim[44] = 13'h0008;
    stim[45] = 13'h077c;
    stim[46] = 13'h07fb;
    stim[47] = 13'h0e37;
    stim[48] = 13'h060c;
    stim[49] = 13'h0f76;
    stim[50] = 13'h0ae9;
    stim[51] = 13'h0bf4;
    stim[52] = 13'h05c3;
    stim[53] = 13'h073a;
    stim[54] = 13'h0c53;
    stim[55] = 13'h002c;
    stim[56] = 13'h0e76;
    stim[57] = 13'h01bc;
    stim[58] = 13'h0519;
    stim[59] = 13'h050a;
    stim[60] = 13'h0b5d;
    stim[61] = 13'h0c42;
    stim[62] = 13'h00c7;
    stim[63] = 13'h0134;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h2000;
      expv[4] = 14'h2000;
      expv[5] = 14'h2000;
      expv[6] = 14'h2000;
      expv[7] = 14'h2000;
      expv[8] = 14'h2000;
      expv[9] = 14'h2000;
      expv[10] = 14'h2000;
      expv[11] = 14'h2000;
      expv[12] = 14'h3612;
      expv[13] = 14'h3612;
      expv[14] = 14'h29e2;
      expv[15] = 14'h29f2;
      expv[16] = 14'h29f2;
      expv[17] = 14'h299d;
      expv[18] = 14'h299c;
      expv[19] = 14'h299c;
      expv[20] = 14'h2ec0;
      expv[21] = 14'h2ec0;
      expv[22] = 14'h2ec0;
      expv[23] = 14'h2ec0;
      expv[24] = 14'h3880;
      expv[25] = 14'h35a0;
      expv[26] = 14'h35a0;
      expv[27] = 14'h35a0;
      expv[28] = 14'h2580;
      expv[29] = 14'h2580;
      expv[30] = 14'h2580;
      expv[31] = 14'h26d2;
      expv[32] = 14'h2512;
      expv[33] = 14'h0511;
      expv[34] = 14'h0510;
      expv[35] = 14'h0510;
      expv[36] = 14'h27bc;
      expv[37] = 14'h2620;
      expv[38] = 14'h2e00;
      expv[39] = 14'h2e00;
      expv[40] = 14'h20c0;
      expv[41] = 14'h25e0;
      expv[42] = 14'h25e0;
      expv[43] = 14'h2072;
      expv[44] = 14'h0071;
      expv[45] = 14'h0070;
      expv[46] = 14'h0070;
      expv[47] = 14'h20bc;
      expv[48] = 14'h27e0;
      expv[49] = 14'h27e0;
      expv[50] = 14'h2380;
      expv[51] = 14'h2380;
      expv[52] = 14'h2d40;
      expv[53] = 14'h2d40;
      expv[54] = 14'h2d40;
      expv[55] = 14'h3100;
      expv[56] = 14'h3100;
      expv[57] = 14'h2c00;
      expv[58] = 14'h2c1d;
      expv[59] = 14'h35c0;
      expv[60] = 14'h2e60;
      expv[61] = 14'h2040;
      expv[62] = 14'h2360;
      expv[63] = 14'h2360;
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
