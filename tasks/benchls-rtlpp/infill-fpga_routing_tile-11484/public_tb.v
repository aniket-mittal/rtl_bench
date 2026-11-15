// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11484 dut (
    .clk(clk),
    .pReset(in_vec[17:17]),
    .prog_clk(in_vec[16:16]),
    .set(in_vec[15:15]),
    .reset(in_vec[14:14]),
    .top_width_0_height_0_subtile_0__pin_I_0_(in_vec[13:13]),
    .top_width_0_height_0_subtile_0__pin_I_4_(in_vec[12:12]),
    .top_width_0_height_0_subtile_0__pin_I_8_(in_vec[11:11]),
    .top_width_0_height_0_subtile_0__pin_clk_0_(in_vec[10:10]),
    .right_width_0_height_0_subtile_0__pin_I_1_(in_vec[9:9]),
    .right_width_0_height_0_subtile_0__pin_I_5_(in_vec[8:8]),
    .right_width_0_height_0_subtile_0__pin_I_9_(in_vec[7:7]),
    .bottom_width_0_height_0_subtile_0__pin_I_2_(in_vec[6:6]),
    .bottom_width_0_height_0_subtile_0__pin_I_6_(in_vec[5:5]),
    .bottom_width_0_height_0_subtile_0__pin_I_10_(in_vec[4:4]),
    .left_width_0_height_0_subtile_0__pin_I_3_(in_vec[3:3]),
    .left_width_0_height_0_subtile_0__pin_I_7_(in_vec[2:2]),
    .left_width_0_height_0_subtile_0__pin_I_11_(in_vec[1:1]),
    .ccff_head(in_vec[0:0]),
    .top_width_0_height_0_subtile_0__pin_O_0_(out_vec[8:8]),
    .top_width_0_height_0_subtile_0__pin_O_4_(out_vec[7:7]),
    .right_width_0_height_0_subtile_0__pin_O_1_(out_vec[6:6]),
    .right_width_0_height_0_subtile_0__pin_O_5_(out_vec[5:5]),
    .bottom_width_0_height_0_subtile_0__pin_O_2_(out_vec[4:4]),
    .bottom_width_0_height_0_subtile_0__pin_O_6_(out_vec[3:3]),
    .left_width_0_height_0_subtile_0__pin_O_3_(out_vec[2:2]),
    .left_width_0_height_0_subtile_0__pin_O_7_(out_vec[1:1]),
    .ccff_tail(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h04cf5;
    stim[1] = 18'h0423b;
    stim[2] = 18'h181b8;
    stim[3] = 18'h19213;
    stim[4] = 18'h332fc;
    stim[5] = 18'h19dd3;
    stim[6] = 18'h1bbbe;
    stim[7] = 18'h1a5be;
    stim[8] = 18'h3beaf;
    stim[9] = 18'h210fd;
    stim[10] = 18'h38b9e;
    stim[11] = 18'h3382f;
    stim[12] = 18'h1885d;
    stim[13] = 18'h23ea8;
    stim[14] = 18'h2a3f8;
    stim[15] = 18'h01043;
    stim[16] = 18'h1192c;
    stim[17] = 18'h23889;
    stim[18] = 18'h10d66;
    stim[19] = 18'h0ad3b;
    stim[20] = 18'h1a4e1;
    stim[21] = 18'h2b705;
    stim[22] = 18'h19a76;
    stim[23] = 18'h02b51;
    stim[24] = 18'h0943e;
    stim[25] = 18'h115c9;
    stim[26] = 18'h2ae62;
    stim[27] = 18'h00821;
    stim[28] = 18'h0343a;
    stim[29] = 18'h18c18;
    stim[30] = 18'h1084c;
    stim[31] = 18'h0068c;
    stim[32] = 18'h306cc;
    stim[33] = 18'h28631;
    stim[34] = 18'h2b61d;
    stim[35] = 18'h30ced;
    stim[36] = 18'h23fb1;
    stim[37] = 18'h1baa3;
    stim[38] = 18'h090fc;
    stim[39] = 18'h124ee;
    stim[40] = 18'h1bc99;
    stim[41] = 18'h13d4e;
    stim[42] = 18'h3b83b;
    stim[43] = 18'h290b1;
    stim[44] = 18'h1bd9e;
    stim[45] = 18'h29fca;
    stim[46] = 18'h225f0;
    stim[47] = 18'h206c7;
    stim[48] = 18'h198f6;
    stim[49] = 18'h095d5;
    stim[50] = 18'h03c6e;
    stim[51] = 18'h1032a;
    stim[52] = 18'h31ca1;
    stim[53] = 18'h23ae9;
    stim[54] = 18'h006e7;
    stim[55] = 18'h006b8;
    stim[56] = 18'h0bf82;
    stim[57] = 18'h18750;
    stim[58] = 18'h22845;
    stim[59] = 18'h100f5;
    stim[60] = 18'h3aa06;
    stim[61] = 18'h1974d;
    stim[62] = 18'h13a8b;
    stim[63] = 18'h02f73;
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
      expv[0] = 9'h01b;
      expv[1] = 9'h04d;
      expv[2] = 9'h02c;
      expv[3] = 9'h0c1;
      expv[4] = 9'h1de;
      expv[5] = 9'h0b1;
      expv[6] = 9'h1ee;
      expv[7] = 9'h12e;
      expv[8] = 9'h1cf;
      expv[9] = 9'h09f;
      expv[10] = 9'h066;
      expv[11] = 9'h18f;
      expv[12] = 9'h017;
      expv[13] = 9'h1cc;
      expv[14] = 9'h17c;
      expv[15] = 9'h091;
      expv[16] = 9'h0ae;
      expv[17] = 9'h185;
      expv[18] = 9'h03a;
      expv[19] = 9'h12d;
      expv[20] = 9'h119;
      expv[21] = 9'h1e3;
      expv[22] = 9'h0da;
      expv[23] = 9'h171;
      expv[24] = 9'h08e;
      expv[25] = 9'h0b5;
      expv[26] = 9'h158;
      expv[27] = 9'h009;
      expv[28] = 9'h18c;
      expv[29] = 9'h004;
      expv[30] = 9'h016;
      expv[31] = 9'h046;
      expv[32] = 9'h056;
      expv[33] = 9'h049;
      expv[34] = 9'h1c7;
      expv[35] = 9'h01f;
      expv[36] = 9'h1e9;
      expv[37] = 9'h1c9;
      expv[38] = 9'h09e;
      expv[39] = 9'h11e;
      expv[40] = 9'h185;
      expv[41] = 9'h1b6;
      expv[42] = 9'h18d;
      expv[43] = 9'h089;
      expv[44] = 9'h1a6;
      expv[45] = 9'h0f4;
      expv[46] = 9'h138;
      expv[47] = 9'h053;
      expv[48] = 9'h09a;
      expv[49] = 9'h0b3;
      expv[50] = 9'h19e;
      expv[51] = 9'h06c;
      expv[52] = 9'h089;
      expv[53] = 9'h1dd;
      expv[54] = 9'h05b;
      expv[55] = 9'h04c;
      expv[56] = 9'h1e0;
      expv[57] = 9'h070;
      expv[58] = 9'h113;
      expv[59] = 9'h01b;
      expv[60] = 9'h142;
      expv[61] = 9'h0f7;
      expv[62] = 9'h1c5;
      expv[63] = 9'h179;
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
