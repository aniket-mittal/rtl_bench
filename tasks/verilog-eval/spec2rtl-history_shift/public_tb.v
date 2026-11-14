// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .areset(in_vec[36:36]),
    .predict_valid(in_vec[35:35]),
    .predict_taken(in_vec[34:34]),
    .train_mispredicted(in_vec[33:33]),
    .train_taken(in_vec[32:32]),
    .train_history(in_vec[31:0]),
    .predict_history(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1573c1f6fb;
    stim[1] = 37'h1a240e4c64;
    stim[2] = 37'h062d332dca;
    stim[3] = 37'h093582a97b;
    stim[4] = 37'h0fc96ed8e9;
    stim[5] = 37'h0217e0a90f;
    stim[6] = 37'h0ba74b01f3;
    stim[7] = 37'h0307dd48c9;
    stim[8] = 37'h0d3c918a34;
    stim[9] = 37'h0a2eb31e26;
    stim[10] = 37'h07e249f3be;
    stim[11] = 37'h0bc6182c2f;
    stim[12] = 37'h07e28ff320;
    stim[13] = 37'h0277544faa;
    stim[14] = 37'h0622706b9b;
    stim[15] = 37'h0ff31fb39e;
    stim[16] = 37'h0645fe53e7;
    stim[17] = 37'h096741c9a0;
    stim[18] = 37'h04c01a2205;
    stim[19] = 37'h07eede3d7d;
    stim[20] = 37'h02a2364ed8;
    stim[21] = 37'h0d4314babb;
    stim[22] = 37'h07c2fb8735;
    stim[23] = 37'h1adde3e685;
    stim[24] = 37'h08b7941cfc;
    stim[25] = 37'h0b3ac42935;
    stim[26] = 37'h0050163be2;
    stim[27] = 37'h053259e504;
    stim[28] = 37'h1ed6b0463b;
    stim[29] = 37'h0cc32e5c26;
    stim[30] = 37'h01952fb31b;
    stim[31] = 37'h02f4ccafb5;
    stim[32] = 37'h081e95e939;
    stim[33] = 37'h0a16f19b65;
    stim[34] = 37'h0f1f996298;
    stim[35] = 37'h0180e11058;
    stim[36] = 37'h015a6bed50;
    stim[37] = 37'h0e660c4050;
    stim[38] = 37'h0996a3fb7e;
    stim[39] = 37'h01c4eac23d;
    stim[40] = 37'h0a5de9d814;
    stim[41] = 37'h0070b10b1c;
    stim[42] = 37'h0f8cc7485c;
    stim[43] = 37'h0fd5b20730;
    stim[44] = 37'h07fff21e5d;
    stim[45] = 37'h1d4311c6df;
    stim[46] = 37'h059b56021e;
    stim[47] = 37'h0f3056263a;
    stim[48] = 37'h02806d1067;
    stim[49] = 37'h076a926adf;
    stim[50] = 37'h0445a611d4;
    stim[51] = 37'h04f4357586;
    stim[52] = 37'h064519498a;
    stim[53] = 37'h019b12fa45;
    stim[54] = 37'h06b1221a02;
    stim[55] = 37'h0966c06ad3;
    stim[56] = 37'h0d090bd05b;
    stim[57] = 37'h0a766143ed;
    stim[58] = 37'h020ec1c5d6;
    stim[59] = 37'h06b943ddfd;
    stim[60] = 37'h0a1a4d71ff;
    stim[61] = 37'h09dd3f0400;
    stim[62] = 37'h07b52db9d4;
    stim[63] = 37'h0244527ecb;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h5a665b94;
      expv[4] = 32'hb4ccb728;
      expv[5] = 32'h92ddb1d3;
      expv[6] = 32'h2fc1521e;
      expv[7] = 32'h4e9603e7;
      expv[8] = 32'h0fba9193;
      expv[9] = 32'h1f752327;
      expv[10] = 32'h5d663c4c;
      expv[11] = 32'hc493e77d;
      expv[12] = 32'h8c30585f;
      expv[13] = 32'hc51fe641;
      expv[14] = 32'heea89f54;
      expv[15] = 32'h44e0d736;
      expv[16] = 32'he63f673d;
      expv[17] = 32'h8bfca7ce;
      expv[18] = 32'h17f94f9c;
      expv[19] = 32'h17f94f9c;
      expv[20] = 32'hddbc7afb;
      expv[21] = 32'h446c9db0;
      expv[22] = 32'h88d93b61;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h7588526b;
      expv[27] = 32'h7588526b;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000001;
      expv[31] = 32'h00000001;
      expv[32] = 32'he9995f6a;
      expv[33] = 32'hd332bed4;
      expv[34] = 32'h2de336ca;
      expv[35] = 32'h3f32c531;
      expv[36] = 32'h3f32c531;
      expv[37] = 32'h3f32c531;
      expv[38] = 32'hcc1880a0;
      expv[39] = 32'h98310140;
      expv[40] = 32'h98310140;
      expv[41] = 32'hbbd3b028;
      expv[42] = 32'hbbd3b028;
      expv[43] = 32'h198e90b9;
      expv[44] = 32'hab640e61;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h60ac4c75;
      expv[49] = 32'h00da20ce;
      expv[50] = 32'hd524d5bf;
      expv[51] = 32'hd524d5bf;
      expv[52] = 32'hd524d5bf;
      expv[53] = 32'h8a329314;
      expv[54] = 32'h8a329314;
      expv[55] = 32'h62443404;
      expv[56] = 32'hc4886808;
      expv[57] = 32'h8910d011;
      expv[58] = 32'hecc287da;
      expv[59] = 32'h1d838bac;
      expv[60] = 32'h7287bbfa;
      expv[61] = 32'h349ae3fe;
      expv[62] = 32'h6935c7fc;
      expv[63] = 32'h6a5b73a9;
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
