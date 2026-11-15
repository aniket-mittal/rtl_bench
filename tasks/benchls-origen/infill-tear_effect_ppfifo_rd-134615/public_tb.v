// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134615 dut (
    .i_axi_clk(clk),
    .rst(in_vec[98:98]),
    .i_tear_effect(in_vec[97:97]),
    .i_fsync(in_vec[96:96]),
    .i_pixel_count(in_vec[95:64]),
    .i_axi_data(in_vec[63:32]),
    .i_axi_keep(in_vec[31:28]),
    .i_axi_last(in_vec[27:27]),
    .i_axi_valid(in_vec[26:26]),
    .i_ppfifo_rdy(in_vec[25:24]),
    .i_ppfifo_size(in_vec[23:0]),
    .o_ppfifo_clk(out_vec[36:36]),
    .o_axi_ready(out_vec[35:35]),
    .o_ppfifo_act(out_vec[34:33]),
    .o_ppfifo_stb(out_vec[32:32]),
    .o_ppfifo_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h4228ba35f64b9b43e465a85e9;
    stim[1] = 99'h7fa939c124c0b4721b7e84b17;
    stim[2] = 99'h4911aea83fdd20bcb89cd7b86;
    stim[3] = 99'h11e59e39c4f49976a5252b185;
    stim[4] = 99'h05d46fb5a50ac63d9b054e240;
    stim[5] = 99'h164e38e9b40ef283b85048fbd;
    stim[6] = 99'h2744615ef9894dc2b0c2bb08e;
    stim[7] = 99'h275f99ca6d5b9439d38d753df;
    stim[8] = 99'h04b510448535fc935a8b30b2c;
    stim[9] = 99'h161eb95bd926fb8f5ed3aa562;
    stim[10] = 99'h32f2d0b27e839022da6a649c3;
    stim[11] = 99'h3b393429c7dfb13c2ed8d1093;
    stim[12] = 99'h01d1730ccd9c47c197434db0e;
    stim[13] = 99'h07d71353aa1a57fa7a6467d82;
    stim[14] = 99'h38d9da1274e45326de1de8524;
    stim[15] = 99'h2d21167d1b4c74419b6b82d0e;
    stim[16] = 99'h306de763b2d940d6c4bc63479;
    stim[17] = 99'h171fa4ac878f1be4dbf307e6b;
    stim[18] = 99'h1f71109201c489dafed52d4d9;
    stim[19] = 99'h2257016a571e41076433f196b;
    stim[20] = 99'h3bde7a3f879a149899033d365;
    stim[21] = 99'h13e932b7d67ad0227352b7dd5;
    stim[22] = 99'h278e193edc44220ba1ca156d8;
    stim[23] = 99'h3fdb1b8ea1121c28e2f7816fd;
    stim[24] = 99'h2c963573f524a0539cab8b63b;
    stim[25] = 99'h235b33563b14e9893648be436;
    stim[26] = 99'h22015e5732582b4fc2fd0fb84;
    stim[27] = 99'h3e636723e49cdcc82b4f80dfc;
    stim[28] = 99'h160b973ef288c58a26a789832;
    stim[29] = 99'h013ec403fbf2e696d358c3e4e;
    stim[30] = 99'h318c1d67f3b80c0e3c297655a;
    stim[31] = 99'h3fa62ea87cb9bb49085c3ffd1;
    stim[32] = 99'h23e4508b8fecf3b17fd2dea96;
    stim[33] = 99'h062ee830f2c83709861313b05;
    stim[34] = 99'h09c1e32d1e9a8a4af844727b7;
    stim[35] = 99'h0b324fe1b789586c382155820;
    stim[36] = 99'h06e3b8756da3b56dd8f214755;
    stim[37] = 99'h37e6cc02c9dd056e8905070a7;
    stim[38] = 99'h349d1f06cd6caa656c3f774f7;
    stim[39] = 99'h2a12689640241275ea7090cee;
    stim[40] = 99'h24f7a83f126484a3379825784;
    stim[41] = 99'h394384171630e6a7e917ef512;
    stim[42] = 99'h118b67741f002496df279cfa7;
    stim[43] = 99'h290fad5fcc70492250818a245;
    stim[44] = 99'h3e20e063e7abb340f51ae8efc;
    stim[45] = 99'h1c375e53e3b527e32ce1b85d8;
    stim[46] = 99'h3342e6e7bae31539faaa95ab1;
    stim[47] = 99'h37f6f22623fc8b946616ba4a3;
    stim[48] = 99'h12db1ead833f3ff57ba566180;
    stim[49] = 99'h3284c53b44a3857e095212760;
    stim[50] = 99'h2960317d1e6f899e40baa30ab;
    stim[51] = 99'h307b955dca3f52788509c3922;
    stim[52] = 99'h27a37639c7e5ebc28b0a80e47;
    stim[53] = 99'h3deefc517c99db6636aa52bac;
    stim[54] = 99'h2c782f690d9b8288eb5cf519a;
    stim[55] = 99'h3b37cd4d2a7613a4e8e4e6d90;
    stim[56] = 99'h2b700a5ff814f9eb7f00ca6ad;
    stim[57] = 99'h7984e71fe2f6bd20f8e2e708d;
    stim[58] = 99'h01e8cc621dc0816b0e66871a7;
    stim[59] = 99'h0666dfbf44b9c6a51e7689960;
    stim[60] = 99'h170c97d1dae8190638062e943;
    stim[61] = 99'h101c41cc268018b0e70d1e731;
    stim[62] = 99'h3ebaded0805f980d1bfdfe76f;
    stim[63] = 99'h1135190f755da659b94671c8c;
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
      expv[0] = 37'h0000000000;
      expv[1] = 37'h0000000000;
      expv[2] = 37'h0000000000;
      expv[3] = 37'h0000000000;
      expv[4] = 37'h0000000000;
      expv[5] = 37'h0000000000;
      expv[6] = 37'h0000000000;
      expv[7] = 37'h0000000000;
      expv[8] = 37'h0000000000;
      expv[9] = 37'h0000000000;
      expv[10] = 37'h0000000000;
      expv[11] = 37'h0a00000000;
      expv[12] = 37'h037dfb13c2;
      expv[13] = 37'h007dfb13c2;
      expv[14] = 37'h007dfb13c2;
      expv[15] = 37'h007dfb13c2;
      expv[16] = 37'h007dfb13c2;
      expv[17] = 37'h007dfb13c2;
      expv[18] = 37'h0c7dfb13c2;
      expv[19] = 37'h0d1c489daf;
      expv[20] = 37'h001c489daf;
      expv[21] = 37'h001c489daf;
      expv[22] = 37'h001c489daf;
      expv[23] = 37'h001c489daf;
      expv[24] = 37'h001c489daf;
      expv[25] = 37'h041c489daf;
      expv[26] = 37'h041c489daf;
      expv[27] = 37'h0c1c489daf;
      expv[28] = 37'h0549cdcc82;
      expv[29] = 37'h0449cdcc82;
      expv[30] = 37'h0c49cdcc82;
      expv[31] = 37'h0449cdcc82;
      expv[32] = 37'h0c49cdcc82;
      expv[33] = 37'h0dfecf3b17;
      expv[34] = 37'h00fecf3b17;
      expv[35] = 37'h00fecf3b17;
      expv[36] = 37'h00fecf3b17;
      expv[37] = 37'h00fecf3b17;
      expv[38] = 37'h00fecf3b17;
      expv[39] = 37'h00fecf3b17;
      expv[40] = 37'h0cfecf3b17;
      expv[41] = 37'h0cfecf3b17;
      expv[42] = 37'h0cfecf3b17;
      expv[43] = 37'h04fecf3b17;
      expv[44] = 37'h04fecf3b17;
      expv[45] = 37'h0cfecf3b17;
      expv[46] = 37'h053b527e32;
      expv[47] = 37'h003b527e32;
      expv[48] = 37'h003b527e32;
      expv[49] = 37'h003b527e32;
      expv[50] = 37'h003b527e32;
      expv[51] = 37'h003b527e32;
      expv[52] = 37'h003b527e32;
      expv[53] = 37'h043b527e32;
      expv[54] = 37'h043b527e32;
      expv[55] = 37'h0c3b527e32;
      expv[56] = 37'h05a7613a4e;
      expv[57] = 37'h0000000000;
      expv[58] = 37'h0000000000;
      expv[59] = 37'h0000000000;
      expv[60] = 37'h0000000000;
      expv[61] = 37'h0000000000;
      expv[62] = 37'h0000000000;
      expv[63] = 37'h0000000000;
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
