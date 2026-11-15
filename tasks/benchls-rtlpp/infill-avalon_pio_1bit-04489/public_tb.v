// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04489 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h24a91a0d70;
    stim[1] = 38'h3929d7f4e2;
    stim[2] = 38'h23f9305b2a;
    stim[3] = 38'h16e3e39172;
    stim[4] = 38'h373dbc1cc1;
    stim[5] = 38'h2fc328a2d4;
    stim[6] = 38'h06920ca3bc;
    stim[7] = 38'h04e8c45ff3;
    stim[8] = 38'h1be8eebe08;
    stim[9] = 38'h16b6b92ef4;
    stim[10] = 38'h1f1b819e2f;
    stim[11] = 38'h03132efb76;
    stim[12] = 38'h2284a81db3;
    stim[13] = 38'h13e32b341a;
    stim[14] = 38'h06c26d22dc;
    stim[15] = 38'h062fb794c3;
    stim[16] = 38'h3f58e2ad18;
    stim[17] = 38'h3a5742b936;
    stim[18] = 38'h1295e384d9;
    stim[19] = 38'h3b3d678cee;
    stim[20] = 38'h3fbd3be971;
    stim[21] = 38'h2f6fd330aa;
    stim[22] = 38'h3305ca5d25;
    stim[23] = 38'h07ff93c3cd;
    stim[24] = 38'h02d2ac3160;
    stim[25] = 38'h32675de887;
    stim[26] = 38'h065ca0cb50;
    stim[27] = 38'h1a540378bd;
    stim[28] = 38'h1e31e8528a;
    stim[29] = 38'h2eebdb80ce;
    stim[30] = 38'h1fc48368fc;
    stim[31] = 38'h03b76ca090;
    stim[32] = 38'h364be656e3;
    stim[33] = 38'h0b48d35e1d;
    stim[34] = 38'h3f96d46fc8;
    stim[35] = 38'h32f12457d2;
    stim[36] = 38'h27a388c2a0;
    stim[37] = 38'h1636539e2c;
    stim[38] = 38'h1a10a99e7e;
    stim[39] = 38'h2759512d94;
    stim[40] = 38'h027a731a69;
    stim[41] = 38'h3be2058980;
    stim[42] = 38'h0e49062ccf;
    stim[43] = 38'h3a7d5626e3;
    stim[44] = 38'h0a3136dc37;
    stim[45] = 38'h3bd7ee90d5;
    stim[46] = 38'h069fcade57;
    stim[47] = 38'h1ee583c9da;
    stim[48] = 38'h0fad19ac32;
    stim[49] = 38'h3b8a2f7ebe;
    stim[50] = 38'h361f96039e;
    stim[51] = 38'h3acb8333b9;
    stim[52] = 38'h2aee9d076d;
    stim[53] = 38'h132c1fd7d4;
    stim[54] = 38'h13d70cbe0e;
    stim[55] = 38'h3b828b0334;
    stim[56] = 38'h0671f9b55e;
    stim[57] = 38'h1a5f10cf4b;
    stim[58] = 38'h36c1e277a7;
    stim[59] = 38'h13bef4ab58;
    stim[60] = 38'h3a3f9bbcd1;
    stim[61] = 38'h22fd839bf5;
    stim[62] = 38'h168f248fff;
    stim[63] = 38'h0b79391829;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000001;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000001;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h000000001;
      expv[58] = 33'h100000000;
      expv[59] = 33'h000000001;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
      expv[62] = 33'h100000001;
      expv[63] = 33'h000000000;
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
