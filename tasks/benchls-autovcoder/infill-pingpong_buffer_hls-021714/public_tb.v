// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021714 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5457e9483;
    stim[1] = 35'h59cd425cc;
    stim[2] = 35'h310833fd5;
    stim[3] = 35'h30a86e5cf;
    stim[4] = 35'h2016e62cb;
    stim[5] = 35'h122690fd8;
    stim[6] = 35'h283361018;
    stim[7] = 35'h0b1ae3e5f;
    stim[8] = 35'h1607a7dec;
    stim[9] = 35'h2087979da;
    stim[10] = 35'h2a2ffb4e0;
    stim[11] = 35'h3929d5134;
    stim[12] = 35'h0d4eb0d32;
    stim[13] = 35'h133f55372;
    stim[14] = 35'h0f0fb0168;
    stim[15] = 35'h3ea595d0c;
    stim[16] = 35'h233aaab69;
    stim[17] = 35'h0d8704ee2;
    stim[18] = 35'h1d84a8e97;
    stim[19] = 35'h3a5c590eb;
    stim[20] = 35'h089b979d4;
    stim[21] = 35'h0457f3201;
    stim[22] = 35'h3a4968dc0;
    stim[23] = 35'h320e06250;
    stim[24] = 35'h134aa82e4;
    stim[25] = 35'h0025850eb;
    stim[26] = 35'h31fd395aa;
    stim[27] = 35'h0e5cbe593;
    stim[28] = 35'h2103630f8;
    stim[29] = 35'h157b30617;
    stim[30] = 35'h0f9ff2e8c;
    stim[31] = 35'h16a73f7bd;
    stim[32] = 35'h39487030b;
    stim[33] = 35'h1a24d9b57;
    stim[34] = 35'h0f1f57fa0;
    stim[35] = 35'h3cb0a31f7;
    stim[36] = 35'h053015d1f;
    stim[37] = 35'h30d083aa0;
    stim[38] = 35'h2d447cfa6;
    stim[39] = 35'h22fe2083c;
    stim[40] = 35'h3f38f2eba;
    stim[41] = 35'h15c62bfb1;
    stim[42] = 35'h2d316c368;
    stim[43] = 35'h393721b73;
    stim[44] = 35'h22f7161c3;
    stim[45] = 35'h3c7e9539f;
    stim[46] = 35'h535eb7be9;
    stim[47] = 35'h297f93046;
    stim[48] = 35'h1c1a1d06e;
    stim[49] = 35'h265b8eda5;
    stim[50] = 35'h0c6015033;
    stim[51] = 35'h0a6cd53fd;
    stim[52] = 35'h30a2a2f17;
    stim[53] = 35'h04184e4ef;
    stim[54] = 35'h3f7a7c3f2;
    stim[55] = 35'h30146c57b;
    stim[56] = 35'h0d91d0a4d;
    stim[57] = 35'h185a3272c;
    stim[58] = 35'h0ee373ce8;
    stim[59] = 35'h1c94a0380;
    stim[60] = 35'h32273ddfd;
    stim[61] = 35'h357e29cf0;
    stim[62] = 35'h14b773cc0;
    stim[63] = 35'h1c1dd1a3b;
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
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h19cd425cc;
      expv[3] = 35'h710833fd4;
      expv[4] = 35'h70a86e5ce;
      expv[5] = 35'h6016e62cb;
      expv[6] = 35'h6016e62cb;
      expv[7] = 35'h6016e62ca;
      expv[8] = 35'h4b1ae3e5f;
      expv[9] = 35'h4b1ae3e5f;
      expv[10] = 35'h0b1ae3e5f;
      expv[11] = 35'h0b1ae3e5f;
      expv[12] = 35'h0b1ae3e5f;
      expv[13] = 35'h0b1ae3e5f;
      expv[14] = 35'h0b1ae3e5f;
      expv[15] = 35'h0b1ae3e5f;
      expv[16] = 35'h0b1ae3e5f;
      expv[17] = 35'h6087979db;
      expv[18] = 35'h2087979db;
      expv[19] = 35'h4d8704ee2;
      expv[20] = 35'h7a5c590eb;
      expv[21] = 35'h7a5c590ea;
      expv[22] = 35'h4457f3200;
      expv[23] = 35'h7a4968dc0;
      expv[24] = 35'h720e06250;
      expv[25] = 35'h534aa82e4;
      expv[26] = 35'h4025850eb;
      expv[27] = 35'h0025850eb;
      expv[28] = 35'h71fd395ab;
      expv[29] = 35'h71fd395aa;
      expv[30] = 35'h557b30617;
      expv[31] = 35'h557b30616;
      expv[32] = 35'h56a73f7bc;
      expv[33] = 35'h79487030a;
      expv[34] = 35'h5a24d9b57;
      expv[35] = 35'h5a24d9b56;
      expv[36] = 35'h7cb0a31f6;
      expv[37] = 35'h453015d1f;
      expv[38] = 35'h453015d1f;
      expv[39] = 35'h053015d1f;
      expv[40] = 35'h053015d1f;
      expv[41] = 35'h053015d1f;
      expv[42] = 35'h6d447cfa7;
      expv[43] = 35'h6d447cfa6;
      expv[44] = 35'h793721b72;
      expv[45] = 35'h62f7161c2;
      expv[46] = 35'h7c7e9539e;
      expv[47] = 35'h3c7e9539c;
      expv[48] = 35'h697f93044;
      expv[49] = 35'h5c1a1d06e;
      expv[50] = 35'h665b8eda4;
      expv[51] = 35'h4c6015032;
      expv[52] = 35'h4a6cd53fc;
      expv[53] = 35'h70a2a2f16;
      expv[54] = 35'h44184e4ef;
      expv[55] = 35'h04184e4ef;
      expv[56] = 35'h7f7a7c3f2;
      expv[57] = 35'h4d91d0a4c;
      expv[58] = 35'h585a3272c;
      expv[59] = 35'h4ee373ce8;
      expv[60] = 35'h5c94a0380;
      expv[61] = 35'h72273ddfc;
      expv[62] = 35'h757e29cf0;
      expv[63] = 35'h54b773cc0;
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
