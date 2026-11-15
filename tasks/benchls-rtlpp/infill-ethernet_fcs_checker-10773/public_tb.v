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

  rtlpp_10773 dut (
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
    stim[0] = 13'h1e8e;
    stim[1] = 13'h109d;
    stim[2] = 13'h0d1e;
    stim[3] = 13'h04b3;
    stim[4] = 13'h0c8f;
    stim[5] = 13'h0eab;
    stim[6] = 13'h0ca4;
    stim[7] = 13'h000a;
    stim[8] = 13'h0584;
    stim[9] = 13'h095e;
    stim[10] = 13'h0681;
    stim[11] = 13'h0b76;
    stim[12] = 13'h0b00;
    stim[13] = 13'h093a;
    stim[14] = 13'h013d;
    stim[15] = 13'h051c;
    stim[16] = 13'h0eb9;
    stim[17] = 13'h0c17;
    stim[18] = 13'h0493;
    stim[19] = 13'h076e;
    stim[20] = 13'h0024;
    stim[21] = 13'h193f;
    stim[22] = 13'h0719;
    stim[23] = 13'h0767;
    stim[24] = 13'h0a14;
    stim[25] = 13'h05ec;
    stim[26] = 13'h0d91;
    stim[27] = 13'h0c16;
    stim[28] = 13'h0144;
    stim[29] = 13'h05ab;
    stim[30] = 13'h004b;
    stim[31] = 13'h086c;
    stim[32] = 13'h031a;
    stim[33] = 13'h020e;
    stim[34] = 13'h05b8;
    stim[35] = 13'h0c7a;
    stim[36] = 13'h0d8a;
    stim[37] = 13'h07ce;
    stim[38] = 13'h0a45;
    stim[39] = 13'h052f;
    stim[40] = 13'h0b5c;
    stim[41] = 13'h0644;
    stim[42] = 13'h0bed;
    stim[43] = 13'h083b;
    stim[44] = 13'h0b03;
    stim[45] = 13'h0509;
    stim[46] = 13'h02fb;
    stim[47] = 13'h0d8d;
    stim[48] = 13'h0d70;
    stim[49] = 13'h0851;
    stim[50] = 13'h0c92;
    stim[51] = 13'h018a;
    stim[52] = 13'h0da0;
    stim[53] = 13'h0fb2;
    stim[54] = 13'h097e;
    stim[55] = 13'h0770;
    stim[56] = 13'h0248;
    stim[57] = 13'h0841;
    stim[58] = 13'h0675;
    stim[59] = 13'h0c11;
    stim[60] = 13'h069a;
    stim[61] = 13'h0ae7;
    stim[62] = 13'h025a;
    stim[63] = 13'h0e54;
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
      expv[11] = 14'h3900;
      expv[12] = 14'h3900;
      expv[13] = 14'h3900;
      expv[14] = 14'h3912;
      expv[15] = 14'h3d5d;
      expv[16] = 14'h3d5c;
      expv[17] = 14'h32a0;
      expv[18] = 14'h3260;
      expv[19] = 14'h3260;
      expv[20] = 14'h3260;
      expv[21] = 14'h2260;
      expv[22] = 14'h0260;
      expv[23] = 14'h2000;
      expv[24] = 14'h2a20;
      expv[25] = 14'h2a20;
      expv[26] = 14'h2a20;
      expv[27] = 14'h3d60;
      expv[28] = 14'h3d60;
      expv[29] = 14'h3d60;
      expv[30] = 14'h3d60;
      expv[31] = 14'h2ec0;
      expv[32] = 14'h3260;
      expv[33] = 14'h2bd2;
      expv[34] = 14'h0bd1;
      expv[35] = 14'h0bd0;
      expv[36] = 14'h0bd0;
      expv[37] = 14'h0bd0;
      expv[38] = 14'h0bd0;
      expv[39] = 14'h2b5c;
      expv[40] = 14'h2080;
      expv[41] = 14'h30c0;
      expv[42] = 14'h2620;
      expv[43] = 14'h2620;
      expv[44] = 14'h2400;
      expv[45] = 14'h2a40;
      expv[46] = 14'h2a52;
      expv[47] = 14'h36b2;
      expv[48] = 14'h37dd;
      expv[49] = 14'h37dc;
      expv[50] = 14'h3060;
      expv[51] = 14'h3060;
      expv[52] = 14'h3060;
      expv[53] = 14'h2a00;
      expv[54] = 14'h2a00;
      expv[55] = 14'h2a00;
      expv[56] = 14'h25e0;
      expv[57] = 14'h25e0;
      expv[58] = 14'h3b00;
      expv[59] = 14'h3b00;
      expv[60] = 14'h3b00;
      expv[61] = 14'h3b00;
      expv[62] = 14'h2300;
      expv[63] = 14'h2312;
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
