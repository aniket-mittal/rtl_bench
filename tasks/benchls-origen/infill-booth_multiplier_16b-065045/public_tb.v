// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065045 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .start(in_vec[32:32]),
    .multiplicand(in_vec[31:16]),
    .multiplier(in_vec[15:0]),
    .prod(out_vec[32:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2f6672782;
    stim[1] = 34'h2f3da54d4;
    stim[2] = 34'h3f4a16e17;
    stim[3] = 34'h18d45be40;
    stim[4] = 34'h051c44948;
    stim[5] = 34'h03de36d1f;
    stim[6] = 34'h1de66d45d;
    stim[7] = 34'h0b2a901e1;
    stim[8] = 34'h044e88b64;
    stim[9] = 34'h1866231e5;
    stim[10] = 34'h11064f329;
    stim[11] = 34'h0a6d9c58b;
    stim[12] = 34'h1643b83d0;
    stim[13] = 34'h1b2db2167;
    stim[14] = 34'h05ef10359;
    stim[15] = 34'h0b7b196e1;
    stim[16] = 34'h1fcfc0b69;
    stim[17] = 34'h1f61531cd;
    stim[18] = 34'h16da52cb8;
    stim[19] = 34'h3e2dd7434;
    stim[20] = 34'h020d4d2cc;
    stim[21] = 34'h05853d1a8;
    stim[22] = 34'h17b7715e2;
    stim[23] = 34'h0a10a65a5;
    stim[24] = 34'h163102bd2;
    stim[25] = 34'h06fcea3a2;
    stim[26] = 34'h1d3ebacfb;
    stim[27] = 34'h1db46cf6c;
    stim[28] = 34'h10feb738d;
    stim[29] = 34'h1354963a5;
    stim[30] = 34'h02fc3b211;
    stim[31] = 34'h0a8c619f8;
    stim[32] = 34'h10f278231;
    stim[33] = 34'h1761b9871;
    stim[34] = 34'h0032de55a;
    stim[35] = 34'h0ead538fd;
    stim[36] = 34'h14f563e9b;
    stim[37] = 34'h01a835649;
    stim[38] = 34'h18831d546;
    stim[39] = 34'h0461a880c;
    stim[40] = 34'h1f33a95ba;
    stim[41] = 34'h18024db56;
    stim[42] = 34'h1161c20bf;
    stim[43] = 34'h1418f9cbc;
    stim[44] = 34'h0f0823bfa;
    stim[45] = 34'h0621b5599;
    stim[46] = 34'h057f5524d;
    stim[47] = 34'h147a160e7;
    stim[48] = 34'h05b04e09f;
    stim[49] = 34'h03ff63ca1;
    stim[50] = 34'h1efe6ac28;
    stim[51] = 34'h03d928a18;
    stim[52] = 34'h0fc138bbe;
    stim[53] = 34'h0a386f61b;
    stim[54] = 34'h0e3ca0c9b;
    stim[55] = 34'h09bd72806;
    stim[56] = 34'h1c78a9f3c;
    stim[57] = 34'h18af72a6a;
    stim[58] = 34'h1907dd81f;
    stim[59] = 34'h06b1132aa;
    stim[60] = 34'h0b52c4d1a;
    stim[61] = 34'h03365c1b8;
    stim[62] = 34'h1b6f9d42e;
    stim[63] = 34'h0d8656c43;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000001;
      expv[2] = 33'h000000001;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000001;
      expv[32] = 33'h0488c2bc5;
      expv[33] = 33'h0488c2bc4;
      expv[34] = 33'h0488c2bc4;
      expv[35] = 33'h0488c2bc4;
      expv[36] = 33'h0488c2bc4;
      expv[37] = 33'h0488c2bc4;
      expv[38] = 33'h0488c2bc4;
      expv[39] = 33'h0488c2bc4;
      expv[40] = 33'h0488c2bc4;
      expv[41] = 33'h0488c2bc5;
      expv[42] = 33'h0488c2bc4;
      expv[43] = 33'h0488c2bc4;
      expv[44] = 33'h0488c2bc4;
      expv[45] = 33'h0488c2bc4;
      expv[46] = 33'h0488c2bc4;
      expv[47] = 33'h0488c2bc4;
      expv[48] = 33'h0488c2bc4;
      expv[49] = 33'h0488c2bc4;
      expv[50] = 33'h0488c2bc5;
      expv[51] = 33'h0488c2bc4;
      expv[52] = 33'h0488c2bc4;
      expv[53] = 33'h0488c2bc4;
      expv[54] = 33'h0488c2bc4;
      expv[55] = 33'h0488c2bc4;
      expv[56] = 33'h0488c2bc4;
      expv[57] = 33'h0488c2bc4;
      expv[58] = 33'h0488c2bc4;
      expv[59] = 33'h0488c2bc5;
      expv[60] = 33'h000015851;
      expv[61] = 33'h000015851;
      expv[62] = 33'h000015851;
      expv[63] = 33'h000015850;
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
