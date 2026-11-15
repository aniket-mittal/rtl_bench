// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05401 dut (
    .clk(clk),
    .rst(in_vec[41:41]),
    .mem_gpr_wd(in_vec[40:9]),
    .mem_gpr_wa(in_vec[8:4]),
    .mem_gpr_we(in_vec[3:3]),
    .mem_flush(in_vec[2:2]),
    .mem_stall(in_vec[1:1]),
    .wb_stall(in_vec[0:0]),
    .wb_gpr_wd(out_vec[37:6]),
    .wb_gpr_wa(out_vec[5:1]),
    .wb_gpr_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h39681a543b6;
    stim[1] = 42'h2bca389bf4a;
    stim[2] = 42'h0d6319bab34;
    stim[3] = 42'h12b067d593a;
    stim[4] = 42'h0a8d2bd7ae5;
    stim[5] = 42'h076fba2d9fd;
    stim[6] = 42'h03e69b788a1;
    stim[7] = 42'h16969382d02;
    stim[8] = 42'h0248dfff990;
    stim[9] = 42'h0b0fcdebcdc;
    stim[10] = 42'h099e5a95a92;
    stim[11] = 42'h05439344e1a;
    stim[12] = 42'h15faabd5e54;
    stim[13] = 42'h0ec2dc8775a;
    stim[14] = 42'h08e2444c3d7;
    stim[15] = 42'h11e3dbd3df1;
    stim[16] = 42'h03eb12ada27;
    stim[17] = 42'h142bc60ae59;
    stim[18] = 42'h09c2b6a6598;
    stim[19] = 42'h1f1cfcec435;
    stim[20] = 42'h15a0a60e3d6;
    stim[21] = 42'h0e2e2f32899;
    stim[22] = 42'h0f6620aaef9;
    stim[23] = 42'h0315a5f3abf;
    stim[24] = 42'h01f3c080cdc;
    stim[25] = 42'h0bc39e8807a;
    stim[26] = 42'h1d0881b4895;
    stim[27] = 42'h1fb35dc22eb;
    stim[28] = 42'h11fd0a21382;
    stim[29] = 42'h1f39136adb2;
    stim[30] = 42'h0fcb83890a2;
    stim[31] = 42'h04e6bb5a567;
    stim[32] = 42'h14231a5f36d;
    stim[33] = 42'h0b3ad06251f;
    stim[34] = 42'h10218200540;
    stim[35] = 42'h0f01e52f15e;
    stim[36] = 42'h1779c590f2f;
    stim[37] = 42'h059b6671dd0;
    stim[38] = 42'h0d636dd6931;
    stim[39] = 42'h0d4ee3b2b81;
    stim[40] = 42'h089b76904ff;
    stim[41] = 42'h1c0c1a3021d;
    stim[42] = 42'h05c01314686;
    stim[43] = 42'h0c616a79af2;
    stim[44] = 42'h0d42ed286c9;
    stim[45] = 42'h0ab3239b379;
    stim[46] = 42'h0e78d09ecd8;
    stim[47] = 42'h064da711f4b;
    stim[48] = 42'h0481f68b920;
    stim[49] = 42'h122c7b50483;
    stim[50] = 42'h0de68db487d;
    stim[51] = 42'h05c257fe529;
    stim[52] = 42'h0f8063d3dba;
    stim[53] = 42'h179d119f68e;
    stim[54] = 42'h0bcaf04ed1b;
    stim[55] = 42'h060e5dcf9f7;
    stim[56] = 42'h19917b446db;
    stim[57] = 42'h01c19293c40;
    stim[58] = 42'h067930bd923;
    stim[59] = 42'h02aac16f802;
    stim[60] = 42'h127e2b07390;
    stim[61] = 42'h01f496c405d;
    stim[62] = 42'h04797fbcc44;
    stim[63] = 42'h11c3057caf2;
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
      expv[0] = 38'hxxxxxxxxxx;
      expv[1] = 38'h0000000000;
      expv[2] = 38'h0000000000;
      expv[3] = 38'h1ac6337540;
      expv[4] = 38'h2560cfab00;
      expv[5] = 38'h2560cfab00;
      expv[6] = 38'h2560cfab00;
      expv[7] = 38'h2560cfab00;
      expv[8] = 38'h2d2d270580;
      expv[9] = 38'h0491bfff32;
      expv[10] = 38'h161f9bd780;
      expv[11] = 38'h133cb52b40;
      expv[12] = 38'h0a872689c0;
      expv[13] = 38'h2bf557abc0;
      expv[14] = 38'h1d85b90ec0;
      expv[15] = 38'h1d85b90ec0;
      expv[16] = 38'h1d85b90ec0;
      expv[17] = 38'h1d85b90ec0;
      expv[18] = 38'h1d85b90ec0;
      expv[19] = 38'h13856d4cb3;
      expv[20] = 38'h13856d4cb3;
      expv[21] = 38'h2b414c1c40;
      expv[22] = 38'h2b414c1c40;
      expv[23] = 38'h2b414c1c40;
      expv[24] = 38'h2b414c1c40;
      expv[25] = 38'h03e7810180;
      expv[26] = 38'h17873d1000;
      expv[27] = 38'h17873d1000;
      expv[28] = 38'h17873d1000;
      expv[29] = 38'h23fa144240;
      expv[30] = 38'h3e7226d580;
      expv[31] = 38'h1f97071200;
      expv[32] = 38'h1f97071200;
      expv[33] = 38'h1f97071200;
      expv[34] = 38'h1f97071200;
      expv[35] = 38'h20430400a8;
      expv[36] = 38'h1e03ca5e00;
      expv[37] = 38'h1e03ca5e00;
      expv[38] = 38'h0b36cce3ba;
      expv[39] = 38'h0b36cce3ba;
      expv[40] = 38'h0b36cce3ba;
      expv[41] = 38'h0b36cce3ba;
      expv[42] = 38'h0b36cce3ba;
      expv[43] = 38'h0b802628c0;
      expv[44] = 38'h18c2d4f340;
      expv[45] = 38'h18c2d4f340;
      expv[46] = 38'h18c2d4f340;
      expv[47] = 38'h1cf1a13d9b;
      expv[48] = 38'h1cf1a13d9b;
      expv[49] = 38'h0903ed1724;
      expv[50] = 38'h0903ed1724;
      expv[51] = 38'h0903ed1724;
      expv[52] = 38'h0903ed1724;
      expv[53] = 38'h1f00c7a780;
      expv[54] = 38'h2f3a233ec0;
      expv[55] = 38'h2f3a233ec0;
      expv[56] = 38'h2f3a233ec0;
      expv[57] = 38'h2f3a233ec0;
      expv[58] = 38'h0383252788;
      expv[59] = 38'h0383252788;
      expv[60] = 38'h055582df00;
      expv[61] = 38'h24fc560e72;
      expv[62] = 38'h24fc560e72;
      expv[63] = 38'h08f2ff7980;
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
