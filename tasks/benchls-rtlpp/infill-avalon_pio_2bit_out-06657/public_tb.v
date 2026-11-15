// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06657 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[33:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0d0880e668;
    stim[1] = 37'h191c18c87a;
    stim[2] = 37'h03c2d9bf40;
    stim[3] = 37'h179c3ee24a;
    stim[4] = 37'h06e259b5bf;
    stim[5] = 37'h12c60b3663;
    stim[6] = 37'h03b428e943;
    stim[7] = 37'h0fbba6b71e;
    stim[8] = 37'h0a6c9b9dea;
    stim[9] = 37'h16087167bf;
    stim[10] = 37'h1317a5d192;
    stim[11] = 37'h1f02fccc9f;
    stim[12] = 37'h15f5f98e28;
    stim[13] = 37'h0f9d1bb6e4;
    stim[14] = 37'h03053bf491;
    stim[15] = 37'h0fd326570a;
    stim[16] = 37'h12930cc4b9;
    stim[17] = 37'h1b3602993b;
    stim[18] = 37'h1242e9f2d1;
    stim[19] = 37'h0b35c78bf1;
    stim[20] = 37'h162d79e108;
    stim[21] = 37'h02c02ba7f2;
    stim[22] = 37'h0b25e76282;
    stim[23] = 37'h12d3b9fc54;
    stim[24] = 37'h1b74bc56b7;
    stim[25] = 37'h0b85a8480b;
    stim[26] = 37'h163e611721;
    stim[27] = 37'h1b88ded7cc;
    stim[28] = 37'h0baf56a6da;
    stim[29] = 37'h0afe3ef05b;
    stim[30] = 37'h173987f469;
    stim[31] = 37'h0ab0c2562d;
    stim[32] = 37'h06d152be6c;
    stim[33] = 37'h03cdd2d9f0;
    stim[34] = 37'h0e7e60b308;
    stim[35] = 37'h100766f5f9;
    stim[36] = 37'h170eec5694;
    stim[37] = 37'h138259330c;
    stim[38] = 37'h0ae2b6c07e;
    stim[39] = 37'h127b941873;
    stim[40] = 37'h0e2272700e;
    stim[41] = 37'h1b609852ec;
    stim[42] = 37'h1699c94f49;
    stim[43] = 37'h1a8a9b8755;
    stim[44] = 37'h17bdd13f1c;
    stim[45] = 37'h07d937aa0c;
    stim[46] = 37'h170f8b19a4;
    stim[47] = 37'h0b25c00df1;
    stim[48] = 37'h0f5cf38d61;
    stim[49] = 37'h1e9a07f83e;
    stim[50] = 37'h0aa97a696f;
    stim[51] = 37'h16c522ab60;
    stim[52] = 37'h16348004f9;
    stim[53] = 37'h0a2d847ea0;
    stim[54] = 37'h07d8f4ae17;
    stim[55] = 37'h13f78a3cf5;
    stim[56] = 37'h1a61db9fe2;
    stim[57] = 37'h074381cafd;
    stim[58] = 37'h1b9b0b6588;
    stim[59] = 37'h0f7177d264;
    stim[60] = 37'h1fbef9122f;
    stim[61] = 37'h0f70ecc582;
    stim[62] = 37'h1e62dce25c;
    stim[63] = 37'h1741e7b984;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h300000000;
      expv[6] = 34'h300000003;
      expv[7] = 34'h300000000;
      expv[8] = 34'h300000000;
      expv[9] = 34'h300000000;
      expv[10] = 34'h300000000;
      expv[11] = 34'h300000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
