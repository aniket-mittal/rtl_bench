// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07351 dut (
    .clk(clk),
    .ce(in_vec[14:14]),
    .a(in_vec[13:6]),
    .b(in_vec[5:0]),
    .p(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h1e7b;
    stim[1] = 15'h07c0;
    stim[2] = 15'h5253;
    stim[3] = 15'h511d;
    stim[4] = 15'h79a2;
    stim[5] = 15'h430e;
    stim[6] = 15'h22e2;
    stim[7] = 15'h4ff4;
    stim[8] = 15'h3f62;
    stim[9] = 15'h5381;
    stim[10] = 15'h7eb1;
    stim[11] = 15'h5b05;
    stim[12] = 15'h38c2;
    stim[13] = 15'h26e9;
    stim[14] = 15'h3a51;
    stim[15] = 15'h27a3;
    stim[16] = 15'h5e10;
    stim[17] = 15'h24b6;
    stim[18] = 15'h5d49;
    stim[19] = 15'h75ff;
    stim[20] = 15'h3d77;
    stim[21] = 15'h489c;
    stim[22] = 15'h6cf7;
    stim[23] = 15'h4d4c;
    stim[24] = 15'h2614;
    stim[25] = 15'h2433;
    stim[26] = 15'h04db;
    stim[27] = 15'h1b07;
    stim[28] = 15'h6c0e;
    stim[29] = 15'h06c9;
    stim[30] = 15'h7a84;
    stim[31] = 15'h74a0;
    stim[32] = 15'h7aa1;
    stim[33] = 15'h7ef4;
    stim[34] = 15'h5a73;
    stim[35] = 15'h1f4a;
    stim[36] = 15'h26b4;
    stim[37] = 15'h5259;
    stim[38] = 15'h1f5d;
    stim[39] = 15'h5721;
    stim[40] = 15'h0643;
    stim[41] = 15'h384a;
    stim[42] = 15'h5d52;
    stim[43] = 15'h57ce;
    stim[44] = 15'h0aa4;
    stim[45] = 15'h5c3b;
    stim[46] = 15'h1f28;
    stim[47] = 15'h0198;
    stim[48] = 15'h5124;
    stim[49] = 15'h4fe2;
    stim[50] = 15'h5753;
    stim[51] = 15'h6f0a;
    stim[52] = 15'h72ad;
    stim[53] = 15'h4ca0;
    stim[54] = 15'h2718;
    stim[55] = 15'h58c0;
    stim[56] = 15'h3e00;
    stim[57] = 15'h002d;
    stim[58] = 15'h59e6;
    stim[59] = 15'h5426;
    stim[60] = 15'h0908;
    stim[61] = 15'h6452;
    stim[62] = 15'h174d;
    stim[63] = 15'h3aad;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'hxxxx;
      expv[2] = 13'hxxxx;
      expv[3] = 13'hxxxx;
      expv[4] = 13'h056b;
      expv[5] = 13'h07b4;
      expv[6] = 13'h1e8c;
      expv[7] = 13'h1e8c;
      expv[8] = 13'h00a8;
      expv[9] = 13'h00a8;
      expv[10] = 13'h0ccc;
      expv[11] = 13'h004e;
      expv[12] = 13'h0fda;
      expv[13] = 13'h0fda;
      expv[14] = 13'h0fda;
      expv[15] = 13'h0fda;
      expv[16] = 13'h0fda;
      expv[17] = 13'h021c;
      expv[18] = 13'h021c;
      expv[19] = 13'h0780;
      expv[20] = 13'h041d;
      expv[21] = 13'h041d;
      expv[22] = 13'h14e9;
      expv[23] = 13'h03b8;
      expv[24] = 13'h0675;
      expv[25] = 13'h0675;
      expv[26] = 13'h0675;
      expv[27] = 13'h0675;
      expv[28] = 13'h0675;
      expv[29] = 13'h027c;
      expv[30] = 13'h027c;
      expv[31] = 13'h09a0;
      expv[32] = 13'h03a8;
      expv[33] = 13'h1a40;
      expv[34] = 13'h1e2a;
      expv[35] = 13'h12fc;
      expv[36] = 13'h12fc;
      expv[37] = 13'h12fc;
      expv[38] = 13'h14eb;
      expv[39] = 13'h14eb;
      expv[40] = 13'h0721;
      expv[41] = 13'h0721;
      expv[42] = 13'h0721;
      expv[43] = 13'h0bdc;
      expv[44] = 13'h083a;
      expv[45] = 13'h083a;
      expv[46] = 13'h0532;
      expv[47] = 13'h0532;
      expv[48] = 13'h0532;
      expv[49] = 13'h19d0;
      expv[50] = 13'h0990;
      expv[51] = 13'h085e;
      expv[52] = 13'h06e7;
      expv[53] = 13'h0758;
      expv[54] = 13'h0382;
      expv[55] = 13'h0382;
      expv[56] = 13'h0640;
      expv[57] = 13'h0640;
      expv[58] = 13'h0640;
      expv[59] = 13'h0000;
      expv[60] = 13'h0f4a;
      expv[61] = 13'h0f4a;
      expv[62] = 13'h0be0;
      expv[63] = 13'h0be0;
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
