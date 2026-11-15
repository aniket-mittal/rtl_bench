// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06974 dut (
    .clk(clk),
    .ce(in_vec[29:29]),
    .a1(in_vec[28:19]),
    .a2(in_vec[18:9]),
    .din(in_vec[8:1]),
    .we(in_vec[0:0]),
    .dout1(out_vec[15:8]),
    .dout2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3d40856d;
    stim[1] = 30'h351b4593;
    stim[2] = 30'h2151a654;
    stim[3] = 30'h2bc21809;
    stim[4] = 30'h056ff1a7;
    stim[5] = 30'h0d81c877;
    stim[6] = 30'h1bbb434e;
    stim[7] = 30'h3c086dd9;
    stim[8] = 30'h35f93333;
    stim[9] = 30'h143ee7c6;
    stim[10] = 30'h10270251;
    stim[11] = 30'h29002215;
    stim[12] = 30'h3c2df9c0;
    stim[13] = 30'h3da9a603;
    stim[14] = 30'h19c1cbd2;
    stim[15] = 30'h007c4d53;
    stim[16] = 30'h280f48b4;
    stim[17] = 30'h056d090d;
    stim[18] = 30'h154c3394;
    stim[19] = 30'h073998ff;
    stim[20] = 30'h3f9552ac;
    stim[21] = 30'h2cb1137a;
    stim[22] = 30'h2a568546;
    stim[23] = 30'h2ae6352d;
    stim[24] = 30'h2dc10621;
    stim[25] = 30'h2827a59e;
    stim[26] = 30'h083e74bc;
    stim[27] = 30'h2f36c340;
    stim[28] = 30'h0e1fccbc;
    stim[29] = 30'h3dfdaf5e;
    stim[30] = 30'h3fe46101;
    stim[31] = 30'h25cd0b64;
    stim[32] = 30'h1aadb635;
    stim[33] = 30'h0e419f6a;
    stim[34] = 30'h01759099;
    stim[35] = 30'h1415749b;
    stim[36] = 30'h18d58432;
    stim[37] = 30'h220a6527;
    stim[38] = 30'h1deb86a4;
    stim[39] = 30'h3fc03e8f;
    stim[40] = 30'h3f15833b;
    stim[41] = 30'h27cf657b;
    stim[42] = 30'h1137ae2a;
    stim[43] = 30'h2af2c141;
    stim[44] = 30'h02c2d993;
    stim[45] = 30'h088c78c0;
    stim[46] = 30'h3904ef7d;
    stim[47] = 30'h1ee05b4d;
    stim[48] = 30'h3613fecd;
    stim[49] = 30'h23057f96;
    stim[50] = 30'h06b180a3;
    stim[51] = 30'h0f40508d;
    stim[52] = 30'h1ff072ce;
    stim[53] = 30'h02c29766;
    stim[54] = 30'h009cd72a;
    stim[55] = 30'h249a960d;
    stim[56] = 30'h28f2af20;
    stim[57] = 30'h224fba8a;
    stim[58] = 30'h359c7e52;
    stim[59] = 30'h34696a8e;
    stim[60] = 30'h0bfdfddf;
    stim[61] = 30'h1372ee55;
    stim[62] = 30'h1465f07e;
    stim[63] = 30'h37d4a68a;
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
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxec;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxx99;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
