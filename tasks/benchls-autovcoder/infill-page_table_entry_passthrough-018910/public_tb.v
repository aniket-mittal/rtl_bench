// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018910 dut (
    .io_x_ppn(in_vec[32:13]),
    .io_x_u(in_vec[12:12]),
    .io_x_ae(in_vec[11:11]),
    .io_x_sw(in_vec[10:10]),
    .io_x_sx(in_vec[9:9]),
    .io_x_sr(in_vec[8:8]),
    .io_x_pw(in_vec[7:7]),
    .io_x_px(in_vec[6:6]),
    .io_x_pr(in_vec[5:5]),
    .io_x_ppp(in_vec[4:4]),
    .io_x_pal(in_vec[3:3]),
    .io_x_paa(in_vec[2:2]),
    .io_x_eff(in_vec[1:1]),
    .io_x_c(in_vec[0:0]),
    .io_y_ppn(out_vec[32:13]),
    .io_y_u(out_vec[12:12]),
    .io_y_ae(out_vec[11:11]),
    .io_y_sw(out_vec[10:10]),
    .io_y_sx(out_vec[9:9]),
    .io_y_sr(out_vec[8:8]),
    .io_y_pw(out_vec[7:7]),
    .io_y_px(out_vec[6:6]),
    .io_y_pr(out_vec[5:5]),
    .io_y_ppp(out_vec[4:4]),
    .io_y_pal(out_vec[3:3]),
    .io_y_paa(out_vec[2:2]),
    .io_y_eff(out_vec[1:1]),
    .io_y_c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h02313a8f9;
    stim[1] = 33'h09223f595;
    stim[2] = 33'h14c47b329;
    stim[3] = 33'h0b0c06e20;
    stim[4] = 33'h127a97132;
    stim[5] = 33'h0a722f567;
    stim[6] = 33'h08522903d;
    stim[7] = 33'h1a24bd32d;
    stim[8] = 33'h142452214;
    stim[9] = 33'h1209c6e61;
    stim[10] = 33'h1b00beed4;
    stim[11] = 33'h0af2d7310;
    stim[12] = 33'h1d986610e;
    stim[13] = 33'h11cae16ff;
    stim[14] = 33'h1e6e17d37;
    stim[15] = 33'h179c601bf;
    stim[16] = 33'h12a702e17;
    stim[17] = 33'h130f7175b;
    stim[18] = 33'h0bec63a74;
    stim[19] = 33'h14f394b4b;
    stim[20] = 33'h09f16ae73;
    stim[21] = 33'h12132851c;
    stim[22] = 33'h1b6f98dbe;
    stim[23] = 33'h0dc49c005;
    stim[24] = 33'h089ad0b31;
    stim[25] = 33'h0f8ed8576;
    stim[26] = 33'h105f615f9;
    stim[27] = 33'h04a261ca4;
    stim[28] = 33'h0efa0f005;
    stim[29] = 33'h10a2f9418;
    stim[30] = 33'h1a8598d95;
    stim[31] = 33'h18b01cc3e;
    stim[32] = 33'h04259872b;
    stim[33] = 33'h00dd2e116;
    stim[34] = 33'h167a14c91;
    stim[35] = 33'h10f736b3d;
    stim[36] = 33'h1e7d165ee;
    stim[37] = 33'h08706db2b;
    stim[38] = 33'h03db27f8f;
    stim[39] = 33'h0024af386;
    stim[40] = 33'h16abc1f7d;
    stim[41] = 33'h06604c756;
    stim[42] = 33'h1cc44c8ed;
    stim[43] = 33'h0059365bb;
    stim[44] = 33'h0cfef6db2;
    stim[45] = 33'h1254b1a3a;
    stim[46] = 33'h067014e15;
    stim[47] = 33'h0c205bf96;
    stim[48] = 33'h124ee8047;
    stim[49] = 33'h1c131b888;
    stim[50] = 33'h0ca7dee0d;
    stim[51] = 33'h0105a91d1;
    stim[52] = 33'h182db05c3;
    stim[53] = 33'h1c9444fb3;
    stim[54] = 33'h16a0d4fce;
    stim[55] = 33'h194fd3b8d;
    stim[56] = 33'h1ee6dc174;
    stim[57] = 33'h141c3a539;
    stim[58] = 33'h073ac98b0;
    stim[59] = 33'h145b68ed4;
    stim[60] = 33'h1280f6a52;
    stim[61] = 33'h0a9b818eb;
    stim[62] = 33'h13e0f3c7a;
    stim[63] = 33'h178d51f64;
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
      expv[0] = 33'h02313a8f9;
      expv[1] = 33'h09223f595;
      expv[2] = 33'h14c47b329;
      expv[3] = 33'h0b0c06e20;
      expv[4] = 33'h127a97132;
      expv[5] = 33'h0a722f567;
      expv[6] = 33'h08522903d;
      expv[7] = 33'h1a24bd32d;
      expv[8] = 33'h142452214;
      expv[9] = 33'h1209c6e61;
      expv[10] = 33'h1b00beed4;
      expv[11] = 33'h0af2d7310;
      expv[12] = 33'h1d986610e;
      expv[13] = 33'h11cae16ff;
      expv[14] = 33'h1e6e17d37;
      expv[15] = 33'h179c601bf;
      expv[16] = 33'h12a702e17;
      expv[17] = 33'h130f7175b;
      expv[18] = 33'h0bec63a74;
      expv[19] = 33'h14f394b4b;
      expv[20] = 33'h09f16ae73;
      expv[21] = 33'h12132851c;
      expv[22] = 33'h1b6f98dbe;
      expv[23] = 33'h0dc49c005;
      expv[24] = 33'h089ad0b31;
      expv[25] = 33'h0f8ed8576;
      expv[26] = 33'h105f615f9;
      expv[27] = 33'h04a261ca4;
      expv[28] = 33'h0efa0f005;
      expv[29] = 33'h10a2f9418;
      expv[30] = 33'h1a8598d95;
      expv[31] = 33'h18b01cc3e;
      expv[32] = 33'h04259872b;
      expv[33] = 33'h00dd2e116;
      expv[34] = 33'h167a14c91;
      expv[35] = 33'h10f736b3d;
      expv[36] = 33'h1e7d165ee;
      expv[37] = 33'h08706db2b;
      expv[38] = 33'h03db27f8f;
      expv[39] = 33'h0024af386;
      expv[40] = 33'h16abc1f7d;
      expv[41] = 33'h06604c756;
      expv[42] = 33'h1cc44c8ed;
      expv[43] = 33'h0059365bb;
      expv[44] = 33'h0cfef6db2;
      expv[45] = 33'h1254b1a3a;
      expv[46] = 33'h067014e15;
      expv[47] = 33'h0c205bf96;
      expv[48] = 33'h124ee8047;
      expv[49] = 33'h1c131b888;
      expv[50] = 33'h0ca7dee0d;
      expv[51] = 33'h0105a91d1;
      expv[52] = 33'h182db05c3;
      expv[53] = 33'h1c9444fb3;
      expv[54] = 33'h16a0d4fce;
      expv[55] = 33'h194fd3b8d;
      expv[56] = 33'h1ee6dc174;
      expv[57] = 33'h141c3a539;
      expv[58] = 33'h073ac98b0;
      expv[59] = 33'h145b68ed4;
      expv[60] = 33'h1280f6a52;
      expv[61] = 33'h0a9b818eb;
      expv[62] = 33'h13e0f3c7a;
      expv[63] = 33'h178d51f64;
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
