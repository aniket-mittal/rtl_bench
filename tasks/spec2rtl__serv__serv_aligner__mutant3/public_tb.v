// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h452251133f275e42e;
    stim[1] = 67'h5e77444fa4d5b2853;
    stim[2] = 67'h31a4629e0678d592d;
    stim[3] = 67'h052d719956518bc47;
    stim[4] = 67'h2fbfa91af648ac5ab;
    stim[5] = 67'h067f4ee2f0abe5a43;
    stim[6] = 67'h2cfab6a62eaac7aab;
    stim[7] = 67'h270383b201d7b8c84;
    stim[8] = 67'h05d27b5092eafa123;
    stim[9] = 67'h01079fe368da07b35;
    stim[10] = 67'h0d27a6d32a6a4e9ab;
    stim[11] = 67'h034de716fe969ee2a;
    stim[12] = 67'h03314312d42bc03f8;
    stim[13] = 67'h1c268de0f9c09cffb;
    stim[14] = 67'h1d720e81351533953;
    stim[15] = 67'h0155e951825e1631e;
    stim[16] = 67'h0a5ff0da72a6ca9ad;
    stim[17] = 67'h23f10e496cc1ef6f1;
    stim[18] = 67'h1da7102d6b882e17c;
    stim[19] = 67'h3eae0d920b828caf5;
    stim[20] = 67'h0f3554a5188793d0b;
    stim[21] = 67'h1b6c3fe02436a8e8e;
    stim[22] = 67'h0e9c6d152824c2a55;
    stim[23] = 67'h10398ea5f71d46a01;
    stim[24] = 67'h0204ca9a55133f36c;
    stim[25] = 67'h398425197d712d220;
    stim[26] = 67'h2d66148741aaf03d3;
    stim[27] = 67'h368583daa0e321487;
    stim[28] = 67'h285e18566ae02bb84;
    stim[29] = 67'h1bb012e5dff183462;
    stim[30] = 67'h0a25200c27d88aec6;
    stim[31] = 67'h36693d81621c72b5e;
    stim[32] = 67'h24815d11a75ba8b56;
    stim[33] = 67'h0ae53704faaf242d4;
    stim[34] = 67'h1371eddc120136d1c;
    stim[35] = 67'h3a3845b635a60198c;
    stim[36] = 67'h106d90aced2bf9fce;
    stim[37] = 67'h21dd754236cdb4acd;
    stim[38] = 67'h0ae523ec4648131f3;
    stim[39] = 67'h3bf008f626bb7d3f6;
    stim[40] = 67'h0c987dce17ea75ebc;
    stim[41] = 67'h210951d95e9aca3a6;
    stim[42] = 67'h01002fd5647964ec6;
    stim[43] = 67'h12fc9694806b697cf;
    stim[44] = 67'h3c144369603a48a6c;
    stim[45] = 67'h2e90410eac96701a9;
    stim[46] = 67'h02854cc2c1dcd65f2;
    stim[47] = 67'h0600be9d21731b0ee;
    stim[48] = 67'h168480c0ac50c2c7c;
    stim[49] = 67'h3357578a082201746;
    stim[50] = 67'h3fb7b1405a8986ab9;
    stim[51] = 67'h3a963886836b6aeba;
    stim[52] = 67'h0d83ea1fde905b9b3;
    stim[53] = 67'h13ee13b2b99a118a2;
    stim[54] = 67'h0fcc3536d35edffae;
    stim[55] = 67'h2a4c28f13e9217cb8;
    stim[56] = 67'h21f38812fe0da4f5f;
    stim[57] = 67'h07760f04fd76018c7;
    stim[58] = 67'h4b621bd7e2ff8b8ad;
    stim[59] = 67'h3c8038c4e9c8d8431;
    stim[60] = 67'h3aa0cff15d0784339;
    stim[61] = 67'h1ea3bf20bd8f79194;
    stim[62] = 67'h38548a5e68c92e07c;
    stim[63] = 67'h06f08c27cb4a8c02f;
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
      expv[0] = 66'h3xxxxxxxx291288xx;
      expv[1] = 66'h09ab650a6f3ba227d;
      expv[2] = 66'h0cf1ab2598d2314f0;
      expv[3] = 66'h2ca31788c296b8cca;
      expv[4] = 66'h2c9158b577dfd48d7;
      expv[5] = 66'h0b486c91433fa771f;
      expv[6] = 66'h1d558f55567d5b531;
      expv[7] = 66'h03af71909381c1d90;
      expv[8] = 66'h25d5f42462e93da84;
      expv[9] = 66'h0f66a5d5c083cff23;
      expv[10] = 66'h1d3551b40693d36a1;
      expv[11] = 66'h3dc554d481a6f38bf;
      expv[12] = 66'h007f14d48198a189e;
      expv[13] = 66'h39ff54d48e1346f0f;
      expv[14] = 66'h2a2a672a4eb907409;
      expv[15] = 66'h04bc2c63c0aaf4a8c;
      expv[16] = 66'h254d9535852ff86d3;
      expv[17] = 66'h1983dede11f88724b;
      expv[18] = 66'h17105c2f8ed38816b;
      expv[19] = 66'h1705195e9f5706c90;
      expv[20] = 66'h310f27a1479aaa528;
      expv[21] = 66'h086d51d1cdb61ff01;
      expv[22] = 66'h1049854a874e368a9;
      expv[23] = 66'h2e3a8d40281cc752f;
      expv[24] = 66'h3e6dae3a8102654da;
      expv[25] = 66'h1a442e3a9cc2128d3;
      expv[26] = 66'h207a6e3a96b30a442;
      expv[27] = 66'h0290c355db42c1edd;
      expv[28] = 66'h15c05770942f0c2b3;
      expv[29] = 66'h3fe3068c4dd80972e;
      expv[30] = 66'h0fb115d8c51290061;
      expv[31] = 66'h0438e56bdb349ec0b;
      expv[32] = 66'h0eb7516ad240ae88d;
      expv[33] = 66'h355e485a85729b827;
      expv[34] = 66'h24026da389b8f6ee0;
      expv[35] = 66'h2b4c03319d1c22db1;
      expv[36] = 66'h1a57f3f9c836c8567;
      expv[37] = 66'h2d9b695990eebaa11;
      expv[38] = 66'h0c90263e457291f62;
      expv[39] = 66'h0d76fa7eddf8047b1;
      expv[40] = 66'h2fd4ebd7864c3ee70;
      expv[41] = 66'h3d359474d084a8eca;
      expv[42] = 66'h08f2c9d8c08017eab;
      expv[43] = 66'h00d6d2f9e97e4b4a4;
      expv[44] = 66'h114d80d6de0a21b53;
      expv[45] = 66'h203500d6d7482087d;
      expv[46] = 66'h03b9acbe4142a6616;
      expv[47] = 66'h02e6361dc3005f4e9;
      expv[48] = 66'h18a1858f8b4240605;
      expv[49] = 66'h104402e8d9ababc50;
      expv[50] = 66'h35130d571fdbd8a02;
      expv[51] = 66'h06d6d5d75d4b1c434;
      expv[52] = 66'h3d20b73666c1f50fe;
      expv[53] = 66'h23147d2089f709d9d;
      expv[54] = 66'h3ff5fd2087e61a9be;
      expv[55] = 66'h2f973d20952614791;
      expv[56] = 66'h09ebfd2090f9c409f;
      expv[57] = 66'h3aec0318e3bb07827;
      expv[58] = 66'h1715baec05b10dec7;
      expv[59] = 66'h1391b0863e401c627;
      expv[60] = 66'h086713919d5067f92;
      expv[61] = 66'h3232ba0f0f51df90d;
      expv[62] = 66'h1c0fba0f1c2a452fb;
      expv[63] = 66'h1805fa0f037846146;
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
