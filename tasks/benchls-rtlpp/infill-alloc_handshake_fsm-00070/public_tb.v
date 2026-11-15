// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00070 dut (
    .ap_clk(clk),
    .alloc_size_ap_vld(in_vec[77:77]),
    .alloc_addr_ap_ack(in_vec[76:76]),
    .alloc_free_target_ap_vld(in_vec[75:75]),
    .alloc_cmd_ap_vld(in_vec[74:74]),
    .ap_rst(in_vec[73:73]),
    .ap_start(in_vec[72:72]),
    .alloc_size(in_vec[71:40]),
    .alloc_free_target(in_vec[39:8]),
    .alloc_cmd(in_vec[7:0]),
    .alloc_size_ap_ack(out_vec[38:38]),
    .alloc_addr_ap_vld(out_vec[37:37]),
    .alloc_free_target_ap_ack(out_vec[36:36]),
    .alloc_cmd_ap_ack(out_vec[35:35]),
    .ap_done(out_vec[34:34]),
    .ap_idle(out_vec[33:33]),
    .ap_ready(out_vec[32:32]),
    .alloc_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h2ed38d0acf645cbeb403;
    stim[1] = 78'h3e6026d9fb74cd74fda8;
    stim[2] = 78'h3458eb92246df7f3227f;
    stim[3] = 78'h20c6d49ee084e5a6e1cf;
    stim[4] = 78'h001bbe76f013bf5244fa;
    stim[5] = 78'h2514e08581749da69475;
    stim[6] = 78'h35c1373e2ffbd9bd3db8;
    stim[7] = 78'h34237f2377cbe74f3831;
    stim[8] = 78'h38b7b13fa4ffff18deb1;
    stim[9] = 78'h05843367b48aa91e4cbf;
    stim[10] = 78'h31ada8ca31433fd2c481;
    stim[11] = 78'h006c9bce84a3012e69d3;
    stim[12] = 78'h347efdf8a7ecf88a32fa;
    stim[13] = 78'h3130b9286c517e7b5f34;
    stim[14] = 78'h04aefdcb4aee144d8da1;
    stim[15] = 78'h38e79e3d30e8967f7313;
    stim[16] = 78'h0849ac02803e419b6d65;
    stim[17] = 78'h10d2bf4fee257a4c1f0b;
    stim[18] = 78'h35ae97ddf22a76121928;
    stim[19] = 78'h345586b97d5cfb47322c;
    stim[20] = 78'h11677766ebab69b396c7;
    stim[21] = 78'h150d5bcb39fe12b6c368;
    stim[22] = 78'h3d4a3068157e39b36123;
    stim[23] = 78'h1406a60cb20fb66639c9;
    stim[24] = 78'h0c345ae5755fa91888bf;
    stim[25] = 78'h311a5485d9d5731832ff;
    stim[26] = 78'h21c86fdea81b4e57ec77;
    stim[27] = 78'h01bb3ec6f631f6b06362;
    stim[28] = 78'h3c86738d8256b65b8aca;
    stim[29] = 78'h003e53de438926b48641;
    stim[30] = 78'h19339cb6cd1c3e2f9063;
    stim[31] = 78'h112ce84e8aff198a5d9d;
    stim[32] = 78'h20e7130ec67e2fed5780;
    stim[33] = 78'h24240f106b4126c1d791;
    stim[34] = 78'h0df94ebcd8a0f7050691;
    stim[35] = 78'h2dd7ad5494a3d903daf8;
    stim[36] = 78'h28a4ef5e698b771318c2;
    stim[37] = 78'h2163c8db2097fbc56a80;
    stim[38] = 78'h1d641faadc644491f644;
    stim[39] = 78'h0d354b7cb6d5ed854a87;
    stim[40] = 78'h38d6f78b752387eab5b5;
    stim[41] = 78'h3cd5dbb8004dba04c57a;
    stim[42] = 78'h2955ea1f1e67d6db82b3;
    stim[43] = 78'h15aa87bf83a515e0b305;
    stim[44] = 78'h1d2ae89baa12a11b91e1;
    stim[45] = 78'h31c102e64016aa98eb7c;
    stim[46] = 78'h1044c1347efb161842c8;
    stim[47] = 78'h3c785690fd92341c6420;
    stim[48] = 78'h05123847f963388d7eb8;
    stim[49] = 78'h092fd4b0e17bdf3c0e33;
    stim[50] = 78'h2484e32e6add45d42995;
    stim[51] = 78'h0d6794fd8d5ce8eabba2;
    stim[52] = 78'h388d10846ccc87a08e95;
    stim[53] = 78'h242c1a73f62f21322c57;
    stim[54] = 78'h013249960cd25a872fea;
    stim[55] = 78'h180237ae1fec64175e72;
    stim[56] = 78'h185d4353a2cb0a0675be;
    stim[57] = 78'h28351c35a9643f3b7b0d;
    stim[58] = 78'h0cc74b3d12fc34d53689;
    stim[59] = 78'h0ea7d5652dffc68211a4;
    stim[60] = 78'h20053d1b38708ec92a7f;
    stim[61] = 78'h0d97f0e249430961b7a7;
    stim[62] = 78'h31a92c5632c2736b89fc;
    stim[63] = 78'h09f780a8a4c6998e0534;
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
      expv[0] = 39'h0200000000;
      expv[1] = 39'h0200000000;
      expv[2] = 39'h0200000000;
      expv[3] = 39'h0200000000;
      expv[4] = 39'h0200000000;
      expv[5] = 39'h0200000000;
      expv[6] = 39'h6d00000000;
      expv[7] = 39'h4d00000000;
      expv[8] = 39'h4a00000000;
      expv[9] = 39'h4a00000000;
      expv[10] = 39'h2d00000000;
      expv[11] = 39'h4500000000;
      expv[12] = 39'h4200000000;
      expv[13] = 39'h4200000000;
      expv[14] = 39'h4500000000;
      expv[15] = 39'h4200000000;
      expv[16] = 39'h4200000000;
      expv[17] = 39'h4200000000;
      expv[18] = 39'h4200000000;
      expv[19] = 39'h4d00000000;
      expv[20] = 39'h4a00000000;
      expv[21] = 39'h0500000000;
      expv[22] = 39'h0d00000000;
      expv[23] = 39'h5d00000000;
      expv[24] = 39'h5a00000000;
      expv[25] = 39'h5a00000000;
      expv[26] = 39'h4500000000;
      expv[27] = 39'h6500000000;
      expv[28] = 39'h2500000000;
      expv[29] = 39'h2200000000;
      expv[30] = 39'h2200000000;
      expv[31] = 39'h1500000000;
      expv[32] = 39'h0500000000;
      expv[33] = 39'h0200000000;
      expv[34] = 39'h0200000000;
      expv[35] = 39'h3d00000000;
      expv[36] = 39'h7d00000000;
      expv[37] = 39'h7a00000000;
      expv[38] = 39'h6500000000;
      expv[39] = 39'h1d00000000;
      expv[40] = 39'h3d00000000;
      expv[41] = 39'h3a00000000;
      expv[42] = 39'h3a00000000;
      expv[43] = 39'h7500000000;
      expv[44] = 39'h0d00000000;
      expv[45] = 39'h1d00000000;
      expv[46] = 39'h4500000000;
      expv[47] = 39'h4200000000;
      expv[48] = 39'h4200000000;
      expv[49] = 39'h2d00000000;
      expv[50] = 39'h3500000000;
      expv[51] = 39'h3200000000;
      expv[52] = 39'h3d00000000;
      expv[53] = 39'h3a00000000;
      expv[54] = 39'h3a00000000;
      expv[55] = 39'h2500000000;
      expv[56] = 39'h2200000000;
      expv[57] = 39'h2200000000;
      expv[58] = 39'h2200000000;
      expv[59] = 39'h0200000000;
      expv[60] = 39'h0200000000;
      expv[61] = 39'h0200000000;
      expv[62] = 39'h3d00000000;
      expv[63] = 39'h4500000000;
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
