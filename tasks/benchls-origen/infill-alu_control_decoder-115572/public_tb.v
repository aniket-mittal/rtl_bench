// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115572 dut (
    .clk(clk),
    .rst(in_vec[20:20]),
    .Immediate(in_vec[19:4]),
    .ALUOp(in_vec[3:0]),
    .ALU_Sel(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h13d8dc;
    stim[1] = 21'h134368;
    stim[2] = 21'h0cf2ed;
    stim[3] = 21'h0a1698;
    stim[4] = 21'h0a101e;
    stim[5] = 21'h0602ee;
    stim[6] = 21'h028661;
    stim[7] = 21'h00e86f;
    stim[8] = 21'h05d0c9;
    stim[9] = 21'h0c9796;
    stim[10] = 21'h0dfd5a;
    stim[11] = 21'h03c7fd;
    stim[12] = 21'h0b5744;
    stim[13] = 21'h056af6;
    stim[14] = 21'h085160;
    stim[15] = 21'h034364;
    stim[16] = 21'h07d253;
    stim[17] = 21'h0c4863;
    stim[18] = 21'h029700;
    stim[19] = 21'h070687;
    stim[20] = 21'h08f3b9;
    stim[21] = 21'h098e9e;
    stim[22] = 21'h02ad91;
    stim[23] = 21'h0c37b1;
    stim[24] = 21'h0f633d;
    stim[25] = 21'h06785d;
    stim[26] = 21'h070268;
    stim[27] = 21'h0ada07;
    stim[28] = 21'h01dee3;
    stim[29] = 21'h068fab;
    stim[30] = 21'h0d47a4;
    stim[31] = 21'h0f45fa;
    stim[32] = 21'h0a0fe8;
    stim[33] = 21'h030513;
    stim[34] = 21'h0c76f2;
    stim[35] = 21'h06de52;
    stim[36] = 21'h031a61;
    stim[37] = 21'h06446a;
    stim[38] = 21'h0304b5;
    stim[39] = 21'h0a3e89;
    stim[40] = 21'h08e748;
    stim[41] = 21'h03db49;
    stim[42] = 21'h06929c;
    stim[43] = 21'h0f948f;
    stim[44] = 21'h0bb2c5;
    stim[45] = 21'h0f1048;
    stim[46] = 21'h03e3e3;
    stim[47] = 21'h06cea2;
    stim[48] = 21'h09ac17;
    stim[49] = 21'h09fc48;
    stim[50] = 21'h0ec349;
    stim[51] = 21'h047831;
    stim[52] = 21'h006eb7;
    stim[53] = 21'h02b8f0;
    stim[54] = 21'h03bbff;
    stim[55] = 21'h096908;
    stim[56] = 21'h02ec96;
    stim[57] = 21'h07ab74;
    stim[58] = 21'h03ece4;
    stim[59] = 21'h09d5e9;
    stim[60] = 21'h07dde1;
    stim[61] = 21'h08f5be;
    stim[62] = 21'h072991;
    stim[63] = 21'h0961e9;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h0d;
      expv[4] = 5'h0e;
      expv[5] = 5'h0e;
      expv[6] = 5'h0e;
      expv[7] = 5'h04;
      expv[8] = 5'h0f;
      expv[9] = 5'h0f;
      expv[10] = 5'h04;
      expv[11] = 5'h0a;
      expv[12] = 5'h0d;
      expv[13] = 5'h07;
      expv[14] = 5'h04;
      expv[15] = 5'h00;
      expv[16] = 5'h07;
      expv[17] = 5'h06;
      expv[18] = 5'h06;
      expv[19] = 5'h00;
      expv[20] = 5'h04;
      expv[21] = 5'h0f;
      expv[22] = 5'h0e;
      expv[23] = 5'h04;
      expv[24] = 5'h04;
      expv[25] = 5'h0d;
      expv[26] = 5'h0d;
      expv[27] = 5'h0e;
      expv[28] = 5'h04;
      expv[29] = 5'h06;
      expv[30] = 5'h0b;
      expv[31] = 5'h07;
      expv[32] = 5'h0a;
      expv[33] = 5'h0e;
      expv[34] = 5'h06;
      expv[35] = 5'h04;
      expv[36] = 5'h04;
      expv[37] = 5'h04;
      expv[38] = 5'h0a;
      expv[39] = 5'h08;
      expv[40] = 5'h0f;
      expv[41] = 5'h0e;
      expv[42] = 5'h0f;
      expv[43] = 5'h0c;
      expv[44] = 5'h0f;
      expv[45] = 5'h08;
      expv[46] = 5'h0e;
      expv[47] = 5'h06;
      expv[48] = 5'h04;
      expv[49] = 5'h04;
      expv[50] = 5'h0e;
      expv[51] = 5'h0f;
      expv[52] = 5'h04;
      expv[53] = 5'h04;
      expv[54] = 5'h0d;
      expv[55] = 5'h0f;
      expv[56] = 5'h0e;
      expv[57] = 5'h04;
      expv[58] = 5'h07;
      expv[59] = 5'h07;
      expv[60] = 5'h0f;
      expv[61] = 5'h04;
      expv[62] = 5'h0e;
      expv[63] = 5'h04;
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
