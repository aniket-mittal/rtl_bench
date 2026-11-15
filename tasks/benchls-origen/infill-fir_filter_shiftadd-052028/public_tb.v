// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052028 dut (
    .axis_aclk(clk),
    .axis_rstn(in_vec[33:33]),
    .valid_in(in_vec[32:32]),
    .sample_in(in_vec[31:0]),
    .valid_out(out_vec[32:32]),
    .sample_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h01cb6e6e7;
    stim[1] = 34'h1990eb647;
    stim[2] = 34'h31a3de127;
    stim[3] = 34'h25174ef65;
    stim[4] = 34'h3a1980e0c;
    stim[5] = 34'h155806d18;
    stim[6] = 34'h3f7c7ed0e;
    stim[7] = 34'h27e915164;
    stim[8] = 34'h3127180c0;
    stim[9] = 34'h37103fb15;
    stim[10] = 34'h2b4811ae2;
    stim[11] = 34'h347d381d9;
    stim[12] = 34'h236036d2c;
    stim[13] = 34'h3aabd1265;
    stim[14] = 34'h2aa816f0b;
    stim[15] = 34'h20943e101;
    stim[16] = 34'h39318f9c9;
    stim[17] = 34'h272ddca48;
    stim[18] = 34'h2e975e05d;
    stim[19] = 34'h3e66013fd;
    stim[20] = 34'h22231162e;
    stim[21] = 34'h2a94e77fd;
    stim[22] = 34'h3d2cd4274;
    stim[23] = 34'h2c6bd293b;
    stim[24] = 34'h2eb331db5;
    stim[25] = 34'h386b2b184;
    stim[26] = 34'h278e6dca2;
    stim[27] = 34'h378875fc3;
    stim[28] = 34'h313671312;
    stim[29] = 34'h361fca9a0;
    stim[30] = 34'h231e36d79;
    stim[31] = 34'h3241f508a;
    stim[32] = 34'h3f8bf2b0c;
    stim[33] = 34'h33aa6a933;
    stim[34] = 34'h2f891c256;
    stim[35] = 34'h2ee353342;
    stim[36] = 34'h2d2b299ee;
    stim[37] = 34'h3949b91b5;
    stim[38] = 34'h33eb9eefe;
    stim[39] = 34'h244e0f5f5;
    stim[40] = 34'h2694413ae;
    stim[41] = 34'h2d0420326;
    stim[42] = 34'h221cae000;
    stim[43] = 34'h3d99abafb;
    stim[44] = 34'h28d1c8ccb;
    stim[45] = 34'h32e049486;
    stim[46] = 34'h249f46e1d;
    stim[47] = 34'h259aa0aa2;
    stim[48] = 34'h3b58cfec4;
    stim[49] = 34'h24b38ee2a;
    stim[50] = 34'h3080d8f2a;
    stim[51] = 34'h27d80125b;
    stim[52] = 34'h290fccda5;
    stim[53] = 34'h3c7980601;
    stim[54] = 34'h23eb26e8a;
    stim[55] = 34'h2af57fd30;
    stim[56] = 34'h2e9b72982;
    stim[57] = 34'h2618c01cb;
    stim[58] = 34'h2934ec2e8;
    stim[59] = 34'h3b80bf598;
    stim[60] = 34'h284c4e53c;
    stim[61] = 34'h33f5d0748;
    stim[62] = 34'h3936d4d9a;
    stim[63] = 34'h2eb0f9b2f;
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
      expv[3] = 33'h100000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h1000005cc;
      expv[10] = 33'h100007611;
      expv[11] = 33'h000007611;
      expv[12] = 33'h100003485;
      expv[13] = 33'h000003485;
      expv[14] = 33'h10000609f;
      expv[15] = 33'h00000609f;
      expv[16] = 33'h00000609f;
      expv[17] = 33'h1ffff8575;
      expv[18] = 33'h0ffff8575;
      expv[19] = 33'h0ffff8575;
      expv[20] = 33'h1ffffd47e;
      expv[21] = 33'h0ffffd47e;
      expv[22] = 33'h0ffffd47e;
      expv[23] = 33'h100004af8;
      expv[24] = 33'h000004af8;
      expv[25] = 33'h000004af8;
      expv[26] = 33'h100003f7e;
      expv[27] = 33'h000003f7e;
      expv[28] = 33'h1ffffc5ec;
      expv[29] = 33'h100005ed4;
      expv[30] = 33'h10000035f;
      expv[31] = 33'h00000035f;
      expv[32] = 33'h100004e55;
      expv[33] = 33'h1ffffcf49;
      expv[34] = 33'h1ffffe30a;
      expv[35] = 33'h0ffffe30a;
      expv[36] = 33'h0ffffe30a;
      expv[37] = 33'h0ffffe30a;
      expv[38] = 33'h100006850;
      expv[39] = 33'h1ffffae30;
      expv[40] = 33'h0ffffae30;
      expv[41] = 33'h0ffffae30;
      expv[42] = 33'h0ffffae30;
      expv[43] = 33'h0ffffae30;
      expv[44] = 33'h1ffff9176;
      expv[45] = 33'h0ffff9176;
      expv[46] = 33'h1ffffcfad;
      expv[47] = 33'h0ffffcfad;
      expv[48] = 33'h0ffffcfad;
      expv[49] = 33'h1000072a5;
      expv[50] = 33'h0000072a5;
      expv[51] = 33'h100005907;
      expv[52] = 33'h000005907;
      expv[53] = 33'h000005907;
      expv[54] = 33'h1ffffdcaa;
      expv[55] = 33'h0ffffdcaa;
      expv[56] = 33'h0ffffdcaa;
      expv[57] = 33'h0ffffdcaa;
      expv[58] = 33'h0ffffdcaa;
      expv[59] = 33'h0ffffdcaa;
      expv[60] = 33'h1ffffe38a;
      expv[61] = 33'h0ffffe38a;
      expv[62] = 33'h100005038;
      expv[63] = 33'h1ffffe133;
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
