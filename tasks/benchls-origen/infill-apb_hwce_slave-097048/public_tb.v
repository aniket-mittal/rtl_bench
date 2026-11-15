// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097048 dut (
    .clk_i(clk),
    .rst_ni(in_vec[67:67]),
    .apb_hwce_addr_i(in_vec[66:35]),
    .apb_hwce_enable_i(in_vec[34:34]),
    .apb_hwce_psel_i(in_vec[33:33]),
    .apb_hwce_pwdata_i(in_vec[32:1]),
    .apb_hwce_pwrite_i(in_vec[0:0]),
    .apb_hwce_prdata_o(out_vec[33:2]),
    .apb_hwce_ready_o(out_vec[1:1]),
    .apb_hwce_pslverr_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h4d1c8da7809bda439;
    stim[1] = 68'h431025421c6d79b33;
    stim[2] = 68'h86ee7f7a2f42df4bc;
    stim[3] = 68'hb14cc66e861d485e7;
    stim[4] = 68'hb4c06eff3b8919938;
    stim[5] = 68'hefb40a95d6d893df6;
    stim[6] = 68'hc683e78a4a01e4b36;
    stim[7] = 68'h855f52b09d5aabcbb;
    stim[8] = 68'h9cc044694785f6062;
    stim[9] = 68'hbf46dca2c9ba2051b;
    stim[10] = 68'h8464c995e72fef0de;
    stim[11] = 68'hb25ec34e446648824;
    stim[12] = 68'hd1bc8e58608dca18a;
    stim[13] = 68'h95bbd330cde0df218;
    stim[14] = 68'hd2bef19835e249104;
    stim[15] = 68'h9d4e5dfb825b31fd3;
    stim[16] = 68'he68c95aa11df06b62;
    stim[17] = 68'hb951aad7ed6c06ad4;
    stim[18] = 68'hf7984d7f62a6eb745;
    stim[19] = 68'haad516e85f34674d7;
    stim[20] = 68'heb21605e9566fa68c;
    stim[21] = 68'hed684bbf504633896;
    stim[22] = 68'hb37ee849730566f87;
    stim[23] = 68'h84056316a4dfd766f;
    stim[24] = 68'hf44880ec4345f66f0;
    stim[25] = 68'he941adb6837cc8f4e;
    stim[26] = 68'hf02d97c1888fb2451;
    stim[27] = 68'h93558242570bcb06c;
    stim[28] = 68'h840c142da701dcbbf;
    stim[29] = 68'h930dad1c452c3bdf1;
    stim[30] = 68'hde87837232acfd053;
    stim[31] = 68'hc0a479a50711f2bf4;
    stim[32] = 68'he94758f82df7dc580;
    stim[33] = 68'hb47054ce9074cc6bc;
    stim[34] = 68'h9b32078ed76ae6892;
    stim[35] = 68'hbc8049eeed89b376c;
    stim[36] = 68'hfaa6540394b82a925;
    stim[37] = 68'hf1b2fddb29f91cf4c;
    stim[38] = 68'h91743a8705adc9acf;
    stim[39] = 68'h92f843bc18918bbf5;
    stim[40] = 68'he7094bb89934ec6a4;
    stim[41] = 68'h9a2cc2bf1105daeef;
    stim[42] = 68'hef38b517194678e04;
    stim[43] = 68'hc461971ab4dc58a0f;
    stim[44] = 68'h9c962b45d1f316f23;
    stim[45] = 68'ha45b36aa510044b7b;
    stim[46] = 68'hf3bd1a9ebdc6d18ee;
    stim[47] = 68'hb9fa116afaf87a6c0;
    stim[48] = 68'he6edeb17dc9c6f075;
    stim[49] = 68'h92566dcfd602bb0c7;
    stim[50] = 68'hf6ec4552dd704a4e3;
    stim[51] = 68'h97025a1201dc0e97f;
    stim[52] = 68'h958d96bed1e7de918;
    stim[53] = 68'hd892af58f95bc6264;
    stim[54] = 68'hcfdc6d2954badbf6e;
    stim[55] = 68'ha524d071f53d86584;
    stim[56] = 68'hae6ffd5981ff3c144;
    stim[57] = 68'h944f539b9b738751e;
    stim[58] = 68'h8f09d73be228ca472;
    stim[59] = 68'hc75f69f7b61d068ca;
    stim[60] = 68'hb90b9d5d37a297cfc;
    stim[61] = 68'ha549a6597827c46df;
    stim[62] = 68'hfb9c45486ced3c634;
    stim[63] = 68'h99e8adc856494a151;
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
      expv[0] = 34'h000000002;
      expv[1] = 34'h000000002;
      expv[2] = 34'h000000002;
      expv[3] = 34'h000000002;
      expv[4] = 34'h000000002;
      expv[5] = 34'h000000002;
      expv[6] = 34'h000000002;
      expv[7] = 34'h000000002;
      expv[8] = 34'h000000002;
      expv[9] = 34'h000000002;
      expv[10] = 34'h000000002;
      expv[11] = 34'h00369077a;
      expv[12] = 34'h00369077a;
      expv[13] = 34'h00369077a;
      expv[14] = 34'h00369077a;
      expv[15] = 34'h00369077a;
      expv[16] = 34'h00369077a;
      expv[17] = 34'h00369077a;
      expv[18] = 34'h00369077a;
      expv[19] = 34'h00369077a;
      expv[20] = 34'h00369077a;
      expv[21] = 34'h00369077a;
      expv[22] = 34'h00369077a;
      expv[23] = 34'h00369077a;
      expv[24] = 34'h00369077a;
      expv[25] = 34'h00369077a;
      expv[26] = 34'h00369077a;
      expv[27] = 34'h00369077a;
      expv[28] = 34'h00369077a;
      expv[29] = 34'h00369077a;
      expv[30] = 34'h00369077a;
      expv[31] = 34'h00369077a;
      expv[32] = 34'h00369077a;
      expv[33] = 34'h00369077a;
      expv[34] = 34'h00369077a;
      expv[35] = 34'h00369077a;
      expv[36] = 34'h00369077a;
      expv[37] = 34'h00369077a;
      expv[38] = 34'h00369077a;
      expv[39] = 34'h00369077a;
      expv[40] = 34'h00369077a;
      expv[41] = 34'h00369077a;
      expv[42] = 34'h00369077a;
      expv[43] = 34'h00369077a;
      expv[44] = 34'h00369077a;
      expv[45] = 34'h00369077a;
      expv[46] = 34'h00369077a;
      expv[47] = 34'h00369077a;
      expv[48] = 34'h00369077a;
      expv[49] = 34'h00369077a;
      expv[50] = 34'h00369077a;
      expv[51] = 34'h00369077a;
      expv[52] = 34'h00369077a;
      expv[53] = 34'h00369077a;
      expv[54] = 34'h00369077a;
      expv[55] = 34'h00369077a;
      expv[56] = 34'h00369077a;
      expv[57] = 34'h00369077a;
      expv[58] = 34'h00369077a;
      expv[59] = 34'h00369077a;
      expv[60] = 34'h00369077a;
      expv[61] = 34'h00369077a;
      expv[62] = 34'h00369077a;
      expv[63] = 34'h00369077a;
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
