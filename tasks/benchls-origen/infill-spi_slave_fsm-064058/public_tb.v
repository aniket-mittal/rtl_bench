// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064058 dut (
    .SCK(clk),
    .SDI(in_vec[9:9]),
    .CSB(in_vec[8:8]),
    .idata(in_vec[7:0]),
    .SDO(out_vec[19:19]),
    .sdoenb(out_vec[18:18]),
    .odata(out_vec[17:10]),
    .oaddr(out_vec[9:2]),
    .rdstb(out_vec[1:1]),
    .wrstb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h104;
    stim[1] = 10'h1bc;
    stim[2] = 10'h08f;
    stim[3] = 10'h2d9;
    stim[4] = 10'h2e8;
    stim[5] = 10'h07d;
    stim[6] = 10'h087;
    stim[7] = 10'h0f4;
    stim[8] = 10'h220;
    stim[9] = 10'h2aa;
    stim[10] = 10'h2a3;
    stim[11] = 10'h05f;
    stim[12] = 10'h091;
    stim[13] = 10'h252;
    stim[14] = 10'h0ea;
    stim[15] = 10'h0ac;
    stim[16] = 10'h3a4;
    stim[17] = 10'h0ed;
    stim[18] = 10'h2c1;
    stim[19] = 10'h2da;
    stim[20] = 10'h2a6;
    stim[21] = 10'h01f;
    stim[22] = 10'h09f;
    stim[23] = 10'h2fc;
    stim[24] = 10'h0d1;
    stim[25] = 10'h0cf;
    stim[26] = 10'h0eb;
    stim[27] = 10'h0f1;
    stim[28] = 10'h0ae;
    stim[29] = 10'h091;
    stim[30] = 10'h219;
    stim[31] = 10'h2a7;
    stim[32] = 10'h02a;
    stim[33] = 10'h255;
    stim[34] = 10'h239;
    stim[35] = 10'h2f1;
    stim[36] = 10'h0ef;
    stim[37] = 10'h216;
    stim[38] = 10'h237;
    stim[39] = 10'h057;
    stim[40] = 10'h26e;
    stim[41] = 10'h2f0;
    stim[42] = 10'h2af;
    stim[43] = 10'h0ab;
    stim[44] = 10'h0a7;
    stim[45] = 10'h068;
    stim[46] = 10'h0fd;
    stim[47] = 10'h24a;
    stim[48] = 10'h27b;
    stim[49] = 10'h029;
    stim[50] = 10'h235;
    stim[51] = 10'h229;
    stim[52] = 10'h209;
    stim[53] = 10'h2be;
    stim[54] = 10'h064;
    stim[55] = 10'h03b;
    stim[56] = 10'h29a;
    stim[57] = 10'h0a0;
    stim[58] = 10'h207;
    stim[59] = 10'h280;
    stim[60] = 10'h2c3;
    stim[61] = 10'h0b5;
    stim[62] = 10'h252;
    stim[63] = 10'h00a;
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
      expv[0] = 20'h40000;
      expv[1] = 20'h40000;
      expv[2] = 20'h40000;
      expv[3] = 20'h40000;
      expv[4] = 20'h40000;
      expv[5] = 20'h40000;
      expv[6] = 20'h40000;
      expv[7] = 20'h40000;
      expv[8] = 20'h40000;
      expv[9] = 20'h40000;
      expv[10] = 20'h40000;
      expv[11] = 20'h40000;
      expv[12] = 20'h40000;
      expv[13] = 20'h40000;
      expv[14] = 20'h40000;
      expv[15] = 20'h40000;
      expv[16] = 20'h40000;
      expv[17] = 20'h40000;
      expv[18] = 20'h40000;
      expv[19] = 20'h40000;
      expv[20] = 20'h40000;
      expv[21] = 20'h40000;
      expv[22] = 20'h40000;
      expv[23] = 20'h40000;
      expv[24] = 20'h40000;
      expv[25] = 20'h40000;
      expv[26] = 20'h40000;
      expv[27] = 20'h40000;
      expv[28] = 20'h40000;
      expv[29] = 20'h40000;
      expv[30] = 20'h40000;
      expv[31] = 20'h40000;
      expv[32] = 20'h40000;
      expv[33] = 20'h40018;
      expv[34] = 20'h0001a;
      expv[35] = 20'h00018;
      expv[36] = 20'h80018;
      expv[37] = 20'h00018;
      expv[38] = 20'h00018;
      expv[39] = 20'h80018;
      expv[40] = 20'h80018;
      expv[41] = 20'h3b419;
      expv[42] = 20'hbb41a;
      expv[43] = 20'hfb418;
      expv[44] = 20'hfb418;
      expv[45] = 20'hfb418;
      expv[46] = 20'hfb418;
      expv[47] = 20'hfb418;
      expv[48] = 20'hfb418;
      expv[49] = 20'hfb418;
      expv[50] = 20'hfb418;
      expv[51] = 20'hfb418;
      expv[52] = 20'hfb418;
      expv[53] = 20'hfb418;
      expv[54] = 20'hfb418;
      expv[55] = 20'hfb418;
      expv[56] = 20'hfb418;
      expv[57] = 20'hfb418;
      expv[58] = 20'hfb7c8;
      expv[59] = 20'hfb7c8;
      expv[60] = 20'hfb7c8;
      expv[61] = 20'hfb7c8;
      expv[62] = 20'hfb7c8;
      expv[63] = 20'hfb7c8;
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
