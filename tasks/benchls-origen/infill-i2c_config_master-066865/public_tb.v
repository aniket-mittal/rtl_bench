// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066865 dut (
    .clk2(clk),
    .reset(in_vec[18:18]),
    .sda(in_vec[17:17]),
    .clk1(in_vec[16:16]),
    .data(in_vec[15:0]),
    .reg_address(out_vec[9:2]),
    .sda_w(out_vec[1:1]),
    .ctrl_h(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h40b91;
    stim[1] = 19'h4e459;
    stim[2] = 19'h2d3f7;
    stim[3] = 19'h1a44b;
    stim[4] = 19'h3705f;
    stim[5] = 19'h32e79;
    stim[6] = 19'h2ff3e;
    stim[7] = 19'h37f7f;
    stim[8] = 19'h2dcbb;
    stim[9] = 19'h0655d;
    stim[10] = 19'h1cae7;
    stim[11] = 19'h0120b;
    stim[12] = 19'h22cd3;
    stim[13] = 19'h0850e;
    stim[14] = 19'h128da;
    stim[15] = 19'h0eff5;
    stim[16] = 19'h02172;
    stim[17] = 19'h38f79;
    stim[18] = 19'h39e8e;
    stim[19] = 19'h26f79;
    stim[20] = 19'h3a2ff;
    stim[21] = 19'h39ed0;
    stim[22] = 19'h2a87d;
    stim[23] = 19'h214bd;
    stim[24] = 19'h1b0e9;
    stim[25] = 19'h38320;
    stim[26] = 19'h03b15;
    stim[27] = 19'h1225e;
    stim[28] = 19'h05e51;
    stim[29] = 19'h39e3e;
    stim[30] = 19'h397ce;
    stim[31] = 19'h01ca6;
    stim[32] = 19'h3175a;
    stim[33] = 19'h0e8aa;
    stim[34] = 19'h314b0;
    stim[35] = 19'h32f9d;
    stim[36] = 19'h1c97d;
    stim[37] = 19'h1547f;
    stim[38] = 19'h155fd;
    stim[39] = 19'h32ea5;
    stim[40] = 19'h28d66;
    stim[41] = 19'h3771a;
    stim[42] = 19'h3e0ac;
    stim[43] = 19'h18d12;
    stim[44] = 19'h6ba79;
    stim[45] = 19'h05bf1;
    stim[46] = 19'h06a77;
    stim[47] = 19'h2efa6;
    stim[48] = 19'h079b3;
    stim[49] = 19'h3b018;
    stim[50] = 19'h14cfc;
    stim[51] = 19'h310a2;
    stim[52] = 19'h216cf;
    stim[53] = 19'h18677;
    stim[54] = 19'h3142d;
    stim[55] = 19'h2dfd7;
    stim[56] = 19'h0f2ba;
    stim[57] = 19'h0633d;
    stim[58] = 19'h0c791;
    stim[59] = 19'h22182;
    stim[60] = 19'h23c9a;
    stim[61] = 19'h76cb0;
    stim[62] = 19'h3b9d9;
    stim[63] = 19'h0b626;
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
      expv[0] = 10'h003;
      expv[1] = 10'h003;
      expv[2] = 10'h003;
      expv[3] = 10'h003;
      expv[4] = 10'h001;
      expv[5] = 10'h002;
      expv[6] = 10'h000;
      expv[7] = 10'h002;
      expv[8] = 10'h002;
      expv[9] = 10'h002;
      expv[10] = 10'h000;
      expv[11] = 10'h002;
      expv[12] = 10'h000;
      expv[13] = 10'h001;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h001;
      expv[23] = 10'h003;
      expv[24] = 10'h001;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h001;
      expv[34] = 10'h003;
      expv[35] = 10'h001;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h003;
      expv[45] = 10'h003;
      expv[46] = 10'h003;
      expv[47] = 10'h001;
      expv[48] = 10'h002;
      expv[49] = 10'h000;
      expv[50] = 10'h002;
      expv[51] = 10'h002;
      expv[52] = 10'h002;
      expv[53] = 10'h000;
      expv[54] = 10'h002;
      expv[55] = 10'h000;
      expv[56] = 10'h001;
      expv[57] = 10'h003;
      expv[58] = 10'h001;
      expv[59] = 10'h002;
      expv[60] = 10'h000;
      expv[61] = 10'h003;
      expv[62] = 10'h003;
      expv[63] = 10'h003;
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
