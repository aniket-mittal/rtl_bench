// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062145 dut (
    .clock(clk),
    .io_d(in_vec[14:0]),
    .io_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h5d4f;
    stim[1] = 15'h4d57;
    stim[2] = 15'h1813;
    stim[3] = 15'h5be0;
    stim[4] = 15'h3e13;
    stim[5] = 15'h40ab;
    stim[6] = 15'h537f;
    stim[7] = 15'h7e6e;
    stim[8] = 15'h72db;
    stim[9] = 15'h4d02;
    stim[10] = 15'h0e19;
    stim[11] = 15'h177b;
    stim[12] = 15'h2681;
    stim[13] = 15'h69cd;
    stim[14] = 15'h6663;
    stim[15] = 15'h3b9d;
    stim[16] = 15'h3bff;
    stim[17] = 15'h6dc1;
    stim[18] = 15'h0971;
    stim[19] = 15'h0937;
    stim[20] = 15'h4cc4;
    stim[21] = 15'h5aaf;
    stim[22] = 15'h5303;
    stim[23] = 15'h0f56;
    stim[24] = 15'h634b;
    stim[25] = 15'h5e3d;
    stim[26] = 15'h466a;
    stim[27] = 15'h60b7;
    stim[28] = 15'h3816;
    stim[29] = 15'h11d1;
    stim[30] = 15'h0876;
    stim[31] = 15'h41df;
    stim[32] = 15'h4d28;
    stim[33] = 15'h2cb4;
    stim[34] = 15'h1bba;
    stim[35] = 15'h48bb;
    stim[36] = 15'h6a1f;
    stim[37] = 15'h05d7;
    stim[38] = 15'h10b2;
    stim[39] = 15'h18fc;
    stim[40] = 15'h3228;
    stim[41] = 15'h6c0a;
    stim[42] = 15'h1e8c;
    stim[43] = 15'h067e;
    stim[44] = 15'h2d4e;
    stim[45] = 15'h6af3;
    stim[46] = 15'h5cb6;
    stim[47] = 15'h56aa;
    stim[48] = 15'h6d5e;
    stim[49] = 15'h7325;
    stim[50] = 15'h0c7a;
    stim[51] = 15'h6e8c;
    stim[52] = 15'h10d8;
    stim[53] = 15'h526f;
    stim[54] = 15'h5dd8;
    stim[55] = 15'h0143;
    stim[56] = 15'h4e34;
    stim[57] = 15'h4c2d;
    stim[58] = 15'h3f56;
    stim[59] = 15'h7dc7;
    stim[60] = 15'h21a6;
    stim[61] = 15'h4dcc;
    stim[62] = 15'h3e80;
    stim[63] = 15'h7805;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h5d4f;
      expv[2] = 15'h4d57;
      expv[3] = 15'h1813;
      expv[4] = 15'h5be0;
      expv[5] = 15'h3e13;
      expv[6] = 15'h40ab;
      expv[7] = 15'h537f;
      expv[8] = 15'h7e6e;
      expv[9] = 15'h72db;
      expv[10] = 15'h4d02;
      expv[11] = 15'h0e19;
      expv[12] = 15'h177b;
      expv[13] = 15'h2681;
      expv[14] = 15'h69cd;
      expv[15] = 15'h6663;
      expv[16] = 15'h3b9d;
      expv[17] = 15'h3bff;
      expv[18] = 15'h6dc1;
      expv[19] = 15'h0971;
      expv[20] = 15'h0937;
      expv[21] = 15'h4cc4;
      expv[22] = 15'h5aaf;
      expv[23] = 15'h5303;
      expv[24] = 15'h0f56;
      expv[25] = 15'h634b;
      expv[26] = 15'h5e3d;
      expv[27] = 15'h466a;
      expv[28] = 15'h60b7;
      expv[29] = 15'h3816;
      expv[30] = 15'h11d1;
      expv[31] = 15'h0876;
      expv[32] = 15'h41df;
      expv[33] = 15'h4d28;
      expv[34] = 15'h2cb4;
      expv[35] = 15'h1bba;
      expv[36] = 15'h48bb;
      expv[37] = 15'h6a1f;
      expv[38] = 15'h05d7;
      expv[39] = 15'h10b2;
      expv[40] = 15'h18fc;
      expv[41] = 15'h3228;
      expv[42] = 15'h6c0a;
      expv[43] = 15'h1e8c;
      expv[44] = 15'h067e;
      expv[45] = 15'h2d4e;
      expv[46] = 15'h6af3;
      expv[47] = 15'h5cb6;
      expv[48] = 15'h56aa;
      expv[49] = 15'h6d5e;
      expv[50] = 15'h7325;
      expv[51] = 15'h0c7a;
      expv[52] = 15'h6e8c;
      expv[53] = 15'h10d8;
      expv[54] = 15'h526f;
      expv[55] = 15'h5dd8;
      expv[56] = 15'h0143;
      expv[57] = 15'h4e34;
      expv[58] = 15'h4c2d;
      expv[59] = 15'h3f56;
      expv[60] = 15'h7dc7;
      expv[61] = 15'h21a6;
      expv[62] = 15'h4dcc;
      expv[63] = 15'h3e80;
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
