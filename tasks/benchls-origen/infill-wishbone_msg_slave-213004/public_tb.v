// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213004 dut (
    .clk_i(clk),
    .rst_i(in_vec[74:74]),
    .cyc_i(in_vec[73:73]),
    .stb_i(in_vec[72:72]),
    .sel_i(in_vec[71:68]),
    .we_i(in_vec[67:67]),
    .adr_i(in_vec[66:64]),
    .dat_i(in_vec[63:32]),
    .msg_in(in_vec[31:0]),
    .dat_o(out_vec[64:33]),
    .ack_o(out_vec[32:32]),
    .msg_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h7d4394765c1a6104561;
    stim[1] = 75'h472cfb99d5e177bd819;
    stim[2] = 75'h2cc056d8b05f2dc7da8;
    stim[3] = 75'h27e97ec17e037fa0dc4;
    stim[4] = 75'h1a55d7c442346672508;
    stim[5] = 75'h2d40a1ce8a911adacdf;
    stim[6] = 75'h2d2099ba098eb1bfd85;
    stim[7] = 75'h3824d39b5eb72578a6b;
    stim[8] = 75'h22c61688fb489114875;
    stim[9] = 75'h3eeeff8b09bf7b8cf61;
    stim[10] = 75'h3f0fc7449bc30d9852b;
    stim[11] = 75'h313dc8cd70e0e9d8982;
    stim[12] = 75'h10686c656fa4af9c45a;
    stim[13] = 75'h2d531d524a9c62a0efc;
    stim[14] = 75'h08a9f0a767f39fcc246;
    stim[15] = 75'h143caabc44bbefb418d;
    stim[16] = 75'h1c6a81d110c87accded;
    stim[17] = 75'h005b1067de5135d48f2;
    stim[18] = 75'h2750ebbc4e3291cfdec;
    stim[19] = 75'h2fd95099a299871c704;
    stim[20] = 75'h1c32c3f7a1176f53298;
    stim[21] = 75'h09a77f8de260c9fc3ec;
    stim[22] = 75'h04e99722a46a1387be1;
    stim[23] = 75'h349c38f15bf3d2ea63f;
    stim[24] = 75'h10beb20499c5b2bf4bd;
    stim[25] = 75'h27349df7c6c0f394775;
    stim[26] = 75'h39790382659fde0eca5;
    stim[27] = 75'h15c13ce43b9b20e40de;
    stim[28] = 75'h0b558b708b220eb4af4;
    stim[29] = 75'h282a4d5049378331f42;
    stim[30] = 75'h1b1c9d37ce88ab3c9e3;
    stim[31] = 75'h1187c7189e42e8d454e;
    stim[32] = 75'h19aecd452724a3caae7;
    stim[33] = 75'h0ecc6cdff571cfd5a08;
    stim[34] = 75'h14ee9a0627f4aaf619c;
    stim[35] = 75'h2d81986ec78f2d15be0;
    stim[36] = 75'h12ffbb383af3fc69d31;
    stim[37] = 75'h244365f6162ea507c17;
    stim[38] = 75'h17bc2675efa73f339a7;
    stim[39] = 75'h2edf883d8d9a48ebaa8;
    stim[40] = 75'h08997fff7fd89343786;
    stim[41] = 75'h1476989b06fe1bef967;
    stim[42] = 75'h1e4751c9046390b7600;
    stim[43] = 75'h25c05dad4d0d935389e;
    stim[44] = 75'h18320f70558c767ea44;
    stim[45] = 75'h0e45a8b455e2116db2a;
    stim[46] = 75'h3d59678cc0e7d35c8f3;
    stim[47] = 75'h35af93e8fd39e0e2260;
    stim[48] = 75'h032ac6fa0ae8a769777;
    stim[49] = 75'h038874c67a67dd7941d;
    stim[50] = 75'h21109c09767133e5042;
    stim[51] = 75'h14053089e372df78598;
    stim[52] = 75'h2e3104116771671f903;
    stim[53] = 75'h2bcd7801202b1c6ce27;
    stim[54] = 75'h393110b961be0bd0acd;
    stim[55] = 75'h38b40ae0191663cad29;
    stim[56] = 75'h108aa9ddbe3f07dc27b;
    stim[57] = 75'h3cbf620f601bb0ce590;
    stim[58] = 75'h1099d2713caf3752402;
    stim[59] = 75'h3331fe2e5ddc054c6e0;
    stim[60] = 75'h126f62359a5e8c06cf6;
    stim[61] = 75'h291b771f7ab60eab1e4;
    stim[62] = 75'h02d79f09b85b9abd6b0;
    stim[63] = 75'h36a4ff2d96977ffce4e;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h09a736bd64d39b5eb;
      expv[9] = 65'h00000000100000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h1f8e89378fc7449bc;
      expv[12] = 65'h1f8e89378fc7449bc;
      expv[13] = 65'h1f8e89378fc7449bc;
      expv[14] = 65'h00000000100000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h1871e2b7ec38f15bf;
      expv[25] = 65'h1871e2b7ec38f15bf;
      expv[26] = 65'h1871e2b7ec38f15bf;
      expv[27] = 65'h00000000100000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h12cf1981c9678cc0e;
      expv[48] = 65'h00000000100000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h022172c36110b961b;
      expv[56] = 65'h022172c36110b961b;
      expv[57] = 65'h00000000100000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h03fc5cbba1fe2e5dd;
      expv[61] = 65'h00000000100000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
