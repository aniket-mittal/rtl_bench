// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074521 dut (
    .clk(clk),
    .s_clk(in_vec[50:50]),
    .en(in_vec[49:49]),
    .on_sw(in_vec[48:48]),
    .shift_right(in_vec[47:47]),
    .shift_left(in_vec[46:46]),
    .shift_down(in_vec[45:45]),
    .orig_x(in_vec[44:34]),
    .orig_y(in_vec[33:23]),
    .pixel_x(in_vec[22:12]),
    .pixel_y(in_vec[11:1]),
    .shot_pixel(in_vec[0:0]),
    .ship_pixel(out_vec[1:1]),
    .line_crossed(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h06759bb172730;
    stim[1] = 51'h616de5d6eb43c;
    stim[2] = 51'h6d97328d2cba0;
    stim[3] = 51'h0d3a4abe8ba67;
    stim[4] = 51'h2877cd275db8b;
    stim[5] = 51'h69e258d7c11ea;
    stim[6] = 51'h33c68908ed17c;
    stim[7] = 51'h0f17b237a6c90;
    stim[8] = 51'h07e3c2f7a7d30;
    stim[9] = 51'h3108b09735637;
    stim[10] = 51'h6d694bbcf6c3a;
    stim[11] = 51'h068de1fd5210d;
    stim[12] = 51'h6a403826e3ad3;
    stim[13] = 51'h5c8d49a1c1659;
    stim[14] = 51'h6f5f641ac9954;
    stim[15] = 51'h74a4e07e3500b;
    stim[16] = 51'h5c46384863064;
    stim[17] = 51'h2259e307fc942;
    stim[18] = 51'h1c2b279a9df43;
    stim[19] = 51'h2fa81d8e75674;
    stim[20] = 51'h78ccfb973bc3a;
    stim[21] = 51'h603c2865a3e57;
    stim[22] = 51'h3fca9bd5c86bd;
    stim[23] = 51'h03f307a84f1d2;
    stim[24] = 51'h6c8c24fb2c1ae;
    stim[25] = 51'h733c34d57dc0b;
    stim[26] = 51'h6c97f2fe3c51c;
    stim[27] = 51'h77f07783e2524;
    stim[28] = 51'h3acfe5c68b8df;
    stim[29] = 51'h4313dd72e779d;
    stim[30] = 51'h45c46ef02e934;
    stim[31] = 51'h68cc99efeb8b2;
    stim[32] = 51'h1a2475178121f;
    stim[33] = 51'h14ff83595d2bb;
    stim[34] = 51'h2840a442fb7f4;
    stim[35] = 51'h0f56cb9f2a7b7;
    stim[36] = 51'h695cafdd63650;
    stim[37] = 51'h6e6010629e33d;
    stim[38] = 51'h78f233ad4ad2a;
    stim[39] = 51'h33c3a23088cf3;
    stim[40] = 51'h00fabfe4be693;
    stim[41] = 51'h4851e9c37f3b7;
    stim[42] = 51'h00c38f8754351;
    stim[43] = 51'h7acf6dd1acdc8;
    stim[44] = 51'h42024bad43559;
    stim[45] = 51'h2d4487c61fa1d;
    stim[46] = 51'h4b52acec9c225;
    stim[47] = 51'h55cb8cc662200;
    stim[48] = 51'h651747a9efa8c;
    stim[49] = 51'h464e9cad7110d;
    stim[50] = 51'h1d0ceb3fab473;
    stim[51] = 51'h7f5962722525c;
    stim[52] = 51'h261986712385d;
    stim[53] = 51'h16e0e7c092e4d;
    stim[54] = 51'h21f679a6acf1f;
    stim[55] = 51'h7d47cce55ae92;
    stim[56] = 51'h56a7d9ad2f213;
    stim[57] = 51'h3c75c932c8df7;
    stim[58] = 51'h0a38430e93e94;
    stim[59] = 51'h7474505cee857;
    stim[60] = 51'h7cc0028ebb865;
    stim[61] = 51'h3ad369d3a9963;
    stim[62] = 51'h3172cc5ab4937;
    stim[63] = 51'h654ba07e55443;
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
      expv[0] = 2'hx;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h0;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h0;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h0;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
