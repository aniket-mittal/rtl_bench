// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08372 dut (
    .clk(clk),
    .reset(in_vec[40:40]),
    .io_out_0_ready(in_vec[39:39]),
    .io_out_1_ready(in_vec[38:38]),
    .io_in_valid(in_vec[37:37]),
    .io_in_bits(in_vec[36:5]),
    .io_in_tag(in_vec[4:0]),
    .io_out_0_valid(out_vec[77:77]),
    .io_out_0_bits(out_vec[76:45]),
    .io_out_0_tag(out_vec[44:40]),
    .io_out_1_valid(out_vec[39:39]),
    .io_out_1_bits(out_vec[38:7]),
    .io_out_1_tag(out_vec[6:2]),
    .io_in_ready(out_vec[1:1]),
    .io_chosen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h187efa18db0;
    stim[1] = 41'h1d7844fbab9;
    stim[2] = 41'h0043e6c0825;
    stim[3] = 41'h063489f872e;
    stim[4] = 41'h08885f3d10d;
    stim[5] = 41'h0262fcd916a;
    stim[6] = 41'h03b13cf58a6;
    stim[7] = 41'h0e11cff8ab1;
    stim[8] = 41'h096233bc4dc;
    stim[9] = 41'h08acb4e12af;
    stim[10] = 41'h0ae2900bba5;
    stim[11] = 41'h0d07fddf3ec;
    stim[12] = 41'h07dfb03adf2;
    stim[13] = 41'h0a6b14a6557;
    stim[14] = 41'h05c5371b02c;
    stim[15] = 41'h0e18f08bb10;
    stim[16] = 41'h0e54dafed3e;
    stim[17] = 41'h0b2fc468590;
    stim[18] = 41'h0d2dcd834d4;
    stim[19] = 41'h0f51f136f81;
    stim[20] = 41'h0ff8a10378b;
    stim[21] = 41'h08544351d3d;
    stim[22] = 41'h0661a432685;
    stim[23] = 41'h0c926195797;
    stim[24] = 41'h084a0fc4aed;
    stim[25] = 41'h0430c4b4399;
    stim[26] = 41'h0cdd0223c4d;
    stim[27] = 41'h0da77fd8a70;
    stim[28] = 41'h0b86292dfdf;
    stim[29] = 41'h0ac4421c41d;
    stim[30] = 41'h0ae5026856e;
    stim[31] = 41'h09245535e86;
    stim[32] = 41'h02a310f6c39;
    stim[33] = 41'h040b70f786b;
    stim[34] = 41'h05005f8552c;
    stim[35] = 41'h0d639a2877a;
    stim[36] = 41'h0898027600f;
    stim[37] = 41'h01c20f14406;
    stim[38] = 41'h0a1a2086eaa;
    stim[39] = 41'h0b567319d05;
    stim[40] = 41'h08b3a674b36;
    stim[41] = 41'h0038524edf2;
    stim[42] = 41'h078122f159c;
    stim[43] = 41'h0c3f1eef91f;
    stim[44] = 41'h02b8c6a8102;
    stim[45] = 41'h0389bbbfe0b;
    stim[46] = 41'h0bfb4e68adc;
    stim[47] = 41'h01bf65dbc93;
    stim[48] = 41'h00adf620b1c;
    stim[49] = 41'h00d3b89999d;
    stim[50] = 41'h031af4dd338;
    stim[51] = 41'h06f9a62783f;
    stim[52] = 41'h0e686673f42;
    stim[53] = 41'h0301204efcf;
    stim[54] = 41'h044a618340a;
    stim[55] = 41'h0b733bd58d5;
    stim[56] = 41'h095138d2db0;
    stim[57] = 41'h046b6bf178d;
    stim[58] = 41'h0b0b895f9cb;
    stim[59] = 41'h0cacd2165af;
    stim[60] = 41'h0b5202af539;
    stim[61] = 41'h093eff7d014;
    stim[62] = 41'h093d47ff485;
    stim[63] = 41'h06267d7d313;
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
      expv[0] = 78'h07efa18db01fbe8636cx;
      expv[1] = 78'h17844fbab95e113eeaex;
      expv[2] = 78'h043e6c082510f9b0209x;
      expv[3] = 78'h03489f872e8d227e1cbx;
      expv[4] = 78'h0885f3d10d2217cf443x;
      expv[5] = 78'h262fcd916a98bf3645ax;
      expv[6] = 78'h3b13cf58a6ec4f3d629x;
      expv[7] = 78'h211cff8ab10473fe2acx;
      expv[8] = 78'h16233bc4dc588cef137x;
      expv[9] = 78'h0acb4e12af2b2d384abx;
      expv[10] = 78'h2e2900bba5b8a402ee9x;
      expv[11] = 78'h107fddf3ec41ff77cfbx;
      expv[12] = 78'h1dfb03adf2f7ec0eb7cx;
      expv[13] = 78'h26b14a65571ac529955x;
      expv[14] = 78'h1c5371b02c714dc6c0bx;
      expv[15] = 78'h018f08bb10863c22ec4x;
      expv[16] = 78'h254dafed3e1536bfb4fx;
      expv[17] = 78'h32fc468590cbf11a164x;
      expv[18] = 78'h12dcd834d44b7360d35x;
      expv[19] = 78'h151f136f81d47c4dbe0x;
      expv[20] = 78'h3f8a10378b7e2840de2x;
      expv[21] = 78'h0544351d3d1510d474fx;
      expv[22] = 78'h061a43268598690c9a1x;
      expv[23] = 78'h09261957972498655e5x;
      expv[24] = 78'h04a0fc4aed1283f12bbx;
      expv[25] = 78'h030c4b43990c312d0e6x;
      expv[26] = 78'h0dd0223c4d374088f13x;
      expv[27] = 78'h1a77fd8a7069dff629cx;
      expv[28] = 78'h386292dfdf618a4b7f7x;
      expv[29] = 78'h2c4421c41db11087107x;
      expv[30] = 78'h2e5026856eb9409a15bx;
      expv[31] = 78'h1245535e8649154d7a1x;
      expv[32] = 78'h2a310f6c39a8c43db0ex;
      expv[33] = 78'h00b70f786b02dc3de1ax;
      expv[34] = 78'h1005f8552c4017e154bx;
      expv[35] = 78'h1639a2877a58e68a1dex;
      expv[36] = 78'h098027600f26009d803x;
      expv[37] = 78'h1c20f144067083c5101x;
      expv[38] = 78'h21a2086eaa868821baax;
      expv[39] = 78'h3567319d05d59cc6741x;
      expv[40] = 78'h0b3a674b362ce99d2cdx;
      expv[41] = 78'h038524edf20e1493b7cx;
      expv[42] = 78'h18122f159ce048bc567x;
      expv[43] = 78'h03f1eef91f0fc7bbe47x;
      expv[44] = 78'h2b8c6a8102ae31aa040x;
      expv[45] = 78'h389bbbfe0be26eeff82x;
      expv[46] = 78'h3fb4e68adc7ed39a2b7x;
      expv[47] = 78'h1bf65dbc936fd976f24x;
      expv[48] = 78'h0adf620b1c2b7d882c7x;
      expv[49] = 78'h0d3b89999d34ee26667x;
      expv[50] = 78'h31af4dd338c6bd374cex;
      expv[51] = 78'h0f9a62783fbe6989e0fx;
      expv[52] = 78'h2686673f421a199cfd0x;
      expv[53] = 78'h301204efcfc04813bf3x;
      expv[54] = 78'h04a618340a129860d02x;
      expv[55] = 78'h3733bd58d5dccef5635x;
      expv[56] = 78'h15138d2db0544e34b6cx;
      expv[57] = 78'h06b6bf178d1adafc5e3x;
      expv[58] = 78'h30b895f9cbc2e257e72x;
      expv[59] = 78'h0acd2165af2b348596bx;
      expv[60] = 78'h35202af539d480abd4ex;
      expv[61] = 78'h13eff7d0144fbfdf405x;
      expv[62] = 78'h13d47ff4854f51ffd21x;
      expv[63] = 78'h0267d7d313899f5f4c4x;
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
