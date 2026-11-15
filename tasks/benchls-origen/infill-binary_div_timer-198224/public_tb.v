// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198224 dut (
    .clk(clk),
    .cnt(out_vec[53:29]),
    .sec1(out_vec[28:28]),
    .sec2(out_vec[27:27]),
    .sec4(out_vec[26:26]),
    .sec8(out_vec[25:25]),
    .wss1(out_vec[24:24]),
    .wss2(out_vec[23:23]),
    .wss4(out_vec[22:22]),
    .wss8(out_vec[21:21]),
    .ws1(out_vec[20:20]),
    .ws2(out_vec[19:19]),
    .ws4(out_vec[18:18]),
    .ws8(out_vec[17:17]),
    .ps1(out_vec[16:16]),
    .ps2(out_vec[15:15]),
    .ps4(out_vec[14:14]),
    .ps8(out_vec[13:13]),
    .pr1(out_vec[12:12]),
    .pr2(out_vec[11:11]),
    .pr4(out_vec[10:10]),
    .pr8(out_vec[9:9]),
    .sub_cnt(out_vec[8:5]),
    .sub_cnt_m(out_vec[4:1]),
    .clk_d10(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 54'hxxxxxxxxxxxxxx;
      expv[1] = 54'hxxxxxxxxxxxxxx;
      expv[2] = 54'hxxxxxxxx0xxxxx;
      expv[3] = 54'hxxxxxxxx0xxxxx;
      expv[4] = 54'hxxxxxxxx0xxxxx;
      expv[5] = 54'hxxxxxxxx0xxxxx;
      expv[6] = 54'hxxxxxxxx0xxxxx;
      expv[7] = 54'hxxxxxxxx0xxxxx;
      expv[8] = 54'hxxxxxxxx0xxxxx;
      expv[9] = 54'hxxxxxxxx0xxxxx;
      expv[10] = 54'hxxxxxxxx0xxxxx;
      expv[11] = 54'hxxxxxxxx0xxxxx;
      expv[12] = 54'hxxxxxxxx0xxxxx;
      expv[13] = 54'hxxxxxxxx0xxxxx;
      expv[14] = 54'hxxxxxxxx0xxxxx;
      expv[15] = 54'hxxxxxxxx0xxxxx;
      expv[16] = 54'hxxxxxxxx0xxxxx;
      expv[17] = 54'hxxxxxxxx0xxxxx;
      expv[18] = 54'hxxxxxxxx0xxxxx;
      expv[19] = 54'hxxxxxxxx0xxxxx;
      expv[20] = 54'hxxxxxxxx0xxxxx;
      expv[21] = 54'hxxxxxxxx0xxxxx;
      expv[22] = 54'hxxxxxxxx0xxxxx;
      expv[23] = 54'hxxxxxxxx0xxxxx;
      expv[24] = 54'hxxxxxxxx0xxxxx;
      expv[25] = 54'hxxxxxxxx0xxxxx;
      expv[26] = 54'hxxxxxxxx0xxxxx;
      expv[27] = 54'hxxxxxxxx0xxxxx;
      expv[28] = 54'hxxxxxxxx0xxxxx;
      expv[29] = 54'hxxxxxxxx0xxxxx;
      expv[30] = 54'hxxxxxxxx0xxxxx;
      expv[31] = 54'hxxxxxxxx0xxxxx;
      expv[32] = 54'hxxxxxxxx0xxxxx;
      expv[33] = 54'hxxxxxxxx0xxxxx;
      expv[34] = 54'hxxxxxxxx0xxxxx;
      expv[35] = 54'hxxxxxxxx0xxxxx;
      expv[36] = 54'hxxxxxxxx0xxxxx;
      expv[37] = 54'hxxxxxxxx0xxxxx;
      expv[38] = 54'hxxxxxxxx0xxxxx;
      expv[39] = 54'hxxxxxxxx0xxxxx;
      expv[40] = 54'hxxxxxxxx0xxxxx;
      expv[41] = 54'hxxxxxxxx0xxxxx;
      expv[42] = 54'hxxxxxxxx0xxxxx;
      expv[43] = 54'hxxxxxxxx0xxxxx;
      expv[44] = 54'hxxxxxxxx0xxxxx;
      expv[45] = 54'hxxxxxxxx0xxxxx;
      expv[46] = 54'hxxxxxxxx0xxxxx;
      expv[47] = 54'hxxxxxxxx0xxxxx;
      expv[48] = 54'hxxxxxxxx0xxxxx;
      expv[49] = 54'hxxxxxxxx0xxxxx;
      expv[50] = 54'hxxxxxxxx0xxxxx;
      expv[51] = 54'hxxxxxxxx0xxxxx;
      expv[52] = 54'hxxxxxxxx0xxxxx;
      expv[53] = 54'hxxxxxxxx0xxxxx;
      expv[54] = 54'hxxxxxxxx0xxxxx;
      expv[55] = 54'hxxxxxxxx0xxxxx;
      expv[56] = 54'hxxxxxxxx0xxxxx;
      expv[57] = 54'hxxxxxxxx0xxxxx;
      expv[58] = 54'hxxxxxxxx0xxxxx;
      expv[59] = 54'hxxxxxxxx0xxxxx;
      expv[60] = 54'hxxxxxxxx0xxxxx;
      expv[61] = 54'hxxxxxxxx0xxxxx;
      expv[62] = 54'hxxxxxxxx0xxxxx;
      expv[63] = 54'hxxxxxxxx0xxxxx;
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
