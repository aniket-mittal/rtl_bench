// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220753 dut (
    .clk(clk),
    .reset(in_vec[24:24]),
    .left(in_vec[23:23]),
    .right(in_vec[22:22]),
    .hPos(in_vec[21:11]),
    .vPos(in_vec[10:0]),
    .gunPosition(out_vec[18:8]),
    .color(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1e6b87a;
    stim[1] = 25'h11fa4a1;
    stim[2] = 25'h0e460ed;
    stim[3] = 25'h098ce26;
    stim[4] = 25'h0088e0a;
    stim[5] = 25'h1738dd0;
    stim[6] = 25'h0f0b0a4;
    stim[7] = 25'h04a620a;
    stim[8] = 25'h0cce93d;
    stim[9] = 25'h0ebbdd4;
    stim[10] = 25'h091e8f0;
    stim[11] = 25'h0a8f165;
    stim[12] = 25'h0ed4fed;
    stim[13] = 25'h0943b77;
    stim[14] = 25'h0e8c0f4;
    stim[15] = 25'h0e16e5f;
    stim[16] = 25'h0e91e3f;
    stim[17] = 25'h0d079c1;
    stim[18] = 25'h0cb70f6;
    stim[19] = 25'h0c0b592;
    stim[20] = 25'h0f3ad9e;
    stim[21] = 25'h0078ec1;
    stim[22] = 25'h00fa7df;
    stim[23] = 25'h017ffa9;
    stim[24] = 25'h06f48f3;
    stim[25] = 25'h07fa9d0;
    stim[26] = 25'h0b1dd82;
    stim[27] = 25'h0056fed;
    stim[28] = 25'h02eaa90;
    stim[29] = 25'h093dbfa;
    stim[30] = 25'h05a9ea3;
    stim[31] = 25'h0d3ca0e;
    stim[32] = 25'h0048fe2;
    stim[33] = 25'h030f114;
    stim[34] = 25'h04fc238;
    stim[35] = 25'h063a36d;
    stim[36] = 25'h091cfbe;
    stim[37] = 25'h05bbb7c;
    stim[38] = 25'h08d1e70;
    stim[39] = 25'h097231c;
    stim[40] = 25'h0a6a594;
    stim[41] = 25'h04e8eea;
    stim[42] = 25'h0ad9c4c;
    stim[43] = 25'h0c52368;
    stim[44] = 25'h07983ee;
    stim[45] = 25'h08d46a0;
    stim[46] = 25'h05a7677;
    stim[47] = 25'h0e2e2ef;
    stim[48] = 25'h087befd;
    stim[49] = 25'h061da76;
    stim[50] = 25'h06965f4;
    stim[51] = 25'h0f3e014;
    stim[52] = 25'h0d38f86;
    stim[53] = 25'h02ec973;
    stim[54] = 25'h0adc25f;
    stim[55] = 25'h0b2ac6e;
    stim[56] = 25'h0a1e535;
    stim[57] = 25'h0898b5c;
    stim[58] = 25'h06e9d21;
    stim[59] = 25'h04f1d54;
    stim[60] = 25'h094aaa4;
    stim[61] = 25'h01993eb;
    stim[62] = 25'h0da7254;
    stim[63] = 25'h0a9534b;
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
      expv[0] = 19'hxxx00;
      expv[1] = 19'h14000;
      expv[2] = 19'h14000;
      expv[3] = 19'h14500;
      expv[4] = 19'h14000;
      expv[5] = 19'h14000;
      expv[6] = 19'h14000;
      expv[7] = 19'h14500;
      expv[8] = 19'h14a00;
      expv[9] = 19'h14f00;
      expv[10] = 19'h15400;
      expv[11] = 19'h14f00;
      expv[12] = 19'h14a00;
      expv[13] = 19'h14f00;
      expv[14] = 19'h14a00;
      expv[15] = 19'h14f00;
      expv[16] = 19'h15400;
      expv[17] = 19'h15900;
      expv[18] = 19'h15e00;
      expv[19] = 19'h16300;
      expv[20] = 19'h16800;
      expv[21] = 19'h16d00;
      expv[22] = 19'h16d00;
      expv[23] = 19'h16d00;
      expv[24] = 19'h16d00;
      expv[25] = 19'h17200;
      expv[26] = 19'h17700;
      expv[27] = 19'h17200;
      expv[28] = 19'h17200;
      expv[29] = 19'h17200;
      expv[30] = 19'h16d00;
      expv[31] = 19'h17200;
      expv[32] = 19'h17700;
      expv[33] = 19'h17700;
      expv[34] = 19'h17700;
      expv[35] = 19'h17c00;
      expv[36] = 19'h18100;
      expv[37] = 19'h17c00;
      expv[38] = 19'h18100;
      expv[39] = 19'h17c00;
      expv[40] = 19'h17700;
      expv[41] = 19'h17200;
      expv[42] = 19'h17700;
      expv[43] = 19'h17200;
      expv[44] = 19'h17700;
      expv[45] = 19'h17c00;
      expv[46] = 19'h17700;
      expv[47] = 19'h17c00;
      expv[48] = 19'h18100;
      expv[49] = 19'h17c00;
      expv[50] = 19'h18100;
      expv[51] = 19'h18600;
      expv[52] = 19'h18b00;
      expv[53] = 19'h19000;
      expv[54] = 19'h19000;
      expv[55] = 19'h18b00;
      expv[56] = 19'h18600;
      expv[57] = 19'h18100;
      expv[58] = 19'h17c00;
      expv[59] = 19'h18100;
      expv[60] = 19'h18600;
      expv[61] = 19'h18100;
      expv[62] = 19'h18100;
      expv[63] = 19'h18600;
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
