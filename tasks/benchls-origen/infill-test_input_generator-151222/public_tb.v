// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151222 dut (
    .clk(clk),
    .data_in0_estr(in_vec[13:8]),
    .data_in1_estr(in_vec[7:2]),
    .valid_in0_estr(in_vec[1:1]),
    .valid_in1_estr(in_vec[0:0]),
    .data_in0(out_vec[15:10]),
    .data_in1(out_vec[9:4]),
    .valid_in0(out_vec[3:3]),
    .valid_in1(out_vec[2:2]),
    .selector(out_vec[1:1]),
    .reset_L(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3939;
    stim[1] = 14'h0857;
    stim[2] = 14'h0f57;
    stim[3] = 14'h0885;
    stim[4] = 14'h07f3;
    stim[5] = 14'h2376;
    stim[6] = 14'h0094;
    stim[7] = 14'h2884;
    stim[8] = 14'h3db1;
    stim[9] = 14'h1d9a;
    stim[10] = 14'h1866;
    stim[11] = 14'h3ffd;
    stim[12] = 14'h3362;
    stim[13] = 14'h30f8;
    stim[14] = 14'h0a05;
    stim[15] = 14'h3f41;
    stim[16] = 14'h0572;
    stim[17] = 14'h1121;
    stim[18] = 14'h1fb9;
    stim[19] = 14'h0abd;
    stim[20] = 14'h2caa;
    stim[21] = 14'h2a8d;
    stim[22] = 14'h3406;
    stim[23] = 14'h32e7;
    stim[24] = 14'h321d;
    stim[25] = 14'h1435;
    stim[26] = 14'h2039;
    stim[27] = 14'h18d3;
    stim[28] = 14'h3577;
    stim[29] = 14'h151f;
    stim[30] = 14'h2a04;
    stim[31] = 14'h3575;
    stim[32] = 14'h099e;
    stim[33] = 14'h2a6b;
    stim[34] = 14'h306e;
    stim[35] = 14'h34e6;
    stim[36] = 14'h3cd8;
    stim[37] = 14'h0799;
    stim[38] = 14'h1a36;
    stim[39] = 14'h299c;
    stim[40] = 14'h1bc0;
    stim[41] = 14'h0486;
    stim[42] = 14'h331a;
    stim[43] = 14'h03f5;
    stim[44] = 14'h1c15;
    stim[45] = 14'h110f;
    stim[46] = 14'h1847;
    stim[47] = 14'h08a0;
    stim[48] = 14'h00ae;
    stim[49] = 14'h2879;
    stim[50] = 14'h2926;
    stim[51] = 14'h3254;
    stim[52] = 14'h19d7;
    stim[53] = 14'h0a31;
    stim[54] = 14'h016f;
    stim[55] = 14'h1f36;
    stim[56] = 14'h21a2;
    stim[57] = 14'h2eb9;
    stim[58] = 14'h2708;
    stim[59] = 14'h1361;
    stim[60] = 14'h0338;
    stim[61] = 14'h2a4b;
    stim[62] = 14'h0763;
    stim[63] = 14'h179e;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h3153;
      expv[2] = 16'h89fd;
      expv[3] = 16'h0c2d;
      expv[4] = 16'h315f;
      expv[5] = 16'h0c2d;
      expv[6] = 16'h315f;
      expv[7] = 16'h0c2d;
      expv[8] = 16'h315f;
      expv[9] = 16'h0c2d;
      expv[10] = 16'h315f;
      expv[11] = 16'h0c2d;
      expv[12] = 16'h315f;
      expv[13] = 16'h0c2d;
      expv[14] = 16'h315f;
      expv[15] = 16'h0c2d;
      expv[16] = 16'h315f;
      expv[17] = 16'h0c2d;
      expv[18] = 16'h315f;
      expv[19] = 16'h0c2d;
      expv[20] = 16'h315f;
      expv[21] = 16'h0c2d;
      expv[22] = 16'h315f;
      expv[23] = 16'h0c2d;
      expv[24] = 16'h315f;
      expv[25] = 16'h0c2d;
      expv[26] = 16'h315f;
      expv[27] = 16'h0c2d;
      expv[28] = 16'h315f;
      expv[29] = 16'h0c2d;
      expv[30] = 16'h315f;
      expv[31] = 16'h0c2d;
      expv[32] = 16'h315f;
      expv[33] = 16'h0c2d;
      expv[34] = 16'h315f;
      expv[35] = 16'h0c2d;
      expv[36] = 16'h315f;
      expv[37] = 16'h0c2d;
      expv[38] = 16'h315f;
      expv[39] = 16'h0c2d;
      expv[40] = 16'h315f;
      expv[41] = 16'h0c2d;
      expv[42] = 16'h315f;
      expv[43] = 16'h0c2d;
      expv[44] = 16'h315f;
      expv[45] = 16'h0c2d;
      expv[46] = 16'h315f;
      expv[47] = 16'h0c2d;
      expv[48] = 16'h315f;
      expv[49] = 16'h0c2d;
      expv[50] = 16'h315f;
      expv[51] = 16'h0c2d;
      expv[52] = 16'h315f;
      expv[53] = 16'h0c2d;
      expv[54] = 16'h315f;
      expv[55] = 16'h0c2d;
      expv[56] = 16'h315f;
      expv[57] = 16'h0c2d;
      expv[58] = 16'h315f;
      expv[59] = 16'h0c2d;
      expv[60] = 16'h315f;
      expv[61] = 16'h0c2d;
      expv[62] = 16'h315f;
      expv[63] = 16'h0c2d;
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
