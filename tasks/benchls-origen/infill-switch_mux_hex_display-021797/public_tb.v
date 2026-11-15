// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_021797 dut (
    .sw(in_vec[9:0]),
    .led(out_vec[24:15]),
    .hex(out_vec[14:8]),
    .hex_on(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2ba;
    stim[1] = 10'h2ac;
    stim[2] = 10'h029;
    stim[3] = 10'h087;
    stim[4] = 10'h151;
    stim[5] = 10'h072;
    stim[6] = 10'h32a;
    stim[7] = 10'h1a3;
    stim[8] = 10'h0fa;
    stim[9] = 10'h118;
    stim[10] = 10'h07d;
    stim[11] = 10'h100;
    stim[12] = 10'h29c;
    stim[13] = 10'h209;
    stim[14] = 10'h074;
    stim[15] = 10'h369;
    stim[16] = 10'h267;
    stim[17] = 10'h044;
    stim[18] = 10'h07d;
    stim[19] = 10'h080;
    stim[20] = 10'h215;
    stim[21] = 10'h0c5;
    stim[22] = 10'h160;
    stim[23] = 10'h00e;
    stim[24] = 10'h130;
    stim[25] = 10'h06e;
    stim[26] = 10'h1a2;
    stim[27] = 10'h3cf;
    stim[28] = 10'h00c;
    stim[29] = 10'h09d;
    stim[30] = 10'h1e6;
    stim[31] = 10'h1dc;
    stim[32] = 10'h294;
    stim[33] = 10'h1b9;
    stim[34] = 10'h339;
    stim[35] = 10'h00a;
    stim[36] = 10'h095;
    stim[37] = 10'h0ca;
    stim[38] = 10'h195;
    stim[39] = 10'h384;
    stim[40] = 10'h080;
    stim[41] = 10'h22d;
    stim[42] = 10'h257;
    stim[43] = 10'h03a;
    stim[44] = 10'h144;
    stim[45] = 10'h122;
    stim[46] = 10'h33f;
    stim[47] = 10'h062;
    stim[48] = 10'h28b;
    stim[49] = 10'h11d;
    stim[50] = 10'h103;
    stim[51] = 10'h20f;
    stim[52] = 10'h0c7;
    stim[53] = 10'h041;
    stim[54] = 10'h2e8;
    stim[55] = 10'h3c9;
    stim[56] = 10'h212;
    stim[57] = 10'h282;
    stim[58] = 10'h3c0;
    stim[59] = 10'h38c;
    stim[60] = 10'h25d;
    stim[61] = 10'h26a;
    stim[62] = 10'h2c1;
    stim[63] = 10'h220;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 25'h15d79fe;
      expv[1] = 25'h15679fe;
      expv[2] = 25'h014f9fe;
      expv[3] = 25'h043c0fe;
      expv[4] = 25'h0a892fe;
      expv[5] = 25'h03979fe;
      expv[6] = 25'h19508fe;
      expv[7] = 25'h0d180fe;
      expv[8] = 25'h07d24fe;
      expv[9] = 25'h08c79fe;
      expv[10] = 25'h03ef9fe;
      expv[11] = 25'h08040fe;
      expv[12] = 25'h14e79fe;
      expv[13] = 25'h104f9fe;
      expv[14] = 25'h03a79fe;
      expv[15] = 25'h1b490fe;
      expv[16] = 25'h133c0fe;
      expv[17] = 25'h02279fe;
      expv[18] = 25'h03ef9fe;
      expv[19] = 25'h04040fe;
      expv[20] = 25'h10af9fe;
      expv[21] = 25'h062f9fe;
      expv[22] = 25'h0b019fe;
      expv[23] = 25'h00779fe;
      expv[24] = 25'h09879fe;
      expv[25] = 25'h03779fe;
      expv[26] = 25'h0d100fe;
      expv[27] = 25'h1e78efe;
      expv[28] = 25'h00679fe;
      expv[29] = 25'h04ef9fe;
      expv[30] = 25'h0f346fe;
      expv[31] = 25'h0ee21fe;
      expv[32] = 25'h14a79fe;
      expv[33] = 25'h0dc90fe;
      expv[34] = 25'h19c90fe;
      expv[35] = 25'h00524fe;
      expv[36] = 25'h04af9fe;
      expv[37] = 25'h06524fe;
      expv[38] = 25'h0ca90fe;
      expv[39] = 25'h1c219fe;
      expv[40] = 25'h04040fe;
      expv[41] = 25'h116f9fe;
      expv[42] = 25'h12bc0fe;
      expv[43] = 25'h01d24fe;
      expv[44] = 25'h0a219fe;
      expv[45] = 25'h09140fe;
      expv[46] = 25'h19f8efe;
      expv[47] = 25'h03179fe;
      expv[48] = 25'h145c0fe;
      expv[49] = 25'h08ef9fe;
      expv[50] = 25'h081c0fe;
      expv[51] = 25'h107c0fe;
      expv[52] = 25'h063c0fe;
      expv[53] = 25'h020c0fe;
      expv[54] = 25'h17479fe;
      expv[55] = 25'h1e490fe;
      expv[56] = 25'h10940fe;
      expv[57] = 25'h14140fe;
      expv[58] = 25'h1e040fe;
      expv[59] = 25'h1c646fe;
      expv[60] = 25'h12ef9fe;
      expv[61] = 25'h13579fe;
      expv[62] = 25'h160c0fe;
      expv[63] = 25'h11040fe;
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
