// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_133671 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .dividend(in_vec[31:16]),
    .divisor(in_vec[15:0]),
    .quotient(out_vec[32:17]),
    .remainder(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h113f24933;
    stim[1] = 33'h16bb0c061;
    stim[2] = 33'h0a6e8883c;
    stim[3] = 33'h0a9c7b8e1;
    stim[4] = 33'h00b8331ba;
    stim[5] = 33'h00100f4fe;
    stim[6] = 33'h0ab2ba46b;
    stim[7] = 33'h032bd43c2;
    stim[8] = 33'h04466a7b2;
    stim[9] = 33'h055bed466;
    stim[10] = 33'h0135acea0;
    stim[11] = 33'h016a784d3;
    stim[12] = 33'h08e47b293;
    stim[13] = 33'h026c7d2af;
    stim[14] = 33'h0202eaa28;
    stim[15] = 33'h0da3e8e23;
    stim[16] = 33'h00a4205b6;
    stim[17] = 33'h01aacc9ce;
    stim[18] = 33'h055fd4dd0;
    stim[19] = 33'h0fbbe7cf0;
    stim[20] = 33'h08154351a;
    stim[21] = 33'h06417f96f;
    stim[22] = 33'h08f5fc51c;
    stim[23] = 33'h056ac262c;
    stim[24] = 33'h0165b7429;
    stim[25] = 33'h0e4de26b8;
    stim[26] = 33'h05f282042;
    stim[27] = 33'h08f7d8524;
    stim[28] = 33'h0477a556a;
    stim[29] = 33'h054bbd6ef;
    stim[30] = 33'h011849c8e;
    stim[31] = 33'h007c29ee7;
    stim[32] = 33'h01d336799;
    stim[33] = 33'h09a69869e;
    stim[34] = 33'h03e60fcf2;
    stim[35] = 33'h064769ac4;
    stim[36] = 33'h01cb2e141;
    stim[37] = 33'h0d1f1de40;
    stim[38] = 33'h037be1a47;
    stim[39] = 33'h009db6496;
    stim[40] = 33'h0f2f337fc;
    stim[41] = 33'h00ba8f197;
    stim[42] = 33'h0e3eb7a6d;
    stim[43] = 33'h009ed13c8;
    stim[44] = 33'h04e8365de;
    stim[45] = 33'h0ab435c2b;
    stim[46] = 33'h05a890843;
    stim[47] = 33'h006d9e137;
    stim[48] = 33'h017170acb;
    stim[49] = 33'h0190a9cbd;
    stim[50] = 33'h095a284df;
    stim[51] = 33'h00e83920d;
    stim[52] = 33'h0002c7af8;
    stim[53] = 33'h03e1f52ed;
    stim[54] = 33'h0ca8d95ab;
    stim[55] = 33'h08573d723;
    stim[56] = 33'h0c1b0f0d8;
    stim[57] = 33'h0c1b15dca;
    stim[58] = 33'h0ffa738f0;
    stim[59] = 33'h07200bb38;
    stim[60] = 33'h0ada81add;
    stim[61] = 33'h001720f0c;
    stim[62] = 33'h05d0e1977;
    stim[63] = 33'h03aade31a;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000020000;
      expv[5] = 33'h000040000;
      expv[6] = 33'h000080000;
      expv[7] = 33'h000100000;
      expv[8] = 33'h000220000;
      expv[9] = 33'h000440000;
      expv[10] = 33'h0008a0000;
      expv[11] = 33'h001140000;
      expv[12] = 33'h0022a0000;
      expv[13] = 33'h004540000;
      expv[14] = 33'h008a80000;
      expv[15] = 33'h011500000;
      expv[16] = 33'h022a20000;
      expv[17] = 33'h045440000;
      expv[18] = 33'h08a8a0000;
      expv[19] = 33'h115140000;
      expv[20] = 33'h115149431;
      expv[21] = 33'h000009431;
      expv[22] = 33'h000029431;
      expv[23] = 33'h000069431;
      expv[24] = 33'h0000c9431;
      expv[25] = 33'h000189431;
      expv[26] = 33'h000329431;
      expv[27] = 33'h000649431;
      expv[28] = 33'h000ca9431;
      expv[29] = 33'h001949431;
      expv[30] = 33'h003289431;
      expv[31] = 33'h006529431;
      expv[32] = 33'h00ca49431;
      expv[33] = 33'h0194a9431;
      expv[34] = 33'h032949431;
      expv[35] = 33'h0652a9431;
      expv[36] = 33'h0ca549431;
      expv[37] = 33'h194aa9431;
      expv[38] = 33'h194aa3375;
      expv[39] = 33'h000003375;
      expv[40] = 33'h000023375;
      expv[41] = 33'h000063375;
      expv[42] = 33'h0000c3375;
      expv[43] = 33'h000183375;
      expv[44] = 33'h000303375;
      expv[45] = 33'h000603375;
      expv[46] = 33'h000c23375;
      expv[47] = 33'h001843375;
      expv[48] = 33'h0030a3375;
      expv[49] = 33'h006143375;
      expv[50] = 33'h00c2a3375;
      expv[51] = 33'h018543375;
      expv[52] = 33'h030aa3375;
      expv[53] = 33'h061543375;
      expv[54] = 33'h0c2aa3375;
      expv[55] = 33'h185543375;
      expv[56] = 33'h18554059d;
      expv[57] = 33'h00000059d;
      expv[58] = 33'h00000059d;
      expv[59] = 33'h00000059d;
      expv[60] = 33'h00000059d;
      expv[61] = 33'h00000059d;
      expv[62] = 33'h00000059d;
      expv[63] = 33'h00000059d;
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
