// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03837 dut (
    .clk(clk),
    .writeEnb(in_vec[17:17]),
    .readReg1(in_vec[16:14]),
    .readReg2(in_vec[13:11]),
    .writeReg(in_vec[10:8]),
    .writeData(in_vec[7:0]),
    .readData1(out_vec[15:8]),
    .readData2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2d7f8;
    stim[1] = 18'h06d62;
    stim[2] = 18'h0e700;
    stim[3] = 18'h35fc4;
    stim[4] = 18'h18012;
    stim[5] = 18'h16092;
    stim[6] = 18'h27fab;
    stim[7] = 18'h04b96;
    stim[8] = 18'h23a8a;
    stim[9] = 18'h314c9;
    stim[10] = 18'h2c62a;
    stim[11] = 18'h3f5ff;
    stim[12] = 18'h38631;
    stim[13] = 18'h05048;
    stim[14] = 18'h018a3;
    stim[15] = 18'h1cf74;
    stim[16] = 18'h3c964;
    stim[17] = 18'h2847e;
    stim[18] = 18'h36086;
    stim[19] = 18'h21f66;
    stim[20] = 18'h0eb60;
    stim[21] = 18'h29ef3;
    stim[22] = 18'h0fb02;
    stim[23] = 18'h33bb6;
    stim[24] = 18'h076a1;
    stim[25] = 18'h0e1fa;
    stim[26] = 18'h20cc9;
    stim[27] = 18'h3ac05;
    stim[28] = 18'h2011a;
    stim[29] = 18'h236de;
    stim[30] = 18'h03e20;
    stim[31] = 18'h2b556;
    stim[32] = 18'h2c227;
    stim[33] = 18'h35226;
    stim[34] = 18'h238d4;
    stim[35] = 18'h065c5;
    stim[36] = 18'h13005;
    stim[37] = 18'h29f1c;
    stim[38] = 18'h304aa;
    stim[39] = 18'h38e7e;
    stim[40] = 18'h3cd66;
    stim[41] = 18'h36710;
    stim[42] = 18'h14e53;
    stim[43] = 18'h2b29b;
    stim[44] = 18'h0f02b;
    stim[45] = 18'h21e1e;
    stim[46] = 18'h359fe;
    stim[47] = 18'h3d434;
    stim[48] = 18'h36f8a;
    stim[49] = 18'h3d1bc;
    stim[50] = 18'h149e2;
    stim[51] = 18'h36673;
    stim[52] = 18'h2fe34;
    stim[53] = 18'h05be1;
    stim[54] = 18'h02bcf;
    stim[55] = 18'h33153;
    stim[56] = 18'h2e478;
    stim[57] = 18'h3aeb3;
    stim[58] = 18'h16ffd;
    stim[59] = 18'h2484e;
    stim[60] = 18'h1ac2e;
    stim[61] = 18'h06cca;
    stim[62] = 18'h129e4;
    stim[63] = 18'h2b463;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h00c4;
      expv[7] = 16'h0000;
      expv[8] = 16'h00ab;
      expv[9] = 16'h008a;
      expv[10] = 16'h0000;
      expv[11] = 16'hab2a;
      expv[12] = 16'h2a00;
      expv[13] = 16'h008a;
      expv[14] = 16'h0000;
      expv[15] = 16'hab00;
      expv[16] = 16'hab00;
      expv[17] = 16'h8a00;
      expv[18] = 16'hff7e;
      expv[19] = 16'h0000;
      expv[20] = 16'h00ff;
      expv[21] = 16'h8a00;
      expv[22] = 16'h0066;
      expv[23] = 16'h7e66;
      expv[24] = 16'h64f3;
      expv[25] = 16'hb67e;
      expv[26] = 16'h0064;
      expv[27] = 16'hf3ff;
      expv[28] = 16'h0000;
      expv[29] = 16'h00f3;
      expv[30] = 16'h0066;
      expv[31] = 16'h8ade;
      expv[32] = 16'hb600;
      expv[33] = 16'h5627;
      expv[34] = 16'h0066;
      expv[35] = 16'h1a05;
      expv[36] = 16'h05de;
      expv[37] = 16'h26b6;
      expv[38] = 16'h0500;
      expv[39] = 16'hde1a;
      expv[40] = 16'h1c1a;
      expv[41] = 16'h66aa;
      expv[42] = 16'h661a;
      expv[43] = 16'h267e;
      expv[44] = 16'hb67e;
      expv[45] = 16'h00b6;
      expv[46] = 16'h66b6;
      expv[47] = 16'h109b;
      expv[48] = 16'h6666;
      expv[49] = 16'h8a9b;
      expv[50] = 16'h66bc;
      expv[51] = 16'h6634;
      expv[52] = 16'hb68a;
      expv[53] = 16'hbcb6;
      expv[54] = 16'h0066;
      expv[55] = 16'h3434;
      expv[56] = 16'hb634;
      expv[57] = 16'h3466;
      expv[58] = 16'h6666;
      expv[59] = 16'h5353;
      expv[60] = 16'hb366;
      expv[61] = 16'h5366;
      expv[62] = 16'h7866;
      expv[63] = 16'h9bb3;
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
