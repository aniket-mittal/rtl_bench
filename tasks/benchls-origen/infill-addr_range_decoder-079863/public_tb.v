// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_079863 dut (
    .virtual_addr(in_vec[31:0]),
    .phys_addr(out_vec[39:8]),
    .device_en(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h91576e16;
    stim[1] = 32'ha0f5d784;
    stim[2] = 32'h01746c71;
    stim[3] = 32'h0145fb61;
    stim[4] = 32'h1f4fc77c;
    stim[5] = 32'h4d9a7bf5;
    stim[6] = 32'h1bd3ed1a;
    stim[7] = 32'h04ddf347;
    stim[8] = 32'h601209f3;
    stim[9] = 32'h34b1f13e;
    stim[10] = 32'h96a60ced;
    stim[11] = 32'hca7a9b04;
    stim[12] = 32'hb4255bd1;
    stim[13] = 32'hf8188df6;
    stim[14] = 32'h1623835f;
    stim[15] = 32'he46aeddc;
    stim[16] = 32'hfe097fb4;
    stim[17] = 32'h44b0e39c;
    stim[18] = 32'h811ab1bc;
    stim[19] = 32'hb2f226d2;
    stim[20] = 32'h07aba971;
    stim[21] = 32'h581e2aa1;
    stim[22] = 32'h48550e1f;
    stim[23] = 32'h3e54021f;
    stim[24] = 32'h658ead89;
    stim[25] = 32'h69ec8cf2;
    stim[26] = 32'hb8e36bc3;
    stim[27] = 32'he1093af4;
    stim[28] = 32'h4275f1e7;
    stim[29] = 32'h366ac1e0;
    stim[30] = 32'h03b370ce;
    stim[31] = 32'h6eed0374;
    stim[32] = 32'h8a86e8f1;
    stim[33] = 32'hae06fbf2;
    stim[34] = 32'h385806eb;
    stim[35] = 32'h2d75b3fc;
    stim[36] = 32'h69921a9c;
    stim[37] = 32'hb547dd7f;
    stim[38] = 32'h5de0e3fe;
    stim[39] = 32'h461f24d1;
    stim[40] = 32'h7ba8f498;
    stim[41] = 32'hb8083365;
    stim[42] = 32'h435b741d;
    stim[43] = 32'h5f506a26;
    stim[44] = 32'h9d57b085;
    stim[45] = 32'hf11f02a5;
    stim[46] = 32'h743b8adc;
    stim[47] = 32'hf2d38f74;
    stim[48] = 32'h42fb07a2;
    stim[49] = 32'h2ede8214;
    stim[50] = 32'hf330e08d;
    stim[51] = 32'h90f87e90;
    stim[52] = 32'hc7bfd8ec;
    stim[53] = 32'hf816ccd1;
    stim[54] = 32'h7b6433cc;
    stim[55] = 32'h80b99e98;
    stim[56] = 32'hf18cb6bf;
    stim[57] = 32'hd0fd9a3b;
    stim[58] = 32'h5cbecfaa;
    stim[59] = 32'haf00d71f;
    stim[60] = 32'h57a34c51;
    stim[61] = 32'he734ebd8;
    stim[62] = 32'h98d88ffa;
    stim[63] = 32'h91d1a0f5;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
