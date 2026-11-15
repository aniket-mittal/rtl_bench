// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06985 dut (
    .clk(clk),
    .ce(in_vec[73:73]),
    .reset(in_vec[72:72]),
    .flags(in_vec[71:40]),
    .prg_ain(in_vec[39:24]),
    .prg_read(in_vec[23:23]),
    .prg_write(in_vec[22:22]),
    .prg_din(in_vec[21:14]),
    .chr_ain(in_vec[13:0]),
    .prg_aout(out_vec[47:26]),
    .prg_allow(out_vec[25:25]),
    .chr_aout(out_vec[24:3]),
    .chr_allow(out_vec[2:2]),
    .vram_a10(out_vec[1:1]),
    .vram_ce(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h307040cf30d10fc5c57;
    stim[1] = 74'h10e0a2506650f0b27aa;
    stim[2] = 74'h042537ca123e414c548;
    stim[3] = 74'h2c3c2706b9ace391fd7;
    stim[4] = 74'h2f96f642b8a76562d9b;
    stim[5] = 74'h2a8d84886636a13ab34;
    stim[6] = 74'h059d1a044a7af28465f;
    stim[7] = 74'h00658abdceb30b30c68;
    stim[8] = 74'h04ecc848b514841dfd3;
    stim[9] = 74'h22af091f1dc071e4e1d;
    stim[10] = 74'h2c23eb5a5bd6a9bf50e;
    stim[11] = 74'h229af2b8620073c1887;
    stim[12] = 74'h2e2dea6329f876ae18e;
    stim[13] = 74'h233e5ccfcb50bca3927;
    stim[14] = 74'h08ba94ccc113e0d1c9e;
    stim[15] = 74'h21c0d9059fa678b7888;
    stim[16] = 74'h08e8746568b1cd082ba;
    stim[17] = 74'h0dc7a429fa27c3331be;
    stim[18] = 74'h240e653becff302cee6;
    stim[19] = 74'h0f3c058e8aa5d9d2614;
    stim[20] = 74'h0a74fa75efc9370e621;
    stim[21] = 74'h040a0a918ba56a6e42b;
    stim[22] = 74'h28b50a5681bb3d68fe0;
    stim[23] = 74'h25adc6b1731dd304f58;
    stim[24] = 74'h047e608b19b90f4761d;
    stim[25] = 74'h2ff4b135210f7f684cd;
    stim[26] = 74'h18b2078fd991be07e12;
    stim[27] = 74'h0087c3a6a80c3ae23e9;
    stim[28] = 74'h2910e987cfd1903b604;
    stim[29] = 74'h2d63d28ea2334b38a78;
    stim[30] = 74'h21b896dcbd7158c114a;
    stim[31] = 74'h0f8f242c451c450b37f;
    stim[32] = 74'h07a55c84fd6d71d3e25;
    stim[33] = 74'h2d3ee8bff3b9ff3a3b9;
    stim[34] = 74'h0734d99a57d5b077610;
    stim[35] = 74'h0c27f96308c5d7907d5;
    stim[36] = 74'h05d5b307bbf05df9026;
    stim[37] = 74'h04b0d8c9acebd7d45a8;
    stim[38] = 74'h04bc1b33a6356984e08;
    stim[39] = 74'h2ef6230249fc633bd96;
    stim[40] = 74'h040b728621561d39ef4;
    stim[41] = 74'h248ff6f7875b75c8df4;
    stim[42] = 74'h2a027f9f965b10e5e07;
    stim[43] = 74'h0a0beab04b2fb82b5bb;
    stim[44] = 74'h0465c989e362af2f83a;
    stim[45] = 74'h210270771bd35449749;
    stim[46] = 74'h222db3babb9543bc5f2;
    stim[47] = 74'h2227658e138ea93648c;
    stim[48] = 74'h06737d8fcfa551ef905;
    stim[49] = 74'h213feeb1b7495df0927;
    stim[50] = 74'h3c76b4d488eb957de44;
    stim[51] = 74'h2247a25f4e6a3c2020b;
    stim[52] = 74'h07dca6c29add91c73d9;
    stim[53] = 74'h09036f115077c9ada0c;
    stim[54] = 74'h266a63dd604a7da8b78;
    stim[55] = 74'h2fbf3d06be26e8791ed;
    stim[56] = 74'h2a36130ee6949fbd879;
    stim[57] = 74'h09ffc855197464ae21d;
    stim[58] = 74'h0af572eb721f1c3fb24;
    stim[59] = 74'h2dd6aff5d60f6c3a5ac;
    stim[60] = 74'h2662906290b8883bf3b;
    stim[61] = 74'h04ab41198b71acae649;
    stim[62] = 74'h0a9cf3a132d3545ed11;
    stim[63] = 74'h032dc9bfa40f92ebc58;
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
      expv[0] = 48'h0x34410xe2ba;
      expv[1] = 48'h01943d003d51;
      expv[2] = 48'h008f91002a42;
      expv[3] = 48'h006b3b00feba;
      expv[4] = 48'h0029d9006cdb;
      expv[5] = 48'h018da90559a1;
      expv[6] = 48'h009ebf0532fc;
      expv[7] = 48'h01acc3056346;
      expv[8] = 48'h01452105fe9e;
      expv[9] = 48'h01701f0570ee;
      expv[10] = 48'h00f5ab05a875;
      expv[11] = 48'h00801d05c43a;
      expv[12] = 48'h007e1d050c75;
      expv[13] = 48'h06d42d0ac93d;
      expv[14] = 48'h0044f902e4f2;
      expv[15] = 48'h01e99f02c447;
      expv[16] = 48'h002c710215d0;
      expv[17] = 48'h0089f3028df1;
      expv[18] = 48'h013fcf027732;
      expv[19] = 48'h00a9770230a3;
      expv[20] = 48'h01f24d02310d;
      expv[21] = 48'h00e95b02215d;
      expv[22] = 48'h006ecd027f06;
      expv[23] = 48'h00c775027ac2;
      expv[24] = 48'h006e4102b0e9;
      expv[25] = 48'h0043dd022668;
      expv[26] = 48'h00646d02f093;
      expv[27] = 48'h00030f001f49;
      expv[28] = 48'h01f46700b025;
      expv[29] = 48'h008cd10053c2;
      expv[30] = 48'h015c57008a50;
      expv[31] = 48'h014711009bf9;
      expv[32] = 48'h015b5f00f12f;
      expv[33] = 48'h00ee7d001dcd;
      expv[34] = 48'h01f56d00b085;
      expv[35] = 48'h003175003eac;
      expv[36] = 48'h00fc15008130;
      expv[37] = 48'h013af5002d44;
      expv[38] = 48'h018d59007046;
      expv[39] = 48'h007f1b00ecb3;
      expv[40] = 48'h00558500f7a2;
      expv[41] = 48'h01d6dd006fa2;
      expv[42] = 48'h0196c500f03e;
      expv[43] = 48'h00cbef00addd;
      expv[44] = 48'h00d8a900c1d7;
      expv[45] = 48'h00f4d500ba48;
      expv[46] = 48'h04e553012f90;
      expv[47] = 48'h04e3a9012463;
      expv[48] = 48'h05e95701c82d;
      expv[49] = 48'h05d25501493c;
      expv[50] = 48'h043ae501f222;
      expv[51] = 48'h019a8d001058;
      expv[52] = 48'h00b767009ec9;
      expv[53] = 48'h001df100d064;
      expv[54] = 48'h00129d005bc2;
      expv[55] = 48'h0189bb008f6c;
      expv[56] = 48'h01a52500c3ca;
      expv[57] = 48'h005d190010ed;
      expv[58] = 48'h0087c500d923;
      expv[59] = 48'h0183d9002d67;
      expv[60] = 48'h002e2100f9db;
      expv[61] = 48'h00dc69003249;
      expv[62] = 48'h00b4d500688b;
      expv[63] = 48'h0103e500e2c7;
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
