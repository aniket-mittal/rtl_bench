// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03628 dut (
    .rdclk(clk),
    .data(in_vec[35:4]),
    .wrreq(in_vec[3:3]),
    .rdreq(in_vec[2:2]),
    .wrclk(in_vec[1:1]),
    .aclr(in_vec[0:0]),
    .q(out_vec[55:24]),
    .rdfull(out_vec[23:23]),
    .rdempty(out_vec[22:22]),
    .rdusedw(out_vec[21:12]),
    .wrfull(out_vec[11:11]),
    .wrempty(out_vec[10:10]),
    .wrusedw(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h5c8f4ecfc;
    stim[1] = 36'heb67181ab;
    stim[2] = 36'hbbf6c577d;
    stim[3] = 36'h21fea77d1;
    stim[4] = 36'hd9cfd69ab;
    stim[5] = 36'h6b72a5034;
    stim[6] = 36'hf91718466;
    stim[7] = 36'h19450083d;
    stim[8] = 36'h1fdc17d50;
    stim[9] = 36'he4509719e;
    stim[10] = 36'h05fd2b0c9;
    stim[11] = 36'h1ee3a6c91;
    stim[12] = 36'he18bdc843;
    stim[13] = 36'hfe7531a51;
    stim[14] = 36'hb6f384035;
    stim[15] = 36'hede6e67eb;
    stim[16] = 36'hfc29ec795;
    stim[17] = 36'h8b862674b;
    stim[18] = 36'hf9625f8c3;
    stim[19] = 36'hd1d0e5cdd;
    stim[20] = 36'h2b38db751;
    stim[21] = 36'h2fbc07213;
    stim[22] = 36'h7c24759c4;
    stim[23] = 36'h975595cd6;
    stim[24] = 36'h900322eef;
    stim[25] = 36'h41d5106f4;
    stim[26] = 36'h344813cff;
    stim[27] = 36'hea1c08441;
    stim[28] = 36'h6ec39135e;
    stim[29] = 36'h24c360a6d;
    stim[30] = 36'h5300636fe;
    stim[31] = 36'hbeb5d8e5c;
    stim[32] = 36'hede2149bd;
    stim[33] = 36'hec8b7a903;
    stim[34] = 36'h2dbd62ddf;
    stim[35] = 36'hfe36c7cdb;
    stim[36] = 36'h4940fbd38;
    stim[37] = 36'h89a4ebff3;
    stim[38] = 36'hdb2fa6e77;
    stim[39] = 36'h30f80411d;
    stim[40] = 36'h4985f625b;
    stim[41] = 36'h192dfde61;
    stim[42] = 36'h5c03d4cd5;
    stim[43] = 36'hd9912219e;
    stim[44] = 36'h52cc68f43;
    stim[45] = 36'h4a50605d5;
    stim[46] = 36'h3f12e6451;
    stim[47] = 36'he5753ebe1;
    stim[48] = 36'h8384c6ebd;
    stim[49] = 36'hbda19f9a4;
    stim[50] = 36'h6c49292a5;
    stim[51] = 36'h7023ab4e1;
    stim[52] = 36'he71a57004;
    stim[53] = 36'hcc449553d;
    stim[54] = 36'h2a49606d0;
    stim[55] = 36'hca4ec80d6;
    stim[56] = 36'hd9098ba20;
    stim[57] = 36'heef1ce10c;
    stim[58] = 36'hf58bbd8a0;
    stim[59] = 36'h38dcc3d31;
    stim[60] = 36'h0f6fce961;
    stim[61] = 36'hd23406ac6;
    stim[62] = 36'hee65db895;
    stim[63] = 36'h57d5e2060;
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
      expv[0] = 56'h00000000xxxxxx;
      expv[1] = 56'heb67181a400bff;
      expv[2] = 56'heb67181a001bff;
      expv[3] = 56'h00000000001bff;
      expv[4] = 56'hd9cfd69a400400;
      expv[5] = 56'h00000000001400;
      expv[6] = 56'h00000000400bff;
      expv[7] = 56'h00000000bffbff;
      expv[8] = 56'h00000000400bff;
      expv[9] = 56'he4509719400400;
      expv[10] = 56'h00000000001400;
      expv[11] = 56'h00000000400400;
      expv[12] = 56'h00000000400400;
      expv[13] = 56'h00000000400400;
      expv[14] = 56'h00000000400400;
      expv[15] = 56'h00000000400bff;
      expv[16] = 56'h00000000400bff;
      expv[17] = 56'h00000000400bff;
      expv[18] = 56'h00000000400bff;
      expv[19] = 56'h00000000400bff;
      expv[20] = 56'h00000000400bff;
      expv[21] = 56'h00000000bffbff;
      expv[22] = 56'h00000000bffbff;
      expv[23] = 56'h00000000400bff;
      expv[24] = 56'h00000000bffbff;
      expv[25] = 56'h00000000400bff;
      expv[26] = 56'h344813cf400bff;
      expv[27] = 56'h00000000001bff;
      expv[28] = 56'h00000000400400;
      expv[29] = 56'h00000000002400;
      expv[30] = 56'h5300636f400bff;
      expv[31] = 56'h00000000001bff;
      expv[32] = 56'h00000000400bff;
      expv[33] = 56'h00000000400bff;
      expv[34] = 56'h00000000bffbff;
      expv[35] = 56'h00000000bffbff;
      expv[36] = 56'h000000003febff;
      expv[37] = 56'h00000000400400;
      expv[38] = 56'h00000000400400;
      expv[39] = 56'h00000000400400;
      expv[40] = 56'h00000000bff3fe;
      expv[41] = 56'h00000000bff3fe;
      expv[42] = 56'h00000000bff3fe;
      expv[43] = 56'h00000000bff3fe;
      expv[44] = 56'h000000000023fe;
      expv[45] = 56'h000000004003fe;
      expv[46] = 56'h000000004003fe;
      expv[47] = 56'h00000000bff3fe;
      expv[48] = 56'h00000000bff3fe;
      expv[49] = 56'h00000000bff3fe;
      expv[50] = 56'h000000004003fe;
      expv[51] = 56'h000000004003fe;
      expv[52] = 56'h00000000bff3fe;
      expv[53] = 56'h000000004003fe;
      expv[54] = 56'h000000004003fe;
      expv[55] = 56'h00000000400400;
      expv[56] = 56'h00000000400400;
      expv[57] = 56'h00000000bff400;
      expv[58] = 56'h00000000bff400;
      expv[59] = 56'h000000003fe400;
      expv[60] = 56'h00000000400400;
      expv[61] = 56'h00000000400400;
      expv[62] = 56'h00000000400400;
      expv[63] = 56'h00000000400400;
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
