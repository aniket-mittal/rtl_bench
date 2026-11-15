// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101928 dut (
    .clk(clk),
    .resetn(in_vec[14:14]),
    .enableCounter(in_vec[13:13]),
    .ld_x(in_vec[12:12]),
    .ld_y(in_vec[11:11]),
    .ld_c(in_vec[10:10]),
    .coordIn(in_vec[9:3]),
    .colourIn(in_vec[2:0]),
    .xOut(out_vec[16:10]),
    .yOut(out_vec[9:3]),
    .colourOut(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h3cdd;
    stim[1] = 15'h05b7;
    stim[2] = 15'h5ce7;
    stim[3] = 15'h4464;
    stim[4] = 15'h69b9;
    stim[5] = 15'h6f8d;
    stim[6] = 15'h6358;
    stim[7] = 15'h6655;
    stim[8] = 15'h7a4e;
    stim[9] = 15'h4c83;
    stim[10] = 15'h51b6;
    stim[11] = 15'h44d6;
    stim[12] = 15'h5e31;
    stim[13] = 15'h4edd;
    stim[14] = 15'h742d;
    stim[15] = 15'h509c;
    stim[16] = 15'h7542;
    stim[17] = 15'h5f64;
    stim[18] = 15'h5e68;
    stim[19] = 15'h5d08;
    stim[20] = 15'h5e24;
    stim[21] = 15'h7f22;
    stim[22] = 15'h6912;
    stim[23] = 15'h5a89;
    stim[24] = 15'h7360;
    stim[25] = 15'h7a2a;
    stim[26] = 15'h4b61;
    stim[27] = 15'h5282;
    stim[28] = 15'h603b;
    stim[29] = 15'h5e75;
    stim[30] = 15'h4d64;
    stim[31] = 15'h44a6;
    stim[32] = 15'h62be;
    stim[33] = 15'h573c;
    stim[34] = 15'h415e;
    stim[35] = 15'h7b5a;
    stim[36] = 15'h52f6;
    stim[37] = 15'h63f9;
    stim[38] = 15'h6569;
    stim[39] = 15'h611f;
    stim[40] = 15'h7c1f;
    stim[41] = 15'h72c4;
    stim[42] = 15'h457f;
    stim[43] = 15'h6389;
    stim[44] = 15'h5b34;
    stim[45] = 15'h5c3a;
    stim[46] = 15'h7dff;
    stim[47] = 15'h44d1;
    stim[48] = 15'h7aaa;
    stim[49] = 15'h571f;
    stim[50] = 15'h7dfe;
    stim[51] = 15'h76df;
    stim[52] = 15'h4b96;
    stim[53] = 15'h5d77;
    stim[54] = 15'h1fd5;
    stim[55] = 15'h6cb2;
    stim[56] = 15'h7180;
    stim[57] = 15'h7ed7;
    stim[58] = 15'h5e7d;
    stim[59] = 15'h772b;
    stim[60] = 15'h7d67;
    stim[61] = 15'h6690;
    stim[62] = 15'h7161;
    stim[63] = 15'h7352;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h070e7;
      expv[4] = 17'h070e4;
      expv[5] = 17'h075bc;
      expv[6] = 17'h07b8d;
      expv[7] = 17'h07f8d;
      expv[8] = 17'h07395;
      expv[9] = 17'h12a55;
      expv[10] = 17'h1288b;
      expv[11] = 17'h0dc8b;
      expv[12] = 17'h0dc8e;
      expv[13] = 17'h11e39;
      expv[14] = 17'h11ee5;
      expv[15] = 17'h01ee5;
      expv[16] = 17'h056e5;
      expv[17] = 17'h0aee2;
      expv[18] = 17'h1bf6c;
      expv[19] = 17'h14270;
      expv[20] = 17'h09110;
      expv[21] = 17'h11e2c;
      expv[22] = 17'h19332;
      expv[23] = 17'h19522;
      expv[24] = 17'h14a9a;
      expv[25] = 17'h1ba9a;
      expv[26] = 17'h1223a;
      expv[27] = 17'h12372;
      expv[28] = 17'h14f72;
      expv[29] = 17'h1437a;
      expv[30] = 17'h13a8d;
      expv[31] = 17'h1397c;
      expv[32] = 17'h1397e;
      expv[33] = 17'h13d7e;
      expv[34] = 17'h1a17c;
      expv[35] = 17'h1a17c;
      expv[36] = 17'h1b774;
      expv[37] = 17'h18374;
      expv[38] = 17'h18774;
      expv[39] = 17'h17b59;
      expv[40] = 17'h17f59;
      expv[41] = 17'h0141f;
      expv[42] = 17'h16c1f;
      expv[43] = 17'h16c1f;
      expv[44] = 17'h16027;
      expv[45] = 17'h19b3f;
      expv[46] = 17'h01c42;
      expv[47] = 17'h10207;
      expv[48] = 17'h10201;
      expv[49] = 17'h15eb1;
      expv[50] = 17'h196b7;
      expv[51] = 17'h10a06;
      expv[52] = 17'h16e0f;
      expv[53] = 17'h16fa7;
      expv[54] = 17'h0b987;
      expv[55] = 17'h00000;
      expv[56] = 17'h004b2;
      expv[57] = 17'h0c8b2;
      expv[58] = 17'h176d7;
      expv[59] = 17'h14a7d;
      expv[60] = 17'h19683;
      expv[61] = 17'h0b56f;
      expv[62] = 17'h0b968;
      expv[63] = 17'h0bd68;
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
