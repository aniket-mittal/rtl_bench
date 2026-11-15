// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134707 dut (
    .in(in_vec[67:4]),
    .sel(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hb12919fd76914121c;
    stim[1] = 68'h309255c1871fd592e;
    stim[2] = 68'h549551bf545646c45;
    stim[3] = 68'h2d025b92ef765905d;
    stim[4] = 68'hf67ff3edf7791126e;
    stim[5] = 68'ha9f5a697263a20460;
    stim[6] = 68'h6daad98d05375002c;
    stim[7] = 68'hab2114c8bb5c7bed7;
    stim[8] = 68'h0961e144a835244d9;
    stim[9] = 68'h4065450aaa1c1166c;
    stim[10] = 68'h7703ed5fa1491ff3c;
    stim[11] = 68'h0f804e55fe83401e1;
    stim[12] = 68'ha0181a71b4eda0941;
    stim[13] = 68'h22569a3e295e67d60;
    stim[14] = 68'h9603f41ff4230bd9c;
    stim[15] = 68'h6a1c2aff19bd073ef;
    stim[16] = 68'h6a714b53d1caf9622;
    stim[17] = 68'h119bf598fd1969934;
    stim[18] = 68'hcad34e7b78d898865;
    stim[19] = 68'h089aeb347c7e248eb;
    stim[20] = 68'he3ba5ae89fefc58d4;
    stim[21] = 68'hbc7d9a8cf4a0edfe5;
    stim[22] = 68'h28cd243f39c78eb0e;
    stim[23] = 68'he662ba8dce8ac6079;
    stim[24] = 68'h5c2afcfcdd4e38cc3;
    stim[25] = 68'h466f61b9db052fce2;
    stim[26] = 68'h5aef8b07a53bd99fb;
    stim[27] = 68'h1e4b62e23c20af008;
    stim[28] = 68'h66bd585a270221f10;
    stim[29] = 68'h905ac59fb3cc221e7;
    stim[30] = 68'haf45898e267fc8a6e;
    stim[31] = 68'hb4ab6c8e36db0d20e;
    stim[32] = 68'h0f46e04b9d9d0bfe8;
    stim[33] = 68'h7661bcbf080824caa;
    stim[34] = 68'h8e85946c42c5afc07;
    stim[35] = 68'h8d2c69a1968fcbd3b;
    stim[36] = 68'hc793c74e875a20d3f;
    stim[37] = 68'h9bcacea8205524d05;
    stim[38] = 68'haadfc5dc790430dfc;
    stim[39] = 68'h451fcaeb3862bd8cb;
    stim[40] = 68'hede49c168402ebb33;
    stim[41] = 68'h60d83a3c942e20bb7;
    stim[42] = 68'h8e610354202c85cd8;
    stim[43] = 68'h0f6762eca26f7d8f1;
    stim[44] = 68'hc2fbcbb1ee2231726;
    stim[45] = 68'hae6b10dc34a34ee9a;
    stim[46] = 68'h5f8770b7fcdfdd3ff;
    stim[47] = 68'hccd6fc0a575b7c921;
    stim[48] = 68'h0a5728f82057ce7df;
    stim[49] = 68'hbadcf624d3cf3dee8;
    stim[50] = 68'h03f5643ad5872eb4d;
    stim[51] = 68'hca003bc44befc7556;
    stim[52] = 68'h1ffbc6e10218fc8cc;
    stim[53] = 68'hf80b3de40b30d2ad7;
    stim[54] = 68'hb1ccbc80266aee5af;
    stim[55] = 68'h54433448a9afd1146;
    stim[56] = 68'h8d30e16a17a056a08;
    stim[57] = 68'h8716d3702b71e01be;
    stim[58] = 68'heae84377655b57104;
    stim[59] = 68'hbd33659e91e21fda8;
    stim[60] = 68'hfd167b29f0e10a89b;
    stim[61] = 68'hefc1f7c9005ffbeaa;
    stim[62] = 68'hcb0e71f6b30ad2b68;
    stim[63] = 68'h71961cf852af82f5f;
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
      expv[0] = 4'h9;
      expv[1] = 4'h0;
      expv[2] = 4'h5;
      expv[3] = 4'h0;
      expv[4] = 4'h6;
      expv[5] = 4'h6;
      expv[6] = 4'ha;
      expv[7] = 4'hb;
      expv[8] = 4'h4;
      expv[9] = 4'h5;
      expv[10] = 4'h3;
      expv[11] = 4'h1;
      expv[12] = 4'h9;
      expv[13] = 4'h6;
      expv[14] = 4'h3;
      expv[15] = 4'h6;
      expv[16] = 4'h9;
      expv[17] = 4'h9;
      expv[18] = 4'hd;
      expv[19] = 4'he;
      expv[20] = 4'hf;
      expv[21] = 4'ha;
      expv[22] = 4'h8;
      expv[23] = 4'h8;
      expv[24] = 4'h3;
      expv[25] = 4'hf;
      expv[26] = 4'h8;
      expv[27] = 4'h2;
      expv[28] = 4'h1;
      expv[29] = 4'hb;
      expv[30] = 4'hf;
      expv[31] = 4'h4;
      expv[32] = 4'hb;
      expv[33] = 4'hc;
      expv[34] = 4'h4;
      expv[35] = 4'h6;
      expv[36] = 4'hc;
      expv[37] = 4'h5;
      expv[38] = 4'hf;
      expv[39] = 4'hc;
      expv[40] = 4'he;
      expv[41] = 4'h9;
      expv[42] = 4'h4;
      expv[43] = 4'h8;
      expv[44] = 4'he;
      expv[45] = 4'h0;
      expv[46] = 4'h5;
      expv[47] = 4'h9;
      expv[48] = 4'h0;
      expv[49] = 4'h4;
      expv[50] = 4'hf;
      expv[51] = 4'hb;
      expv[52] = 4'hb;
      expv[53] = 4'h0;
      expv[54] = 4'hb;
      expv[55] = 4'h9;
      expv[56] = 4'ha;
      expv[57] = 4'h7;
      expv[58] = 4'hb;
      expv[59] = 4'he;
      expv[60] = 4'h7;
      expv[61] = 4'h7;
      expv[62] = 4'h6;
      expv[63] = 4'h7;
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
