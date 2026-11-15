// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_131554 dut (
    .MRxClk(clk),
    .Reset(in_vec[8:8]),
    .MRxDV(in_vec[7:7]),
    .RxValid(in_vec[6:6]),
    .StateIdle(in_vec[5:5]),
    .StateFFS(in_vec[4:4]),
    .StatePreamble(in_vec[3:3]),
    .StateData(in_vec[2:1]),
    .StateFrmCrc(in_vec[0:0]),
    .TotalRecvNibCntEq0(out_vec[29:29]),
    .TotalRecvNibCnt(out_vec[28:13]),
    .RxRamAddr(out_vec[12:5]),
    .FrmCrcNibCnt(out_vec[4:1]),
    .FrmCrcStateEnd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h170;
    stim[1] = 9'h190;
    stim[2] = 9'h0d1;
    stim[3] = 9'h0c2;
    stim[4] = 9'h055;
    stim[5] = 9'h0c0;
    stim[6] = 9'h04e;
    stim[7] = 9'h020;
    stim[8] = 9'h0aa;
    stim[9] = 9'h0d7;
    stim[10] = 9'h015;
    stim[11] = 9'h07c;
    stim[12] = 9'h0e5;
    stim[13] = 9'h048;
    stim[14] = 9'h03d;
    stim[15] = 9'h04c;
    stim[16] = 9'h0f6;
    stim[17] = 9'h021;
    stim[18] = 9'h015;
    stim[19] = 9'h089;
    stim[20] = 9'h0c1;
    stim[21] = 9'h0ae;
    stim[22] = 9'h0dd;
    stim[23] = 9'h000;
    stim[24] = 9'h066;
    stim[25] = 9'h02c;
    stim[26] = 9'h0ad;
    stim[27] = 9'h055;
    stim[28] = 9'h09d;
    stim[29] = 9'h070;
    stim[30] = 9'h009;
    stim[31] = 9'h03b;
    stim[32] = 9'h0e3;
    stim[33] = 9'h006;
    stim[34] = 9'h0d3;
    stim[35] = 9'h0a8;
    stim[36] = 9'h00d;
    stim[37] = 9'h05e;
    stim[38] = 9'h013;
    stim[39] = 9'h0ff;
    stim[40] = 9'h02e;
    stim[41] = 9'h0ed;
    stim[42] = 9'h0b1;
    stim[43] = 9'h05f;
    stim[44] = 9'h0eb;
    stim[45] = 9'h037;
    stim[46] = 9'h0ac;
    stim[47] = 9'h00d;
    stim[48] = 9'h086;
    stim[49] = 9'h0fa;
    stim[50] = 9'h02c;
    stim[51] = 9'h00f;
    stim[52] = 9'h092;
    stim[53] = 9'h0f9;
    stim[54] = 9'h03d;
    stim[55] = 9'h0e6;
    stim[56] = 9'h0dd;
    stim[57] = 9'h0ac;
    stim[58] = 9'h02f;
    stim[59] = 9'h054;
    stim[60] = 9'h058;
    stim[61] = 9'h025;
    stim[62] = 9'h040;
    stim[63] = 9'h0ec;
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
      expv[0] = 30'h20000000;
      expv[1] = 30'h20000000;
      expv[2] = 30'h20000000;
      expv[3] = 30'h00002002;
      expv[4] = 30'h00004022;
      expv[5] = 30'h00006004;
      expv[6] = 30'h00008024;
      expv[7] = 30'h0000a004;
      expv[8] = 30'h20000000;
      expv[9] = 30'h20000000;
      expv[10] = 30'h00002002;
      expv[11] = 30'h00002002;
      expv[12] = 30'h20000000;
      expv[13] = 30'h00002000;
      expv[14] = 30'h00004000;
      expv[15] = 30'h20000000;
      expv[16] = 30'h00002000;
      expv[17] = 30'h00004000;
      expv[18] = 30'h20000000;
      expv[19] = 30'h20000000;
      expv[20] = 30'h20000000;
      expv[21] = 30'h00002022;
      expv[22] = 30'h00002000;
      expv[23] = 30'h00004002;
      expv[24] = 30'h00004002;
      expv[25] = 30'h20000000;
      expv[26] = 30'h20000000;
      expv[27] = 30'h20000000;
      expv[28] = 30'h00002002;
      expv[29] = 30'h00002002;
      expv[30] = 30'h20000000;
      expv[31] = 30'h20000000;
      expv[32] = 30'h20000000;
      expv[33] = 30'h00002000;
      expv[34] = 30'h00002000;
      expv[35] = 30'h00004002;
      expv[36] = 30'h00004000;
      expv[37] = 30'h00004000;
      expv[38] = 30'h00006000;
      expv[39] = 30'h00006000;
      expv[40] = 30'h00008000;
      expv[41] = 30'h20000000;
      expv[42] = 30'h00002000;
      expv[43] = 30'h00002000;
      expv[44] = 30'h00004002;
      expv[45] = 30'h00006000;
      expv[46] = 30'h20000000;
      expv[47] = 30'h20000000;
      expv[48] = 30'h20000000;
      expv[49] = 30'h20000000;
      expv[50] = 30'h00002000;
      expv[51] = 30'h20000000;
      expv[52] = 30'h20000000;
      expv[53] = 30'h20000000;
      expv[54] = 30'h00002000;
      expv[55] = 30'h20000000;
      expv[56] = 30'h00002000;
      expv[57] = 30'h00004002;
      expv[58] = 30'h00004000;
      expv[59] = 30'h20000000;
      expv[60] = 30'h00002000;
      expv[61] = 30'h00004000;
      expv[62] = 30'h20000000;
      expv[63] = 30'h00002020;
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
