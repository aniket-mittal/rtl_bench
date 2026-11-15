// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 133;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154607 dut (
    .PCLK(clk),
    .PRESETB(in_vec[132:132]),
    .PADDR(in_vec[131:100]),
    .PSEL(in_vec[99:99]),
    .PENABLE(in_vec[98:98]),
    .PWRITE(in_vec[97:97]),
    .PWDATA(in_vec[96:65]),
    .fc_done(in_vec[64:64]),
    .clk_counter(in_vec[63:32]),
    .max_index(in_vec[31:0]),
    .fc_start(out_vec[43:43]),
    .data_size(out_vec[42:32]),
    .PRDATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 133'h1c06d352c32d165e8f96c09b7df75a3666;
    stim[1] = 133'h1a6e5e87da261b7b47010fbbf25d0cf7fc;
    stim[2] = 133'h0bed87f396700bb984bb7e1c4bf77906d4;
    stim[3] = 133'h086ea9245b3106f661f5ce22bef4b38ab7;
    stim[4] = 133'h0bc2103b4df817ce71cc294ff52a1321bc;
    stim[5] = 133'h0f4f70ba44e5a573f975e964ac49dc5b59;
    stim[6] = 133'h0355f19e9b3fa35a363f7434a924b03c7e;
    stim[7] = 133'h0c7baa58723c4ab5e851ce4e40f6d2166f;
    stim[8] = 133'h0b2fb32324a5c222758f310a865cd2cd26;
    stim[9] = 133'h0fc7f66a0af006389c2dc98e56625efe65;
    stim[10] = 133'h0728c9ede006785e02584d0f0e736af6da;
    stim[11] = 133'h0d50626c53e122d41da74f655a86a95b07;
    stim[12] = 133'h09c462c2b63a2026a60d03d01176129e2e;
    stim[13] = 133'h09b5407063e9425d058872fe5e393e3b2e;
    stim[14] = 133'h0c952ef52f99fa46c58d8a35323358ccf1;
    stim[15] = 133'h09b4e0ce0d54b08883eef91ae82ce43606;
    stim[16] = 133'h0ccd02f6ec67875fcf287326455ce82441;
    stim[17] = 133'h00c8e9fa6dc4a83e2679a7dbdd9d1cb37b;
    stim[18] = 133'h0a244374712d67484aa756c1a12dbfd231;
    stim[19] = 133'h02e238e7c11b8e6c25d95d7acdec5ddf6f;
    stim[20] = 133'h0382889197b52a11f096e3d67bd422e7cf;
    stim[21] = 133'h02c997edaea0ab5c77dfd5bb44c74c94c7;
    stim[22] = 133'h08056420ed9b9733e9a05ed3a3f56d73d8;
    stim[23] = 133'h00381b2b50d67d2bef0a3182879b06e45a;
    stim[24] = 133'h0512139020c2ff6913753bf3bd29902aa2;
    stim[25] = 133'h09efc2f54f8409c0154f90619bddb19055;
    stim[26] = 133'h07e515a42c825163972d6823b440c26a6d;
    stim[27] = 133'h086e6868e6c285ae9edd9be9ce9d21ea58;
    stim[28] = 133'h0c8e8b742fe5866eda3c58041751ba8cee;
    stim[29] = 133'h06d3d45ff7f8942dfcb3b0649fb54e9d8f;
    stim[30] = 133'h04c687ed5555f14b80b3b4dae69f541b7e;
    stim[31] = 133'h0698a4bf31b6be671eb6b57cc202515332;
    stim[32] = 133'h02245580f64c0f9d31e702ae76918d02a4;
    stim[33] = 133'h047cce769e65266a1275916307e95b1ac0;
    stim[34] = 133'h025dbd4d0ca31ef5733788e8315b966cc9;
    stim[35] = 133'h0c919850f4158581faa12da0a1ebda52a1;
    stim[36] = 133'h09ace06215d6cd8dbee3d8327be272b83f;
    stim[37] = 133'h0aa8ce2cadc52807ea75af41bee49a05a7;
    stim[38] = 133'h039154c4810c0eeef10a945d07d7f68bb1;
    stim[39] = 133'h0bc8cc5ee449089682c46b9bdb591f7c3a;
    stim[40] = 133'h014be737e4d4288c5a9191ba0b6528bd64;
    stim[41] = 133'h082302d6709895a15f4a29ac1c227d6056;
    stim[42] = 133'h087a3377eacc11782c1980bdd19066c9fb;
    stim[43] = 133'h003d5545a8e2d5cfe72600290414ca2a92;
    stim[44] = 133'h0657874dd29b0b7d121f8288a68e48b1d8;
    stim[45] = 133'h00ed86463ec8d2696e47b866e5d4985986;
    stim[46] = 133'h02e9f456b49984ea8b073c5ab315d4cc00;
    stim[47] = 133'h0255786265da630f8edce42d28cf30f228;
    stim[48] = 133'h070fb77672418a13cc78cb335738799c1f;
    stim[49] = 133'h0d64de1c4cedbbc01314bd0cb7e2013151;
    stim[50] = 133'h04402716b779e1d5453d48d23b1eb06a58;
    stim[51] = 133'h0b0d570161b6ec6a4e067300a773543f87;
    stim[52] = 133'h08bf5d2d86d0969209173b661e6e534cf2;
    stim[53] = 133'h08327e53ddb849dcaa852edcc33db29e58;
    stim[54] = 133'h0458649e5874ae98fed4f7cf925737e300;
    stim[55] = 133'h060fb8a1107e0c6382c7d55a7d911d5e30;
    stim[56] = 133'h066ce47fb9de69668a6d48c90b7853074e;
    stim[57] = 133'h0953825c7f72008b37d27e9a913015a6fb;
    stim[58] = 133'h09418ba367a2344f64e430cbfb79c9a258;
    stim[59] = 133'h00c05c5be37357e9a0315a0658eb85c9d4;
    stim[60] = 133'h0e6ceec745441e833e5ba3e3f517ecbbeb;
    stim[61] = 133'h0b3d9d27d5779996a291d340592c9e495c;
    stim[62] = 133'h0d6b0ce103a6c9ac4719f09ccc8c732a12;
    stim[63] = 133'h057b6930fe67c7a3b806b2474cd70369d2;
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
      expv[0] = 44'h000xxxxxxxx;
      expv[1] = 44'h000xxxxxxxx;
      expv[2] = 44'h000xxxxxxxx;
      expv[3] = 44'h000xxxxxxxx;
      expv[4] = 44'h000xxxxxxxx;
      expv[5] = 44'h00000000000;
      expv[6] = 44'h00000000000;
      expv[7] = 44'h00000000000;
      expv[8] = 44'h00000000000;
      expv[9] = 44'h00000000000;
      expv[10] = 44'h00000000000;
      expv[11] = 44'h00000000000;
      expv[12] = 44'h00000000000;
      expv[13] = 44'h00000000000;
      expv[14] = 44'h00000000000;
      expv[15] = 44'h00000000000;
      expv[16] = 44'h00000000000;
      expv[17] = 44'h00000000000;
      expv[18] = 44'h00000000000;
      expv[19] = 44'h00000000000;
      expv[20] = 44'h00000000000;
      expv[21] = 44'h00000000000;
      expv[22] = 44'h00000000000;
      expv[23] = 44'h00000000000;
      expv[24] = 44'h00000000000;
      expv[25] = 44'h00000000000;
      expv[26] = 44'h00000000000;
      expv[27] = 44'h00000000000;
      expv[28] = 44'h00000000000;
      expv[29] = 44'h00000000000;
      expv[30] = 44'h00000000000;
      expv[31] = 44'h00000000000;
      expv[32] = 44'h00000000000;
      expv[33] = 44'h00000000000;
      expv[34] = 44'h00000000000;
      expv[35] = 44'h00000000000;
      expv[36] = 44'h00000000000;
      expv[37] = 44'h00000000000;
      expv[38] = 44'h00000000000;
      expv[39] = 44'h00000000000;
      expv[40] = 44'h00000000000;
      expv[41] = 44'h00000000000;
      expv[42] = 44'h00000000000;
      expv[43] = 44'h00000000000;
      expv[44] = 44'h00000000000;
      expv[45] = 44'h00000000000;
      expv[46] = 44'h00000000000;
      expv[47] = 44'h00000000000;
      expv[48] = 44'h00000000000;
      expv[49] = 44'h00000000000;
      expv[50] = 44'h00000000000;
      expv[51] = 44'h00000000000;
      expv[52] = 44'h00000000000;
      expv[53] = 44'h00000000000;
      expv[54] = 44'h00000000000;
      expv[55] = 44'h00000000000;
      expv[56] = 44'h00000000000;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h00000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'h00000000000;
      expv[62] = 44'h00000000000;
      expv[63] = 44'h00000000000;
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
