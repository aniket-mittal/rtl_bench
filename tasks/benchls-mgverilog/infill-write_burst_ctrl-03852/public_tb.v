// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03852 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .i_enable(in_vec[26:26]),
    .i_wr_rdy(in_vec[25:24]),
    .i_wr_size(in_vec[23:0]),
    .o_wr_act(out_vec[34:33]),
    .o_wr_stb(out_vec[32:32]),
    .o_wr_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'he975dce;
    stim[1] = 28'hba32f32;
    stim[2] = 28'h4806bd0;
    stim[3] = 28'hd981ba7;
    stim[4] = 28'h2dc03ab;
    stim[5] = 28'h0446c89;
    stim[6] = 28'h0a143f0;
    stim[7] = 28'h049884b;
    stim[8] = 28'h73556e9;
    stim[9] = 28'h3036655;
    stim[10] = 28'h33fe030;
    stim[11] = 28'h4b2b687;
    stim[12] = 28'h61f4e25;
    stim[13] = 28'h7de895d;
    stim[14] = 28'h50e8ab2;
    stim[15] = 28'h22fa285;
    stim[16] = 28'h71255e8;
    stim[17] = 28'h6015c1d;
    stim[18] = 28'h015ab63;
    stim[19] = 28'h3e46038;
    stim[20] = 28'h705d12f;
    stim[21] = 28'h3efa0a5;
    stim[22] = 28'h4e5acca;
    stim[23] = 28'h3ddb1cc;
    stim[24] = 28'h376d942;
    stim[25] = 28'h4679a0a;
    stim[26] = 28'h2f69e8c;
    stim[27] = 28'h35a00df;
    stim[28] = 28'h1d66815;
    stim[29] = 28'h41383c8;
    stim[30] = 28'h752968a;
    stim[31] = 28'h31a96f5;
    stim[32] = 28'h4036224;
    stim[33] = 28'h7d1473e;
    stim[34] = 28'h76dcebf;
    stim[35] = 28'h26106cb;
    stim[36] = 28'h2c8f436;
    stim[37] = 28'h596b1e1;
    stim[38] = 28'h7f35b88;
    stim[39] = 28'h123b732;
    stim[40] = 28'h5165f13;
    stim[41] = 28'h50b0948;
    stim[42] = 28'h075a47c;
    stim[43] = 28'h6ac0127;
    stim[44] = 28'h5c890c4;
    stim[45] = 28'h33cd21a;
    stim[46] = 28'h1938281;
    stim[47] = 28'h336bd97;
    stim[48] = 28'h64c7c2f;
    stim[49] = 28'h5c00733;
    stim[50] = 28'h64ccc71;
    stim[51] = 28'h683ff7f;
    stim[52] = 28'h59705c4;
    stim[53] = 28'h59a5808;
    stim[54] = 28'h2f7c016;
    stim[55] = 28'h628223a;
    stim[56] = 28'h433dcd0;
    stim[57] = 28'h7b19c85;
    stim[58] = 28'h6a4a230;
    stim[59] = 28'h3bdc405;
    stim[60] = 28'h0d18b16;
    stim[61] = 28'h48e1415;
    stim[62] = 28'h26cf143;
    stim[63] = 28'h447df93;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h200000000;
      expv[10] = 35'h200000000;
      expv[11] = 35'h200000000;
      expv[12] = 35'h300000000;
      expv[13] = 35'h300000001;
      expv[14] = 35'h300000002;
      expv[15] = 35'h300000003;
      expv[16] = 35'h200000003;
      expv[17] = 35'h300000004;
      expv[18] = 35'h300000005;
      expv[19] = 35'h200000005;
      expv[20] = 35'h200000005;
      expv[21] = 35'h300000006;
      expv[22] = 35'h200000006;
      expv[23] = 35'h300000007;
      expv[24] = 35'h200000007;
      expv[25] = 35'h200000007;
      expv[26] = 35'h300000008;
      expv[27] = 35'h200000008;
      expv[28] = 35'h200000008;
      expv[29] = 35'h200000008;
      expv[30] = 35'h300000009;
      expv[31] = 35'h30000000a;
      expv[32] = 35'h20000000a;
      expv[33] = 35'h30000000b;
      expv[34] = 35'h30000000c;
      expv[35] = 35'h30000000d;
      expv[36] = 35'h20000000d;
      expv[37] = 35'h20000000d;
      expv[38] = 35'h30000000e;
      expv[39] = 35'h30000000f;
      expv[40] = 35'h20000000f;
      expv[41] = 35'h300000010;
      expv[42] = 35'h300000011;
      expv[43] = 35'h200000011;
      expv[44] = 35'h300000012;
      expv[45] = 35'h300000013;
      expv[46] = 35'h200000013;
      expv[47] = 35'h200000013;
      expv[48] = 35'h200000013;
      expv[49] = 35'h300000014;
      expv[50] = 35'h300000015;
      expv[51] = 35'h300000016;
      expv[52] = 35'h300000017;
      expv[53] = 35'h300000018;
      expv[54] = 35'h300000019;
      expv[55] = 35'h200000019;
      expv[56] = 35'h30000001a;
      expv[57] = 35'h30000001b;
      expv[58] = 35'h30000001c;
      expv[59] = 35'h30000001d;
      expv[60] = 35'h20000001d;
      expv[61] = 35'h20000001d;
      expv[62] = 35'h30000001e;
      expv[63] = 35'h20000001e;
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
