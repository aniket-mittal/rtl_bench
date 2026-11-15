// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07624 dut (
    .CLK(clk),
    .NOTE(in_vec[6:0]),
    .ADDER(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h52;
    stim[1] = 7'h02;
    stim[2] = 7'h66;
    stim[3] = 7'h5e;
    stim[4] = 7'h04;
    stim[5] = 7'h3f;
    stim[6] = 7'h21;
    stim[7] = 7'h66;
    stim[8] = 7'h3a;
    stim[9] = 7'h42;
    stim[10] = 7'h0e;
    stim[11] = 7'h39;
    stim[12] = 7'h05;
    stim[13] = 7'h14;
    stim[14] = 7'h55;
    stim[15] = 7'h62;
    stim[16] = 7'h5c;
    stim[17] = 7'h35;
    stim[18] = 7'h61;
    stim[19] = 7'h05;
    stim[20] = 7'h07;
    stim[21] = 7'h59;
    stim[22] = 7'h6c;
    stim[23] = 7'h18;
    stim[24] = 7'h3c;
    stim[25] = 7'h31;
    stim[26] = 7'h19;
    stim[27] = 7'h2d;
    stim[28] = 7'h16;
    stim[29] = 7'h34;
    stim[30] = 7'h08;
    stim[31] = 7'h4c;
    stim[32] = 7'h2c;
    stim[33] = 7'h25;
    stim[34] = 7'h48;
    stim[35] = 7'h45;
    stim[36] = 7'h58;
    stim[37] = 7'h05;
    stim[38] = 7'h77;
    stim[39] = 7'h5c;
    stim[40] = 7'h77;
    stim[41] = 7'h61;
    stim[42] = 7'h15;
    stim[43] = 7'h7b;
    stim[44] = 7'h0e;
    stim[45] = 7'h54;
    stim[46] = 7'h7a;
    stim[47] = 7'h37;
    stim[48] = 7'h2b;
    stim[49] = 7'h10;
    stim[50] = 7'h64;
    stim[51] = 7'h09;
    stim[52] = 7'h0a;
    stim[53] = 7'h7a;
    stim[54] = 7'h22;
    stim[55] = 7'h6d;
    stim[56] = 7'h34;
    stim[57] = 7'h01;
    stim[58] = 7'h69;
    stim[59] = 7'h0f;
    stim[60] = 7'h3e;
    stim[61] = 7'h4c;
    stim[62] = 7'h11;
    stim[63] = 7'h30;
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
      expv[0] = 32'h00057c97;
      expv[1] = 32'h00009c6b;
      expv[2] = 32'h0000018a;
      expv[3] = 32'h0001f099;
      expv[4] = 32'h000138d6;
      expv[5] = 32'h000001ba;
      expv[6] = 32'h00003432;
      expv[7] = 32'h0000093a;
      expv[8] = 32'h0001f099;
      expv[9] = 32'h0000271a;
      expv[10] = 32'h00003e13;
      expv[11] = 32'h00000314;
      expv[12] = 32'h000024e8;
      expv[13] = 32'h000001d4;
      expv[14] = 32'h0000045a;
      expv[15] = 32'h0000ba03;
      expv[16] = 32'h00018a26;
      expv[17] = 32'h000116b4;
      expv[18] = 32'h00001d4b;
      expv[19] = 32'h00017407;
      expv[20] = 32'h000001d4;
      expv[21] = 32'h0000020e;
      expv[22] = 32'h0000ea5d;
      expv[23] = 32'h0002be4b;
      expv[24] = 32'h0000057c;
      expv[25] = 32'h00002be4;
      expv[26] = 32'h00001740;
      expv[27] = 32'h000005d0;
      expv[28] = 32'h00001274;
      expv[29] = 32'h000004e3;
      expv[30] = 32'h00001ba6;
      expv[31] = 32'h0000022d;
      expv[32] = 32'h00006e9a;
      expv[33] = 32'h0000116b;
      expv[34] = 32'h00000ba0;
      expv[35] = 32'h000057c9;
      expv[36] = 32'h000049d1;
      expv[37] = 32'h0000dd35;
      expv[38] = 32'h000001d4;
      expv[39] = 32'h00052dc2;
      expv[40] = 32'h000116b4;
      expv[41] = 32'h00052dc2;
      expv[42] = 32'h00017407;
      expv[43] = 32'h0000049d;
      expv[44] = 32'h0006865a;
      expv[45] = 32'h00000314;
      expv[46] = 32'h0000af92;
      expv[47] = 32'h0006289a;
      expv[48] = 32'h000020e2;
      expv[49] = 32'h00001071;
      expv[50] = 32'h00000374;
      expv[51] = 32'h0001ba6b;
      expv[52] = 32'h0000024e;
      expv[53] = 32'h00000271;
      expv[54] = 32'h0006289a;
      expv[55] = 32'h000009c6;
      expv[56] = 32'h0002e80e;
      expv[57] = 32'h00001ba6;
      expv[58] = 32'h00000174;
      expv[59] = 32'h00024e8e;
      expv[60] = 32'h00000343;
      expv[61] = 32'h00003144;
      expv[62] = 32'h00006e9a;
      expv[63] = 32'h000003a9;
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
