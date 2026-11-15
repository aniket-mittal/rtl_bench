// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00059 dut (
    .clock(clk),
    .WriteEnable(in_vec[65:65]),
    .Flush(in_vec[64:64]),
    .pc_plus_four(in_vec[63:32]),
    .instruction(in_vec[31:0]),
    .ID_pc_plus_four(out_vec[63:32]),
    .ID_instruction(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h092691c6a202a9573;
    stim[1] = 66'h190a39d8e15d77d6f;
    stim[2] = 66'h3ba6b634dae861bda;
    stim[3] = 66'h1c13fb114911476fd;
    stim[4] = 66'h1a2b7ee1fa674b4ce;
    stim[5] = 66'h30619b50af3f86356;
    stim[6] = 66'h126c20339c1eb60ee;
    stim[7] = 66'h0f54af93d62b647e4;
    stim[8] = 66'h3ad2240790bec1e5f;
    stim[9] = 66'h21f98730a2ed5284e;
    stim[10] = 66'h32afc7bfe5abc215a;
    stim[11] = 66'h2df9b2c87a60f02a4;
    stim[12] = 66'h01c5304c4fc0ef5f1;
    stim[13] = 66'h1485372a62edabca6;
    stim[14] = 66'h23e3a4bcf8ffe8095;
    stim[15] = 66'h243fa28d5b85887af;
    stim[16] = 66'h3743a169dc805710a;
    stim[17] = 66'h0f44e21c52f92f63f;
    stim[18] = 66'h3b10fea62758f0c28;
    stim[19] = 66'h0bcf4ee3938c69fd4;
    stim[20] = 66'h12b00de7928074afa;
    stim[21] = 66'h3310b82c290e279a8;
    stim[22] = 66'h3fa7ae99f2bd1aec1;
    stim[23] = 66'h06fc514a67df299f3;
    stim[24] = 66'h0fff92509af03181e;
    stim[25] = 66'h2abd5df3f893b29be;
    stim[26] = 66'h12d8fe7133455562b;
    stim[27] = 66'h1a6e5feaaf823ca91;
    stim[28] = 66'h06015c993d8a82dae;
    stim[29] = 66'h115aa7a146a1b9ea6;
    stim[30] = 66'h1f83603912f2a3d3e;
    stim[31] = 66'h391eee94970d8b52b;
    stim[32] = 66'h068896f19d2e54c97;
    stim[33] = 66'h3b17096c085c59250;
    stim[34] = 66'h2a43740bb3b69efdd;
    stim[35] = 66'h1b9b06ba8c976a3ec;
    stim[36] = 66'h0306cbc333a6456db;
    stim[37] = 66'h11e8db75ae9f8fc84;
    stim[38] = 66'h2aa0ca76b183234b5;
    stim[39] = 66'h36145e11b13270bba;
    stim[40] = 66'h3d997a3474f87b5bc;
    stim[41] = 66'h0b243ca91dc85b5e1;
    stim[42] = 66'h2be66ea58b159134c;
    stim[43] = 66'h2853dd0933a15f341;
    stim[44] = 66'h2dd800065db72d272;
    stim[45] = 66'h18f3d34203b792cca;
    stim[46] = 66'h2f8103bcd913e4743;
    stim[47] = 66'h1f7148d0d4451d4f0;
    stim[48] = 66'h2d9aadd457f5f3dbb;
    stim[49] = 66'h066c463d9e1b7fc82;
    stim[50] = 66'h0681cfaf378f7f298;
    stim[51] = 66'h2a5b5b01b1de30f4c;
    stim[52] = 66'h0c71fe04b8fa66501;
    stim[53] = 66'h1f4e5afcbcdee77b3;
    stim[54] = 66'h1adbb9040e431b484;
    stim[55] = 66'h224a6282eac824b41;
    stim[56] = 66'h1aff5921727bba8d4;
    stim[57] = 66'h15bc00737f49a8cfb;
    stim[58] = 66'h1f39392fdaabf54e0;
    stim[59] = 66'h006193ff3e9a8faa1;
    stim[60] = 66'h0746090e4b4732d20;
    stim[61] = 66'h061903144c550d61c;
    stim[62] = 66'h052ac4bec4122a0a0;
    stim[63] = 66'h070fde3b98ff79925;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h1f98730a2ed5284e;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'hdf9b2c87a60f02a4;
      expv[13] = 64'hdf9b2c87a60f02a4;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h3e3a4bcf8ffe8095;
      expv[16] = 64'h43fa28d5b85887af;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'habd5df3f893b29be;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'ha43740bb3b69efdd;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'haa0ca76b183234b5;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'hbe66ea58b159134c;
      expv[44] = 64'h853dd0933a15f341;
      expv[45] = 64'hdd800065db72d272;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'hf8103bcd913e4743;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'hd9aadd457f5f3dbb;
      expv[50] = 64'hd9aadd457f5f3dbb;
      expv[51] = 64'hd9aadd457f5f3dbb;
      expv[52] = 64'ha5b5b01b1de30f4c;
      expv[53] = 64'ha5b5b01b1de30f4c;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h24a6282eac824b41;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
