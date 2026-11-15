// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04492 dut (
    .iClk(clk),
    .inRst(in_vec[24:24]),
    .iR(in_vec[23:16]),
    .iG(in_vec[15:8]),
    .iB(in_vec[7:0]),
    .oR(out_vec[27:20]),
    .oG(out_vec[19:12]),
    .oB(out_vec[11:4]),
    .oHSync(out_vec[3:3]),
    .oVSync(out_vec[2:2]),
    .oLineValid(out_vec[1:1]),
    .oFrameValid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1c15184;
    stim[1] = 25'h11acc83;
    stim[2] = 25'h087f2a0;
    stim[3] = 25'h0568061;
    stim[4] = 25'h0ebfc03;
    stim[5] = 25'h0975950;
    stim[6] = 25'h0115143;
    stim[7] = 25'h0e2972e;
    stim[8] = 25'h0074a7f;
    stim[9] = 25'h0ada9dd;
    stim[10] = 25'h0c907cc;
    stim[11] = 25'h0be85d8;
    stim[12] = 25'h0c687f4;
    stim[13] = 25'h0ac26bb;
    stim[14] = 25'h0540778;
    stim[15] = 25'h0222abb;
    stim[16] = 25'h090c578;
    stim[17] = 25'h0fae11d;
    stim[18] = 25'h0cc83d2;
    stim[19] = 25'h06346ce;
    stim[20] = 25'h0fd8122;
    stim[21] = 25'h04bb32f;
    stim[22] = 25'h07c9640;
    stim[23] = 25'h032aea9;
    stim[24] = 25'h0cf9e2c;
    stim[25] = 25'h0f55a29;
    stim[26] = 25'h0e4801f;
    stim[27] = 25'h0659f55;
    stim[28] = 25'h08dbb4f;
    stim[29] = 25'h084979e;
    stim[30] = 25'h0c51924;
    stim[31] = 25'h0cd4f70;
    stim[32] = 25'h042c2f3;
    stim[33] = 25'h0e475f3;
    stim[34] = 25'h06f006f;
    stim[35] = 25'h0b22bb1;
    stim[36] = 25'h0f120a7;
    stim[37] = 25'h077302d;
    stim[38] = 25'h0210a0b;
    stim[39] = 25'h0ed427e;
    stim[40] = 25'h0853e88;
    stim[41] = 25'h0b62b08;
    stim[42] = 25'h0664f47;
    stim[43] = 25'h018b5dd;
    stim[44] = 25'h0c7e9c4;
    stim[45] = 25'h0319da6;
    stim[46] = 25'h071fd7c;
    stim[47] = 25'h034eaf8;
    stim[48] = 25'h0dbd1db;
    stim[49] = 25'h07ce04a;
    stim[50] = 25'h0fd12fa;
    stim[51] = 25'h01e2ed3;
    stim[52] = 25'h03c33af;
    stim[53] = 25'h01670ac;
    stim[54] = 25'h0330838;
    stim[55] = 25'h0153208;
    stim[56] = 25'h02d030a;
    stim[57] = 25'h0feec39;
    stim[58] = 25'h06095fa;
    stim[59] = 25'h081e6aa;
    stim[60] = 25'h03b53c6;
    stim[61] = 25'h14980e2;
    stim[62] = 25'h00e04a7;
    stim[63] = 25'h07f3d1c;
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
      expv[0] = 28'h000000c;
      expv[1] = 28'h000000c;
      expv[2] = 28'h000000c;
      expv[3] = 28'h000000c;
      expv[4] = 28'h000000c;
      expv[5] = 28'h000000c;
      expv[6] = 28'h000000c;
      expv[7] = 28'h000000c;
      expv[8] = 28'h000000c;
      expv[9] = 28'h000000c;
      expv[10] = 28'h000000c;
      expv[11] = 28'h000000c;
      expv[12] = 28'h000000c;
      expv[13] = 28'h000000c;
      expv[14] = 28'h000000c;
      expv[15] = 28'h000000c;
      expv[16] = 28'h000000c;
      expv[17] = 28'h000000c;
      expv[18] = 28'h000000c;
      expv[19] = 28'h000000c;
      expv[20] = 28'h000000c;
      expv[21] = 28'h000000c;
      expv[22] = 28'h000000c;
      expv[23] = 28'h000000c;
      expv[24] = 28'h000000c;
      expv[25] = 28'h000000c;
      expv[26] = 28'h000000c;
      expv[27] = 28'h000000c;
      expv[28] = 28'h000000c;
      expv[29] = 28'h000000c;
      expv[30] = 28'h000000c;
      expv[31] = 28'h000000c;
      expv[32] = 28'h000000c;
      expv[33] = 28'h000000c;
      expv[34] = 28'h000000c;
      expv[35] = 28'h000000c;
      expv[36] = 28'h000000c;
      expv[37] = 28'h000000c;
      expv[38] = 28'h000000c;
      expv[39] = 28'h000000c;
      expv[40] = 28'h000000c;
      expv[41] = 28'h000000c;
      expv[42] = 28'h000000c;
      expv[43] = 28'h000000c;
      expv[44] = 28'h000000c;
      expv[45] = 28'h000000c;
      expv[46] = 28'h000000c;
      expv[47] = 28'h000000c;
      expv[48] = 28'h000000c;
      expv[49] = 28'h000000c;
      expv[50] = 28'h000000c;
      expv[51] = 28'h000000c;
      expv[52] = 28'h000000c;
      expv[53] = 28'h000000c;
      expv[54] = 28'h000000c;
      expv[55] = 28'h000000c;
      expv[56] = 28'h000000c;
      expv[57] = 28'h000000c;
      expv[58] = 28'h000000c;
      expv[59] = 28'h000000c;
      expv[60] = 28'h000000c;
      expv[61] = 28'h000000c;
      expv[62] = 28'h000000c;
      expv[63] = 28'h000000c;
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
