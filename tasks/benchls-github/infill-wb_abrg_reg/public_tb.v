// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  wb_abrg_reg dut (
    .wbs_clk_i(clk),
    .sys_rst(in_vec[59:59]),
    .wbs_adr_i(in_vec[58:40]),
    .wbs_dat_i(in_vec[39:24]),
    .wbs_sel_i(in_vec[23:22]),
    .wbs_tga_i(in_vec[21:21]),
    .wbs_stb_i(in_vec[20:20]),
    .wbs_cyc_i(in_vec[19:19]),
    .wbs_we_i(in_vec[18:18]),
    .wbm_clk_i(in_vec[17:17]),
    .wbm_dat_i(in_vec[16:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wbs_dat_o(out_vec[57:42]),
    .wbs_ack_o(out_vec[41:41]),
    .wbm_adr_o(out_vec[40:22]),
    .wbm_dat_o(out_vec[21:6]),
    .wbm_sel_o(out_vec[5:4]),
    .wbm_tga_o(out_vec[3:3]),
    .wbm_stb_o(out_vec[2:2]),
    .wbm_cyc_o(out_vec[1:1]),
    .wbm_we_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hc97d4fb90d53542;
    stim[1] = 60'hbfc6586813024be;
    stim[2] = 60'h6e9fd14d60d8072;
    stim[3] = 60'h4e2f0bdd2bfe73b;
    stim[4] = 60'h667c4fcbcc59a17;
    stim[5] = 60'h6b7832b16a8fe0b;
    stim[6] = 60'h670d5ebb80d381d;
    stim[7] = 60'h0adadff72d1acca;
    stim[8] = 60'h13cb58af7376c85;
    stim[9] = 60'h26b60fd1aaba1af;
    stim[10] = 60'h4368206a71213e1;
    stim[11] = 60'h737501dbee5f879;
    stim[12] = 60'h3745f2787cd5fe0;
    stim[13] = 60'h4c99ddd5e93bd7f;
    stim[14] = 60'h139d9f9809b71e1;
    stim[15] = 60'h7c1126557ce79eb;
    stim[16] = 60'h7bcb43a75a53253;
    stim[17] = 60'h74f7fb6946f3b22;
    stim[18] = 60'h26f9f3bd0c44ad8;
    stim[19] = 60'h7301829e24950db;
    stim[20] = 60'h482101303b19640;
    stim[21] = 60'h50d68ddb0f0393a;
    stim[22] = 60'h59d1c3a9d38e1d5;
    stim[23] = 60'h6028db3ddb81389;
    stim[24] = 60'h10ffcf0e1a726d9;
    stim[25] = 60'h48c32d5e475264a;
    stim[26] = 60'h79da1f4785da93c;
    stim[27] = 60'h4b10639f5f79f23;
    stim[28] = 60'h21397de72b3359a;
    stim[29] = 60'h384413f22861936;
    stim[30] = 60'h60e157d7e0d8a81;
    stim[31] = 60'h610a4ea047decfe;
    stim[32] = 60'h559c382409acfde;
    stim[33] = 60'h270d6449e75c894;
    stim[34] = 60'h0d61dc7b3bbe079;
    stim[35] = 60'h501bff529cd437c;
    stim[36] = 60'h1fab87443b2f576;
    stim[37] = 60'h3f1debcefa8a620;
    stim[38] = 60'h1441b45596295f6;
    stim[39] = 60'h7bfcfd207228cfb;
    stim[40] = 60'h593e80d6cbe6749;
    stim[41] = 60'h25401e9404cd291;
    stim[42] = 60'h5594b0621577b16;
    stim[43] = 60'h0712dd396b9799c;
    stim[44] = 60'h0cc688aa47a2bfc;
    stim[45] = 60'h715b1218c74c4e2;
    stim[46] = 60'h35b204aa7f39863;
    stim[47] = 60'h44d88a664d890ab;
    stim[48] = 60'h6759dfdb040a698;
    stim[49] = 60'h1eace272a37076a;
    stim[50] = 60'h712677b77404c95;
    stim[51] = 60'h41f326e4f2323f1;
    stim[52] = 60'h2236b7db01791b9;
    stim[53] = 60'h53b83d270428695;
    stim[54] = 60'h504cc6f6f4ef8a4;
    stim[55] = 60'h1ec821da9074b85;
    stim[56] = 60'h4241efc343b20da;
    stim[57] = 60'h19ddefa5d1a2157;
    stim[58] = 60'h6d8f28d6e0f26e2;
    stim[59] = 60'h170b60efaab915a;
    stim[60] = 60'h0e4df906eebd2b8;
    stim[61] = 60'h74228101254ce9c;
    stim[62] = 60'h4aa898fa87bc4ec;
    stim[63] = 60'h4256a49acb192ac;
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
      expv[0] = 58'hxxxxxxxxxxxxxxx;
      expv[1] = 58'hxxxxxxxxxxxxxxx;
      expv[2] = 58'hxxxxxxxxxxxxxxx;
      expv[3] = 58'hxxxxxxxxxxxxxxx;
      expv[4] = 58'hxxxxxxxxxxxxxxx;
      expv[5] = 58'hxxxxxxxxxxxxxxx;
      expv[6] = 58'h3ce7xxxxxxxxxxx;
      expv[7] = 58'h3ce7xxxxxxxxxxx;
      expv[8] = 58'h3ce7xba7f45358x;
      expv[9] = 58'h3ce7xba7f45358x;
      expv[10] = 58'h3ce7xba7f45358x;
      expv[11] = 58'h2d90xba7f45358x;
      expv[12] = 58'h2d90xba7f45358x;
      expv[13] = 58'h2d90x2b6b7fdcbx;
      expv[14] = 58'h2d90x2b6b7fdcbx;
      expv[15] = 58'h2d90x2b6b7fdcbx;
      expv[16] = 58'h37afx2b6b7fdcbx;
      expv[17] = 58'h37afxdd17c9e1ff;
      expv[18] = 58'h37afxdd17c9e1ff;
      expv[19] = 58'h37afxdd17c9e1ff;
      expv[20] = 58'h37afxdd17c9e1ff;
      expv[21] = 58'h37afxdd17c9e1ff;
      expv[22] = 58'h37afxdd17c9e1ff;
      expv[23] = 58'h37afxdd17c9e1ff;
      expv[24] = 58'h37afxef2d0e9d61;
      expv[25] = 58'h37afxef2d0e9d61;
      expv[26] = 58'h37afxef2d0e9d61;
      expv[27] = 58'h24dbx80a36cf76x;
      expv[28] = 58'h24dbx80a36cf76x;
      expv[29] = 58'h24dbx80a36cf76x;
      expv[30] = 58'h33e4x80a36cf76x;
      expv[31] = 58'h33e4x80a36cf76x;
      expv[32] = 58'h33e4xe7687d1e1x;
      expv[33] = 58'h33e4xe7687d1e1x;
      expv[34] = 58'h33e4x84293a811x;
      expv[35] = 58'h33e4x84293a811x;
      expv[36] = 58'h33e4x9c3591279x;
      expv[37] = 58'h3c0fx9c3591279x;
      expv[38] = 58'h3c0fx406ffd4a7x;
      expv[39] = 58'h3c0fx406ffd4a7x;
      expv[40] = 58'h3c0fx406ffd4a7x;
      expv[41] = 58'h3c0fx406ffd4a7x;
      expv[42] = 58'h3c0fxfc77af3bex;
      expv[43] = 58'h3c0fxfc77af3bex;
      expv[44] = 58'h3c0fx95007a501x;
      expv[45] = 58'h3c0fx95007a501x;
      expv[46] = 58'h3c0fx1c4b74e5ax;
      expv[47] = 58'h3c0fx1c4b74e5ax;
      expv[48] = 58'h3c0fx1c4b74e5ax;
      expv[49] = 58'h330cxc56c48631x;
      expv[50] = 58'h330cxc56c48631x;
      expv[51] = 58'h330cx9d677f6c1x;
      expv[52] = 58'h330cx9d677f6c1x;
      expv[53] = 58'h330cx9d677f6c1x;
      expv[54] = 58'h247ex9d677f6c1x;
      expv[55] = 58'h247ex9d677f6c1x;
      expv[56] = 58'h247ex9d677f6c1x;
      expv[57] = 58'h247ex9d677f6c1x;
      expv[58] = 58'h247ex9d677f6c1x;
      expv[59] = 58'h247ex9d677f6c1x;
      expv[60] = 58'h247ex9d677f6c1x;
      expv[61] = 58'h247ex9d677f6c1x;
      expv[62] = 58'h247exc499dedddx;
      expv[63] = 58'h247exc499dedddx;
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
