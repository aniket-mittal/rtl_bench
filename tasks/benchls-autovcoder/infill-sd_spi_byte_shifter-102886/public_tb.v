// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_102886 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sd_miso(in_vec[17:17]),
    .clk_div(in_vec[16:9]),
    .send_dat(in_vec[8:1]),
    .go(in_vec[0:0]),
    .sd_clk(out_vec[10:10]),
    .sd_mosi(out_vec[9:9]),
    .rcv_dat(out_vec[8:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h76864;
    stim[1] = 19'h69b66;
    stim[2] = 19'h32dce;
    stim[3] = 19'h26744;
    stim[4] = 19'h3a5e5;
    stim[5] = 19'h06cfb;
    stim[6] = 19'h2eee3;
    stim[7] = 19'h32dce;
    stim[8] = 19'h1efaf;
    stim[9] = 19'h00f17;
    stim[10] = 19'h0adbe;
    stim[11] = 19'h23892;
    stim[12] = 19'h1d7d4;
    stim[13] = 19'h05023;
    stim[14] = 19'h2b9f4;
    stim[15] = 19'h0bb00;
    stim[16] = 19'h3c9de;
    stim[17] = 19'h0225f;
    stim[18] = 19'h146c2;
    stim[19] = 19'h005f6;
    stim[20] = 19'h1d730;
    stim[21] = 19'h1ee89;
    stim[22] = 19'h133e1;
    stim[23] = 19'h15b34;
    stim[24] = 19'h19630;
    stim[25] = 19'h06bb3;
    stim[26] = 19'h098e4;
    stim[27] = 19'h37c32;
    stim[28] = 19'h10ea6;
    stim[29] = 19'h5c27a;
    stim[30] = 19'h07960;
    stim[31] = 19'h34b18;
    stim[32] = 19'h32b08;
    stim[33] = 19'h3a448;
    stim[34] = 19'h7ef22;
    stim[35] = 19'h2ce55;
    stim[36] = 19'h16f78;
    stim[37] = 19'h0eac3;
    stim[38] = 19'h01fea;
    stim[39] = 19'h14e55;
    stim[40] = 19'h0d94f;
    stim[41] = 19'h0748d;
    stim[42] = 19'h395ba;
    stim[43] = 19'h228c6;
    stim[44] = 19'h27a3e;
    stim[45] = 19'h11845;
    stim[46] = 19'h31d22;
    stim[47] = 19'h361c4;
    stim[48] = 19'h0fa03;
    stim[49] = 19'h11ec7;
    stim[50] = 19'h15382;
    stim[51] = 19'h30a0e;
    stim[52] = 19'h07300;
    stim[53] = 19'h204a9;
    stim[54] = 19'h194e1;
    stim[55] = 19'h3c0c3;
    stim[56] = 19'h071ba;
    stim[57] = 19'h11c88;
    stim[58] = 19'h2d3f5;
    stim[59] = 19'h1ba2e;
    stim[60] = 19'h2cec2;
    stim[61] = 19'h17c8c;
    stim[62] = 19'h2e7c8;
    stim[63] = 19'h0bcb0;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'h3e4;
      expv[6] = 11'h0fa;
      expv[7] = 11'h0e2;
      expv[8] = 11'h0e2;
      expv[9] = 11'h3ae;
      expv[10] = 11'h316;
      expv[11] = 11'h316;
      expv[12] = 11'h316;
      expv[13] = 11'h316;
      expv[14] = 11'h022;
      expv[15] = 11'h022;
      expv[16] = 11'h022;
      expv[17] = 11'h022;
      expv[18] = 11'h05e;
      expv[19] = 11'h05e;
      expv[20] = 11'h05e;
      expv[21] = 11'h05e;
      expv[22] = 11'h088;
      expv[23] = 11'h3e0;
      expv[24] = 11'h3e0;
      expv[25] = 11'h3e0;
      expv[26] = 11'h3b2;
      expv[27] = 11'h3b2;
      expv[28] = 11'h3b2;
      expv[29] = 11'h3b2;
      expv[30] = 11'h3b3;
      expv[31] = 11'h3b3;
      expv[32] = 11'h3b3;
      expv[33] = 11'h3b3;
      expv[34] = 11'h3b3;
      expv[35] = 11'h3b3;
      expv[36] = 11'h054;
      expv[37] = 11'h054;
      expv[38] = 11'h0c2;
      expv[39] = 11'h0c2;
      expv[40] = 11'h054;
      expv[41] = 11'h34e;
      expv[42] = 11'h08c;
      expv[43] = 11'h08c;
      expv[44] = 11'h08c;
      expv[45] = 11'h08c;
      expv[46] = 11'h044;
      expv[47] = 11'h044;
      expv[48] = 11'h044;
      expv[49] = 11'h002;
      expv[50] = 11'h0c6;
      expv[51] = 11'h0c6;
      expv[52] = 11'h0c6;
      expv[53] = 11'h0c6;
      expv[54] = 11'h0a8;
      expv[55] = 11'h0e0;
      expv[56] = 11'h0c2;
      expv[57] = 11'h0c2;
      expv[58] = 11'h0c2;
      expv[59] = 11'h3f4;
      expv[60] = 11'h3f4;
      expv[61] = 11'h3f4;
      expv[62] = 11'h3f4;
      expv[63] = 11'h3f4;
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
