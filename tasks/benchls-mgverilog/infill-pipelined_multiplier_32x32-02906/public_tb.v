// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02906 dut (
    .clk(clk),
    .reset(in_vec[64:64]),
    .p0(in_vec[63:32]),
    .p1(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h15f9bdacb5d14d92b;
    stim[1] = 65'h15412486fd8a97cb9;
    stim[2] = 65'h05eb3f497c437c79e;
    stim[3] = 65'h0d78618e366b2063c;
    stim[4] = 65'h08d5c86a5da07cf75;
    stim[5] = 65'h034f7a9891ca4ee07;
    stim[6] = 65'h0d433974360a07cda;
    stim[7] = 65'h0df61b682a9e237cf;
    stim[8] = 65'h0f43452bf4a46cc22;
    stim[9] = 65'h01271e533384b38cf;
    stim[10] = 65'h00345ef490f5e666b;
    stim[11] = 65'h0fd413002434f06cf;
    stim[12] = 65'h0f2ba7810311d9ae9;
    stim[13] = 65'h0a2f20aae85e97cf4;
    stim[14] = 65'h0721d6f51e7bcd122;
    stim[15] = 65'h078555cba7ddf6e5b;
    stim[16] = 65'h0e0dbffc9e9efab12;
    stim[17] = 65'h0810f4593abba7b20;
    stim[18] = 65'h0d2a7ecbc70832d59;
    stim[19] = 65'h01b7a6ca309f8e4c4;
    stim[20] = 65'h007c5bb577145a0b6;
    stim[21] = 65'h057125f8a3590913c;
    stim[22] = 65'h0a9099432e3e3520d;
    stim[23] = 65'h0afd3e1600e2bb07b;
    stim[24] = 65'h08d8e158cd5526645;
    stim[25] = 65'h0887e63c46815f289;
    stim[26] = 65'h0c36a7881fa2a0a74;
    stim[27] = 65'h0a587dabd21000a0e;
    stim[28] = 65'h06c802bab3648b1a4;
    stim[29] = 65'h03f1bcb4c1555ffe4;
    stim[30] = 65'h09e1063a7cbe1492a;
    stim[31] = 65'h0b5820931d1701d37;
    stim[32] = 65'h02e57822fc0f79aad;
    stim[33] = 65'h031d16b62de3e74bb;
    stim[34] = 65'h03368359828e914cb;
    stim[35] = 65'h0313fd1d7a40964b2;
    stim[36] = 65'h086a24e1b706e3749;
    stim[37] = 65'h063c35646b7e2114f;
    stim[38] = 65'h04d9a967401ae5fde;
    stim[39] = 65'h04a1491780684b30a;
    stim[40] = 65'h041d89b405a908b15;
    stim[41] = 65'h06fa7c2fa81f5d21a;
    stim[42] = 65'h0eb585c30d96fd9af;
    stim[43] = 65'h05a7501fb806b9f6a;
    stim[44] = 65'h1bd7feeca29cba4fe;
    stim[45] = 65'h072e81b0c50c3e7b7;
    stim[46] = 65'h0ce9fd3439306ce27;
    stim[47] = 65'h05b0573ddbf086973;
    stim[48] = 65'h0ebbf0fbb67605f28;
    stim[49] = 65'h0097f3ba7ddf4cace;
    stim[50] = 65'h0ac9cb4ff2f721cf4;
    stim[51] = 65'h0b52627e14708a63a;
    stim[52] = 65'h0086626304939b93c;
    stim[53] = 65'h09385ac33599569d4;
    stim[54] = 65'h0c35f5a6aaf88e542;
    stim[55] = 65'h1634cc5e4495738f8;
    stim[56] = 65'h07fed3cf895ec30e9;
    stim[57] = 65'h00a8d66420ead10c2;
    stim[58] = 65'h0222970c314260f9c;
    stim[59] = 65'h0e9d45d0a92c8114f;
    stim[60] = 65'h0eff2c451333a5c66;
    stim[61] = 65'h06d93360a0670ec61;
    stim[62] = 65'h058211eddcb7f0f4b;
    stim[63] = 65'h004f2a2cbaf70c813;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h027fd319;
      expv[4] = 32'h15931c37;
      expv[5] = 32'h7ea35632;
      expv[6] = 32'h67d92734;
      expv[7] = 32'h9cabf469;
      expv[8] = 32'h4a2700bf;
      expv[9] = 32'h5b13430e;
      expv[10] = 32'h8efc811e;
      expv[11] = 32'hf71d315e;
      expv[12] = 32'h222c7c3d;
      expv[13] = 32'h5f601983;
      expv[14] = 32'ha573dd9e;
      expv[15] = 32'hc1c0e690;
      expv[16] = 32'haa3c75d8;
      expv[17] = 32'h0645e9c2;
      expv[18] = 32'h0c35e21e;
      expv[19] = 32'h80fa3f22;
      expv[20] = 32'h36245360;
      expv[21] = 32'h2532595c;
      expv[22] = 32'h0b6458cc;
      expv[23] = 32'h011c8fda;
      expv[24] = 32'h200b8e58;
      expv[25] = 32'h654a8a8a;
      expv[26] = 32'h40df4920;
      expv[27] = 32'h26b996bc;
      expv[28] = 32'h5506abe4;
      expv[29] = 32'h741da474;
      expv[30] = 32'hb8f95856;
      expv[31] = 32'h7a65348c;
      expv[32] = 32'ha07dc3b0;
      expv[33] = 32'h9de1f866;
      expv[34] = 32'hc06a8687;
      expv[35] = 32'hd0cc3fc3;
      expv[36] = 32'h465dd896;
      expv[37] = 32'h6f2a5f88;
      expv[38] = 32'h48e6e37e;
      expv[39] = 32'ha2aa12b3;
      expv[40] = 32'hf5ce459a;
      expv[41] = 32'h60bb8498;
      expv[42] = 32'h186496b0;
      expv[43] = 32'hd7107c40;
      expv[44] = 32'h883ce164;
      expv[45] = 32'h705bb4d0;
      expv[46] = 32'h7496b6ee;
      expv[47] = 32'hae16546c;
      expv[48] = 32'hee772994;
      expv[49] = 32'h82eb1935;
      expv[50] = 32'ha1e0b147;
      expv[51] = 32'hdfd0da38;
      expv[52] = 32'h0f9fc662;
      expv[53] = 32'h13b6670c;
      expv[54] = 32'h6e88eefa;
      expv[55] = 32'hfa39a340;
      expv[56] = 32'hf302853c;
      expv[57] = 32'h28c62154;
      expv[58] = 32'h422594e0;
      expv[59] = 32'h76fafdb8;
      expv[60] = 32'h8c259e04;
      expv[61] = 32'h37ce23d4;
      expv[62] = 32'ha6866016;
      expv[63] = 32'h76a15446;
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
