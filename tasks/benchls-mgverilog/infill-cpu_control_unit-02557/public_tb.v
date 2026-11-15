// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02557 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .Zero(in_vec[7:7]),
    .Cout(in_vec[6:6]),
    .cntlInstruc(in_vec[5:0]),
    .RdOrR2(out_vec[7:7]),
    .AluOrMem(out_vec[6:6]),
    .RFWE(out_vec[5:5]),
    .MWE(out_vec[4:4]),
    .stackContrl(out_vec[3:2]),
    .pcContrl(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1f8;
    stim[1] = 9'h199;
    stim[2] = 9'h016;
    stim[3] = 9'h01f;
    stim[4] = 9'h00c;
    stim[5] = 9'h0f3;
    stim[6] = 9'h064;
    stim[7] = 9'h0c9;
    stim[8] = 9'h0d6;
    stim[9] = 9'h0f4;
    stim[10] = 9'h0e6;
    stim[11] = 9'h016;
    stim[12] = 9'h029;
    stim[13] = 9'h0b0;
    stim[14] = 9'h01a;
    stim[15] = 9'h042;
    stim[16] = 9'h1ee;
    stim[17] = 9'h0d7;
    stim[18] = 9'h083;
    stim[19] = 9'h0e1;
    stim[20] = 9'h0f2;
    stim[21] = 9'h0e7;
    stim[22] = 9'h0ca;
    stim[23] = 9'h00f;
    stim[24] = 9'h0bc;
    stim[25] = 9'h0f7;
    stim[26] = 9'h027;
    stim[27] = 9'h0ed;
    stim[28] = 9'h0ab;
    stim[29] = 9'h075;
    stim[30] = 9'h08c;
    stim[31] = 9'h08f;
    stim[32] = 9'h0cd;
    stim[33] = 9'h0d3;
    stim[34] = 9'h003;
    stim[35] = 9'h0c2;
    stim[36] = 9'h07b;
    stim[37] = 9'h04d;
    stim[38] = 9'h09d;
    stim[39] = 9'h044;
    stim[40] = 9'h07d;
    stim[41] = 9'h026;
    stim[42] = 9'h018;
    stim[43] = 9'h07b;
    stim[44] = 9'h0d5;
    stim[45] = 9'h083;
    stim[46] = 9'h0af;
    stim[47] = 9'h030;
    stim[48] = 9'h06d;
    stim[49] = 9'h07f;
    stim[50] = 9'h06c;
    stim[51] = 9'h05c;
    stim[52] = 9'h0fc;
    stim[53] = 9'h038;
    stim[54] = 9'h09d;
    stim[55] = 9'h0d3;
    stim[56] = 9'h0ef;
    stim[57] = 9'h023;
    stim[58] = 9'h01d;
    stim[59] = 9'h072;
    stim[60] = 9'h058;
    stim[61] = 9'h0f1;
    stim[62] = 9'h0e6;
    stim[63] = 9'h06c;
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
      expv[0] = 8'h43;
      expv[1] = 8'h60;
      expv[2] = 8'h60;
      expv[3] = 8'h60;
      expv[4] = 8'h60;
      expv[5] = 8'h60;
      expv[6] = 8'h00;
      expv[7] = 8'h60;
      expv[8] = 8'h60;
      expv[9] = 8'h60;
      expv[10] = 8'h00;
      expv[11] = 8'h60;
      expv[12] = 8'h40;
      expv[13] = 8'h60;
      expv[14] = 8'h60;
      expv[15] = 8'h60;
      expv[16] = 8'h40;
      expv[17] = 8'h60;
      expv[18] = 8'h60;
      expv[19] = 8'h20;
      expv[20] = 8'h60;
      expv[21] = 8'h00;
      expv[22] = 8'h60;
      expv[23] = 8'h60;
      expv[24] = 8'h4a;
      expv[25] = 8'h60;
      expv[26] = 8'h00;
      expv[27] = 8'h41;
      expv[28] = 8'h40;
      expv[29] = 8'h60;
      expv[30] = 8'h60;
      expv[31] = 8'h60;
      expv[32] = 8'h60;
      expv[33] = 8'h60;
      expv[34] = 8'h60;
      expv[35] = 8'h60;
      expv[36] = 8'h47;
      expv[37] = 8'h60;
      expv[38] = 8'h60;
      expv[39] = 8'h60;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h60;
      expv[43] = 8'h47;
      expv[44] = 8'h60;
      expv[45] = 8'h60;
      expv[46] = 8'h41;
      expv[47] = 8'h60;
      expv[48] = 8'h41;
      expv[49] = 8'h00;
      expv[50] = 8'h41;
      expv[51] = 8'h60;
      expv[52] = 8'h4a;
      expv[53] = 8'h43;
      expv[54] = 8'h60;
      expv[55] = 8'h60;
      expv[56] = 8'h40;
      expv[57] = 8'hd0;
      expv[58] = 8'h60;
      expv[59] = 8'h60;
      expv[60] = 8'h60;
      expv[61] = 8'h60;
      expv[62] = 8'h00;
      expv[63] = 8'h41;
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
