// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011885 dut (
    .sysClk(clk),
    .sysRst(in_vec[10:10]),
    .in_data(in_vec[9:2]),
    .in_data_valid(in_vec[1:1]),
    .out_data_ready(in_vec[0:0]),
    .in_data_ready(out_vec[22:22]),
    .out_data(out_vec[21:14]),
    .out_data_valid(out_vec[13:13]),
    .fillLevel(out_vec[12:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6e1;
    stim[1] = 11'h697;
    stim[2] = 11'h08c;
    stim[3] = 11'h264;
    stim[4] = 11'h0d3;
    stim[5] = 11'h0a6;
    stim[6] = 11'h2e2;
    stim[7] = 11'h3a9;
    stim[8] = 11'h016;
    stim[9] = 11'h274;
    stim[10] = 11'h1be;
    stim[11] = 11'h01e;
    stim[12] = 11'h139;
    stim[13] = 11'h228;
    stim[14] = 11'h138;
    stim[15] = 11'h01c;
    stim[16] = 11'h2fa;
    stim[17] = 11'h7a6;
    stim[18] = 11'h1bc;
    stim[19] = 11'h039;
    stim[20] = 11'h19d;
    stim[21] = 11'h284;
    stim[22] = 11'h012;
    stim[23] = 11'h004;
    stim[24] = 11'h062;
    stim[25] = 11'h120;
    stim[26] = 11'h078;
    stim[27] = 11'h007;
    stim[28] = 11'h28a;
    stim[29] = 11'h3c9;
    stim[30] = 11'h097;
    stim[31] = 11'h376;
    stim[32] = 11'h232;
    stim[33] = 11'h160;
    stim[34] = 11'h3c7;
    stim[35] = 11'h29f;
    stim[36] = 11'h30b;
    stim[37] = 11'h282;
    stim[38] = 11'h168;
    stim[39] = 11'h3df;
    stim[40] = 11'h3ec;
    stim[41] = 11'h282;
    stim[42] = 11'h15e;
    stim[43] = 11'h128;
    stim[44] = 11'h15a;
    stim[45] = 11'h04c;
    stim[46] = 11'h00f;
    stim[47] = 11'h188;
    stim[48] = 11'h226;
    stim[49] = 11'h299;
    stim[50] = 11'h3ac;
    stim[51] = 11'h185;
    stim[52] = 11'h3b2;
    stim[53] = 11'h3e1;
    stim[54] = 11'h2fa;
    stim[55] = 11'h262;
    stim[56] = 11'h26e;
    stim[57] = 11'h04a;
    stim[58] = 11'h1c8;
    stim[59] = 11'h038;
    stim[60] = 11'h373;
    stim[61] = 11'h23c;
    stim[62] = 11'h187;
    stim[63] = 11'h033;
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
      expv[0] = 23'hxxx001;
      expv[1] = 23'hxxx001;
      expv[2] = 23'hxxx001;
      expv[3] = 23'hxxx001;
      expv[4] = 23'hxxx001;
      expv[5] = 23'hxxx004;
      expv[6] = 23'hxxx008;
      expv[7] = 23'hxxx00c;
      expv[8] = 23'hxxx00c;
      expv[9] = 23'hxxx010;
      expv[10] = 23'hxxx010;
      expv[11] = 23'hxxx014;
      expv[12] = 23'hxxx018;
      expv[13] = 23'hxxx018;
      expv[14] = 23'hxxx018;
      expv[15] = 23'hxxx018;
      expv[16] = 23'hxxx018;
      expv[17] = 23'hxxx001;
      expv[18] = 23'hxxx001;
      expv[19] = 23'hxxx001;
      expv[20] = 23'hxxx001;
      expv[21] = 23'hxxx001;
      expv[22] = 23'hxxx001;
      expv[23] = 23'hxxx004;
      expv[24] = 23'hxxx004;
      expv[25] = 23'hxxx008;
      expv[26] = 23'hxxx008;
      expv[27] = 23'hxxx008;
      expv[28] = 23'h410004;
      expv[29] = 23'h410008;
      expv[30] = 23'h412008;
      expv[31] = 23'h460004;
      expv[32] = 23'h460008;
      expv[33] = 23'h46000c;
      expv[34] = 23'h46200c;
      expv[35] = 23'h404008;
      expv[36] = 23'h40400c;
      expv[37] = 23'h404010;
      expv[38] = 23'h404014;
      expv[39] = 23'h406014;
      expv[40] = 23'h688010;
      expv[41] = 23'h68a010;
      expv[42] = 23'h688014;
      expv[43] = 23'h688018;
      expv[44] = 23'h68a018;
      expv[45] = 23'h68801c;
      expv[46] = 23'h68a01c;
      expv[47] = 23'h494018;
      expv[48] = 23'h496018;
      expv[49] = 23'h49401c;
      expv[50] = 23'h49601c;
      expv[51] = 23'h49601c;
      expv[52] = 23'h776018;
      expv[53] = 23'h77401c;
      expv[54] = 23'h77601c;
      expv[55] = 23'h774020;
      expv[56] = 23'h774024;
      expv[57] = 23'h774028;
      expv[58] = 23'h77402c;
      expv[59] = 23'h77602c;
      expv[60] = 23'h77602c;
      expv[61] = 23'h630028;
      expv[62] = 23'h632028;
      expv[63] = 23'h7c4024;
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
