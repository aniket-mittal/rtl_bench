// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10435 dut (
    .clk(clk),
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
    stim[0] = 16'hbc5b;
    stim[1] = 16'h39d0;
    stim[2] = 16'hd43c;
    stim[3] = 16'ha47d;
    stim[4] = 16'hf5d3;
    stim[5] = 16'hd74f;
    stim[6] = 16'h86b5;
    stim[7] = 16'hfbeb;
    stim[8] = 16'hcd59;
    stim[9] = 16'hf296;
    stim[10] = 16'h08d4;
    stim[11] = 16'hcd8b;
    stim[12] = 16'h3653;
    stim[13] = 16'h6ae5;
    stim[14] = 16'h39ff;
    stim[15] = 16'h5f7e;
    stim[16] = 16'hf7a8;
    stim[17] = 16'ha044;
    stim[18] = 16'h8629;
    stim[19] = 16'h2472;
    stim[20] = 16'hac1b;
    stim[21] = 16'h5b3c;
    stim[22] = 16'h5750;
    stim[23] = 16'hf653;
    stim[24] = 16'hcb04;
    stim[25] = 16'h3a01;
    stim[26] = 16'hffaf;
    stim[27] = 16'h3442;
    stim[28] = 16'h13e4;
    stim[29] = 16'hb56f;
    stim[30] = 16'h9381;
    stim[31] = 16'h140f;
    stim[32] = 16'he253;
    stim[33] = 16'h7322;
    stim[34] = 16'h5b72;
    stim[35] = 16'hbf5d;
    stim[36] = 16'hee74;
    stim[37] = 16'hf270;
    stim[38] = 16'hfadb;
    stim[39] = 16'hd4fb;
    stim[40] = 16'h77bb;
    stim[41] = 16'hdafe;
    stim[42] = 16'ha2ec;
    stim[43] = 16'h58b9;
    stim[44] = 16'h1aad;
    stim[45] = 16'hbed5;
    stim[46] = 16'hcb32;
    stim[47] = 16'h0649;
    stim[48] = 16'h5b27;
    stim[49] = 16'ha88c;
    stim[50] = 16'h81b1;
    stim[51] = 16'h7b57;
    stim[52] = 16'he23a;
    stim[53] = 16'hb5df;
    stim[54] = 16'h6066;
    stim[55] = 16'h2502;
    stim[56] = 16'hf5ca;
    stim[57] = 16'h2c36;
    stim[58] = 16'hfa54;
    stim[59] = 16'hadfa;
    stim[60] = 16'h987e;
    stim[61] = 16'h4812;
    stim[62] = 16'h8cb7;
    stim[63] = 16'h32ad;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hbc5b;
      expv[2] = 16'h39d0;
      expv[3] = 16'hd43c;
      expv[4] = 16'ha47d;
      expv[5] = 16'hf5d3;
      expv[6] = 16'hd74f;
      expv[7] = 16'h86b5;
      expv[8] = 16'hfbeb;
      expv[9] = 16'hcd59;
      expv[10] = 16'hf296;
      expv[11] = 16'h08d4;
      expv[12] = 16'hcd8b;
      expv[13] = 16'h3653;
      expv[14] = 16'h6ae5;
      expv[15] = 16'h39ff;
      expv[16] = 16'h5f7e;
      expv[17] = 16'hf7a8;
      expv[18] = 16'ha044;
      expv[19] = 16'h8629;
      expv[20] = 16'h2472;
      expv[21] = 16'hac1b;
      expv[22] = 16'h5b3c;
      expv[23] = 16'h5750;
      expv[24] = 16'hf653;
      expv[25] = 16'hcb04;
      expv[26] = 16'h3a01;
      expv[27] = 16'hffaf;
      expv[28] = 16'h3442;
      expv[29] = 16'h13e4;
      expv[30] = 16'hb56f;
      expv[31] = 16'h9381;
      expv[32] = 16'h140f;
      expv[33] = 16'he253;
      expv[34] = 16'h7322;
      expv[35] = 16'h5b72;
      expv[36] = 16'hbf5d;
      expv[37] = 16'hee74;
      expv[38] = 16'hf270;
      expv[39] = 16'hfadb;
      expv[40] = 16'hd4fb;
      expv[41] = 16'h77bb;
      expv[42] = 16'hdafe;
      expv[43] = 16'ha2ec;
      expv[44] = 16'h58b9;
      expv[45] = 16'h1aad;
      expv[46] = 16'hbed5;
      expv[47] = 16'hcb32;
      expv[48] = 16'h0649;
      expv[49] = 16'h5b27;
      expv[50] = 16'ha88c;
      expv[51] = 16'h81b1;
      expv[52] = 16'h7b57;
      expv[53] = 16'he23a;
      expv[54] = 16'hb5df;
      expv[55] = 16'h6066;
      expv[56] = 16'h2502;
      expv[57] = 16'hf5ca;
      expv[58] = 16'h2c36;
      expv[59] = 16'hfa54;
      expv[60] = 16'hadfa;
      expv[61] = 16'h987e;
      expv[62] = 16'h4812;
      expv[63] = 16'h8cb7;
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
