// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061665 dut (
    .in1(in_vec[63:63]),
    .in2(in_vec[62:55]),
    .in3(in_vec[54:32]),
    .in4(in_vec[31:24]),
    .in5(in_vec[23:1]),
    .in6(in_vec[0:0]),
    .out1(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h9cdfc93ca60f8aba;
    stim[1] = 64'hbe16bad429c65c2a;
    stim[2] = 64'h3b665635f246f22c;
    stim[3] = 64'ha65bb8f2dd0882d0;
    stim[4] = 64'h39312352c6c4d5d4;
    stim[5] = 64'h1fb264fe386d67c2;
    stim[6] = 64'hf28d6faa0d24f12d;
    stim[7] = 64'hcd9d65c08c011784;
    stim[8] = 64'h255b69158b83d89a;
    stim[9] = 64'hde843edc3c7ffd40;
    stim[10] = 64'h421bda06dafbe777;
    stim[11] = 64'h48c41f3bcf47b6fd;
    stim[12] = 64'hf4d76ce2700298f5;
    stim[13] = 64'h603f6d72bf7e8148;
    stim[14] = 64'hec691dc1cfe0b323;
    stim[15] = 64'h1f06c9f52221b798;
    stim[16] = 64'h70c6c5ff387f8cf6;
    stim[17] = 64'h53ba54cf40106c1c;
    stim[18] = 64'h2bb6f31ea4392609;
    stim[19] = 64'h766088e2f1d84b11;
    stim[20] = 64'h78805f2a3f8bcd02;
    stim[21] = 64'hb3856738a368f568;
    stim[22] = 64'h630e406604900eeb;
    stim[23] = 64'hcc6ba672f82a9e9c;
    stim[24] = 64'h43efdfa09ba7c966;
    stim[25] = 64'h3114bb501ffeff9b;
    stim[26] = 64'h49987490c0a2dd04;
    stim[27] = 64'h821e1bf8e3e744c4;
    stim[28] = 64'h9861579e4761b95e;
    stim[29] = 64'hb39a33e4cce80230;
    stim[30] = 64'h4b543c8de43e85cc;
    stim[31] = 64'hccd9209b9527f0c9;
    stim[32] = 64'hbcc4849d1e50dec5;
    stim[33] = 64'hdb4c3f757b705849;
    stim[34] = 64'h23985308c0acf485;
    stim[35] = 64'hf4d4c78155ee0d1c;
    stim[36] = 64'h4449874dc17db375;
    stim[37] = 64'h4dae37ef4269823d;
    stim[38] = 64'h1f3b51c0e2993474;
    stim[39] = 64'hc305d182198e8864;
    stim[40] = 64'hfa29e43371f22f6f;
    stim[41] = 64'h4b283f275e318a71;
    stim[42] = 64'h03a85a7acc4659a6;
    stim[43] = 64'h95d15b7da795403f;
    stim[44] = 64'he129b2823f98270f;
    stim[45] = 64'h4c0c57e265f85f28;
    stim[46] = 64'h56a211acc25d91ed;
    stim[47] = 64'h380f5eb31000d7e8;
    stim[48] = 64'h6bec52cdd8317414;
    stim[49] = 64'h9faf124548139ab9;
    stim[50] = 64'h5e3116286e79b1c8;
    stim[51] = 64'hfb403fd534507da6;
    stim[52] = 64'hb2f9c66e6d8cb263;
    stim[53] = 64'hd78a6962371afd02;
    stim[54] = 64'h73bec73761ce197c;
    stim[55] = 64'h44760a69eede22b4;
    stim[56] = 64'hf518151591efdbfb;
    stim[57] = 64'h3363bc538527343b;
    stim[58] = 64'h80d9c20f1cf6e6af;
    stim[59] = 64'h379a1153923d875e;
    stim[60] = 64'hf74098cd10cf3b9b;
    stim[61] = 64'h898b2a8b692bc82c;
    stim[62] = 64'hd6442e4f6f389cfe;
    stim[63] = 64'h187770379389f348;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h0;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h0;
      expv[22] = 2'h1;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h1;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h1;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h0;
      expv[43] = 2'h1;
      expv[44] = 2'h0;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h0;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h0;
      expv[52] = 2'h1;
      expv[53] = 2'h0;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
