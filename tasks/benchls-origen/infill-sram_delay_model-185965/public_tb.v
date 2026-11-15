// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185965 dut (
    .clk(clk),
    .rst(in_vec[58:58]),
    .read_0(in_vec[57:57]),
    .rd_adr_0(in_vec[56:49]),
    .write_1(in_vec[48:48]),
    .wr_adr_1(in_vec[47:40]),
    .wr_din_1(in_vec[39:8]),
    .select_adr(in_vec[7:0]),
    .ready(out_vec[32:32]),
    .rd_dout_0(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h4e511dd71b9f6ae;
    stim[1] = 59'h4aad2be294dc687;
    stim[2] = 59'h3bc45746bb49b9e;
    stim[3] = 59'h10b26d90e82cbe6;
    stim[4] = 59'h1ec82d197886d7a;
    stim[5] = 59'h302e8bc91b8d93c;
    stim[6] = 59'h05143364c0bf045;
    stim[7] = 59'h23b831c9147162c;
    stim[8] = 59'h2593cf5064b26ac;
    stim[9] = 59'h3a5d312d2b11048;
    stim[10] = 59'h1936a7a16ddde43;
    stim[11] = 59'h237a262de7b5365;
    stim[12] = 59'h28dcdc144c2348d;
    stim[13] = 59'h2e9c46aec862856;
    stim[14] = 59'h1169237abeab644;
    stim[15] = 59'h04d33f97097d7e4;
    stim[16] = 59'h09d72a907d6bdfa;
    stim[17] = 59'h29db9532d2d29d1;
    stim[18] = 59'h2f4e225e9536239;
    stim[19] = 59'h0b1471dd6d2bcee;
    stim[20] = 59'h3fa7e2990565cc1;
    stim[21] = 59'h18e73df5df6833e;
    stim[22] = 59'h3d754fa977f2142;
    stim[23] = 59'h200b472d5c354b7;
    stim[24] = 59'h2ce0bc33fba9e20;
    stim[25] = 59'h3b406df3e2c2a9f;
    stim[26] = 59'h23171d19504e1f5;
    stim[27] = 59'h618084e5ea5f403;
    stim[28] = 59'h2dce755e87479c5;
    stim[29] = 59'h277ef819144b714;
    stim[30] = 59'h261fc6172c2dbdd;
    stim[31] = 59'h1046599a856599f;
    stim[32] = 59'h27555a7c81dc291;
    stim[33] = 59'h350dea134625500;
    stim[34] = 59'h35278b1ccccc4b5;
    stim[35] = 59'h3a73488bc8992d7;
    stim[36] = 59'h074367fd3fbe765;
    stim[37] = 59'h06ecd7267de735d;
    stim[38] = 59'h19d94341d805d30;
    stim[39] = 59'h0d9fe06b54520ae;
    stim[40] = 59'h20c50d65a5e8699;
    stim[41] = 59'h25d26435b52e5b4;
    stim[42] = 59'h372a403100a2eb1;
    stim[43] = 59'h3add31baac6f098;
    stim[44] = 59'h2dad0350df50ad9;
    stim[45] = 59'h2f4af7b00a2f07f;
    stim[46] = 59'h3ea2fddf04aac53;
    stim[47] = 59'h106dfe9edefc386;
    stim[48] = 59'h378b88189e07dd8;
    stim[49] = 59'h23641cbb0bfb8a7;
    stim[50] = 59'h37e7e8103417fbf;
    stim[51] = 59'h2f71776f5d8e0f8;
    stim[52] = 59'h1e808353fcfa203;
    stim[53] = 59'h37ace154735d5dd;
    stim[54] = 59'h0d213e90d664d6a;
    stim[55] = 59'h17fb227c575fc9f;
    stim[56] = 59'h3f4f103695657a3;
    stim[57] = 59'h119d8f4e4eb1c27;
    stim[58] = 59'h1322474912a5164;
    stim[59] = 59'h1c4042548b6585b;
    stim[60] = 59'h2b2eabbf01d9e71;
    stim[61] = 59'h1a4a7339998b0f4;
    stim[62] = 59'h0112f4012ec1c7a;
    stim[63] = 59'h23d6b8d846317c8;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h10000001d;
      expv[9] = 33'h10000002c;
      expv[10] = 33'h1000000d2;
      expv[11] = 33'h1000000d2;
      expv[12] = 33'h10000001b;
      expv[13] = 33'h100000046;
      expv[14] = 33'h100000074;
      expv[15] = 33'h100000074;
      expv[16] = 33'h100000074;
      expv[17] = 33'h100000074;
      expv[18] = 33'h10000004e;
      expv[19] = 33'h10000007a;
      expv[20] = 33'h10000007a;
      expv[21] = 33'h1000000fd;
      expv[22] = 33'h1000000fd;
      expv[23] = 33'h1000000eb;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000067;
      expv[26] = 33'h1000000da;
      expv[27] = 33'h100000018;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000030;
      expv[32] = 33'h100000030;
      expv[33] = 33'h10000003a;
      expv[34] = 33'h1000000a8;
      expv[35] = 33'h1000000a9;
      expv[36] = 33'h1000000d3;
      expv[37] = 33'h1000000d3;
      expv[38] = 33'h1000000d3;
      expv[39] = 33'h1000000d3;
      expv[40] = 33'h1000000d3;
      expv[41] = 33'h100000006;
      expv[42] = 33'h10000002e;
      expv[43] = 33'h1000000b9;
      expv[44] = 33'h1000000d6;
      expv[45] = 33'h10000006d;
      expv[46] = 33'h10000007a;
      expv[47] = 33'h1000000f5;
      expv[48] = 33'h1000000f5;
      expv[49] = 33'h1000000bc;
      expv[50] = 33'h10000001b;
      expv[51] = 33'h1000000bf;
      expv[52] = 33'h10000007b;
      expv[53] = 33'h10000007b;
      expv[54] = 33'h1000000bd;
      expv[55] = 33'h1000000bd;
      expv[56] = 33'h1000000bd;
      expv[57] = 33'h1000000fa;
      expv[58] = 33'h1000000fa;
      expv[59] = 33'h1000000fa;
      expv[60] = 33'h1000000fa;
      expv[61] = 33'h100000059;
      expv[62] = 33'h100000059;
      expv[63] = 33'h100000059;
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
