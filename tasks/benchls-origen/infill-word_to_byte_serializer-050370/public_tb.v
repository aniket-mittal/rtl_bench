// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050370 dut (
    .ClkEngress(clk),
    .ARst(in_vec[33:33]),
    .WriteData(in_vec[32:1]),
    .WriteDataValid(in_vec[0:0]),
    .Data(out_vec[9:2]),
    .DataValid(out_vec[1:1]),
    .Ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h325b0b13e;
    stim[1] = 34'h2f26b700c;
    stim[2] = 34'h0413a3d54;
    stim[3] = 34'h0a53dde1c;
    stim[4] = 34'h081504370;
    stim[5] = 34'h0fcff653a;
    stim[6] = 34'h180a3d223;
    stim[7] = 34'h132ac0121;
    stim[8] = 34'h066bfe210;
    stim[9] = 34'h0586a1a82;
    stim[10] = 34'h1d37fd800;
    stim[11] = 34'h053b4f94e;
    stim[12] = 34'h1c11bccca;
    stim[13] = 34'h1343ae30e;
    stim[14] = 34'h18aa2889e;
    stim[15] = 34'h138de6867;
    stim[16] = 34'h01bb23fe6;
    stim[17] = 34'h1e0cf04e2;
    stim[18] = 34'h105701138;
    stim[19] = 34'h0f796d4ad;
    stim[20] = 34'h139de4239;
    stim[21] = 34'h1118185a7;
    stim[22] = 34'h1433aa7c1;
    stim[23] = 34'h1f26f4aba;
    stim[24] = 34'h03144aa72;
    stim[25] = 34'h0be60c2bd;
    stim[26] = 34'h1442443d2;
    stim[27] = 34'h01f6412a2;
    stim[28] = 34'h1ba080f57;
    stim[29] = 34'h16a4622f5;
    stim[30] = 34'h144a39152;
    stim[31] = 34'h03ddd326c;
    stim[32] = 34'h1bfd6c42a;
    stim[33] = 34'h148a53968;
    stim[34] = 34'h1bbb96280;
    stim[35] = 34'h10ca485be;
    stim[36] = 34'h122b04f71;
    stim[37] = 34'h0e7d36203;
    stim[38] = 34'h29ff4de67;
    stim[39] = 34'h0d1efd392;
    stim[40] = 34'h0a40e0386;
    stim[41] = 34'h1e57b88f6;
    stim[42] = 34'h15017f8c6;
    stim[43] = 34'h1fb9a45e4;
    stim[44] = 34'h049bb89cc;
    stim[45] = 34'h1a4175645;
    stim[46] = 34'h05b686239;
    stim[47] = 34'h147023820;
    stim[48] = 34'h0f77b6731;
    stim[49] = 34'h11460b4a4;
    stim[50] = 34'h125b16ed8;
    stim[51] = 34'h15bd77a51;
    stim[52] = 34'h0fd8cce08;
    stim[53] = 34'h1f83d69fd;
    stim[54] = 34'h00dbd41b1;
    stim[55] = 34'h084cc87f7;
    stim[56] = 34'h1fc3b4a3f;
    stim[57] = 34'h124985569;
    stim[58] = 34'h01933ab96;
    stim[59] = 34'h1d5e60ec6;
    stim[60] = 34'h06354d758;
    stim[61] = 34'h1cdee0266;
    stim[62] = 34'h1509af90a;
    stim[63] = 34'h1739cb3ce;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'h046;
      expv[9] = 10'h3a6;
      expv[10] = 10'h147;
      expv[11] = 10'h301;
      expv[12] = 10'h301;
      expv[13] = 10'h301;
      expv[14] = 10'h301;
      expv[15] = 10'h301;
      expv[16] = 10'h302;
      expv[17] = 10'h0ce;
      expv[18] = 10'h0d2;
      expv[19] = 10'h1bf;
      expv[20] = 10'h1be;
      expv[21] = 10'h15a;
      expv[22] = 10'h1aa;
      expv[23] = 10'h32f;
      expv[24] = 10'h1ed;
      expv[25] = 10'h1ed;
      expv[26] = 10'h1ee;
      expv[27] = 10'h17a;
      expv[28] = 10'h186;
      expv[29] = 10'h0c3;
      expv[30] = 10'h0c2;
      expv[31] = 10'h1ea;
      expv[32] = 10'h046;
      expv[33] = 10'h08f;
      expv[34] = 10'h2d5;
      expv[35] = 10'h2d5;
      expv[36] = 10'h2d5;
      expv[37] = 10'h2d6;
      expv[38] = 10'h2e1;
      expv[39] = 10'h2e1;
      expv[40] = 10'h2e1;
      expv[41] = 10'h2e1;
      expv[42] = 10'h2e1;
      expv[43] = 10'h2e1;
      expv[44] = 10'h2e1;
      expv[45] = 10'h2e1;
      expv[46] = 10'h2e2;
      expv[47] = 10'h08a;
      expv[48] = 10'h2ae;
      expv[49] = 10'h02f;
      expv[50] = 10'h349;
      expv[51] = 10'h349;
      expv[52] = 10'h34a;
      expv[53] = 10'h0a2;
      expv[54] = 10'h2f6;
      expv[55] = 10'h3af;
      expv[56] = 10'h3ae;
      expv[57] = 10'h3ee;
      expv[58] = 10'h10e;
      expv[59] = 10'h19b;
      expv[60] = 10'h109;
      expv[61] = 10'h109;
      expv[62] = 10'h109;
      expv[63] = 10'h109;
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
