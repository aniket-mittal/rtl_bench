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

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h145;
    stim[1] = 9'h0d9;
    stim[2] = 9'h196;
    stim[3] = 9'h18e;
    stim[4] = 9'h1ca;
    stim[5] = 9'h0a6;
    stim[6] = 9'h01c;
    stim[7] = 9'h0b0;
    stim[8] = 9'h1c6;
    stim[9] = 9'h00c;
    stim[10] = 9'h034;
    stim[11] = 9'h0e8;
    stim[12] = 9'h1c2;
    stim[13] = 9'h1fc;
    stim[14] = 9'h002;
    stim[15] = 9'h1a0;
    stim[16] = 9'h052;
    stim[17] = 9'h12c;
    stim[18] = 9'h0fc;
    stim[19] = 9'h13e;
    stim[20] = 9'h0aa;
    stim[21] = 9'h176;
    stim[22] = 9'h05e;
    stim[23] = 9'h0ee;
    stim[24] = 9'h17e;
    stim[25] = 9'h014;
    stim[26] = 9'h1c2;
    stim[27] = 9'h052;
    stim[28] = 9'h1ea;
    stim[29] = 9'h1cc;
    stim[30] = 9'h126;
    stim[31] = 9'h0e2;
    stim[32] = 9'h11e;
    stim[33] = 9'h1c2;
    stim[34] = 9'h084;
    stim[35] = 9'h0c8;
    stim[36] = 9'h05c;
    stim[37] = 9'h1ec;
    stim[38] = 9'h1ea;
    stim[39] = 9'h180;
    stim[40] = 9'h044;
    stim[41] = 9'h0ae;
    stim[42] = 9'h0dc;
    stim[43] = 9'h192;
    stim[44] = 9'h164;
    stim[45] = 9'h122;
    stim[46] = 9'h162;
    stim[47] = 9'h008;
    stim[48] = 9'h030;
    stim[49] = 9'h010;
    stim[50] = 9'h02a;
    stim[51] = 9'h0ec;
    stim[52] = 9'h072;
    stim[53] = 9'h01e;
    stim[54] = 9'h092;
    stim[55] = 9'h130;
    stim[56] = 9'h1cc;
    stim[57] = 9'h0ac;
    stim[58] = 9'h18e;
    stim[59] = 9'h004;
    stim[60] = 9'h0c0;
    stim[61] = 9'h0d2;
    stim[62] = 9'h020;
    stim[63] = 9'h0d4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hbc;
      expv[4] = 8'h7c;
      expv[5] = 8'h5e;
      expv[6] = 8'h35;
      expv[7] = 8'he0;
      expv[8] = 8'h85;
      expv[9] = 8'h3e;
      expv[10] = 8'h60;
      expv[11] = 8'ha1;
      expv[12] = 8'h47;
      expv[13] = 8'h1e;
      expv[14] = 8'hef;
      expv[15] = 8'h10;
      expv[16] = 8'h0d;
      expv[17] = 8'h92;
      expv[18] = 8'h69;
      expv[19] = 8'he7;
      expv[20] = 8'hf9;
      expv[21] = 8'h55;
      expv[22] = 8'hbb;
      expv[23] = 8'hf2;
      expv[24] = 8'h77;
      expv[25] = 8'hfb;
      expv[26] = 8'ha0;
      expv[27] = 8'h1e;
      expv[28] = 8'h92;
      expv[29] = 8'h5f;
      expv[30] = 8'h6e;
      expv[31] = 8'h39;
      expv[32] = 8'h17;
      expv[33] = 8'hf8;
      expv[34] = 8'h1e;
      expv[35] = 8'h24;
      expv[36] = 8'h46;
      expv[37] = 8'he2;
      expv[38] = 8'h6f;
      expv[39] = 8'h5f;
      expv[40] = 8'h0c;
      expv[41] = 8'h22;
      expv[42] = 8'h75;
      expv[43] = 8'he6;
      expv[44] = 8'h9c;
      expv[45] = 8'h2b;
      expv[46] = 8'h19;
      expv[47] = 8'h1b;
      expv[48] = 8'h40;
      expv[49] = 8'h81;
      expv[50] = 8'h80;
      expv[51] = 8'h51;
      expv[52] = 8'h67;
      expv[53] = 8'h93;
      expv[54] = 8'hf0;
      expv[55] = 8'h94;
      expv[56] = 8'h89;
      expv[57] = 8'h6e;
      expv[58] = 8'h65;
      expv[59] = 8'h7c;
      expv[60] = 8'h20;
      expv[61] = 8'h06;
      expv[62] = 8'h96;
      expv[63] = 8'h01;
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
