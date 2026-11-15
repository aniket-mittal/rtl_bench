// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138356 dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hc540d29a;
    stim[1] = 32'h18696db6;
    stim[2] = 32'hc739fbf9;
    stim[3] = 32'h995ad0cc;
    stim[4] = 32'h0ae58b7f;
    stim[5] = 32'h083fb511;
    stim[6] = 32'hc4c86ebe;
    stim[7] = 32'h6c874a98;
    stim[8] = 32'he1177215;
    stim[9] = 32'hd4e7ae0b;
    stim[10] = 32'ha2d46b36;
    stim[11] = 32'h3361c44f;
    stim[12] = 32'hf35a36ac;
    stim[13] = 32'h6684ad01;
    stim[14] = 32'he25e2a1b;
    stim[15] = 32'h1ca84089;
    stim[16] = 32'hbb14ae46;
    stim[17] = 32'hdd8e6af7;
    stim[18] = 32'h4e0f4f1f;
    stim[19] = 32'h0ec34ea8;
    stim[20] = 32'h6125fd16;
    stim[21] = 32'h5d36be1e;
    stim[22] = 32'hc05296d9;
    stim[23] = 32'ha3daa11e;
    stim[24] = 32'hf9dc38aa;
    stim[25] = 32'h1a4b2789;
    stim[26] = 32'hce20597e;
    stim[27] = 32'h15b76772;
    stim[28] = 32'h213d8ded;
    stim[29] = 32'hb7ac289f;
    stim[30] = 32'had1d6ff7;
    stim[31] = 32'h38463f87;
    stim[32] = 32'h479489c9;
    stim[33] = 32'hebbd0087;
    stim[34] = 32'h4a8a2d39;
    stim[35] = 32'h8fb2c989;
    stim[36] = 32'h648db85a;
    stim[37] = 32'hfa7f2754;
    stim[38] = 32'hea5ee975;
    stim[39] = 32'hf1cb232f;
    stim[40] = 32'h6de088ff;
    stim[41] = 32'haa5a88ce;
    stim[42] = 32'ha391ae0b;
    stim[43] = 32'h9ca8d73d;
    stim[44] = 32'hee8e2440;
    stim[45] = 32'h4afeb473;
    stim[46] = 32'h35ebae62;
    stim[47] = 32'hbcac39e3;
    stim[48] = 32'hafef1ad7;
    stim[49] = 32'hc4c39dc2;
    stim[50] = 32'hbe28613a;
    stim[51] = 32'h23e555e9;
    stim[52] = 32'hf6678be7;
    stim[53] = 32'h86270297;
    stim[54] = 32'hc83079de;
    stim[55] = 32'h7fa19c0b;
    stim[56] = 32'ha8b7981b;
    stim[57] = 32'hdf39ef69;
    stim[58] = 32'hc9a50a65;
    stim[59] = 32'h8d5fe96e;
    stim[60] = 32'hca99aa31;
    stim[61] = 32'h8ff784f9;
    stim[62] = 32'hf8e927e0;
    stim[63] = 32'hd3a34387;
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
      expv[0] = 32'h9ac540d2;
      expv[1] = 32'h18696db6;
      expv[2] = 32'hf9c739fb;
      expv[3] = 32'hcc995ad0;
      expv[4] = 32'h0ae58b7f;
      expv[5] = 32'h083fb511;
      expv[6] = 32'hbec4c86e;
      expv[7] = 32'h4a986c87;
      expv[8] = 32'h15e11772;
      expv[9] = 32'h0bd4e7ae;
      expv[10] = 32'h36a2d46b;
      expv[11] = 32'h61c44f33;
      expv[12] = 32'hacf35a36;
      expv[13] = 32'had016684;
      expv[14] = 32'h1be25e2a;
      expv[15] = 32'h1ca84089;
      expv[16] = 32'h46bb14ae;
      expv[17] = 32'hf7dd8e6a;
      expv[18] = 32'h4f1f4e0f;
      expv[19] = 32'h0ec34ea8;
      expv[20] = 32'hfd166125;
      expv[21] = 32'hbe1e5d36;
      expv[22] = 32'hd9c05296;
      expv[23] = 32'h1ea3daa1;
      expv[24] = 32'haaf9dc38;
      expv[25] = 32'h1a4b2789;
      expv[26] = 32'h7ece2059;
      expv[27] = 32'h15b76772;
      expv[28] = 32'h3d8ded21;
      expv[29] = 32'h9fb7ac28;
      expv[30] = 32'hf7ad1d6f;
      expv[31] = 32'h463f8738;
      expv[32] = 32'h89c94794;
      expv[33] = 32'h87ebbd00;
      expv[34] = 32'h2d394a8a;
      expv[35] = 32'h898fb2c9;
      expv[36] = 32'hb85a648d;
      expv[37] = 32'h54fa7f27;
      expv[38] = 32'h75ea5ee9;
      expv[39] = 32'h2ff1cb23;
      expv[40] = 32'h88ff6de0;
      expv[41] = 32'hceaa5a88;
      expv[42] = 32'h0ba391ae;
      expv[43] = 32'h3d9ca8d7;
      expv[44] = 32'h40ee8e24;
      expv[45] = 32'hb4734afe;
      expv[46] = 32'hebae6235;
      expv[47] = 32'he3bcac39;
      expv[48] = 32'hd7afef1a;
      expv[49] = 32'hc2c4c39d;
      expv[50] = 32'h3abe2861;
      expv[51] = 32'he555e923;
      expv[52] = 32'he7f6678b;
      expv[53] = 32'h97862702;
      expv[54] = 32'hdec83079;
      expv[55] = 32'h9c0b7fa1;
      expv[56] = 32'h1ba8b798;
      expv[57] = 32'h69df39ef;
      expv[58] = 32'h65c9a50a;
      expv[59] = 32'h6e8d5fe9;
      expv[60] = 32'h31ca99aa;
      expv[61] = 32'hf98ff784;
      expv[62] = 32'he0f8e927;
      expv[63] = 32'h87d3a343;
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
