// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024521 dut (
    .clk(clk),
    .data(in_vec[62:47]),
    .displayX(in_vec[46:37]),
    .displayY(in_vec[36:27]),
    .hsync(in_vec[26:26]),
    .vsync(in_vec[25:25]),
    .blank(in_vec[24:24]),
    .previousPixel(in_vec[23:0]),
    .pixel(out_vec[56:33]),
    .addr(out_vec[32:23]),
    .displayXOut(out_vec[22:13]),
    .displayYOut(out_vec[12:3]),
    .hsyncOut(out_vec[2:2]),
    .vsyncOut(out_vec[1:1]),
    .blankOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h1526e30f3da666fa;
    stim[1] = 63'h58ede474d24989c6;
    stim[2] = 63'h751c492c23868c8c;
    stim[3] = 63'h413032fd3b0d9676;
    stim[4] = 63'h39b1132c0b49c5dc;
    stim[5] = 63'h252b93b490b8f7e0;
    stim[6] = 63'h177bd244bf320953;
    stim[7] = 63'h14243192736cc81c;
    stim[8] = 63'h1a401f87bdef72d1;
    stim[9] = 63'h0fd882aed2199f69;
    stim[10] = 63'h43ec9490477ed530;
    stim[11] = 63'h736452e0d94faf23;
    stim[12] = 63'h3dcc674dbe025d10;
    stim[13] = 63'h2aa59d57a64a7f69;
    stim[14] = 63'h6ad8f2750e3f236a;
    stim[15] = 63'h37a0122636f9492b;
    stim[16] = 63'h58dbf4468678ed9c;
    stim[17] = 63'h4cba0886d14b8ad5;
    stim[18] = 63'h77f7f5f7c08c913f;
    stim[19] = 63'h737d9de2d639ce4a;
    stim[20] = 63'h62804af617fcd202;
    stim[21] = 63'h57fe384f143ad7ac;
    stim[22] = 63'h7cf9d2935d083429;
    stim[23] = 63'h5bebbf178b6a1e26;
    stim[24] = 63'h2cdf49d10cf12222;
    stim[25] = 63'h50cf9b7a6e35dea9;
    stim[26] = 63'h26c4fad8216792e0;
    stim[27] = 63'h33b4d5a0a33dec64;
    stim[28] = 63'h15087fa9543fca1d;
    stim[29] = 63'h69c4f8deaf87ec6b;
    stim[30] = 63'h58a253539129c56b;
    stim[31] = 63'h5d17a477a19a0e20;
    stim[32] = 63'h4d2dd309a052c132;
    stim[33] = 63'h37269e420f7e936b;
    stim[34] = 63'h413d5f005e5ec5bf;
    stim[35] = 63'h03111bae69131e62;
    stim[36] = 63'h12a765cca6cfaf01;
    stim[37] = 63'h404ce8454405e514;
    stim[38] = 63'h128b69792340f7c2;
    stim[39] = 63'h676999d28a8f173c;
    stim[40] = 63'h4b22d962af7a1a7f;
    stim[41] = 63'h311668b4935a2f7a;
    stim[42] = 63'h39774ca06ea179e3;
    stim[43] = 63'h08f96bf9384a24a4;
    stim[44] = 63'h49b1a6109b3a0857;
    stim[45] = 63'h206c9b44b0c4b4bc;
    stim[46] = 63'h7c1bc4a011d9b0c7;
    stim[47] = 63'h471f9739a127f16d;
    stim[48] = 63'h64ee8f1e21943057;
    stim[49] = 63'h02dff476015f3017;
    stim[50] = 63'h0b1f374642a73f1c;
    stim[51] = 63'h34d7918d435b467e;
    stim[52] = 63'h5249aad7471391f8;
    stim[53] = 63'h2237d22b6abf8a85;
    stim[54] = 63'h7fbbf4ad3701a560;
    stim[55] = 63'h4374ae253fef4602;
    stim[56] = 63'h67dc006d365078f6;
    stim[57] = 63'h4c09b2a4416d8ab7;
    stim[58] = 63'h61694d072f82856d;
    stim[59] = 63'h605ff5983649e83a;
    stim[60] = 63'h1e53d2d01d1bdb18;
    stim[61] = 63'h15936136909a9036;
    stim[62] = 63'h02ef0daf50643a20;
    stim[63] = 63'h5809350546c5a4d9;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'h1xxxxxxxxx30f3d;
      expv[2] = 57'hxxxxxxxxxx474d2;
      expv[3] = 57'h1fe000xxxx92c23;
      expv[4] = 57'h1fe000xxxx2fd3b;
      expv[5] = 57'h0938bbxxxx32c0b;
      expv[6] = 57'h1fe000xxxx3b490;
      expv[7] = 57'h1fe000xxxx244bf;
      expv[8] = 57'h1fe000xxxx19273;
      expv[9] = 57'h1fe000xxxxf87bd;
      expv[10] = 57'h1fe000xxxx2aed2;
      expv[11] = 57'h1fe000xxxx49047;
      expv[12] = 57'h1fe000xxxx2e0d9;
      expv[13] = 57'h1fe000xxxx74dbe;
      expv[14] = 57'h1fe000xxxxd57a6;
      expv[15] = 57'h07e46dxxxx2750e;
      expv[16] = 57'h1f2925xxxx22636;
      expv[17] = 57'h0f1db3xxxx44686;
      expv[18] = 57'h1fe000xxxx886d1;
      expv[19] = 57'h1fe000xxxx5f7c0;
      expv[20] = 57'h0739c9xxxxde2d6;
      expv[21] = 57'h1fe000xxxxaf617;
      expv[22] = 57'h1fe000xxxx84f14;
      expv[23] = 57'h010685xxxx2935d;
      expv[24] = 57'h1fe000xxxxf178b;
      expv[25] = 57'h1e2444xxxx9d10c;
      expv[26] = 57'h1fe000xxxxb7a6e;
      expv[27] = 57'h0cf25cxxxxad821;
      expv[28] = 57'h1fe000xxxx5a0a3;
      expv[29] = 57'h1fe000xxxxfa954;
      expv[30] = 57'h1fe000xxxx8deaf;
      expv[31] = 57'h0538adxxxx35391;
      expv[32] = 57'h1341c4xxxx477a1;
      expv[33] = 57'h0a5826xxxx309a0;
      expv[34] = 57'h1fe000xxxxe420f;
      expv[35] = 57'h0bd8b7xxxxf005e;
      expv[36] = 57'h1fe000xxxxbae69;
      expv[37] = 57'h19f5e0xxxx5cca6;
      expv[38] = 57'h00bca2xxxx84544;
      expv[39] = 57'h1fe000xxxx97923;
      expv[40] = 57'h11e2e7xxxx9d28a;
      expv[41] = 57'h1fe000xxxx962af;
      expv[42] = 57'h1fe000xxxx8b493;
      expv[43] = 57'h142f3cxxxxca06e;
      expv[44] = 57'h1fe000xxxxbf938;
      expv[45] = 57'h07410axxxx6109b;
      expv[46] = 57'h189697xxxxb44b0;
      expv[47] = 57'h1fe000xxxx4a011;
      expv[48] = 57'h1fe000xxxx739a1;
      expv[49] = 57'h12860axxxxf1e21;
      expv[50] = 57'h0be602xxxx47601;
      expv[51] = 57'h14e7e3xxxx74642;
      expv[52] = 57'h1fe000xxxx18d43;
      expv[53] = 57'h02723fxxxxad747;
      expv[54] = 57'h1fe000xxxx22b6a;
      expv[55] = 57'h1fe000xxxx4ad37;
      expv[56] = 57'h1de8c0xxxxe253f;
      expv[57] = 57'h1fe000xxxx06d36;
      expv[58] = 57'h0db156xxxx2a441;
      expv[59] = 57'h1fe000xxxxd072f;
      expv[60] = 57'h093d07xxxx59836;
      expv[61] = 57'h037b63xxxx2d01d;
      expv[62] = 57'h135206xxxx13690;
      expv[63] = 57'h0c8744xxxxdaf50;
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
