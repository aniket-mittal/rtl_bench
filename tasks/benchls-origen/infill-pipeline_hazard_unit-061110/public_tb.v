// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061110 dut (
    .clk(clk),
    .reset(in_vec[36:36]),
    .intterupt(in_vec[35:35]),
    .MemReadEX(in_vec[34:34]),
    .BranchID(in_vec[33:33]),
    .JRID(in_vec[32:32]),
    .MemReadMEM(in_vec[31:31]),
    .RegWriteEX(in_vec[30:30]),
    .regwriteaddrEX(in_vec[29:25]),
    .rtaddrEX(in_vec[24:20]),
    .rsaddrID(in_vec[19:15]),
    .rtaddrID(in_vec[14:10]),
    .regwriteaddrMEM(in_vec[9:5]),
    .PCSrcID(in_vec[4:2]),
    .MemtoRegMEM(in_vec[1:0]),
    .stall(out_vec[1:1]),
    .flush(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1ee1a2b771;
    stim[1] = 37'h17311ca22c;
    stim[2] = 37'h070cb3d5fb;
    stim[3] = 37'h052e738927;
    stim[4] = 37'h035b000c77;
    stim[5] = 37'h0c06164d4e;
    stim[6] = 37'h0399d3f517;
    stim[7] = 37'h0b8119c34b;
    stim[8] = 37'h05b8a2635b;
    stim[9] = 37'h06906de466;
    stim[10] = 37'h029acbc31a;
    stim[11] = 37'h0eaf05a078;
    stim[12] = 37'h0a79381121;
    stim[13] = 37'h06a7d68760;
    stim[14] = 37'h0c5a4d60f1;
    stim[15] = 37'h0e9ced65ba;
    stim[16] = 37'h0eca8f57bf;
    stim[17] = 37'h0631cb0bd5;
    stim[18] = 37'h045bf7db1b;
    stim[19] = 37'h0e72018dbe;
    stim[20] = 37'h0f5fd10388;
    stim[21] = 37'h07c16b32f1;
    stim[22] = 37'h0d90e478d7;
    stim[23] = 37'h05156a7472;
    stim[24] = 37'h0e8d37284c;
    stim[25] = 37'h01c63ae01e;
    stim[26] = 37'h0bd5417363;
    stim[27] = 37'h0594017fd2;
    stim[28] = 37'h06153a611c;
    stim[29] = 37'h0404af91b2;
    stim[30] = 37'h0cc53e0d49;
    stim[31] = 37'h024ab3ad9f;
    stim[32] = 37'h09c7bf8257;
    stim[33] = 37'h092ea5d2f0;
    stim[34] = 37'h07744d014b;
    stim[35] = 37'h078b4a80f2;
    stim[36] = 37'h06dba9a896;
    stim[37] = 37'h0122169b17;
    stim[38] = 37'h04079601eb;
    stim[39] = 37'h1bb7f89f3a;
    stim[40] = 37'h092fdc1d08;
    stim[41] = 37'h0c2bcf833f;
    stim[42] = 37'h073730b7c5;
    stim[43] = 37'h0b7f6214ae;
    stim[44] = 37'h0d0bafdb35;
    stim[45] = 37'h0a635a4d2a;
    stim[46] = 37'h0ab13fe787;
    stim[47] = 37'h0e73a75c42;
    stim[48] = 37'h02d5105148;
    stim[49] = 37'h0744effc74;
    stim[50] = 37'h05462f80e6;
    stim[51] = 37'h0f85acecea;
    stim[52] = 37'h0f962db25d;
    stim[53] = 37'h032749422d;
    stim[54] = 37'h1b5547a7a6;
    stim[55] = 37'h0844ac4807;
    stim[56] = 37'h090506887e;
    stim[57] = 37'h0ba7b382cd;
    stim[58] = 37'h0115619148;
    stim[59] = 37'h092525d307;
    stim[60] = 37'h0e553bdfda;
    stim[61] = 37'h02b5bc8d75;
    stim[62] = 37'h01c3ead6ec;
    stim[63] = 37'h04120106b6;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h2;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h0;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h2;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h2;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
