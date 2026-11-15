// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06631 dut (
    .clk(clk),
    .pixel_count(in_vec[25:14]),
    .line_count(in_vec[13:2]),
    .fb_reset(in_vec[1:1]),
    .fb_enable(in_vec[0:0]),
    .x(out_vec[23:12]),
    .y(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h10a99af;
    stim[1] = 26'h0d7956f;
    stim[2] = 26'h08b03c4;
    stim[3] = 26'h2fc51c8;
    stim[4] = 26'h39b4cc9;
    stim[5] = 26'h0a54cc8;
    stim[6] = 26'h3fbebfc;
    stim[7] = 26'h264b985;
    stim[8] = 26'h0a3b6e1;
    stim[9] = 26'h11c85b0;
    stim[10] = 26'h308d061;
    stim[11] = 26'h2a81c85;
    stim[12] = 26'h01b5c98;
    stim[13] = 26'h33c8474;
    stim[14] = 26'h23e44c8;
    stim[15] = 26'h2bfa544;
    stim[16] = 26'h0312444;
    stim[17] = 26'h14fb67a;
    stim[18] = 26'h234672b;
    stim[19] = 26'h36a4490;
    stim[20] = 26'h3ee3d90;
    stim[21] = 26'h15efa08;
    stim[22] = 26'h077f565;
    stim[23] = 26'h0ba7198;
    stim[24] = 26'h172e380;
    stim[25] = 26'h38e3289;
    stim[26] = 26'h314bfe1;
    stim[27] = 26'h0409420;
    stim[28] = 26'h1a13b45;
    stim[29] = 26'h0b1a2c9;
    stim[30] = 26'h331365d;
    stim[31] = 26'h10723bc;
    stim[32] = 26'h0d7b0b0;
    stim[33] = 26'h09333a5;
    stim[34] = 26'h19fe5b9;
    stim[35] = 26'h05ce7d5;
    stim[36] = 26'h0c4ef7c;
    stim[37] = 26'h2e110f1;
    stim[38] = 26'h1cfc08c;
    stim[39] = 26'h2f281f8;
    stim[40] = 26'h1a2f950;
    stim[41] = 26'h23ac4d9;
    stim[42] = 26'h04f4970;
    stim[43] = 26'h3adf59c;
    stim[44] = 26'h0c5f6ec;
    stim[45] = 26'h3de4bf9;
    stim[46] = 26'h3144c61;
    stim[47] = 26'h0ad87b9;
    stim[48] = 26'h20481e4;
    stim[49] = 26'h3cfb1c5;
    stim[50] = 26'h2014824;
    stim[51] = 26'h2a10aa0;
    stim[52] = 26'h3fa9a28;
    stim[53] = 26'h2aff184;
    stim[54] = 26'h32fbaf5;
    stim[55] = 26'h19fc989;
    stim[56] = 26'h3c7ea7c;
    stim[57] = 26'h302d669;
    stim[58] = 26'h0dc7865;
    stim[59] = 26'h3c7e248;
    stim[60] = 26'h3997bc5;
    stim[61] = 26'h387da51;
    stim[62] = 26'h34fb2a5;
    stim[63] = 26'h04e7b05;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h001000;
      expv[6] = 24'h001000;
      expv[7] = 24'h001000;
      expv[8] = 24'h002000;
      expv[9] = 24'h003000;
      expv[10] = 24'h003000;
      expv[11] = 24'h004000;
      expv[12] = 24'h005000;
      expv[13] = 24'h005000;
      expv[14] = 24'h005000;
      expv[15] = 24'h005000;
      expv[16] = 24'h005000;
      expv[17] = 24'h005000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h001000;
      expv[24] = 24'h001000;
      expv[25] = 24'h001000;
      expv[26] = 24'h002000;
      expv[27] = 24'h003000;
      expv[28] = 24'h003000;
      expv[29] = 24'h004000;
      expv[30] = 24'h005000;
      expv[31] = 24'h006000;
      expv[32] = 24'h006000;
      expv[33] = 24'h006000;
      expv[34] = 24'h007000;
      expv[35] = 24'h008000;
      expv[36] = 24'h009000;
      expv[37] = 24'h009000;
      expv[38] = 24'h00a000;
      expv[39] = 24'h00a000;
      expv[40] = 24'h00a000;
      expv[41] = 24'h00a000;
      expv[42] = 24'h00b000;
      expv[43] = 24'h00b000;
      expv[44] = 24'h00b000;
      expv[45] = 24'h00b000;
      expv[46] = 24'h00c000;
      expv[47] = 24'h00d000;
      expv[48] = 24'h00e000;
      expv[49] = 24'h00e000;
      expv[50] = 24'h00f000;
      expv[51] = 24'h00f000;
      expv[52] = 24'h00f000;
      expv[53] = 24'h00f000;
      expv[54] = 24'h00f000;
      expv[55] = 24'h010000;
      expv[56] = 24'h011000;
      expv[57] = 24'h011000;
      expv[58] = 24'h012000;
      expv[59] = 24'h013000;
      expv[60] = 24'h013000;
      expv[61] = 24'h014000;
      expv[62] = 24'h015000;
      expv[63] = 24'h016000;
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
