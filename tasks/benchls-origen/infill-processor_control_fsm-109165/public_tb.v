// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109165 dut (
    .clk(clk),
    .reset(in_vec[26:26]),
    .irOutput(in_vec[25:14]),
    .pushBtnLeft(in_vec[13:13]),
    .pushBtnRight(in_vec[12:12]),
    .switches(in_vec[11:0]),
    .D_addr(out_vec[17:14]),
    .D_rd(out_vec[13:13]),
    .D_wr(out_vec[12:12]),
    .RF_we(out_vec[11:11]),
    .RF_waddr(out_vec[10:8]),
    .isExternal(out_vec[7:7]),
    .AluSel(out_vec[6:6]),
    .ra(out_vec[5:3]),
    .rb(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h54b6494;
    stim[1] = 27'h65d931c;
    stim[2] = 27'h3cb3f0b;
    stim[3] = 27'h12d4949;
    stim[4] = 27'h19afb7c;
    stim[5] = 27'h3bcd03e;
    stim[6] = 27'h380d23d;
    stim[7] = 27'h266c0e0;
    stim[8] = 27'h0f8af26;
    stim[9] = 27'h3ba63c8;
    stim[10] = 27'h2ad34f9;
    stim[11] = 27'h2cc155b;
    stim[12] = 27'h051cdd1;
    stim[13] = 27'h3020a27;
    stim[14] = 27'h09a10ec;
    stim[15] = 27'h0ebefaf;
    stim[16] = 27'h0162820;
    stim[17] = 27'h0df0fde;
    stim[18] = 27'h1bb58aa;
    stim[19] = 27'h1009c8b;
    stim[20] = 27'h36efc2c;
    stim[21] = 27'h3f64c81;
    stim[22] = 27'h3b01f82;
    stim[23] = 27'h138cfd5;
    stim[24] = 27'h16e901a;
    stim[25] = 27'h0858f4a;
    stim[26] = 27'h1009243;
    stim[27] = 27'h42450d0;
    stim[28] = 27'h1130fc2;
    stim[29] = 27'h0ca18d2;
    stim[30] = 27'h3042886;
    stim[31] = 27'h2e60222;
    stim[32] = 27'h3c10f32;
    stim[33] = 27'h2c17b0f;
    stim[34] = 27'h050a5f5;
    stim[35] = 27'h2c89ebc;
    stim[36] = 27'h3e8bdfd;
    stim[37] = 27'h180fbac;
    stim[38] = 27'h130415e;
    stim[39] = 27'h1a217af;
    stim[40] = 27'h4ee3f16;
    stim[41] = 27'h24938ec;
    stim[42] = 27'h3245887;
    stim[43] = 27'h350e3f2;
    stim[44] = 27'h3f82e9b;
    stim[45] = 27'h142f4d1;
    stim[46] = 27'h090f273;
    stim[47] = 27'h0f54e8c;
    stim[48] = 27'h2fb0b5d;
    stim[49] = 27'h2954e3f;
    stim[50] = 27'h0776f07;
    stim[51] = 27'h1e3cf52;
    stim[52] = 27'h2ac6cca;
    stim[53] = 27'h2526cd3;
    stim[54] = 27'h15b76f0;
    stim[55] = 27'h0070cec;
    stim[56] = 27'h0325e12;
    stim[57] = 27'h316a4b4;
    stim[58] = 27'h012d5d0;
    stim[59] = 27'h33f56c5;
    stim[60] = 27'h2ca4ca9;
    stim[61] = 27'h091bdce;
    stim[62] = 27'h058bebf;
    stim[63] = 27'h3fcdd9a;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00080;
      expv[2] = 18'h00080;
      expv[3] = 18'h00516;
      expv[4] = 18'h00800;
      expv[5] = 18'h00000;
      expv[6] = 18'h00080;
      expv[7] = 18'h00333;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00416;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00001;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h0000b;
      expv[17] = 18'h32800;
      expv[18] = 18'h00000;
      expv[19] = 18'h00080;
      expv[20] = 18'h00337;
      expv[21] = 18'h00000;
      expv[22] = 18'h00080;
      expv[23] = 18'h0031c;
      expv[24] = 18'h00800;
      expv[25] = 18'h00000;
      expv[26] = 18'h00080;
      expv[27] = 18'h00080;
      expv[28] = 18'h00000;
      expv[29] = 18'h00025;
      expv[30] = 18'h01000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00520;
      expv[34] = 18'h00000;
      expv[35] = 18'h00080;
      expv[36] = 18'h00234;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00011;
      expv[40] = 18'h00080;
      expv[41] = 18'h00080;
      expv[42] = 18'h00112;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00321;
      expv[46] = 18'h00800;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h0050a;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00116;
      expv[53] = 18'h00000;
      expv[54] = 18'h00080;
      expv[55] = 18'h00403;
      expv[56] = 18'h26800;
      expv[57] = 18'h00000;
      expv[58] = 18'h00080;
      expv[59] = 18'h0051f;
      expv[60] = 18'h00000;
      expv[61] = 18'h00080;
      expv[62] = 18'h0022c;
      expv[63] = 18'h0e800;
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
