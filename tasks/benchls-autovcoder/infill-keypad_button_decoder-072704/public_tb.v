// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072704 dut (
    .clk(clk),
    .keyValue(in_vec[4:1]),
    .keyPressed(in_vec[0:0]),
    .btnMID(out_vec[9:9]),
    .btnR(out_vec[8:8]),
    .btnL(out_vec[7:7]),
    .btnU(out_vec[6:6]),
    .btnD(out_vec[5:5]),
    .btnLV1(out_vec[4:4]),
    .btnLV2(out_vec[3:3]),
    .btnLV3(out_vec[2:2]),
    .btnCHGDIFF(out_vec[1:1]),
    .btnCHGCOLOR(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1b;
    stim[1] = 5'h06;
    stim[2] = 5'h17;
    stim[3] = 5'h1e;
    stim[4] = 5'h1f;
    stim[5] = 5'h19;
    stim[6] = 5'h1f;
    stim[7] = 5'h13;
    stim[8] = 5'h0d;
    stim[9] = 5'h16;
    stim[10] = 5'h03;
    stim[11] = 5'h01;
    stim[12] = 5'h10;
    stim[13] = 5'h1d;
    stim[14] = 5'h0d;
    stim[15] = 5'h0f;
    stim[16] = 5'h0c;
    stim[17] = 5'h18;
    stim[18] = 5'h19;
    stim[19] = 5'h07;
    stim[20] = 5'h18;
    stim[21] = 5'h01;
    stim[22] = 5'h04;
    stim[23] = 5'h0d;
    stim[24] = 5'h02;
    stim[25] = 5'h01;
    stim[26] = 5'h0e;
    stim[27] = 5'h09;
    stim[28] = 5'h13;
    stim[29] = 5'h1e;
    stim[30] = 5'h02;
    stim[31] = 5'h09;
    stim[32] = 5'h15;
    stim[33] = 5'h0f;
    stim[34] = 5'h09;
    stim[35] = 5'h03;
    stim[36] = 5'h01;
    stim[37] = 5'h1f;
    stim[38] = 5'h18;
    stim[39] = 5'h0c;
    stim[40] = 5'h15;
    stim[41] = 5'h0b;
    stim[42] = 5'h11;
    stim[43] = 5'h0b;
    stim[44] = 5'h14;
    stim[45] = 5'h09;
    stim[46] = 5'h17;
    stim[47] = 5'h18;
    stim[48] = 5'h19;
    stim[49] = 5'h10;
    stim[50] = 5'h00;
    stim[51] = 5'h1b;
    stim[52] = 5'h04;
    stim[53] = 5'h06;
    stim[54] = 5'h01;
    stim[55] = 5'h0f;
    stim[56] = 5'h1e;
    stim[57] = 5'h1a;
    stim[58] = 5'h12;
    stim[59] = 5'h17;
    stim[60] = 5'h01;
    stim[61] = 5'h14;
    stim[62] = 5'h18;
    stim[63] = 5'h0c;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'h000;
      expv[3] = 10'h008;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h004;
      expv[7] = 10'h004;
      expv[8] = 10'h004;
      expv[9] = 10'h104;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h001;
      expv[15] = 10'h101;
      expv[16] = 10'h101;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h004;
      expv[20] = 10'h004;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h100;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h080;
      expv[29] = 10'h080;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h080;
      expv[33] = 10'h090;
      expv[34] = 10'h090;
      expv[35] = 10'h090;
      expv[36] = 10'h090;
      expv[37] = 10'h090;
      expv[38] = 10'h090;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h010;
      expv[42] = 10'h210;
      expv[43] = 10'h230;
      expv[44] = 10'h230;
      expv[45] = 10'h000;
      expv[46] = 10'h080;
      expv[47] = 10'h088;
      expv[48] = 10'h000;
      expv[49] = 10'h004;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h002;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h008;
      expv[61] = 10'h008;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
