// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09356 dut (
    .clk_i(clk),
    .O_offset_cnt_en(in_vec[5:5]),
    .D_offset_cnt_en(in_vec[4:4]),
    .offset_reset(in_vec[3:3]),
    .prev_row_load(in_vec[2:2]),
    .curr_row_load(in_vec[1:1]),
    .next_row_load(in_vec[0:0]),
    .adr_o(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h3c;
    stim[1] = 6'h0a;
    stim[2] = 6'h04;
    stim[3] = 6'h12;
    stim[4] = 6'h16;
    stim[5] = 6'h15;
    stim[6] = 6'h15;
    stim[7] = 6'h16;
    stim[8] = 6'h03;
    stim[9] = 6'h06;
    stim[10] = 6'h27;
    stim[11] = 6'h24;
    stim[12] = 6'h04;
    stim[13] = 6'h11;
    stim[14] = 6'h01;
    stim[15] = 6'h13;
    stim[16] = 6'h36;
    stim[17] = 6'h34;
    stim[18] = 6'h14;
    stim[19] = 6'h26;
    stim[20] = 6'h36;
    stim[21] = 6'h03;
    stim[22] = 6'h11;
    stim[23] = 6'h27;
    stim[24] = 6'h33;
    stim[25] = 6'h24;
    stim[26] = 6'h07;
    stim[27] = 6'h11;
    stim[28] = 6'h21;
    stim[29] = 6'h22;
    stim[30] = 6'h36;
    stim[31] = 6'h17;
    stim[32] = 6'h34;
    stim[33] = 6'h27;
    stim[34] = 6'h07;
    stim[35] = 6'h13;
    stim[36] = 6'h16;
    stim[37] = 6'h14;
    stim[38] = 6'h26;
    stim[39] = 6'h33;
    stim[40] = 6'h25;
    stim[41] = 6'h21;
    stim[42] = 6'h31;
    stim[43] = 6'h26;
    stim[44] = 6'h27;
    stim[45] = 6'h37;
    stim[46] = 6'h03;
    stim[47] = 6'h22;
    stim[48] = 6'h10;
    stim[49] = 6'h34;
    stim[50] = 6'h17;
    stim[51] = 6'h22;
    stim[52] = 6'h15;
    stim[53] = 6'h37;
    stim[54] = 6'h37;
    stim[55] = 6'h34;
    stim[56] = 6'h26;
    stim[57] = 6'h02;
    stim[58] = 6'h37;
    stim[59] = 6'h00;
    stim[60] = 6'h04;
    stim[61] = 6'h22;
    stim[62] = 6'h27;
    stim[63] = 6'h02;
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
      expv[0] = 22'hxxxxxx;
      expv[1] = 22'h000280;
      expv[2] = 22'h000000;
      expv[3] = 22'h000280;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000280;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000004;
      expv[12] = 22'h000008;
      expv[13] = 22'h000508;
      expv[14] = 22'h000508;
      expv[15] = 22'h000288;
      expv[16] = 22'h000008;
      expv[17] = 22'h00000c;
      expv[18] = 22'h000010;
      expv[19] = 22'h000010;
      expv[20] = 22'h000014;
      expv[21] = 22'h000298;
      expv[22] = 22'h000518;
      expv[23] = 22'h000018;
      expv[24] = 22'h00029c;
      expv[25] = 22'h000020;
      expv[26] = 22'h000024;
      expv[27] = 22'h000524;
      expv[28] = 22'h000524;
      expv[29] = 22'h0002a8;
      expv[30] = 22'h00002c;
      expv[31] = 22'h000030;
      expv[32] = 22'h000030;
      expv[33] = 22'h000034;
      expv[34] = 22'h000038;
      expv[35] = 22'h0002b8;
      expv[36] = 22'h000038;
      expv[37] = 22'h000038;
      expv[38] = 22'h000038;
      expv[39] = 22'h0002bc;
      expv[40] = 22'h000040;
      expv[41] = 22'h000544;
      expv[42] = 22'h000548;
      expv[43] = 22'h00004c;
      expv[44] = 22'h000050;
      expv[45] = 22'h000054;
      expv[46] = 22'h0002d8;
      expv[47] = 22'h0002d8;
      expv[48] = 22'h00005c;
      expv[49] = 22'h00005c;
      expv[50] = 22'h000060;
      expv[51] = 22'h0002e0;
      expv[52] = 22'h000064;
      expv[53] = 22'h000064;
      expv[54] = 22'h000068;
      expv[55] = 22'h00006c;
      expv[56] = 22'h000070;
      expv[57] = 22'h0002f4;
      expv[58] = 22'h000074;
      expv[59] = 22'h00007c;
      expv[60] = 22'h000078;
      expv[61] = 22'h0002f8;
      expv[62] = 22'h00007c;
      expv[63] = 22'h000300;
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
