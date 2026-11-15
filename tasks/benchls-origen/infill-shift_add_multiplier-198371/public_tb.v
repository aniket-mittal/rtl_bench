// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198371 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .mul(in_vec[16:16]),
    .x(in_vec[15:8]),
    .y(in_vec[7:0]),
    .z_pos(out_vec[16:1]),
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
    stim[0] = 18'h2c7e0;
    stim[1] = 18'h3d7e7;
    stim[2] = 18'h0877c;
    stim[3] = 18'h11794;
    stim[4] = 18'h0ac83;
    stim[5] = 18'h06667;
    stim[6] = 18'h1cd07;
    stim[7] = 18'h19396;
    stim[8] = 18'h067a3;
    stim[9] = 18'h18085;
    stim[10] = 18'h31dec;
    stim[11] = 18'h06930;
    stim[12] = 18'h06ad4;
    stim[13] = 18'h172f6;
    stim[14] = 18'h1fee3;
    stim[15] = 18'h110a6;
    stim[16] = 18'h067cc;
    stim[17] = 18'h1a9ad;
    stim[18] = 18'h134ca;
    stim[19] = 18'h2947f;
    stim[20] = 18'h13606;
    stim[21] = 18'h13950;
    stim[22] = 18'h105d1;
    stim[23] = 18'h043d0;
    stim[24] = 18'h1974b;
    stim[25] = 18'h3c4e7;
    stim[26] = 18'h0098a;
    stim[27] = 18'h09075;
    stim[28] = 18'h1f979;
    stim[29] = 18'h0a698;
    stim[30] = 18'h1a664;
    stim[31] = 18'h15a5a;
    stim[32] = 18'h02fa4;
    stim[33] = 18'h19f27;
    stim[34] = 18'h0ba9a;
    stim[35] = 18'h11ae0;
    stim[36] = 18'h00249;
    stim[37] = 18'h0af04;
    stim[38] = 18'h09c58;
    stim[39] = 18'h055aa;
    stim[40] = 18'h1dca1;
    stim[41] = 18'h0d3b4;
    stim[42] = 18'h0cfa2;
    stim[43] = 18'h1b8f0;
    stim[44] = 18'h18dda;
    stim[45] = 18'h179cc;
    stim[46] = 18'h07dad;
    stim[47] = 18'h0bab6;
    stim[48] = 18'h06a53;
    stim[49] = 18'h11ad8;
    stim[50] = 18'h186b0;
    stim[51] = 18'h1cbc4;
    stim[52] = 18'h01117;
    stim[53] = 18'h1827a;
    stim[54] = 18'h19e95;
    stim[55] = 18'h04f55;
    stim[56] = 18'h0b96c;
    stim[57] = 18'h03fae;
    stim[58] = 18'h19060;
    stim[59] = 18'h1c0bd;
    stim[60] = 18'h103bf;
    stim[61] = 18'h13b30;
    stim[62] = 18'h1b013;
    stim[63] = 18'h13c40;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h0010e;
      expv[4] = 17'h0046e;
      expv[5] = 17'h0046e;
      expv[6] = 17'h0046e;
      expv[7] = 17'h00236;
      expv[8] = 17'h006c6;
      expv[9] = 17'h006c6;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h000d2;
      expv[13] = 17'h000d2;
      expv[14] = 17'h0057e;
      expv[15] = 17'h002be;
      expv[16] = 17'h00816;
      expv[17] = 17'h00816;
      expv[18] = 17'h0040a;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00012;
      expv[28] = 17'h00012;
      expv[29] = 17'h00008;
      expv[30] = 17'h00008;
      expv[31] = 17'h00008;
      expv[32] = 17'h00004;
      expv[33] = 17'h00004;
      expv[34] = 17'h00004;
      expv[35] = 17'h00004;
      expv[36] = 17'h00002;
      expv[37] = 17'h00002;
      expv[38] = 17'h00002;
      expv[39] = 17'h00002;
      expv[40] = 17'h00002;
      expv[41] = 17'h0028a;
      expv[42] = 17'h0028a;
      expv[43] = 17'h0028a;
      expv[44] = 17'h00144;
      expv[45] = 17'h00144;
      expv[46] = 17'h000a2;
      expv[47] = 17'h000a2;
      expv[48] = 17'h000a2;
      expv[49] = 17'h000a2;
      expv[50] = 17'h004a6;
      expv[51] = 17'h00252;
      expv[52] = 17'h007b6;
      expv[53] = 17'h007b6;
      expv[54] = 17'h003da;
      expv[55] = 17'h00a0a;
      expv[56] = 17'h00a0a;
      expv[57] = 17'h00a0a;
      expv[58] = 17'h00a0a;
      expv[59] = 17'h00504;
      expv[60] = 17'h00505;
      expv[61] = 17'h00505;
      expv[62] = 17'h00505;
      expv[63] = 17'h00505;
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
