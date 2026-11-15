// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07927 dut (
    .clk(clk),
    .reset_(in_vec[28:28]),
    .digit_0(in_vec[27:21]),
    .digit_1(in_vec[20:14]),
    .digit_2(in_vec[13:7]),
    .digit_3(in_vec[6:0]),
    .segment_(out_vec[10:4]),
    .digit_enable_(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h11c746fb;
    stim[1] = 29'h1921ebb1;
    stim[2] = 29'h09a85e66;
    stim[3] = 29'h05318f5a;
    stim[4] = 29'h0653bbf2;
    stim[5] = 29'h09d87fbf;
    stim[6] = 29'h01d6ec0c;
    stim[7] = 29'h074cc0b4;
    stim[8] = 29'h0f3cfe14;
    stim[9] = 29'h0ed01be9;
    stim[10] = 29'h0d92b396;
    stim[11] = 29'h077cc4d5;
    stim[12] = 29'h023a153f;
    stim[13] = 29'h09d751cc;
    stim[14] = 29'h04dbb10f;
    stim[15] = 29'h0e6cb9c6;
    stim[16] = 29'h13789a47;
    stim[17] = 29'h071806a2;
    stim[18] = 29'h060725fd;
    stim[19] = 29'h03927275;
    stim[20] = 29'h05b471ac;
    stim[21] = 29'h02cc2c38;
    stim[22] = 29'h0bc88e16;
    stim[23] = 29'h00d1fe5a;
    stim[24] = 29'h04985201;
    stim[25] = 29'h0212dc6a;
    stim[26] = 29'h0271e262;
    stim[27] = 29'h0e7540b7;
    stim[28] = 29'h0940fe3a;
    stim[29] = 29'h0f30378a;
    stim[30] = 29'h0fa45586;
    stim[31] = 29'h08c28a3d;
    stim[32] = 29'h0f8c76fc;
    stim[33] = 29'h0948f292;
    stim[34] = 29'h038707c8;
    stim[35] = 29'h0986e87e;
    stim[36] = 29'h075c5a7d;
    stim[37] = 29'h0a4f7917;
    stim[38] = 29'h0f68878a;
    stim[39] = 29'h02f2e3fa;
    stim[40] = 29'h0f5b068c;
    stim[41] = 29'h0e3093ac;
    stim[42] = 29'h0adc98ed;
    stim[43] = 29'h00778600;
    stim[44] = 29'h0d4ac689;
    stim[45] = 29'h0a1dfafb;
    stim[46] = 29'h07757b4e;
    stim[47] = 29'h0451df6b;
    stim[48] = 29'h02590274;
    stim[49] = 29'h0a3acaaa;
    stim[50] = 29'h0e9f2aa4;
    stim[51] = 29'h04dd0eba;
    stim[52] = 29'h0eb17570;
    stim[53] = 29'h022151ce;
    stim[54] = 29'h054ec2f8;
    stim[55] = 29'h090798cf;
    stim[56] = 29'h089ade7a;
    stim[57] = 29'h04fa7ace;
    stim[58] = 29'h05c41b29;
    stim[59] = 29'h0cb1f384;
    stim[60] = 29'h05ab35c2;
    stim[61] = 29'h0dfa8b10;
    stim[62] = 29'h00ec9e21;
    stim[63] = 29'h1a31b13f;
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
      expv[0] = 11'h04f;
      expv[1] = 11'h4ef;
      expv[2] = 11'h19f;
      expv[3] = 11'h25f;
      expv[4] = 11'h0df;
      expv[5] = 11'h40f;
      expv[6] = 11'h73f;
      expv[7] = 11'h4bf;
      expv[8] = 11'h6bf;
      expv[9] = 11'h16f;
      expv[10] = 11'h69f;
      expv[11] = 11'h2af;
      expv[12] = 11'h40f;
      expv[13] = 11'h33f;
      expv[14] = 11'h70f;
      expv[15] = 11'h39f;
      expv[16] = 11'h38f;
      expv[17] = 11'h5df;
      expv[18] = 11'h02f;
      expv[19] = 11'h0af;
      expv[20] = 11'h53f;
      expv[21] = 11'h47f;
      expv[22] = 11'h69f;
      expv[23] = 11'h25f;
      expv[24] = 11'h7ef;
      expv[25] = 11'h15f;
      expv[26] = 11'h1df;
      expv[27] = 11'h48f;
      expv[28] = 11'h45f;
      expv[29] = 11'h75f;
      expv[30] = 11'h79f;
      expv[31] = 11'h42f;
      expv[32] = 11'h03f;
      expv[33] = 11'h6df;
      expv[34] = 11'h37f;
      expv[35] = 11'h01f;
      expv[36] = 11'h02f;
      expv[37] = 11'h68f;
      expv[38] = 11'h75f;
      expv[39] = 11'h05f;
      expv[40] = 11'h73f;
      expv[41] = 11'h53f;
      expv[42] = 11'h12f;
      expv[43] = 11'h7ff;
      expv[44] = 11'h76f;
      expv[45] = 11'h04f;
      expv[46] = 11'h31f;
      expv[47] = 11'h14f;
      expv[48] = 11'h0bf;
      expv[49] = 11'h55f;
      expv[50] = 11'h5bf;
      expv[51] = 11'h45f;
      expv[52] = 11'h0ff;
      expv[53] = 11'h31f;
      expv[54] = 11'h07f;
      expv[55] = 11'h30f;
      expv[56] = 11'h05f;
      expv[57] = 11'h31f;
      expv[58] = 11'h56f;
      expv[59] = 11'h7bf;
      expv[60] = 11'h3df;
      expv[61] = 11'h6ff;
      expv[62] = 11'h5ef;
      expv[63] = 11'h40f;
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
