// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09046 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h22bc8cd5e1a6422483bda30541aaa01;
    stim[1] = 122'h023f4adf9f684b8f1abe610ed3d03e9;
    stim[2] = 122'h33e83b737c49c6aa1cde9905e6327d9;
    stim[3] = 122'h1dc4edb47547abd5517f3436939975c;
    stim[4] = 122'h0d78a2ec5cda33fe1d6f2b18c3cbee5;
    stim[5] = 122'h23796c581bf3d9a46d5cc8285c4d99f;
    stim[6] = 122'h22c64d1538f9fd14ddfcd9f000c3e54;
    stim[7] = 122'h1ae2d4a9d507079709deda02b7a560f;
    stim[8] = 122'h32e0a7eb75b98b1aed4e23f247dffc6;
    stim[9] = 122'h230c911efda88d43e8cfe89e2d1f1e7;
    stim[10] = 122'h1c070080bf3bb121f4525ec6eb361cc;
    stim[11] = 122'h201dd70a556c9df8656ff37e4a83e30;
    stim[12] = 122'h0d86c04c6194b3258cc1734fba243f9;
    stim[13] = 122'h28133f6cc785d67aff4cd07193ef1ba;
    stim[14] = 122'h38a1553184781d960eed399ef47a4a6;
    stim[15] = 122'h0e7924819414840449401c77d5c2c33;
    stim[16] = 122'h18fd1584d3a8e5d534d5ed4667eb6be;
    stim[17] = 122'h07e92b44f33546d5b9c86d3759f628e;
    stim[18] = 122'h026903c42abfa595086bcec52cea475;
    stim[19] = 122'h2c154eddaa734b0c705e2f74a206857;
    stim[20] = 122'h125d8ef64da4075acf7353c960a053e;
    stim[21] = 122'h3c58a89f44406ce789ecd8bb2c81b5c;
    stim[22] = 122'h148b9c15b079bc5d037102a772d0c2f;
    stim[23] = 122'h18a6b63e0ad3a5b4bafa4f2ea20918b;
    stim[24] = 122'h2dd4ff13a0f3d45f2df35610ef4b4a8;
    stim[25] = 122'h2654acf1c7bc0103e467529e58936c0;
    stim[26] = 122'h2ae2375185a33156e52181a255e33bc;
    stim[27] = 122'h091a4a6debbb6c2ea3c6813663bbe96;
    stim[28] = 122'h31f81aae820c222fdbe556ebd9993c9;
    stim[29] = 122'h3db836235a871c94527f6f99a08e100;
    stim[30] = 122'h3735921e7e7fb8e0fd4a3acdef47ae7;
    stim[31] = 122'h1a58efd526a7293041d08ba9e72c78a;
    stim[32] = 122'h3ff8408a6bc8d599c2dd9d900424e4e;
    stim[33] = 122'h0822571d9555f7386da8c493938e0a0;
    stim[34] = 122'h11c3e0df9a29b7804cdce8c304db400;
    stim[35] = 122'h3fbb9c006c0710826c52e2b79245e35;
    stim[36] = 122'h305558c68a181a4a58e33cbf7ad1c06;
    stim[37] = 122'h2190c900fc66bca1751aabda486f096;
    stim[38] = 122'h390ca5168879b7a2895134b7c0839ba;
    stim[39] = 122'h0f63ec38dafc8d8b5a52a23e175acfd;
    stim[40] = 122'h1fa84eeb65213f07e575543a4e46e06;
    stim[41] = 122'h162f8fd91b0c909b0e77e85942182eb;
    stim[42] = 122'h1441c687a9574283217f64ac52bf767;
    stim[43] = 122'h027b56f6d15e74e52b42781d0aa4eaf;
    stim[44] = 122'h219488233ec935b75a74ab3c2595dbd;
    stim[45] = 122'h2f156cde85f7c36a5400772bd1ac996;
    stim[46] = 122'h2d2dfe8af1a140779fcbb8bc0c8b83a;
    stim[47] = 122'h0cac2d3a19ab185676c6fd7043e3e1f;
    stim[48] = 122'h3f35751dac6788364a5834e1d2ca7f3;
    stim[49] = 122'h1c4c1a2eb84a76cac8d4cb071a05460;
    stim[50] = 122'h253a7a6ccbb1a93ddcfdf4085c89417;
    stim[51] = 122'h1372a8180a4aa682dae0a791f469866;
    stim[52] = 122'h08848168511a67a71a43d5f8b9e8a15;
    stim[53] = 122'h0458cfd6af0db0fceaee10892265fd5;
    stim[54] = 122'h25b6d831f0ec7fe1685fb886a506bdd;
    stim[55] = 122'h051afd49ab509435dd4bf3d09ef2733;
    stim[56] = 122'h2307dc40f1602545535a92a3e9bfbca;
    stim[57] = 122'h04ee26bffb11f14896c59df6b15fd42;
    stim[58] = 122'h3c1e9cba82951f19eadad01e377f908;
    stim[59] = 122'h2495c678b3644d63666dee4d1bd61e1;
    stim[60] = 122'h189aa1c63e9eb792ade45539d6f2974;
    stim[61] = 122'h2ff6149afc996527df6d6e9adea2d43;
    stim[62] = 122'h15a7d22e01383daabee090a7be2dbdd;
    stim[63] = 122'h3eb7f524f02eda00d4e05c218102299;
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
      expv[0] = 53'h0000000000001f;
      expv[1] = 53'h0000000000201f;
      expv[2] = 53'h0000000000201f;
      expv[3] = 53'h0000000000001f;
      expv[4] = 53'h0000000000001f;
      expv[5] = 53'h0000000000001f;
      expv[6] = 53'h0000000000001f;
      expv[7] = 53'h0000000000001f;
      expv[8] = 53'h0000000000001f;
      expv[9] = 53'h0000000000201f;
      expv[10] = 53'h0000000000001f;
      expv[11] = 53'h0000000000001f;
      expv[12] = 53'h0000000000201f;
      expv[13] = 53'h0000000000001f;
      expv[14] = 53'h0000000000201f;
      expv[15] = 53'h0000000000001f;
      expv[16] = 53'h0000000000201f;
      expv[17] = 53'h0000000000001f;
      expv[18] = 53'h0000000000001f;
      expv[19] = 53'h0000000000001f;
      expv[20] = 53'h0000000000001f;
      expv[21] = 53'h0000000000001f;
      expv[22] = 53'h0000000000001f;
      expv[23] = 53'h0000000000201f;
      expv[24] = 53'h0000000000001f;
      expv[25] = 53'h0000000000001f;
      expv[26] = 53'h0000000000001f;
      expv[27] = 53'h0000000000001f;
      expv[28] = 53'h0000000000001f;
      expv[29] = 53'h0000000000001f;
      expv[30] = 53'h0000000000001f;
      expv[31] = 53'h0000000000001f;
      expv[32] = 53'h0000000000201f;
      expv[33] = 53'h0000000000001f;
      expv[34] = 53'h0000000000201f;
      expv[35] = 53'h0000000000001f;
      expv[36] = 53'h0000000000201f;
      expv[37] = 53'h0000000000401f;
      expv[38] = 53'h0000000000001f;
      expv[39] = 53'h0000000000001f;
      expv[40] = 53'h0000000000001f;
      expv[41] = 53'h0000000000001f;
      expv[42] = 53'h0000000000001f;
      expv[43] = 53'h0000000000001f;
      expv[44] = 53'h0000000000001f;
      expv[45] = 53'h0000000000401f;
      expv[46] = 53'h0000000000001f;
      expv[47] = 53'h0000000000201f;
      expv[48] = 53'h0000000000001f;
      expv[49] = 53'h0000000000201f;
      expv[50] = 53'h0000000000201f;
      expv[51] = 53'h0000000000201f;
      expv[52] = 53'h0000000000001f;
      expv[53] = 53'h0000000000201f;
      expv[54] = 53'h0000000000001f;
      expv[55] = 53'h0000000000001f;
      expv[56] = 53'h0000000000001f;
      expv[57] = 53'h0000000000201f;
      expv[58] = 53'h0000000000201f;
      expv[59] = 53'h0000000000001f;
      expv[60] = 53'h0000000000001f;
      expv[61] = 53'h0000000000001f;
      expv[62] = 53'h0000000000201f;
      expv[63] = 53'h0000000000201f;
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
