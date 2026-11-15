// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  serv_rf_ram_if dut (
    .i_clk(clk),
    .i_rst(in_vec[38:38]),
    .i_wreq(in_vec[37:37]),
    .i_rreq(in_vec[36:36]),
    .i_wreg0(in_vec[35:30]),
    .i_wreg1(in_vec[29:24]),
    .i_wen0(in_vec[23:23]),
    .i_wen1(in_vec[22:22]),
    .i_wdata0(in_vec[21:21]),
    .i_wdata1(in_vec[20:20]),
    .i_rreg0(in_vec[19:14]),
    .i_rreg1(in_vec[13:8]),
    .i_rdata(in_vec[7:0]),
    .o_ready(out_vec[28:28]),
    .o_rdata0(out_vec[27:27]),
    .o_rdata1(out_vec[26:26]),
    .o_waddr(out_vec[25:18]),
    .o_wdata(out_vec[17:10]),
    .o_wen(out_vec[9:9]),
    .o_raddr(out_vec[8:1]),
    .o_ren(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h643b987112;
    stim[1] = 39'h47f02c8617;
    stim[2] = 39'h1ccf5ddd59;
    stim[3] = 39'h12bc70ff8b;
    stim[4] = 39'h264763bedc;
    stim[5] = 39'h12724bccc2;
    stim[6] = 39'h30b1c052ae;
    stim[7] = 39'h0d466065f5;
    stim[8] = 39'h296e512aec;
    stim[9] = 39'h3e30cb7b88;
    stim[10] = 39'h12fbbb2fcf;
    stim[11] = 39'h331c6547d7;
    stim[12] = 39'h0de007b25b;
    stim[13] = 39'h10d3b61c59;
    stim[14] = 39'h0c0be09db2;
    stim[15] = 39'h02b03e2f61;
    stim[16] = 39'h52679fdd0d;
    stim[17] = 39'h0d40a66b99;
    stim[18] = 39'h10795ab12f;
    stim[19] = 39'h3197252860;
    stim[20] = 39'h3996c90c63;
    stim[21] = 39'h08539d1afe;
    stim[22] = 39'h09f7eb168a;
    stim[23] = 39'h22568ec221;
    stim[24] = 39'h18b4f1aa67;
    stim[25] = 39'h04c6e8ec9f;
    stim[26] = 39'h2523af7d1f;
    stim[27] = 39'h272c34a4eb;
    stim[28] = 39'h0bb7ae69b0;
    stim[29] = 39'h1d11629303;
    stim[30] = 39'h7913dfe85a;
    stim[31] = 39'h16ae65c578;
    stim[32] = 39'h3ca75e9ddc;
    stim[33] = 39'h076b063171;
    stim[34] = 39'h2aeb23c1e9;
    stim[35] = 39'h2d12899657;
    stim[36] = 39'h22ac395080;
    stim[37] = 39'h3b18a634b0;
    stim[38] = 39'h032a075f07;
    stim[39] = 39'h2b96e3bed7;
    stim[40] = 39'h18b60fe39e;
    stim[41] = 39'h280c710bfa;
    stim[42] = 39'h3a27647cbe;
    stim[43] = 39'h03e85eb945;
    stim[44] = 39'h30963d525d;
    stim[45] = 39'h085e4f5d78;
    stim[46] = 39'h30a21475b3;
    stim[47] = 39'h6b08d49123;
    stim[48] = 39'h37d67c3e99;
    stim[49] = 39'h39a9851428;
    stim[50] = 39'h10fac0fe76;
    stim[51] = 39'h28dc9fea8b;
    stim[52] = 39'h159cf67c65;
    stim[53] = 39'h2f2af4ad0b;
    stim[54] = 39'h3abdcd95e7;
    stim[55] = 39'h2c5f5fc2c7;
    stim[56] = 39'h00be235942;
    stim[57] = 39'h09602867a0;
    stim[58] = 39'h2e3f3a635e;
    stim[59] = 39'h1b902e17b9;
    stim[60] = 39'h1a6f81a82a;
    stim[61] = 39'h11affb77e6;
    stim[62] = 39'h3390132286;
    stim[63] = 39'h16232d04a8;
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
      expv[0] = 29'h1xxxxxxx;
      expv[1] = 29'h0xxxxx90;
      expv[2] = 29'h0xxxxxb8;
      expv[3] = 29'h0xadxx19;
      expv[4] = 29'h1x9exx71;
      expv[5] = 29'h1x9fxx78;
      expv[6] = 29'h1x2dax09;
      expv[7] = 29'h1x5cdx08;
      expv[8] = 29'h125e6820;
      expv[9] = 29'h138d3568;
      expv[10] = 29'h00bc9960;
      expv[11] = 29'h10ce4ca9;
      expv[12] = 29'h137f24f0;
      expv[13] = 29'h103d90c0;
      expv[14] = 29'h030ec811;
      expv[15] = 29'h10af6579;
      expv[16] = 29'h0c9fb1f8;
      expv[17] = 29'h000e94c8;
      expv[18] = 29'h041eed88;
      expv[19] = 29'h186d74a1;
      expv[20] = 29'h196ed320;
      expv[21] = 29'h1a1d5da0;
      expv[22] = 29'h1a7cad60;
      expv[23] = 29'h109255d8;
      expv[24] = 29'h0e2d2830;
      expv[25] = 29'h053e9519;
      expv[26] = 29'h114f49e9;
      expv[27] = 29'h1dcfa690;
      expv[28] = 29'h0f7c91c8;
      expv[29] = 29'h0b4fe850;
      expv[30] = 29'h1e4ff5f9;
      expv[31] = 29'h09adf8b8;
      expv[32] = 29'h172efdd1;
      expv[33] = 29'h15dd7cc0;
      expv[34] = 29'h16bcbc78;
      expv[35] = 29'h134e5d30;
      expv[36] = 29'h10ad2d28;
      expv[37] = 29'h12ce94c0;
      expv[38] = 29'h00cf48e8;
      expv[39] = 29'h12eda470;
      expv[40] = 29'h022ed1f8;
      expv[41] = 29'h120d6821;
      expv[42] = 29'h128eb488;
      expv[43] = 29'h00ff59d0;
      expv[44] = 29'h102dada8;
      expv[45] = 29'h021ed5e8;
      expv[46] = 29'h102d6888;
      expv[47] = 29'h12ccb490;
      expv[48] = 29'h11fc5980;
      expv[49] = 29'h126e2ca0;
      expv[50] = 29'h103d1418;
      expv[51] = 29'h123c89f9;
      expv[52] = 29'h116c44c8;
      expv[53] = 29'h13ce2091;
      expv[54] = 29'h12af11b0;
      expv[55] = 29'h131d89f8;
      expv[56] = 29'h102cc468;
      expv[57] = 29'h025e6108;
      expv[58] = 29'h13833148;
      expv[59] = 29'h02ef99c0;
      expv[60] = 29'h029fcc31;
      expv[61] = 29'h106de569;
      expv[62] = 29'h10eef061;
      expv[63] = 29'h118d79a0;
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
