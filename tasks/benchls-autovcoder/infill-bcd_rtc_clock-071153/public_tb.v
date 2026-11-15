// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071153 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .cen(in_vec[11:11]),
    .din(in_vec[10:3]),
    .we(in_vec[2:0]),
    .sec(out_vec[23:16]),
    .min(out_vec[15:8]),
    .hour(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1fa6;
    stim[1] = 13'h1188;
    stim[2] = 13'h0a34;
    stim[3] = 13'h00d3;
    stim[4] = 13'h07f1;
    stim[5] = 13'h1761;
    stim[6] = 13'h0a2e;
    stim[7] = 13'h0b1a;
    stim[8] = 13'h006b;
    stim[9] = 13'h0638;
    stim[10] = 13'h0c4f;
    stim[11] = 13'h0a5a;
    stim[12] = 13'h016b;
    stim[13] = 13'h04bf;
    stim[14] = 13'h0127;
    stim[15] = 13'h0069;
    stim[16] = 13'h022a;
    stim[17] = 13'h0d1e;
    stim[18] = 13'h094e;
    stim[19] = 13'h0815;
    stim[20] = 13'h0800;
    stim[21] = 13'h094f;
    stim[22] = 13'h015f;
    stim[23] = 13'h025e;
    stim[24] = 13'h0244;
    stim[25] = 13'h090f;
    stim[26] = 13'h0b0e;
    stim[27] = 13'h031f;
    stim[28] = 13'h0a02;
    stim[29] = 13'h0ce9;
    stim[30] = 13'h08eb;
    stim[31] = 13'h091b;
    stim[32] = 13'h0157;
    stim[33] = 13'h0494;
    stim[34] = 13'h0b31;
    stim[35] = 13'h0270;
    stim[36] = 13'h039f;
    stim[37] = 13'h00d0;
    stim[38] = 13'h09d3;
    stim[39] = 13'h0cbc;
    stim[40] = 13'h0084;
    stim[41] = 13'h06d8;
    stim[42] = 13'h0f19;
    stim[43] = 13'h0b63;
    stim[44] = 13'h0a0d;
    stim[45] = 13'h056f;
    stim[46] = 13'h0750;
    stim[47] = 13'h0403;
    stim[48] = 13'h029a;
    stim[49] = 13'h08e9;
    stim[50] = 13'h04cb;
    stim[51] = 13'h0656;
    stim[52] = 13'h09a8;
    stim[53] = 13'h0586;
    stim[54] = 13'h0dc4;
    stim[55] = 13'h0c1e;
    stim[56] = 13'h0224;
    stim[57] = 13'h0438;
    stim[58] = 13'h0dfd;
    stim[59] = 13'h0829;
    stim[60] = 13'h0c6f;
    stim[61] = 13'h04a1;
    stim[62] = 13'h042c;
    stim[63] = 13'h0f2e;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h010046;
      expv[4] = 24'h1a1a46;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h014545;
      expv[8] = 24'h016345;
      expv[9] = 24'h0d0d45;
      expv[10] = 24'h0d0d45;
      expv[11] = 24'h898989;
      expv[12] = 24'h894b89;
      expv[13] = 24'h2d2d89;
      expv[14] = 24'h979797;
      expv[15] = 24'h242424;
      expv[16] = 24'h0d2424;
      expv[17] = 24'h0d4524;
      expv[18] = 24'h0da3a3;
      expv[19] = 24'h0d2929;
      expv[20] = 24'h022902;
      expv[21] = 24'h022902;
      expv[22] = 24'h292929;
      expv[23] = 24'h2b2b2b;
      expv[24] = 24'h2b4b4b;
      expv[25] = 24'h2b4b48;
      expv[26] = 24'h212121;
      expv[27] = 24'h216161;
      expv[28] = 24'h636363;
      expv[29] = 24'h634063;
      expv[30] = 24'h9d4063;
      expv[31] = 24'h1d1d63;
      expv[32] = 24'h232363;
      expv[33] = 24'h2a2a2a;
      expv[34] = 24'h2a2a92;
      expv[35] = 24'h662a92;
      expv[36] = 24'h662a92;
      expv[37] = 24'h737373;
      expv[38] = 24'h737373;
      expv[39] = 24'h3a3a73;
      expv[40] = 24'h3a3a97;
      expv[41] = 24'h3a3a10;
      expv[42] = 24'h3a3a10;
      expv[43] = 24'he33a10;
      expv[44] = 24'h6c6c10;
      expv[45] = 24'h416c41;
      expv[46] = 24'hadadad;
      expv[47] = 24'hadadad;
      expv[48] = 24'h8080ad;
      expv[49] = 24'h8053ad;
      expv[50] = 24'h1d53ad;
      expv[51] = 24'h9999ad;
      expv[52] = 24'h99caca;
      expv[53] = 24'h99caca;
      expv[54] = 24'h99b0b0;
      expv[55] = 24'h99b0b8;
      expv[56] = 24'h998383;
      expv[57] = 24'h998344;
      expv[58] = 24'h998344;
      expv[59] = 24'hbf83bf;
      expv[60] = 24'h0583bf;
      expv[61] = 24'h8d8d8d;
      expv[62] = 24'h948d8d;
      expv[63] = 24'h948d85;
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
