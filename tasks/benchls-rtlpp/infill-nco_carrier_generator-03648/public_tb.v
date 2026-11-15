// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03648 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h24cb7252;
    stim[1] = 31'h1f15bdea;
    stim[2] = 31'h4daab168;
    stim[3] = 31'h53662dbf;
    stim[4] = 31'h7fa8471b;
    stim[5] = 31'h7a00a92d;
    stim[6] = 31'h7e070f49;
    stim[7] = 31'h543d93e6;
    stim[8] = 31'h4556f739;
    stim[9] = 31'h771e3bac;
    stim[10] = 31'h4444eb41;
    stim[11] = 31'h72e3a163;
    stim[12] = 31'h71d55a23;
    stim[13] = 31'h68994b2d;
    stim[14] = 31'h52cec994;
    stim[15] = 31'h474a366b;
    stim[16] = 31'h7facaa86;
    stim[17] = 31'h503585af;
    stim[18] = 31'h754b5402;
    stim[19] = 31'h5d82ecc9;
    stim[20] = 31'h4fc69e64;
    stim[21] = 31'h66d60345;
    stim[22] = 31'h66473d0d;
    stim[23] = 31'h40a02383;
    stim[24] = 31'h5478faa1;
    stim[25] = 31'h4c07d2ad;
    stim[26] = 31'h5dd3186a;
    stim[27] = 31'h604c90e7;
    stim[28] = 31'h5223b1dc;
    stim[29] = 31'h40642dea;
    stim[30] = 31'h590dc105;
    stim[31] = 31'h4f493df7;
    stim[32] = 31'h7d16b84e;
    stim[33] = 31'h762c3817;
    stim[34] = 31'h4e9c42d1;
    stim[35] = 31'h400026a2;
    stim[36] = 31'h5d18dcf9;
    stim[37] = 31'h6ce22106;
    stim[38] = 31'h5ff0f920;
    stim[39] = 31'h676e435d;
    stim[40] = 31'h442687da;
    stim[41] = 31'h4ca170db;
    stim[42] = 31'h46e0ebff;
    stim[43] = 31'h6039d22c;
    stim[44] = 31'h75971766;
    stim[45] = 31'h40461cf0;
    stim[46] = 31'h4adc117b;
    stim[47] = 31'h4bcf893d;
    stim[48] = 31'h5c2b4e13;
    stim[49] = 31'h7455bf37;
    stim[50] = 31'h6368d2b9;
    stim[51] = 31'h58c39966;
    stim[52] = 31'h68ef05c0;
    stim[53] = 31'h69ba1937;
    stim[54] = 31'h458e0faf;
    stim[55] = 31'h4ca9aad8;
    stim[56] = 31'h531485c5;
    stim[57] = 31'h754ffba7;
    stim[58] = 31'h5309a172;
    stim[59] = 31'h71b60275;
    stim[60] = 31'h7d1a2f4f;
    stim[61] = 31'h5c059f8e;
    stim[62] = 31'h7cc419e8;
    stim[63] = 31'h7c17a1cb;
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
      expv[0] = 36'hxxxxxxxxb;
      expv[1] = 36'hxxxxxxxx9;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxx9;
      expv[4] = 36'hxxxxxxxx3;
      expv[5] = 36'h00000211c;
      expv[6] = 36'h0000000b6;
      expv[7] = 36'h000001abe;
      expv[8] = 36'h000001abe;
      expv[9] = 36'h000001ab1;
      expv[10] = 36'h000005254;
      expv[11] = 36'h000005253;
      expv[12] = 36'h000002dbe;
      expv[13] = 36'h00000009c;
      expv[14] = 36'h000001274;
      expv[15] = 36'h000001276;
      expv[16] = 36'h00000127c;
      expv[17] = 36'h000003521;
      expv[18] = 36'h000003526;
      expv[19] = 36'h00000250c;
      expv[20] = 36'h000002501;
      expv[21] = 36'h000002504;
      expv[22] = 36'h000006796;
      expv[23] = 36'h000002e76;
      expv[24] = 36'h000002e7b;
      expv[25] = 36'h000002e7c;
      expv[26] = 36'h000002e74;
      expv[27] = 36'h000002e74;
      expv[28] = 36'h0000073ab;
      expv[29] = 36'h0000073ab;
      expv[30] = 36'h0000073a9;
      expv[31] = 36'h0000073a4;
      expv[32] = 36'h0000073ab;
      expv[33] = 36'h000006ed9;
      expv[34] = 36'h000000be4;
      expv[35] = 36'h000000be4;
      expv[36] = 36'h000000bee;
      expv[37] = 36'h000000bec;
      expv[38] = 36'h000004dc6;
      expv[39] = 36'h000004dc3;
      expv[40] = 36'h000003aab;
      expv[41] = 36'h000003aae;
      expv[42] = 36'h000003aac;
      expv[43] = 36'h000003aac;
      expv[44] = 36'h0000019b4;
      expv[45] = 36'h0000019f4;
      expv[46] = 36'h0000019f6;
      expv[47] = 36'h0000019fb;
      expv[48] = 36'h0000019f9;
      expv[49] = 36'h0000019f6;
      expv[50] = 36'h0000062a6;
      expv[51] = 36'h0000036fe;
      expv[52] = 36'h0000036f9;
      expv[53] = 36'h000005321;
      expv[54] = 36'h000001c11;
      expv[55] = 36'h000001c16;
      expv[56] = 36'h000001c1b;
      expv[57] = 36'h000001c19;
      expv[58] = 36'h000004b14;
      expv[59] = 36'h000004b1b;
      expv[60] = 36'h000003379;
      expv[61] = 36'h000000523;
      expv[62] = 36'h00000052c;
      expv[63] = 36'h000003e46;
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
