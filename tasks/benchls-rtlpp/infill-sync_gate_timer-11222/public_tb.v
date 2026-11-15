// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11222 dut (
    .clk(clk),
    .rst_n(in_vec[49:49]),
    .ena(in_vec[48:48]),
    .Tsync(in_vec[47:40]),
    .Tgdel(in_vec[39:32]),
    .Tgate(in_vec[31:16]),
    .Tlen(in_vec[15:0]),
    .sync(out_vec[2:2]),
    .gate(out_vec[1:1]),
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
    stim[0] = 50'h164ac59ca754e;
    stim[1] = 50'h1beb27cc9a079;
    stim[2] = 50'h38ab53e41efc4;
    stim[3] = 50'h22247e788d03c;
    stim[4] = 50'h3ea78c2f05963;
    stim[5] = 50'h26c5a9e5ec1c6;
    stim[6] = 50'h3a40b98d08d96;
    stim[7] = 50'h3c004271b3f66;
    stim[8] = 50'h3ac83259bddd2;
    stim[9] = 50'h2d3b4d9cf0e6f;
    stim[10] = 50'h23ea79d16b399;
    stim[11] = 50'h3e981e5e5e2c6;
    stim[12] = 50'h3d93b2b331863;
    stim[13] = 50'h3b593de77a5cd;
    stim[14] = 50'h3d3ffa3ea4413;
    stim[15] = 50'h22f5c8b52922c;
    stim[16] = 50'h3d186f3c63086;
    stim[17] = 50'h3a3016f16b45d;
    stim[18] = 50'h255f2fa653355;
    stim[19] = 50'h312e7fb73f5a0;
    stim[20] = 50'h2b7169f0ca374;
    stim[21] = 50'h243ded996bc8f;
    stim[22] = 50'h1316a14f4bb1b;
    stim[23] = 50'h3d3220a5f0bf5;
    stim[24] = 50'h3e10f7f0ec03f;
    stim[25] = 50'h3c56d74c59c4b;
    stim[26] = 50'h2d8c65e4d3b8a;
    stim[27] = 50'h3843aec8f7483;
    stim[28] = 50'h2b2c0ea220cb9;
    stim[29] = 50'h31de58b30d552;
    stim[30] = 50'h393087cb0d151;
    stim[31] = 50'h255356c66582b;
    stim[32] = 50'h33b3facdf5435;
    stim[33] = 50'h3ce640b9ad865;
    stim[34] = 50'h37ce93b078b0f;
    stim[35] = 50'h3ac580e297190;
    stim[36] = 50'h3bf291a1651b5;
    stim[37] = 50'h38a79a5bbc23e;
    stim[38] = 50'h26d550796d81a;
    stim[39] = 50'h2e242a601765b;
    stim[40] = 50'h3350ebd28d467;
    stim[41] = 50'h20cca7426862c;
    stim[42] = 50'h23904040e72f2;
    stim[43] = 50'h324d1fb15a93f;
    stim[44] = 50'h2090d2d37b291;
    stim[45] = 50'h2efdad1248935;
    stim[46] = 50'h3073518d8dc13;
    stim[47] = 50'h2e92fd1b6cf4e;
    stim[48] = 50'h3038876e49c08;
    stim[49] = 50'h2659d5828d296;
    stim[50] = 50'h3ec4ce1bb282f;
    stim[51] = 50'h3366359a933a5;
    stim[52] = 50'h3e0d113512de2;
    stim[53] = 50'h3ac008c4b9d48;
    stim[54] = 50'h33ecc564d590b;
    stim[55] = 50'h200314d0886a1;
    stim[56] = 50'h2654c9f50f6a1;
    stim[57] = 50'h21a56c8385601;
    stim[58] = 50'h3ac5993783daa;
    stim[59] = 50'h3d645042f7ccf;
    stim[60] = 50'h285e8e319b86a;
    stim[61] = 50'h3e44604ad3ebe;
    stim[62] = 50'h32f0d8ae24628;
    stim[63] = 50'h2fb14994aedf5;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
