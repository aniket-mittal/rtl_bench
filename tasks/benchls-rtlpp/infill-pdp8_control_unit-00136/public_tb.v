// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00136 dut (
    .clk(clk),
    .reset(in_vec[25:25]),
    .EN(in_vec[24:24]),
    .IR(in_vec[23:21]),
    .AC(in_vec[20:9]),
    .LINK(in_vec[8:8]),
    .ckFetch(in_vec[7:7]),
    .ck1(in_vec[6:6]),
    .ck2(in_vec[5:5]),
    .stbFetchA(in_vec[4:4]),
    .stbFetchB(in_vec[3:3]),
    .stb1(in_vec[2:2]),
    .irqRq(in_vec[1:1]),
    .anyDone(in_vec[0:0]),
    .done(out_vec[21:21]),
    .rot2ac(out_vec[20:20]),
    .ac_ck(out_vec[19:19]),
    .clr(out_vec[18:18]),
    .ACclr(out_vec[17:17]),
    .linkclr(out_vec[16:16]),
    .linkcml(out_vec[15:15]),
    .link_ck(out_vec[14:14]),
    .pc_ck(out_vec[13:13]),
    .ACGTF(out_vec[12:1]),
    .irqOverride(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h29b8f20;
    stim[1] = 26'h2261abd;
    stim[2] = 26'h06cf4ed;
    stim[3] = 26'h198b6f6;
    stim[4] = 26'h0de7206;
    stim[5] = 26'h1786901;
    stim[6] = 26'h1ffd327;
    stim[7] = 26'h186d8e2;
    stim[8] = 26'h1e99232;
    stim[9] = 26'h16f01b3;
    stim[10] = 26'h127822b;
    stim[11] = 26'h1090f06;
    stim[12] = 26'h144686a;
    stim[13] = 26'h19ec50e;
    stim[14] = 26'h15bc846;
    stim[15] = 26'h19a80d7;
    stim[16] = 26'h0b763eb;
    stim[17] = 26'h0b84752;
    stim[18] = 26'h01bbf46;
    stim[19] = 26'h1f961c3;
    stim[20] = 26'h1291cef;
    stim[21] = 26'h0d18a77;
    stim[22] = 26'h00135d4;
    stim[23] = 26'h1d5a624;
    stim[24] = 26'h1327926;
    stim[25] = 26'h1e6e9a4;
    stim[26] = 26'h0b6a51e;
    stim[27] = 26'h0e271f7;
    stim[28] = 26'h09c9eba;
    stim[29] = 26'h15ea676;
    stim[30] = 26'h1f1b899;
    stim[31] = 26'h165480d;
    stim[32] = 26'h1367526;
    stim[33] = 26'h04ce57a;
    stim[34] = 26'h09903a2;
    stim[35] = 26'h01a5bf3;
    stim[36] = 26'h02209ee;
    stim[37] = 26'h14544b4;
    stim[38] = 26'h1168f69;
    stim[39] = 26'h0b2c1c7;
    stim[40] = 26'h0e150ca;
    stim[41] = 26'h01bdf82;
    stim[42] = 26'h1a57a59;
    stim[43] = 26'h0a62aae;
    stim[44] = 26'h0c953bb;
    stim[45] = 26'h04596cc;
    stim[46] = 26'h3b5ffe1;
    stim[47] = 26'h1c747d3;
    stim[48] = 26'h14c7ffa;
    stim[49] = 26'h107f230;
    stim[50] = 26'h0b9c714;
    stim[51] = 26'h016844f;
    stim[52] = 26'h18dff59;
    stim[53] = 26'h1fde26f;
    stim[54] = 26'h13e5efd;
    stim[55] = 26'h07998a6;
    stim[56] = 26'h19f2cc0;
    stim[57] = 26'h027fe1a;
    stim[58] = 26'h1b9ba00;
    stim[59] = 26'h049ca66;
    stim[60] = 26'h300a0d0;
    stim[61] = 26'h238579d;
    stim[62] = 26'h1cf0357;
    stim[63] = 26'h0ca5b59;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h3a0400;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h284000;
      expv[7] = 22'h320400;
      expv[8] = 22'h200000;
      expv[9] = 22'h200000;
      expv[10] = 22'h200000;
      expv[11] = 22'h000000;
      expv[12] = 22'h200000;
      expv[13] = 22'h080000;
      expv[14] = 22'h000000;
      expv[15] = 22'h1a0400;
      expv[16] = 22'h000000;
      expv[17] = 22'h000000;
      expv[18] = 22'h000000;
      expv[19] = 22'h150000;
      expv[20] = 22'h200000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h200000;
      expv[25] = 22'h284000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h200000;
      expv[30] = 22'h000000;
      expv[31] = 22'h000000;
      expv[32] = 22'h200000;
      expv[33] = 22'h000000;
      expv[34] = 22'h000000;
      expv[35] = 22'h000000;
      expv[36] = 22'h000000;
      expv[37] = 22'h200000;
      expv[38] = 22'h200000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h010000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h218000;
      expv[47] = 22'h000000;
      expv[48] = 22'h200000;
      expv[49] = 22'h200000;
      expv[50] = 22'h000000;
      expv[51] = 22'h000000;
      expv[52] = 22'h121000;
      expv[53] = 22'h3d4000;
      expv[54] = 22'h200000;
      expv[55] = 22'h000000;
      expv[56] = 22'h120100;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h000000;
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
