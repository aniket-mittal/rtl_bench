// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152838 dut (
    .sys_rst(clk),
    .csr_selected(in_vec[38:38]),
    .csr_a(in_vec[37:33]),
    .csr_we(in_vec[32:32]),
    .csr_di(in_vec[31:0]),
    .csr_do(out_vec[56:25]),
    .sdram_cs_n(out_vec[24:24]),
    .sdram_we_n(out_vec[23:23]),
    .sdram_cas_n(out_vec[22:22]),
    .sdram_ras_n(out_vec[21:21]),
    .sdram_adr(out_vec[20:8]),
    .sdram_ba(out_vec[7:6]),
    .sdram_rst(out_vec[5:5]),
    .bypass(out_vec[4:4]),
    .idelay_rst(out_vec[3:3]),
    .idelay_ce(out_vec[2:2]),
    .idelay_inc(out_vec[1:1]),
    .idelay_cal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h6c2f758a40;
    stim[1] = 39'h435675fd8b;
    stim[2] = 39'h7f34fa4211;
    stim[3] = 39'h4e72649c39;
    stim[4] = 39'h02121ee2f0;
    stim[5] = 39'h74f0b29b3e;
    stim[6] = 39'h3f2ae1f70b;
    stim[7] = 39'h6a4f3840c0;
    stim[8] = 39'h0aa686f1a0;
    stim[9] = 39'h26eb875d2b;
    stim[10] = 39'h607d41feee;
    stim[11] = 39'h0c400ba18d;
    stim[12] = 39'h118ca55435;
    stim[13] = 39'h27aaf69750;
    stim[14] = 39'h61a2538cc1;
    stim[15] = 39'h48a5eceefb;
    stim[16] = 39'h4be53f46ac;
    stim[17] = 39'h5273987483;
    stim[18] = 39'h14bf66257b;
    stim[19] = 39'h79c19f06dd;
    stim[20] = 39'h346647e938;
    stim[21] = 39'h43de5a7fa0;
    stim[22] = 39'h6af6f4b9e9;
    stim[23] = 39'h4668ff16f3;
    stim[24] = 39'h0761d92015;
    stim[25] = 39'h697ab5d97c;
    stim[26] = 39'h01614372d4;
    stim[27] = 39'h4129a2a966;
    stim[28] = 39'h60cef16c3c;
    stim[29] = 39'h01f7b8f7f0;
    stim[30] = 39'h4ed1213349;
    stim[31] = 39'h645f6d412f;
    stim[32] = 39'h13b88529a2;
    stim[33] = 39'h7ff51a1c8b;
    stim[34] = 39'h603a71de10;
    stim[35] = 39'h1ffc18c220;
    stim[36] = 39'h35c5ffe154;
    stim[37] = 39'h32d992a85f;
    stim[38] = 39'h01422a9193;
    stim[39] = 39'h548fbb4995;
    stim[40] = 39'h735e7756ae;
    stim[41] = 39'h0f231837a1;
    stim[42] = 39'h45345aabbd;
    stim[43] = 39'h6ffec89248;
    stim[44] = 39'h22425a9f98;
    stim[45] = 39'h3c3f8136cd;
    stim[46] = 39'h6a37ba7ebc;
    stim[47] = 39'h3d026b50f5;
    stim[48] = 39'h5bc909950f;
    stim[49] = 39'h0dadbdc2b0;
    stim[50] = 39'h07c3f005d0;
    stim[51] = 39'h4e8bbe2e66;
    stim[52] = 39'h3e3978db42;
    stim[53] = 39'h147692ea6a;
    stim[54] = 39'h560010f4eb;
    stim[55] = 39'h30e4406f8f;
    stim[56] = 39'h1df662fb5a;
    stim[57] = 39'h14e950c30a;
    stim[58] = 39'h7547b670ab;
    stim[59] = 39'h4438708802;
    stim[60] = 39'h0b65e22178;
    stim[61] = 39'h7778621f91;
    stim[62] = 39'h75d8809175;
    stim[63] = 39'h5b8119fa41;
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
      expv[0] = 57'h00000000xxxxxxx;
      expv[1] = 57'h000000001e00028;
      expv[2] = 57'h000000001e00028;
      expv[3] = 57'h000000001e00028;
      expv[4] = 57'h000000001e00028;
      expv[5] = 57'h000000001e00028;
      expv[6] = 57'h000000001e00028;
      expv[7] = 57'h000000001e00028;
      expv[8] = 57'h000000001e00028;
      expv[9] = 57'h000000001e00028;
      expv[10] = 57'h000000001e00028;
      expv[11] = 57'h000000001e00028;
      expv[12] = 57'h00000001fe00028;
      expv[13] = 57'h000000001e00028;
      expv[14] = 57'h000000001e00028;
      expv[15] = 57'h000000001e00028;
      expv[16] = 57'h000000001e00028;
      expv[17] = 57'h000000005e00028;
      expv[18] = 57'h000000011e00028;
      expv[19] = 57'h000000001e00028;
      expv[20] = 57'h000000001e00028;
      expv[21] = 57'h1bcb4ff41e00028;
      expv[22] = 57'h000000001e00028;
      expv[23] = 57'h000000001e00028;
      expv[24] = 57'h000000001e00028;
      expv[25] = 57'h000000001e00028;
      expv[26] = 57'h000000001e00028;
      expv[27] = 57'h0534552cde00028;
      expv[28] = 57'h000000001e00028;
      expv[29] = 57'h000000001e00028;
      expv[30] = 57'h000000001e00028;
      expv[31] = 57'h000000001e00028;
      expv[32] = 57'h000000005e00028;
      expv[33] = 57'h000000001e00028;
      expv[34] = 57'h000000001e00028;
      expv[35] = 57'h000000001e00028;
      expv[36] = 57'h000000001e00028;
      expv[37] = 57'h000000001e00028;
      expv[38] = 57'h000000001e00028;
      expv[39] = 57'h000000011e00028;
      expv[40] = 57'h000000001e00028;
      expv[41] = 57'h000000001e00028;
      expv[42] = 57'h068b5577be00028;
      expv[43] = 57'h000000001e00028;
      expv[44] = 57'h000000001e00028;
      expv[45] = 57'h000000001e00028;
      expv[46] = 57'h000000001e00028;
      expv[47] = 57'h000000001e00028;
      expv[48] = 57'h000000001e00028;
      expv[49] = 57'h000000001e00028;
      expv[50] = 57'h000000001e00028;
      expv[51] = 57'h000000001e00028;
      expv[52] = 57'h000000001e00028;
      expv[53] = 57'h000000011e00028;
      expv[54] = 57'h000000001e00028;
      expv[55] = 57'h000000001e00028;
      expv[56] = 57'h000000001e00028;
      expv[57] = 57'h000000011e00028;
      expv[58] = 57'h000000001e00028;
      expv[59] = 57'h000000001e00028;
      expv[60] = 57'h000000001e00028;
      expv[61] = 57'h000000001e00028;
      expv[62] = 57'h000000001e00028;
      expv[63] = 57'h000000001e00028;
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
