// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07087 dut (
    .clk(clk),
    .ER_CDE(in_vec[7:0]),
    .HEX0(out_vec[28:22]),
    .HEX1(out_vec[21:15]),
    .HEX2(out_vec[14:8]),
    .HEX3(out_vec[7:1]),
    .HEX1DP(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h2e;
    stim[1] = 8'h19;
    stim[2] = 8'h45;
    stim[3] = 8'h8e;
    stim[4] = 8'h09;
    stim[5] = 8'h46;
    stim[6] = 8'h57;
    stim[7] = 8'h72;
    stim[8] = 8'hc6;
    stim[9] = 8'ha9;
    stim[10] = 8'h6d;
    stim[11] = 8'h3a;
    stim[12] = 8'h6c;
    stim[13] = 8'h97;
    stim[14] = 8'hbe;
    stim[15] = 8'h78;
    stim[16] = 8'ha5;
    stim[17] = 8'h85;
    stim[18] = 8'hb6;
    stim[19] = 8'h95;
    stim[20] = 8'h0f;
    stim[21] = 8'hcf;
    stim[22] = 8'he2;
    stim[23] = 8'h2d;
    stim[24] = 8'he4;
    stim[25] = 8'h4c;
    stim[26] = 8'h73;
    stim[27] = 8'ha3;
    stim[28] = 8'h66;
    stim[29] = 8'ha9;
    stim[30] = 8'hb8;
    stim[31] = 8'h8d;
    stim[32] = 8'h62;
    stim[33] = 8'hc0;
    stim[34] = 8'h56;
    stim[35] = 8'h1c;
    stim[36] = 8'hd5;
    stim[37] = 8'h45;
    stim[38] = 8'h1b;
    stim[39] = 8'h78;
    stim[40] = 8'h22;
    stim[41] = 8'hc7;
    stim[42] = 8'hf2;
    stim[43] = 8'h15;
    stim[44] = 8'h86;
    stim[45] = 8'h77;
    stim[46] = 8'h96;
    stim[47] = 8'hda;
    stim[48] = 8'he7;
    stim[49] = 8'h8e;
    stim[50] = 8'h97;
    stim[51] = 8'hc0;
    stim[52] = 8'h7a;
    stim[53] = 8'h52;
    stim[54] = 8'h9f;
    stim[55] = 8'h20;
    stim[56] = 8'hb2;
    stim[57] = 8'h9d;
    stim[58] = 8'h32;
    stim[59] = 8'hdf;
    stim[60] = 8'h6f;
    stim[61] = 8'h90;
    stim[62] = 8'h05;
    stim[63] = 8'h29;
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
      expv[0] = 29'hxxxxxxxx;
      expv[1] = 29'hxxxxxxxx;
      expv[2] = 29'hxxxxxxxx;
      expv[3] = 29'hxxxxxxxx;
      expv[4] = 29'hxxxxxxxx;
      expv[5] = 29'hxxxxxxxx;
      expv[6] = 29'hxxxxxxxx;
      expv[7] = 29'hxxxxxxxx;
      expv[8] = 29'hxxxxxxxx;
      expv[9] = 29'hxxxxxxxx;
      expv[10] = 29'hxxxxxxxx;
      expv[11] = 29'hxxxxxxxx;
      expv[12] = 29'hxxxxxxxx;
      expv[13] = 29'hxxxxxxxx;
      expv[14] = 29'hxxxxxxxx;
      expv[15] = 29'hxxxxxxxx;
      expv[16] = 29'hxxxxxxxx;
      expv[17] = 29'hxxxxxxxx;
      expv[18] = 29'hxxxxxxxx;
      expv[19] = 29'hxxxxxxxx;
      expv[20] = 29'hxxxxxxxx;
      expv[21] = 29'hxxxxxxxx;
      expv[22] = 29'hxxxxxxxx;
      expv[23] = 29'hxxxxxxxx;
      expv[24] = 29'hxxxxxxxx;
      expv[25] = 29'hxxxxxxxx;
      expv[26] = 29'hxxxxxxxx;
      expv[27] = 29'hxxxxxxxx;
      expv[28] = 29'hxxxxxxxx;
      expv[29] = 29'hxxxxxxxx;
      expv[30] = 29'hxxxxxxxx;
      expv[31] = 29'hxxxxxxxx;
      expv[32] = 29'hxxxxxxxx;
      expv[33] = 29'hxxxxxxxx;
      expv[34] = 29'hxxxxxxxx;
      expv[35] = 29'hxxxxxxxx;
      expv[36] = 29'hxxxxxxxx;
      expv[37] = 29'hxxxxxxxx;
      expv[38] = 29'hxxxxxxxx;
      expv[39] = 29'hxxxxxxxx;
      expv[40] = 29'hxxxxxxxx;
      expv[41] = 29'hxxxxxxxx;
      expv[42] = 29'hxxxxxxxx;
      expv[43] = 29'hxxxxxxxx;
      expv[44] = 29'hxxxxxxxx;
      expv[45] = 29'hxxxxxxxx;
      expv[46] = 29'hxxxxxxxx;
      expv[47] = 29'hxxxxxxxx;
      expv[48] = 29'hxxxxxxxx;
      expv[49] = 29'hxxxxxxxx;
      expv[50] = 29'hxxxxxxxx;
      expv[51] = 29'hxxxxxxxx;
      expv[52] = 29'hxxxxxxxx;
      expv[53] = 29'hxxxxxxxx;
      expv[54] = 29'hxxxxxxxx;
      expv[55] = 29'hxxxxxxxx;
      expv[56] = 29'hxxxxxxxx;
      expv[57] = 29'hxxxxxxxx;
      expv[58] = 29'hxxxxxxxx;
      expv[59] = 29'hxxxxxxxx;
      expv[60] = 29'hxxxxxxxx;
      expv[61] = 29'hxxxxxxxx;
      expv[62] = 29'hxxxxxxxx;
      expv[63] = 29'h1e683fdb;
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
