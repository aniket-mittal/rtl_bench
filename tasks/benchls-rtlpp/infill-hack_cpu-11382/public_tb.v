// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11382 dut (
    .clk(clk),
    .instruction(in_vec[32:17]),
    .inM(in_vec[16:1]),
    .reset(in_vec[0:0]),
    .outM(out_vec[47:32]),
    .writeM(out_vec[31:31]),
    .PC(out_vec[30:15]),
    .addressM(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h032514571;
    stim[1] = 33'h0e679994d;
    stim[2] = 33'h067660d38;
    stim[3] = 33'h0c51ae800;
    stim[4] = 33'h174eaff3a;
    stim[5] = 33'h12032b760;
    stim[6] = 33'h0953f2174;
    stim[7] = 33'h1176abd14;
    stim[8] = 33'h115592e46;
    stim[9] = 33'h170f3883a;
    stim[10] = 33'h13f6770ca;
    stim[11] = 33'h111360f62;
    stim[12] = 33'h04356edc4;
    stim[13] = 33'h1c964e8c0;
    stim[14] = 33'h0fffb84bc;
    stim[15] = 33'h1414d865e;
    stim[16] = 33'h15998733e;
    stim[17] = 33'h187127ec6;
    stim[18] = 33'h150ebcf88;
    stim[19] = 33'h063cb17c6;
    stim[20] = 33'h01128cf8a;
    stim[21] = 33'h1339518c2;
    stim[22] = 33'h00d20d13a;
    stim[23] = 33'h06e878ee8;
    stim[24] = 33'h1483dd47e;
    stim[25] = 33'h00efb77fa;
    stim[26] = 33'h154f60616;
    stim[27] = 33'h1050b7e82;
    stim[28] = 33'h0ca571468;
    stim[29] = 33'h0bff9895a;
    stim[30] = 33'h1fc8e914a;
    stim[31] = 33'h0a487cf76;
    stim[32] = 33'h01d35fad6;
    stim[33] = 33'h17c6058f4;
    stim[34] = 33'h04c12465e;
    stim[35] = 33'h0d67ca91c;
    stim[36] = 33'h0c9be6aa4;
    stim[37] = 33'h19c504000;
    stim[38] = 33'h035942b46;
    stim[39] = 33'h1faa2028a;
    stim[40] = 33'h03beb1eb0;
    stim[41] = 33'h1539c4b60;
    stim[42] = 33'h08251edb8;
    stim[43] = 33'h0d791d1f0;
    stim[44] = 33'h0a277ebee;
    stim[45] = 33'h1b2d18eac;
    stim[46] = 33'h192b52888;
    stim[47] = 33'h04e64d22e;
    stim[48] = 33'h052afe246;
    stim[49] = 33'h0cd1d2664;
    stim[50] = 33'h105e4a21a;
    stim[51] = 33'h1c186091a;
    stim[52] = 33'h04ba84d30;
    stim[53] = 33'h08ae251fe;
    stim[54] = 33'h099c35302;
    stim[55] = 33'h12805004e;
    stim[56] = 33'h0a07a31fe;
    stim[57] = 33'h12764a29e;
    stim[58] = 33'h1c7c91dcc;
    stim[59] = 33'h19b45bfca;
    stim[60] = 33'h0eba56734;
    stim[61] = 33'h0e7be3e56;
    stim[62] = 33'h1d4e0ad74;
    stim[63] = 33'h05dc8eada;
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
      expv[0] = 48'h00000000xxxx;
      expv[1] = 48'hxxxx00000000;
      expv[2] = 48'hxxxx0000xxxx;
      expv[3] = 48'hxxxx0000xxxx;
      expv[4] = 48'hffff0001xxxx;
      expv[5] = 48'hba75xxxxxa75;
      expv[6] = 48'h0000xxxxxa75;
      expv[7] = 48'hffffxxxxx000;
      expv[8] = 48'h000080000bb5;
      expv[9] = 48'hffff80008aac;
      expv[10] = 48'hfffe00013879;
      expv[11] = 48'h07b180019fb3;
      expv[12] = 48'h90ce4fd99fb3;
      expv[13] = 48'h6cae4fda10ce;
      expv[14] = 48'h0001486764b2;
      expv[15] = 48'h2fdd48678001;
      expv[16] = 48'hc6618000a0a6;
      expv[17] = 48'h6cadd05320a6;
      expv[18] = 48'hffff5053a0a6;
      expv[19] = 48'ha87650532875;
      expv[20] = 48'h67c55053a876;
      expv[21] = 48'h67c5d05467c5;
      expv[22] = 48'h000033e2e7c5;
      expv[23] = 48'hffff33e30000;
      expv[24] = 48'h0000b3e3ffff;
      expv[25] = 48'h00007fffffff;
      expv[26] = 48'hffff80000000;
      expv[27] = 48'hffff0000aa7b;
      expv[28] = 48'h0000553daa7b;
      expv[29] = 48'h0001553e0000;
      expv[30] = 48'hffff553e8001;
      expv[31] = 48'hffff00008001;
      expv[32] = 48'hffff00017fff;
      expv[33] = 48'h00000001ffff;
      expv[34] = 48'h000000023e30;
      expv[35] = 48'h000000028000;
      expv[36] = 48'hcaae00030000;
      expv[37] = 48'h00008003caae;
      expv[38] = 48'hffff00044e28;
      expv[39] = 48'hffff0004ffff;
      expv[40] = 48'h000000057fff;
      expv[41] = 48'h25b080058000;
      expv[42] = 48'h092300000000;
      expv[43] = 48'h000000008923;
      expv[44] = 48'hffff00010000;
      expv[45] = 48'hffff8001ffff;
      expv[46] = 48'hffff80025968;
      expv[47] = 48'h00000002d968;
      expv[48] = 48'hffff00030000;
      expv[49] = 48'h00000003ffff;
      expv[50] = 48'h000000040000;
      expv[51] = 48'hfb72000002f2;
      expv[52] = 48'h2699000082f2;
      expv[53] = 48'h28ff00012699;
      expv[54] = 48'h567f0001a8ff;
      expv[55] = 48'h567f0002567f;
      expv[56] = 48'h00002b3fd67f;
      expv[57] = 48'hffff2b400000;
      expv[58] = 48'h00012b4093b2;
      expv[59] = 48'h20192b4163e4;
      expv[60] = 48'hcda271f24da2;
      expv[61] = 48'h000171f2cda2;
      expv[62] = 48'hffff71f30001;
      expv[63] = 48'h000071f3ea70;
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
