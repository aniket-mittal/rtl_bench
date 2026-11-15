// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01614 dut (
    .clk(clk),
    .ce(in_vec[37:37]),
    .reset(in_vec[36:36]),
    .odd_cycle(in_vec[35:35]),
    .sprite_trigger(in_vec[34:34]),
    .dmc_trigger(in_vec[33:33]),
    .cpu_read(in_vec[32:32]),
    .data_from_cpu(in_vec[31:24]),
    .data_from_ram(in_vec[23:16]),
    .dmc_dma_addr(in_vec[15:0]),
    .aout(out_vec[27:12]),
    .aout_enable(out_vec[11:11]),
    .read(out_vec[10:10]),
    .data_to_ram(out_vec[9:2]),
    .dmc_ack(out_vec[1:1]),
    .pause_cpu(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3f9e781d4a;
    stim[1] = 38'h3ae987c3e7;
    stim[2] = 38'h275c236100;
    stim[3] = 38'h24aad2a265;
    stim[4] = 38'h0e73d2b970;
    stim[5] = 38'h2b2deb7ab0;
    stim[6] = 38'h0b4ab97c09;
    stim[7] = 38'h288791c355;
    stim[8] = 38'h277a1ed34b;
    stim[9] = 38'h00ef5f0b7a;
    stim[10] = 38'h294641f726;
    stim[11] = 38'h20fce6bd46;
    stim[12] = 38'h26345f7141;
    stim[13] = 38'h03e563e9fa;
    stim[14] = 38'h288a67916c;
    stim[15] = 38'h2a08255917;
    stim[16] = 38'h04e1de1dc1;
    stim[17] = 38'h39dd62f988;
    stim[18] = 38'h064e73d659;
    stim[19] = 38'h06e27e0851;
    stim[20] = 38'h26756346b9;
    stim[21] = 38'h23a050f6c2;
    stim[22] = 38'h027bd53bed;
    stim[23] = 38'h04df253fb7;
    stim[24] = 38'h07d74f00a9;
    stim[25] = 38'h2a2c9c9482;
    stim[26] = 38'h22f935e063;
    stim[27] = 38'h0adeef6dfe;
    stim[28] = 38'h22a299bf3e;
    stim[29] = 38'h0d5f061e37;
    stim[30] = 38'h0100041cdb;
    stim[31] = 38'h256f466cf3;
    stim[32] = 38'h26a928cffd;
    stim[33] = 38'h004b909d03;
    stim[34] = 38'h0c69d56e3f;
    stim[35] = 38'h20c8a48c31;
    stim[36] = 38'h072fea86bf;
    stim[37] = 38'h280d9159b8;
    stim[38] = 38'h2e1da20439;
    stim[39] = 38'h2ab095e3d6;
    stim[40] = 38'h25d7929915;
    stim[41] = 38'h02bf78ccf5;
    stim[42] = 38'h271a51b708;
    stim[43] = 38'h2359dc612a;
    stim[44] = 38'h228ad69c48;
    stim[45] = 38'h0ccdc4463f;
    stim[46] = 38'h282c44cec3;
    stim[47] = 38'h0a8ca29778;
    stim[48] = 38'h28b3124393;
    stim[49] = 38'h2ff9e07157;
    stim[50] = 38'h0abe2d75f0;
    stim[51] = 38'h2c03869be4;
    stim[52] = 38'h2c03be421e;
    stim[53] = 38'h2a03f24272;
    stim[54] = 38'h09a7e4f660;
    stim[55] = 38'h03a4b18682;
    stim[56] = 38'h0cb14e6366;
    stim[57] = 38'h0654d298dc;
    stim[58] = 38'h25e958a5d5;
    stim[59] = 38'h0f9e2f43b3;
    stim[60] = 38'h2a7ed7c8ff;
    stim[61] = 38'h0df57caa11;
    stim[62] = 38'h03f2f28f8b;
    stim[63] = 38'h2533a182b2;
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
      expv[0] = 28'h2004xxx;
      expv[1] = 28'h2004000;
      expv[2] = 28'h0000401;
      expv[3] = 28'ha265c02;
      expv[4] = 28'h2004000;
      expv[5] = 28'h2004001;
      expv[6] = 28'h2004801;
      expv[7] = 28'h2004800;
      expv[8] = 28'haa01e45;
      expv[9] = 28'h0b7ac7a;
      expv[10] = 28'h2004079;
      expv[11] = 28'hbd46c7a;
      expv[12] = 28'h7a00798;
      expv[13] = 28'h3400799;
      expv[14] = 28'h2004398;
      expv[15] = 28'h2004398;
      expv[16] = 28'h3400798;
      expv[17] = 28'h2004399;
      expv[18] = 28'h0000400;
      expv[19] = 28'h0000400;
      expv[20] = 28'h0000400;
      expv[21] = 28'h7500401;
      expv[22] = 28'h3bedc02;
      expv[23] = 28'h3fb7c02;
      expv[24] = 28'h00a9c03;
      expv[25] = 28'h2004000;
      expv[26] = 28'he063c02;
      expv[27] = 28'h2004000;
      expv[28] = 28'h7500400;
      expv[29] = 28'h2004001;
      expv[30] = 28'h7500401;
      expv[31] = 28'h7500401;
      expv[32] = 28'h6f00400;
      expv[33] = 28'ha900400;
      expv[34] = 28'h2004000;
      expv[35] = 28'ha900400;
      expv[36] = 28'ha900401;
      expv[37] = 28'h2004000;
      expv[38] = 28'h2004000;
      expv[39] = 28'h2004000;
      expv[40] = 28'h1d00401;
      expv[41] = 28'hd700400;
      expv[42] = 28'hd700401;
      expv[43] = 28'h612ac03;
      expv[44] = 28'h1a00400;
      expv[45] = 28'h2004000;
      expv[46] = 28'h2004000;
      expv[47] = 28'h2004000;
      expv[48] = 28'h2004000;
      expv[49] = 28'h2004001;
      expv[50] = 28'h2004800;
      expv[51] = 28'h2004800;
      expv[52] = 28'h2004218;
      expv[53] = 28'h2004218;
      expv[54] = 28'h2004219;
      expv[55] = 28'h0300619;
      expv[56] = 28'h2004218;
      expv[57] = 28'h0300618;
      expv[58] = 28'h0300619;
      expv[59] = 28'h2004219;
      expv[60] = 28'h2004218;
      expv[61] = 28'h2004219;
      expv[62] = 28'he900619;
      expv[63] = 28'he900619;
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
