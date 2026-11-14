// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
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
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h33ac2;
    stim[1] = 19'h2142b;
    stim[2] = 19'h66bf3;
    stim[3] = 19'h69978;
    stim[4] = 19'h625ca;
    stim[5] = 19'h7d770;
    stim[6] = 19'h57e35;
    stim[7] = 19'h4c593;
    stim[8] = 19'h44632;
    stim[9] = 19'h72326;
    stim[10] = 19'h4e117;
    stim[11] = 19'h4382e;
    stim[12] = 19'h5c42c;
    stim[13] = 19'h6f257;
    stim[14] = 19'h5f6c1;
    stim[15] = 19'h58cf1;
    stim[16] = 19'h491c9;
    stim[17] = 19'h7be8e;
    stim[18] = 19'h77b0e;
    stim[19] = 19'h79283;
    stim[20] = 19'h67df6;
    stim[21] = 19'h552c3;
    stim[22] = 19'h4b583;
    stim[23] = 19'h5b5a8;
    stim[24] = 19'h6137b;
    stim[25] = 19'h5485a;
    stim[26] = 19'h7c619;
    stim[27] = 19'h619a8;
    stim[28] = 19'h701f4;
    stim[29] = 19'h4029f;
    stim[30] = 19'h5ea67;
    stim[31] = 19'h55da6;
    stim[32] = 19'h7f6a1;
    stim[33] = 19'h603b5;
    stim[34] = 19'h67266;
    stim[35] = 19'h549d6;
    stim[36] = 19'h74722;
    stim[37] = 19'h6f765;
    stim[38] = 19'h4d91c;
    stim[39] = 19'h6b495;
    stim[40] = 19'h7511f;
    stim[41] = 19'h696d9;
    stim[42] = 19'h62fec;
    stim[43] = 19'h5784c;
    stim[44] = 19'h584ef;
    stim[45] = 19'h62e3e;
    stim[46] = 19'h48cec;
    stim[47] = 19'h68dfe;
    stim[48] = 19'h731f1;
    stim[49] = 19'h53097;
    stim[50] = 19'h6eb08;
    stim[51] = 19'h5e47d;
    stim[52] = 19'h7dde2;
    stim[53] = 19'h7a4db;
    stim[54] = 19'h44658;
    stim[55] = 19'h5df91;
    stim[56] = 19'h49428;
    stim[57] = 19'h65cc3;
    stim[58] = 19'h6965f;
    stim[59] = 19'h6ce56;
    stim[60] = 19'h7123d;
    stim[61] = 19'h550f1;
    stim[62] = 19'h61332;
    stim[63] = 19'h476a7;
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
      expv[3] = 16'h6b00;
      expv[4] = 16'h9900;
      expv[5] = 16'h2500;
      expv[6] = 16'hd770;
      expv[7] = 16'hd735;
      expv[8] = 16'hd735;
      expv[9] = 16'hd735;
      expv[10] = 16'h2326;
      expv[11] = 16'h2326;
      expv[12] = 16'h2326;
      expv[13] = 16'h232c;
      expv[14] = 16'hf22c;
      expv[15] = 16'hf2c1;
      expv[16] = 16'hf2f1;
      expv[17] = 16'hf2f1;
      expv[18] = 16'hbe8e;
      expv[19] = 16'h7b0e;
      expv[20] = 16'h9283;
      expv[21] = 16'h7d83;
      expv[22] = 16'h7dc3;
      expv[23] = 16'h7dc3;
      expv[24] = 16'h7da8;
      expv[25] = 16'h13a8;
      expv[26] = 16'h135a;
      expv[27] = 16'hc619;
      expv[28] = 16'h1919;
      expv[29] = 16'h01f4;
      expv[30] = 16'h01f4;
      expv[31] = 16'h0167;
      expv[32] = 16'h01a6;
      expv[33] = 16'hf6a1;
      expv[34] = 16'h03a1;
      expv[35] = 16'h72a1;
      expv[36] = 16'h72d6;
      expv[37] = 16'h4722;
      expv[38] = 16'hf722;
      expv[39] = 16'hf722;
      expv[40] = 16'hb422;
      expv[41] = 16'h511f;
      expv[42] = 16'h961f;
      expv[43] = 16'h2f1f;
      expv[44] = 16'h2f4c;
      expv[45] = 16'h2fef;
      expv[46] = 16'h2eef;
      expv[47] = 16'h2eef;
      expv[48] = 16'h8def;
      expv[49] = 16'h31f1;
      expv[50] = 16'h3197;
      expv[51] = 16'heb97;
      expv[52] = 16'heb7d;
      expv[53] = 16'hdde2;
      expv[54] = 16'ha4db;
      expv[55] = 16'ha4db;
      expv[56] = 16'ha491;
      expv[57] = 16'ha491;
      expv[58] = 16'h5c91;
      expv[59] = 16'h9691;
      expv[60] = 16'hce91;
      expv[61] = 16'h123d;
      expv[62] = 16'h12f1;
      expv[63] = 16'h13f1;
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
