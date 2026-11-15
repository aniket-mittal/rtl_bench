// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09108 dut (
    .clk(clk),
    .RsRx(in_vec[11:11]),
    .sw(in_vec[10:3]),
    .btnS(in_vec[2:2]),
    .btnR(in_vec[1:1]),
    .btn1(in_vec[0:0]),
    .RsTx(out_vec[8:8]),
    .led(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'ha72;
    stim[1] = 12'h202;
    stim[2] = 12'h810;
    stim[3] = 12'h14c;
    stim[4] = 12'h59c;
    stim[5] = 12'hd5e;
    stim[6] = 12'hdb1;
    stim[7] = 12'h4c0;
    stim[8] = 12'h3fc;
    stim[9] = 12'hb44;
    stim[10] = 12'hefd;
    stim[11] = 12'h158;
    stim[12] = 12'h479;
    stim[13] = 12'hf8c;
    stim[14] = 12'h490;
    stim[15] = 12'h797;
    stim[16] = 12'h2f8;
    stim[17] = 12'h574;
    stim[18] = 12'hccd;
    stim[19] = 12'hbbc;
    stim[20] = 12'h0ad;
    stim[21] = 12'h560;
    stim[22] = 12'h0cc;
    stim[23] = 12'he7d;
    stim[24] = 12'hcb1;
    stim[25] = 12'h024;
    stim[26] = 12'hc05;
    stim[27] = 12'h829;
    stim[28] = 12'h839;
    stim[29] = 12'h705;
    stim[30] = 12'h329;
    stim[31] = 12'h178;
    stim[32] = 12'h0fd;
    stim[33] = 12'h380;
    stim[34] = 12'hc5c;
    stim[35] = 12'hb25;
    stim[36] = 12'h380;
    stim[37] = 12'he34;
    stim[38] = 12'hee0;
    stim[39] = 12'hdac;
    stim[40] = 12'h6e5;
    stim[41] = 12'h2f4;
    stim[42] = 12'h26d;
    stim[43] = 12'h0c1;
    stim[44] = 12'h678;
    stim[45] = 12'hd40;
    stim[46] = 12'h809;
    stim[47] = 12'h231;
    stim[48] = 12'h300;
    stim[49] = 12'h6f5;
    stim[50] = 12'he64;
    stim[51] = 12'h5bc;
    stim[52] = 12'h660;
    stim[53] = 12'h810;
    stim[54] = 12'h748;
    stim[55] = 12'h040;
    stim[56] = 12'h910;
    stim[57] = 12'haa0;
    stim[58] = 12'h7f0;
    stim[59] = 12'h324;
    stim[60] = 12'hc70;
    stim[61] = 12'h384;
    stim[62] = 12'h280;
    stim[63] = 12'he35;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hx00;
      expv[2] = 9'hx00;
      expv[3] = 9'hx00;
      expv[4] = 9'hx00;
      expv[5] = 9'hx00;
      expv[6] = 9'hx00;
      expv[7] = 9'hx00;
      expv[8] = 9'hx00;
      expv[9] = 9'hx00;
      expv[10] = 9'hx00;
      expv[11] = 9'hx00;
      expv[12] = 9'hx00;
      expv[13] = 9'hx00;
      expv[14] = 9'hx00;
      expv[15] = 9'hx00;
      expv[16] = 9'hx00;
      expv[17] = 9'hx00;
      expv[18] = 9'hx00;
      expv[19] = 9'hx00;
      expv[20] = 9'hx00;
      expv[21] = 9'hx00;
      expv[22] = 9'hx00;
      expv[23] = 9'hx00;
      expv[24] = 9'hx00;
      expv[25] = 9'hx00;
      expv[26] = 9'hx00;
      expv[27] = 9'hx00;
      expv[28] = 9'hx00;
      expv[29] = 9'hx00;
      expv[30] = 9'hx00;
      expv[31] = 9'hx00;
      expv[32] = 9'hx00;
      expv[33] = 9'hx00;
      expv[34] = 9'hx00;
      expv[35] = 9'hx00;
      expv[36] = 9'hx00;
      expv[37] = 9'hx00;
      expv[38] = 9'hx00;
      expv[39] = 9'hx00;
      expv[40] = 9'hx00;
      expv[41] = 9'hx00;
      expv[42] = 9'hx00;
      expv[43] = 9'hx00;
      expv[44] = 9'hx00;
      expv[45] = 9'hx00;
      expv[46] = 9'hx00;
      expv[47] = 9'hx00;
      expv[48] = 9'hx00;
      expv[49] = 9'hx00;
      expv[50] = 9'hx00;
      expv[51] = 9'hx00;
      expv[52] = 9'hx00;
      expv[53] = 9'hx00;
      expv[54] = 9'hx00;
      expv[55] = 9'hx00;
      expv[56] = 9'hx00;
      expv[57] = 9'hx00;
      expv[58] = 9'hx00;
      expv[59] = 9'hx00;
      expv[60] = 9'hx00;
      expv[61] = 9'hx00;
      expv[62] = 9'hx00;
      expv[63] = 9'hx00;
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
