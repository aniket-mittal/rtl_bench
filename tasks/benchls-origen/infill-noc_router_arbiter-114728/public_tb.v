// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_114728 dut (
    .north_hit_i(in_vec[14:14]),
    .east_hit_i(in_vec[13:13]),
    .west_hit_i(in_vec[12:12]),
    .south_hit_i(in_vec[11:11]),
    .local_hit_i(in_vec[10:10]),
    .last_dir_i(in_vec[9:5]),
    .is_body_i(in_vec[4:0]),
    .dir_o(out_vec[10:6]),
    .filter_o(out_vec[5:1]),
    .arb_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h2166;
    stim[1] = 15'h1e49;
    stim[2] = 15'h75d5;
    stim[3] = 15'h7b48;
    stim[4] = 15'h784c;
    stim[5] = 15'h68d5;
    stim[6] = 15'h0b8b;
    stim[7] = 15'h6794;
    stim[8] = 15'h066a;
    stim[9] = 15'h72e7;
    stim[10] = 15'h512f;
    stim[11] = 15'h7979;
    stim[12] = 15'h16bb;
    stim[13] = 15'h61a7;
    stim[14] = 15'h5b4f;
    stim[15] = 15'h356f;
    stim[16] = 15'h6300;
    stim[17] = 15'h2e02;
    stim[18] = 15'h3b50;
    stim[19] = 15'h0a07;
    stim[20] = 15'h6c67;
    stim[21] = 15'h44ee;
    stim[22] = 15'h6ad5;
    stim[23] = 15'h220b;
    stim[24] = 15'h1d4e;
    stim[25] = 15'h0f55;
    stim[26] = 15'h56d6;
    stim[27] = 15'h310c;
    stim[28] = 15'h4fa0;
    stim[29] = 15'h0e79;
    stim[30] = 15'h2188;
    stim[31] = 15'h530f;
    stim[32] = 15'h3da3;
    stim[33] = 15'h63d3;
    stim[34] = 15'h5e99;
    stim[35] = 15'h78a4;
    stim[36] = 15'h2f86;
    stim[37] = 15'h485a;
    stim[38] = 15'h6668;
    stim[39] = 15'h1a57;
    stim[40] = 15'h6358;
    stim[41] = 15'h576a;
    stim[42] = 15'h79d4;
    stim[43] = 15'h49c2;
    stim[44] = 15'h2c94;
    stim[45] = 15'h2979;
    stim[46] = 15'h11ef;
    stim[47] = 15'h1cd5;
    stim[48] = 15'h7e7e;
    stim[49] = 15'h4f24;
    stim[50] = 15'h3fe1;
    stim[51] = 15'h5a1b;
    stim[52] = 15'h131a;
    stim[53] = 15'h788a;
    stim[54] = 15'h0b58;
    stim[55] = 15'h126f;
    stim[56] = 15'h4f25;
    stim[57] = 15'h3f90;
    stim[58] = 15'h4f51;
    stim[59] = 15'h7fdc;
    stim[60] = 15'h6370;
    stim[61] = 15'h725c;
    stim[62] = 15'h5f01;
    stim[63] = 15'h0b07;
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
      expv[0] = 11'h2c0;
      expv[1] = 11'h04d;
      expv[2] = 11'h41b;
      expv[3] = 11'h22d;
      expv[4] = 11'h22d;
      expv[5] = 11'h415;
      expv[6] = 11'h700;
      expv[7] = 11'h413;
      expv[8] = 11'h4c0;
      expv[9] = 11'h131;
      expv[10] = 11'h121;
      expv[11] = 11'h41d;
      expv[12] = 11'h049;
      expv[13] = 11'h031;
      expv[14] = 11'h125;
      expv[15] = 11'h20b;
      expv[16] = 11'h031;
      expv[17] = 11'h093;
      expv[18] = 11'h01d;
      expv[19] = 11'h400;
      expv[20] = 11'h0b3;
      expv[21] = 11'h023;
      expv[22] = 11'h415;
      expv[23] = 11'h400;
      expv[24] = 11'h107;
      expv[25] = 11'h045;
      expv[26] = 11'h40b;
      expv[27] = 11'h209;
      expv[28] = 11'h027;
      expv[29] = 11'h045;
      expv[30] = 11'h300;
      expv[31] = 11'h121;
      expv[32] = 11'h09b;
      expv[33] = 11'h411;
      expv[34] = 11'h40f;
      expv[35] = 11'h135;
      expv[36] = 11'h093;
      expv[37] = 11'h405;
      expv[38] = 11'h223;
      expv[39] = 11'h105;
      expv[40] = 11'h411;
      expv[41] = 11'h02b;
      expv[42] = 11'h41d;
      expv[43] = 11'h0a1;
      expv[44] = 11'h207;
      expv[45] = 11'h205;
      expv[46] = 11'h3c0;
      expv[47] = 11'h107;
      expv[48] = 11'h41f;
      expv[49] = 11'h027;
      expv[50] = 11'h05d;
      expv[51] = 11'h40d;
      expv[52] = 11'h600;
      expv[53] = 11'h22d;
      expv[54] = 11'h680;
      expv[55] = 11'h4c0;
      expv[56] = 11'h065;
      expv[57] = 11'h01f;
      expv[58] = 11'h407;
      expv[59] = 11'h41f;
      expv[60] = 11'h411;
      expv[61] = 11'h419;
      expv[62] = 11'h06d;
      expv[63] = 11'h600;
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
