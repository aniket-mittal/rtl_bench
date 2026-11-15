// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_177649 dut (
    .clk(clk),
    .req(in_vec[49:49]),
    .rst(in_vec[48:48]),
    .start_x(in_vec[47:36]),
    .start_y(in_vec[35:24]),
    .end_x(in_vec[23:12]),
    .end_y(in_vec[11:0]),
    .out_x(out_vec[24:13]),
    .out_y(out_vec[12:1]),
    .ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h11ca3bcaf090c;
    stim[1] = 50'h37addfa088cd6;
    stim[2] = 50'h093fe30bdf796;
    stim[3] = 50'h296040cdc3e8f;
    stim[4] = 50'h2b8aa8312cbe2;
    stim[5] = 50'h0317709ee4a73;
    stim[6] = 50'h26b4ca0fd582d;
    stim[7] = 50'h08b2f6afab3ef;
    stim[8] = 50'h2298ca6b6ab4c;
    stim[9] = 50'h0a5d9dedd66e1;
    stim[10] = 50'h2071c554ab038;
    stim[11] = 50'h27954a3adb2ae;
    stim[12] = 50'h2525429c228a2;
    stim[13] = 50'h2de6ad5db8980;
    stim[14] = 50'h0bf9320210873;
    stim[15] = 50'h273761be41ad0;
    stim[16] = 50'h2748001161fb8;
    stim[17] = 50'h0f80400841c7a;
    stim[18] = 50'h2f6cabf7fbca6;
    stim[19] = 50'h00e0d5fa37e84;
    stim[20] = 50'h26a0eb609d2b6;
    stim[21] = 50'h25ebfe9e86625;
    stim[22] = 50'h0d76337caefe6;
    stim[23] = 50'h267fe2fd35456;
    stim[24] = 50'h0df35f1830b3e;
    stim[25] = 50'h2cdb665e0768f;
    stim[26] = 50'h08671fe8c8137;
    stim[27] = 50'h29c2010ade6d1;
    stim[28] = 50'h255fc8cdcbe59;
    stim[29] = 50'h293b0e43b721b;
    stim[30] = 50'h265a6ae689760;
    stim[31] = 50'h2c3bb9e4af4e1;
    stim[32] = 50'h0d399230e2c24;
    stim[33] = 50'h2065c758fde97;
    stim[34] = 50'h244f3b70c16b7;
    stim[35] = 50'h022da1f94b72b;
    stim[36] = 50'h2e2b51f483148;
    stim[37] = 50'h2fcd89c158e71;
    stim[38] = 50'h08e05f54b8acd;
    stim[39] = 50'h23bf9ae77687b;
    stim[40] = 50'h2bedd6d03b27f;
    stim[41] = 50'h0e1a8893ddfd8;
    stim[42] = 50'h01516f0105210;
    stim[43] = 50'h28a2696e553c7;
    stim[44] = 50'h2079ab3771378;
    stim[45] = 50'h2049cb3e5ae29;
    stim[46] = 50'h2cf2f7e9a4c68;
    stim[47] = 50'h211ae9bbb9a86;
    stim[48] = 50'h07100829cc686;
    stim[49] = 50'h2b624a7b0dd2a;
    stim[50] = 50'h23753528df1ce;
    stim[51] = 50'h2f443a68c32d1;
    stim[52] = 50'h293360198c469;
    stim[53] = 50'h0ffc72bfd05d7;
    stim[54] = 50'h2028ad1a27438;
    stim[55] = 50'h269aab40ba606;
    stim[56] = 50'h08d949aff20c8;
    stim[57] = 50'h09665a419647e;
    stim[58] = 50'h06c7fc1d448cf;
    stim[59] = 50'h0534637aee9c7;
    stim[60] = 50'h2bc314403791a;
    stim[61] = 50'h094b34fc4204a;
    stim[62] = 50'h2ca8cf600b1dc;
    stim[63] = 50'h2b53283a26a51;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000000;
      expv[6] = 25'h0000000;
      expv[7] = 25'h0003940;
      expv[8] = 25'h0003940;
      expv[9] = 25'h000594c;
      expv[10] = 25'h000594c;
      expv[11] = 25'h00078aa;
      expv[12] = 25'h0008946;
      expv[13] = 25'h000a852;
      expv[14] = 25'h000d5aa;
      expv[15] = 25'h000d5aa;
      expv[16] = 25'h000ec36;
      expv[17] = 25'h0010002;
      expv[18] = 25'h0010002;
      expv[19] = 25'h001357e;
      expv[20] = 25'h001357e;
      expv[21] = 25'h0015d6c;
      expv[22] = 25'h0017fd2;
      expv[23] = 25'h0017fd2;
      expv[24] = 25'h0019c5e;
      expv[25] = 25'h0019c5e;
      expv[26] = 25'h001acca;
      expv[27] = 25'h001acca;
      expv[28] = 25'h001c020;
      expv[29] = 25'h001f918;
      expv[30] = 25'h00201c8;
      expv[31] = 25'h0022d5c;
      expv[32] = 25'h002573c;
      expv[33] = 25'h002573c;
      expv[34] = 25'h00278ea;
      expv[35] = 25'h002876e;
      expv[36] = 25'h002876e;
      expv[37] = 25'h002aa3e;
      expv[38] = 25'h002d138;
      expv[39] = 25'h002d138;
      expv[40] = 25'h002f35c;
      expv[41] = 25'h0031ada;
      expv[42] = 25'h0031ada;
      expv[43] = 25'h0031ada;
      expv[44] = 25'h0032d2c;
      expv[45] = 25'h0035566;
      expv[46] = 25'h0037966;
      expv[47] = 25'h0039efc;
      expv[48] = 25'h003bd36;
      expv[49] = 25'h003bd36;
      expv[50] = 25'h003c94e;
      expv[51] = 25'h003e6a4;
      expv[52] = 25'h004074c;
      expv[53] = 25'h0042c02;
      expv[54] = 25'h0042c02;
      expv[55] = 25'h00455a2;
      expv[56] = 25'h0047568;
      expv[57] = 25'h0047568;
      expv[58] = 25'h0047568;
      expv[59] = 25'h0047568;
      expv[60] = 25'h0047568;
      expv[61] = 25'h0048288;
      expv[62] = 25'h0048288;
      expv[63] = 25'h004b9ec;
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
