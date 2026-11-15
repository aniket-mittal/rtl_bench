// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_038500 dut (
    .clk(clk),
    .rst_n(in_vec[24:24]),
    .vram_data(in_vec[23:0]),
    .vram_h(out_vec[48:39]),
    .vram_v(out_vec[38:29]),
    .vram_read(out_vec[28:28]),
    .vblank(out_vec[27:27]),
    .rgb_en(out_vec[26:26]),
    .hsync(out_vec[25:25]),
    .vsync(out_vec[24:24]),
    .r(out_vec[23:16]),
    .g(out_vec[15:8]),
    .b(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0f0c076;
    stim[1] = 25'h0c1af8f;
    stim[2] = 25'h113be6b;
    stim[3] = 25'h13ab97f;
    stim[4] = 25'h1eef075;
    stim[5] = 25'h14d2306;
    stim[6] = 25'h1b66d5b;
    stim[7] = 25'h19f1a85;
    stim[8] = 25'h102efa5;
    stim[9] = 25'h1c78c4b;
    stim[10] = 25'h17379bb;
    stim[11] = 25'h18d0aab;
    stim[12] = 25'h16b6c6a;
    stim[13] = 25'h13aded8;
    stim[14] = 25'h16df7ae;
    stim[15] = 25'h1eedb34;
    stim[16] = 25'h1139c6f;
    stim[17] = 25'h112e07d;
    stim[18] = 25'h1726bd0;
    stim[19] = 25'h1e37b28;
    stim[20] = 25'h12bdda4;
    stim[21] = 25'h11b331d;
    stim[22] = 25'h1067434;
    stim[23] = 25'h1c03d52;
    stim[24] = 25'h144a982;
    stim[25] = 25'h1a456cf;
    stim[26] = 25'h15668a8;
    stim[27] = 25'h15cf73a;
    stim[28] = 25'h160497b;
    stim[29] = 25'h1f748ef;
    stim[30] = 25'h14c893c;
    stim[31] = 25'h127910d;
    stim[32] = 25'h1b5d808;
    stim[33] = 25'h17a204e;
    stim[34] = 25'h1b03849;
    stim[35] = 25'h1d9f617;
    stim[36] = 25'h15e3001;
    stim[37] = 25'h1e760e9;
    stim[38] = 25'h1e6d2f4;
    stim[39] = 25'h11bf0de;
    stim[40] = 25'h0a6163b;
    stim[41] = 25'h150531e;
    stim[42] = 25'h17d5a1a;
    stim[43] = 25'h13c4730;
    stim[44] = 25'h1b90f75;
    stim[45] = 25'h116d6f6;
    stim[46] = 25'h151b924;
    stim[47] = 25'h165cf08;
    stim[48] = 25'h1d9cd8d;
    stim[49] = 25'h17ac5ce;
    stim[50] = 25'h1f3d686;
    stim[51] = 25'h1a6be26;
    stim[52] = 25'h196fea2;
    stim[53] = 25'h054142e;
    stim[54] = 25'h1c7a83d;
    stim[55] = 25'h1a2b472;
    stim[56] = 25'h17f7ab9;
    stim[57] = 25'h10f6a02;
    stim[58] = 25'h1e54c43;
    stim[59] = 25'h1e024a4;
    stim[60] = 25'h1e9087a;
    stim[61] = 25'h1ef84bc;
    stim[62] = 25'h1d2a842;
    stim[63] = 25'h156b2c6;
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
      expv[0] = 49'h0000000000000;
      expv[1] = 49'h0000000000000;
      expv[2] = 49'h0000000000000;
      expv[3] = 49'h001001413be6b;
      expv[4] = 49'h00180143ab97f;
      expv[5] = 49'h0020014eef075;
      expv[6] = 49'h00280144d2306;
      expv[7] = 49'h0030014b66d5b;
      expv[8] = 49'h00380149f1a85;
      expv[9] = 49'h004001402efa5;
      expv[10] = 49'h0048014c78c4b;
      expv[11] = 49'h00500147379bb;
      expv[12] = 49'h00580148d0aab;
      expv[13] = 49'h00600146b6c6a;
      expv[14] = 49'h00680143aded8;
      expv[15] = 49'h00700146df7ae;
      expv[16] = 49'h0078014eedb34;
      expv[17] = 49'h0080014139c6f;
      expv[18] = 49'h008801412e07d;
      expv[19] = 49'h0090014726bd0;
      expv[20] = 49'h0098014e37b28;
      expv[21] = 49'h00a00142bdda4;
      expv[22] = 49'h00a80141b331d;
      expv[23] = 49'h00b0014067434;
      expv[24] = 49'h00b8014c03d52;
      expv[25] = 49'h00c001444a982;
      expv[26] = 49'h00c8014a456cf;
      expv[27] = 49'h00d00145668a8;
      expv[28] = 49'h00d80145cf73a;
      expv[29] = 49'h00e001460497b;
      expv[30] = 49'h00e8014f748ef;
      expv[31] = 49'h00f00144c893c;
      expv[32] = 49'h00f801427910d;
      expv[33] = 49'h0100014b5d808;
      expv[34] = 49'h01080147a204e;
      expv[35] = 49'h0110014b03849;
      expv[36] = 49'h0118014d9f617;
      expv[37] = 49'h01200145e3001;
      expv[38] = 49'h0128014e760e9;
      expv[39] = 49'h0130014e6d2f4;
      expv[40] = 49'h0000000000000;
      expv[41] = 49'h0000000000000;
      expv[42] = 49'h001001450531e;
      expv[43] = 49'h00180147d5a1a;
      expv[44] = 49'h00200143c4730;
      expv[45] = 49'h0028014b90f75;
      expv[46] = 49'h003001416d6f6;
      expv[47] = 49'h003801451b924;
      expv[48] = 49'h004001465cf08;
      expv[49] = 49'h0048014d9cd8d;
      expv[50] = 49'h00500147ac5ce;
      expv[51] = 49'h0058014f3d686;
      expv[52] = 49'h0060014a6be26;
      expv[53] = 49'h0000000000000;
      expv[54] = 49'h0000000000000;
      expv[55] = 49'h0010014c7a83d;
      expv[56] = 49'h0018014a2b472;
      expv[57] = 49'h00200147f7ab9;
      expv[58] = 49'h00280140f6a02;
      expv[59] = 49'h0030014e54c43;
      expv[60] = 49'h0038014e024a4;
      expv[61] = 49'h0040014e9087a;
      expv[62] = 49'h0048014ef84bc;
      expv[63] = 49'h0050014d2a842;
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
