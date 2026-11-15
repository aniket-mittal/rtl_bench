// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06616 dut (
    .pixclk(clk),
    .hresetn(in_vec[50:50]),
    .colres(in_vec[49:49]),
    .sixbitlin(in_vec[48:48]),
    .p0_red_pal_adr(in_vec[47:40]),
    .p0_grn_pal_adr(in_vec[39:32]),
    .p0_blu_pal_adr(in_vec[31:24]),
    .palr2dac_evn(in_vec[23:16]),
    .palg2dac_evn(in_vec[15:8]),
    .palb2dac_evn(in_vec[7:0]),
    .p0_red_pal(out_vec[47:40]),
    .p0_grn_pal(out_vec[39:32]),
    .p0_blu_pal(out_vec[31:24]),
    .palr_addr_evn(out_vec[23:16]),
    .palg_addr_evn(out_vec[15:8]),
    .palb_addr_evn(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h330e221cd8c4e;
    stim[1] = 51'h10321b8e9fdc7;
    stim[2] = 51'h7dd789ee77644;
    stim[3] = 51'h65caaec840cca;
    stim[4] = 51'h68708e6d8fd47;
    stim[5] = 51'h45c4d2c50373a;
    stim[6] = 51'h5599888ad267d;
    stim[7] = 51'h71757e258ad18;
    stim[8] = 51'h7ff0f8df2fb82;
    stim[9] = 51'h7b12d7ef90cd1;
    stim[10] = 51'h008f3f8ac380c;
    stim[11] = 51'h647cd088f8533;
    stim[12] = 51'h765af65759b68;
    stim[13] = 51'h6ae0175ba7be4;
    stim[14] = 51'h3dfc161ccfa58;
    stim[15] = 51'h46ccfabda2e70;
    stim[16] = 51'h5a9d81d6607b0;
    stim[17] = 51'h6540646390525;
    stim[18] = 51'h6de1279633c8f;
    stim[19] = 51'h791698974d562;
    stim[20] = 51'h72883e595528f;
    stim[21] = 51'h4958aa82dc81e;
    stim[22] = 51'h665d78baef1a1;
    stim[23] = 51'h4b16b44891449;
    stim[24] = 51'h555b06544227e;
    stim[25] = 51'h58c67cdaf2b42;
    stim[26] = 51'h42da71e977fe1;
    stim[27] = 51'h211c06ecd5798;
    stim[28] = 51'h580369d502b06;
    stim[29] = 51'h65fd451311a59;
    stim[30] = 51'h434d7f83a7e0a;
    stim[31] = 51'h64941ab79dd51;
    stim[32] = 51'h5c1ddac5ee10f;
    stim[33] = 51'h47f24e07e6f3e;
    stim[34] = 51'h620d845c95584;
    stim[35] = 51'h770c0e354193e;
    stim[36] = 51'h6f0eb9aba94e0;
    stim[37] = 51'h78ea22f980eea;
    stim[38] = 51'h5e6a3fe6337ce;
    stim[39] = 51'h40e1982572e46;
    stim[40] = 51'h71f928228d0d6;
    stim[41] = 51'h4ef11e46a0d4d;
    stim[42] = 51'h6d1dd256e276e;
    stim[43] = 51'h5cb37f76a93c3;
    stim[44] = 51'h48382faa31075;
    stim[45] = 51'h6f444c3119081;
    stim[46] = 51'h5be3d69ed0782;
    stim[47] = 51'h5e6f86ca913d2;
    stim[48] = 51'h68e764df01c16;
    stim[49] = 51'h62219d33f0acd;
    stim[50] = 51'h42a3cd4573037;
    stim[51] = 51'h586779742b636;
    stim[52] = 51'h7f88c9fc1209e;
    stim[53] = 51'h4e61b1281be6e;
    stim[54] = 51'h5cc5c34a658b7;
    stim[55] = 51'h7eb51e7cda841;
    stim[56] = 51'h63f1a7c30a0d1;
    stim[57] = 51'h50dc1384b8cb9;
    stim[58] = 51'h4ece9476b95f7;
    stim[59] = 51'h4e947c717fd7a;
    stim[60] = 51'h75d25ad02fad4;
    stim[61] = 51'h411e00c394db4;
    stim[62] = 51'h5bb4716b49e23;
    stim[63] = 51'h60739a1a9a320;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'he77644dd789e;
      expv[4] = 48'h840cca5caaec;
      expv[5] = 48'hd8fd478708e6;
      expv[6] = 48'h5134385c4d2c;
      expv[7] = 48'had267d599888;
      expv[8] = 48'h58ad181757e2;
      expv[9] = 48'hf2fb82ff0f8d;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h8f853347cd08;
      expv[13] = 48'h759b6865af65;
      expv[14] = 48'h000000000000;
      expv[15] = 48'h000000000000;
      expv[16] = 48'hdb2c716ccfab;
      expv[17] = 48'h6607b0a9d81d;
      expv[18] = 48'h390525540646;
      expv[19] = 48'h633c8fde1279;
      expv[20] = 48'h74d562916989;
      expv[21] = 48'h95528f2883e5;
      expv[22] = 48'h2ccb1c958aa8;
      expv[23] = 48'haef1a165d78b;
      expv[24] = 48'h8a1449b16b44;
      expv[25] = 48'h44227e55b065;
      expv[26] = 48'haf2b428c67cd;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h502b0680369d;
      expv[30] = 48'h311a595fd451;
      expv[31] = 48'h387d0834d7f8;
      expv[32] = 48'h79dd514941ab;
      expv[33] = 48'h5ee10fc1ddac;
      expv[34] = 48'h7d6d3c7f24e0;
      expv[35] = 48'hc9558420d845;
      expv[36] = 48'h54193e70c0e3;
      expv[37] = 48'hba94e0f0eb9a;
      expv[38] = 48'h980eea8ea22f;
      expv[39] = 48'h6337cee6a3fe;
      expv[40] = 48'h552c450e1982;
      expv[41] = 48'h28d0d61f9282;
      expv[42] = 48'h690c4def11e4;
      expv[43] = 48'h6e276ed1dd25;
      expv[44] = 48'h6a93c3cb37f7;
      expv[45] = 48'ha210758382fa;
      expv[46] = 48'h119081f444c3;
      expv[47] = 48'hed0782be3d69;
      expv[48] = 48'ha913d2e6f86c;
      expv[49] = 48'hf01c168e764d;
      expv[50] = 48'h3f0acd2219d3;
      expv[51] = 48'h5530342a3cd4;
      expv[52] = 48'h42b636867797;
      expv[53] = 48'hc1209ef88c9f;
      expv[54] = 48'h82be6de61b12;
      expv[55] = 48'ha658b7cc5c34;
      expv[56] = 48'hcda841eb51e7;
      expv[57] = 48'h30a0d13f1a7c;
      expv[58] = 48'h4b8cb90dc138;
      expv[59] = 48'h6996f7ece947;
      expv[60] = 48'h14ff79e947c7;
      expv[61] = 48'h02fad45d25ad;
      expv[62] = 48'h384db611e00c;
      expv[63] = 48'hb49e23bb4716;
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
