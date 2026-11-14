// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h5dc1;
    stim[1] = 16'hbb4c;
    stim[2] = 16'hc6c9;
    stim[3] = 16'heb50;
    stim[4] = 16'he9aa;
    stim[5] = 16'he9e5;
    stim[6] = 16'hec2e;
    stim[7] = 16'h6eb1;
    stim[8] = 16'hf4b5;
    stim[9] = 16'h0af0;
    stim[10] = 16'h61df;
    stim[11] = 16'he0c2;
    stim[12] = 16'h4403;
    stim[13] = 16'h86a2;
    stim[14] = 16'h1366;
    stim[15] = 16'hc099;
    stim[16] = 16'h2eb9;
    stim[17] = 16'h0120;
    stim[18] = 16'hf4f7;
    stim[19] = 16'hf4d2;
    stim[20] = 16'h3411;
    stim[21] = 16'h217c;
    stim[22] = 16'hc60f;
    stim[23] = 16'h44c8;
    stim[24] = 16'h8a36;
    stim[25] = 16'h6825;
    stim[26] = 16'h963c;
    stim[27] = 16'h8737;
    stim[28] = 16'h3515;
    stim[29] = 16'hfb68;
    stim[30] = 16'h4a71;
    stim[31] = 16'h03e4;
    stim[32] = 16'h7206;
    stim[33] = 16'h2739;
    stim[34] = 16'h8a76;
    stim[35] = 16'he1dd;
    stim[36] = 16'h3643;
    stim[37] = 16'h04ec;
    stim[38] = 16'hd4e7;
    stim[39] = 16'hc38c;
    stim[40] = 16'h85af;
    stim[41] = 16'h6837;
    stim[42] = 16'h61e6;
    stim[43] = 16'hcede;
    stim[44] = 16'hcc6d;
    stim[45] = 16'h24fe;
    stim[46] = 16'h9db2;
    stim[47] = 16'hd737;
    stim[48] = 16'ha11f;
    stim[49] = 16'h7877;
    stim[50] = 16'hdf5a;
    stim[51] = 16'hb3c5;
    stim[52] = 16'hb825;
    stim[53] = 16'h31e4;
    stim[54] = 16'hcdd5;
    stim[55] = 16'hff58;
    stim[56] = 16'h21f9;
    stim[57] = 16'h9831;
    stim[58] = 16'h253c;
    stim[59] = 16'h4c2f;
    stim[60] = 16'hd805;
    stim[61] = 16'h2e6d;
    stim[62] = 16'he3d3;
    stim[63] = 16'h076a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h03c;
      expv[1] = 9'h00e;
      expv[2] = 9'h11e;
      expv[3] = 9'h076;
      expv[4] = 9'h126;
      expv[5] = 9'h19c;
      expv[6] = 9'h034;
      expv[7] = 9'h03e;
      expv[8] = 9'h152;
      expv[9] = 9'h1f4;
      expv[10] = 9'h080;
      expv[11] = 9'h144;
      expv[12] = 9'h08e;
      expv[13] = 9'h051;
      expv[14] = 9'h0f2;
      expv[15] = 9'h0b3;
      expv[16] = 9'h1ce;
      expv[17] = 9'h042;
      expv[18] = 9'h1d6;
      expv[19] = 9'h18c;
      expv[20] = 9'h08a;
      expv[21] = 9'h13b;
      expv[22] = 9'h1aa;
      expv[23] = 9'h018;
      expv[24] = 9'h180;
      expv[25] = 9'h11b;
      expv[26] = 9'h1a4;
      expv[27] = 9'h17c;
      expv[28] = 9'h094;
      expv[29] = 9'h0c6;
      expv[30] = 9'h177;
      expv[31] = 9'h1ce;
      expv[32] = 9'h0f0;
      expv[33] = 9'h0c0;
      expv[34] = 9'h000;
      expv[35] = 9'h17c;
      expv[36] = 9'h0f2;
      expv[37] = 9'h1e0;
      expv[38] = 9'h176;
      expv[39] = 9'h09f;
      expv[40] = 9'h069;
      expv[41] = 9'h13f;
      expv[42] = 9'h08e;
      expv[43] = 9'h158;
      expv[44] = 9'h072;
      expv[45] = 9'h044;
      expv[46] = 9'h09f;
      expv[47] = 9'h01c;
      expv[48] = 9'h180;
      expv[49] = 9'h1df;
      expv[50] = 9'h072;
      expv[51] = 9'h0f1;
      expv[52] = 9'h1ba;
      expv[53] = 9'h02a;
      expv[54] = 9'h144;
      expv[55] = 9'h0ae;
      expv[56] = 9'h034;
      expv[57] = 9'h192;
      expv[58] = 9'h0c2;
      expv[59] = 9'h0f6;
      expv[60] = 9'h1ba;
      expv[61] = 9'h137;
      expv[62] = 9'h16c;
      expv[63] = 9'h0e2;
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
