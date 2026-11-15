// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_013455 dut (
    .CC3200_SPI_CLK(clk),
    .CC3200_SPI_CS(in_vec[10:10]),
    .CC3200_SPI_DOUT(in_vec[9:9]),
    .Envelop(in_vec[8:8]),
    .Trans_Data(in_vec[7:0]),
    .CC3200_SPI_DIN(out_vec[26:26]),
    .Enable(out_vec[25:25]),
    .Line_Num(out_vec[24:17]),
    .Zoom(out_vec[16:15]),
    .Gain(out_vec[14:9]),
    .Trans_Addr(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h35a;
    stim[1] = 11'h14e;
    stim[2] = 11'h6a0;
    stim[3] = 11'h0db;
    stim[4] = 11'h4ec;
    stim[5] = 11'h2ce;
    stim[6] = 11'h265;
    stim[7] = 11'h6ce;
    stim[8] = 11'h020;
    stim[9] = 11'h0cc;
    stim[10] = 11'h6e5;
    stim[11] = 11'h653;
    stim[12] = 11'h619;
    stim[13] = 11'h044;
    stim[14] = 11'h085;
    stim[15] = 11'h6c9;
    stim[16] = 11'h2fa;
    stim[17] = 11'h039;
    stim[18] = 11'h09c;
    stim[19] = 11'h004;
    stim[20] = 11'h450;
    stim[21] = 11'h207;
    stim[22] = 11'h622;
    stim[23] = 11'h0ab;
    stim[24] = 11'h68c;
    stim[25] = 11'h023;
    stim[26] = 11'h0a6;
    stim[27] = 11'h058;
    stim[28] = 11'h177;
    stim[29] = 11'h2d9;
    stim[30] = 11'h22e;
    stim[31] = 11'h48c;
    stim[32] = 11'h0d9;
    stim[33] = 11'h2f5;
    stim[34] = 11'h088;
    stim[35] = 11'h025;
    stim[36] = 11'h015;
    stim[37] = 11'h4e2;
    stim[38] = 11'h289;
    stim[39] = 11'h686;
    stim[40] = 11'h24c;
    stim[41] = 11'h035;
    stim[42] = 11'h090;
    stim[43] = 11'h0ce;
    stim[44] = 11'h2c8;
    stim[45] = 11'h0be;
    stim[46] = 11'h6a8;
    stim[47] = 11'h05c;
    stim[48] = 11'h6c5;
    stim[49] = 11'h658;
    stim[50] = 11'h49e;
    stim[51] = 11'h1e7;
    stim[52] = 11'h2f6;
    stim[53] = 11'h210;
    stim[54] = 11'h520;
    stim[55] = 11'h215;
    stim[56] = 11'h02b;
    stim[57] = 11'h4ee;
    stim[58] = 11'h2e1;
    stim[59] = 11'h286;
    stim[60] = 11'h231;
    stim[61] = 11'h6c3;
    stim[62] = 11'h251;
    stim[63] = 11'h3b1;
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
      expv[0] = 27'hxxxxx00;
      expv[1] = 27'hxxxxx00;
      expv[2] = 27'hxxxxx01;
      expv[3] = 27'hxxxxx01;
      expv[4] = 27'hxxxxx02;
      expv[5] = 27'hxxxxx02;
      expv[6] = 27'hxxxxx02;
      expv[7] = 27'hxxxxx03;
      expv[8] = 27'hxxxxx03;
      expv[9] = 27'hxxxxx03;
      expv[10] = 27'hxxxxx04;
      expv[11] = 27'hxxxxx04;
      expv[12] = 27'hxxxxx04;
      expv[13] = 27'hxxxxx04;
      expv[14] = 27'hxxxxx04;
      expv[15] = 27'hxxxxx05;
      expv[16] = 27'hxbxxx05;
      expv[17] = 27'hxbxxx05;
      expv[18] = 27'hxbxxx05;
      expv[19] = 27'hxbxxx05;
      expv[20] = 27'hxbxxx06;
      expv[21] = 27'h37xxx06;
      expv[22] = 27'h17xxx07;
      expv[23] = 27'h2fxxx07;
      expv[24] = 27'h0fxxx08;
      expv[25] = 27'h7f7xx08;
      expv[26] = 27'h7f7xx08;
      expv[27] = 27'h7f7xx08;
      expv[28] = 27'h7f7xx00;
      expv[29] = 27'h7f7xx00;
      expv[30] = 27'h7f7xx00;
      expv[31] = 27'h5f7xx01;
      expv[32] = 27'h3ecxx01;
      expv[33] = 27'h3ecxx01;
      expv[34] = 27'h3ecxx01;
      expv[35] = 27'h3ecxx01;
      expv[36] = 27'h3ecxx01;
      expv[37] = 27'h1ecxx02;
      expv[38] = 27'h3d9xx02;
      expv[39] = 27'h1d9xx03;
      expv[40] = 27'h7b3xa03;
      expv[41] = 27'h7b3xa03;
      expv[42] = 27'h7b3xa03;
      expv[43] = 27'h7b3xa03;
      expv[44] = 27'h7b3xa03;
      expv[45] = 27'h7b3xa03;
      expv[46] = 27'h5b3xa04;
      expv[47] = 27'h767x604;
      expv[48] = 27'h567x605;
      expv[49] = 27'h167x605;
      expv[50] = 27'h567x605;
      expv[51] = 27'h33cbe00;
      expv[52] = 27'h33cbe00;
      expv[53] = 27'h33cbe00;
      expv[54] = 27'h13cbe00;
      expv[55] = 27'h279fc00;
      expv[56] = 27'h279fc00;
      expv[57] = 27'h079fc01;
      expv[58] = 27'h2f17a01;
      expv[59] = 27'h2f17a01;
      expv[60] = 27'h2f17a01;
      expv[61] = 27'h0f17a02;
      expv[62] = 27'h3e27602;
      expv[63] = 27'h3e27600;
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
