// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04807 dut (
    .addroundkey_data_i(in_vec[25:22]),
    .addroundkey_data_reg(in_vec[21:18]),
    .addroundkey_round(in_vec[17:14]),
    .key_i(in_vec[13:10]),
    .keysched_new_key_o(in_vec[9:6]),
    .round(in_vec[5:2]),
    .addroundkey_start_i(in_vec[1:1]),
    .keysched_ready_o(in_vec[0:0]),
    .keysched_last_key_i(out_vec[21:18]),
    .keysched_round_i(out_vec[17:14]),
    .next_addroundkey_data_reg(out_vec[13:10]),
    .next_addroundkey_round(out_vec[9:6]),
    .round_data_var(out_vec[5:2]),
    .keysched_start_i(out_vec[1:1]),
    .next_addroundkey_ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h11faa04;
    stim[1] = 26'h390d0b1;
    stim[2] = 26'h262afda;
    stim[3] = 26'h0b1470f;
    stim[4] = 26'h0e89da8;
    stim[5] = 26'h0786f13;
    stim[6] = 26'h0afae6f;
    stim[7] = 26'h3d8d043;
    stim[8] = 26'h0ddb65e;
    stim[9] = 26'h39cabb2;
    stim[10] = 26'h3d83391;
    stim[11] = 26'h2b7351b;
    stim[12] = 26'h1a93675;
    stim[13] = 26'h22b6785;
    stim[14] = 26'h3871658;
    stim[15] = 26'h31c7b88;
    stim[16] = 26'h14e5ec9;
    stim[17] = 26'h0661360;
    stim[18] = 26'h0ad4516;
    stim[19] = 26'h37a777a;
    stim[20] = 26'h19eb24e;
    stim[21] = 26'h07d149e;
    stim[22] = 26'h271e60c;
    stim[23] = 26'h30e94e8;
    stim[24] = 26'h31e4a28;
    stim[25] = 26'h2feafd1;
    stim[26] = 26'h09257bd;
    stim[27] = 26'h1be5233;
    stim[28] = 26'h355292c;
    stim[29] = 26'h229119e;
    stim[30] = 26'h2f74b04;
    stim[31] = 26'h3431962;
    stim[32] = 26'h3e470ba;
    stim[33] = 26'h38bc426;
    stim[34] = 26'h3129cbb;
    stim[35] = 26'h1a4d247;
    stim[36] = 26'h06226e3;
    stim[37] = 26'h26beb21;
    stim[38] = 26'h2aacad4;
    stim[39] = 26'h2bb0407;
    stim[40] = 26'h0078dd0;
    stim[41] = 26'h31d8f50;
    stim[42] = 26'h35abd73;
    stim[43] = 26'h22ee45c;
    stim[44] = 26'h0fbf3c0;
    stim[45] = 26'h0e491e4;
    stim[46] = 26'h3e18e9c;
    stim[47] = 26'h1b13567;
    stim[48] = 26'h05ba0dd;
    stim[49] = 26'h1a6ed90;
    stim[50] = 26'h3fcf05d;
    stim[51] = 26'h31c8e35;
    stim[52] = 26'h0901211;
    stim[53] = 26'h0b1f39b;
    stim[54] = 26'h2af4e8d;
    stim[55] = 26'h390c5e8;
    stim[56] = 26'h1784466;
    stim[57] = 26'h1c11c29;
    stim[58] = 26'h012db46;
    stim[59] = 26'h2d5b4b5;
    stim[60] = 26'h2b8424f;
    stim[61] = 26'h3888cde;
    stim[62] = 26'h0bb946f;
    stim[63] = 26'h3487921;
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
      expv[0] = 22'h239f9c;
      expv[1] = 22'h091112;
      expv[2] = 22'h2c6062;
      expv[3] = 22'h047072;
      expv[4] = 22'h18a8a8;
      expv[5] = 22'h2c787a;
      expv[6] = 22'h2c6c6e;
      expv[7] = 22'h04eced;
      expv[8] = 22'h345c5e;
      expv[9] = 22'h285c5e;
      expv[10] = 22'h38585a;
      expv[11] = 22'h347476;
      expv[12] = 22'h25696a;
      expv[13] = 22'h3babaa;
      expv[14] = 22'h270704;
      expv[15] = 22'h385c5c;
      expv[16] = 22'h2e8e8e;
      expv[17] = 22'h362624;
      expv[18] = 22'h046c6e;
      expv[19] = 22'h34787a;
      expv[20] = 22'h305c5e;
      expv[21] = 22'h147c7e;
      expv[22] = 22'h21f1f0;
      expv[23] = 22'h0e8e8c;
      expv[24] = 22'h225e5c;
      expv[25] = 22'h3efefe;
      expv[26] = 22'h3a9292;
      expv[27] = 22'h107c7e;
      expv[28] = 22'h111514;
      expv[29] = 22'h10686a;
      expv[30] = 22'h337774;
      expv[31] = 22'h184042;
      expv[32] = 22'h306466;
      expv[33] = 22'h04484a;
      expv[34] = 22'h1c5052;
      expv[35] = 22'h106466;
      expv[36] = 22'h246062;
      expv[37] = 22'h30282a;
      expv[38] = 22'h2eeae8;
      expv[39] = 22'h04787a;
      expv[40] = 22'h1f8784;
      expv[41] = 22'h359d9c;
      expv[42] = 22'h3c585a;
      expv[43] = 22'h06eeec;
      expv[44] = 22'h3ffbf8;
      expv[45] = 22'h1ca4a4;
      expv[46] = 22'h29a1a0;
      expv[47] = 22'h347072;
      expv[48] = 22'h0fdbda;
      expv[49] = 22'h1ae6e4;
      expv[50] = 22'h053d3e;
      expv[51] = 22'h20dcde;
      expv[52] = 22'h205052;
      expv[53] = 22'h307072;
      expv[54] = 22'h2bafae;
      expv[55] = 22'h1cd0d0;
      expv[56] = 22'h04787a;
      expv[57] = 22'h014142;
      expv[58] = 22'h185052;
      expv[59] = 22'h09d5d6;
      expv[60] = 22'h00787a;
      expv[61] = 22'h0c484a;
      expv[62] = 22'h14787a;
      expv[63] = 22'h10888a;
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
