// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02796 dut (
    .clk(clk),
    .reset(in_vec[53:53]),
    .emon_vector(in_vec[52:37]),
    .emon_sel(in_vec[36:33]),
    .reg_write(in_vec[32:32]),
    .reg_data(in_vec[31:0]),
    .emon_reg(out_vec[32:1]),
    .emon_zero_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h284d19ead351ea;
    stim[1] = 54'h2208cb96bebb38;
    stim[2] = 54'h13f9e8f66b90a6;
    stim[3] = 54'h18ee8345734094;
    stim[4] = 54'h06a81c1c8818f9;
    stim[5] = 54'h1126a2d6e9797f;
    stim[6] = 54'h00c79bc3d081eb;
    stim[7] = 54'h16a50ff225eeba;
    stim[8] = 54'h095c8c3250a90d;
    stim[9] = 54'h36cca491ef5b0b;
    stim[10] = 54'h16d866902f04c3;
    stim[11] = 54'h13027f01950e52;
    stim[12] = 54'h004b90fc28428b;
    stim[13] = 54'h1d35762aa441f5;
    stim[14] = 54'h044a0a9fe29049;
    stim[15] = 54'h0fa9a91d8be571;
    stim[16] = 54'h0636dc9763a7bf;
    stim[17] = 54'h03835cc030544a;
    stim[18] = 54'h0610633935ba89;
    stim[19] = 54'h15c9ff013e27d2;
    stim[20] = 54'h0fce41fe892ef6;
    stim[21] = 54'h02097a9d6fd775;
    stim[22] = 54'h1593eaa4d8ab70;
    stim[23] = 54'h04df659aa3d9b1;
    stim[24] = 54'h1ce31d696b8e42;
    stim[25] = 54'h14a42fc8b80642;
    stim[26] = 54'h0ac568966f1879;
    stim[27] = 54'h1070dacbb333fb;
    stim[28] = 54'h02831e840d841d;
    stim[29] = 54'h1f27563c925f4b;
    stim[30] = 54'h09ab5a1e66a147;
    stim[31] = 54'h11e2710c687654;
    stim[32] = 54'h0e75aba71471aa;
    stim[33] = 54'h1dec22b5c408a8;
    stim[34] = 54'h08fb71ff6d851e;
    stim[35] = 54'h16a6d29d3e5825;
    stim[36] = 54'h08695ae37733c7;
    stim[37] = 54'h1ae426f8a8ce46;
    stim[38] = 54'h1e47928c60693b;
    stim[39] = 54'h0c748109d58d9d;
    stim[40] = 54'h12c9e4659c933a;
    stim[41] = 54'h032e4c6003546e;
    stim[42] = 54'h16c4be75f13158;
    stim[43] = 54'h0f26bb03b1c0b8;
    stim[44] = 54'h185d3a61ac17ef;
    stim[45] = 54'h0ec470582e8441;
    stim[46] = 54'h094a0bd425f983;
    stim[47] = 54'h04c61c6676394a;
    stim[48] = 54'h02b316ec55b38a;
    stim[49] = 54'h1626334dab0b9a;
    stim[50] = 54'h088561ed7f53ec;
    stim[51] = 54'h0b05095445be6a;
    stim[52] = 54'h06ff4174c1c851;
    stim[53] = 54'h0fda6fc36096d1;
    stim[54] = 54'h1cf715d447088d;
    stim[55] = 54'h17055b510970f5;
    stim[56] = 54'h07a1adc066bd49;
    stim[57] = 54'h088b72d71f0141;
    stim[58] = 54'h19b2926dd1d850;
    stim[59] = 54'h1069832cbb16e0;
    stim[60] = 54'h1cabb328cc5b00;
    stim[61] = 54'h05c9c9108fdce6;
    stim[62] = 54'h1c90d42d5a9479;
    stim[63] = 54'h03e7474da11089;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h1fffffffe;
      expv[2] = 33'h1fffffffe;
      expv[3] = 33'h1fffffffe;
      expv[4] = 33'h08ae68128;
      expv[5] = 33'h08ae68128;
      expv[6] = 33'h08ae68128;
      expv[7] = 33'h187a103d6;
      expv[8] = 33'h1e44bdd74;
      expv[9] = 33'h1e44bdd74;
      expv[10] = 33'h1fffffffe;
      expv[11] = 33'h1fffffffc;
      expv[12] = 33'h0032a1ca4;
      expv[13] = 33'h0032a1ca2;
      expv[14] = 33'h0032a1ca2;
      expv[15] = 33'h0032a1ca0;
      expv[16] = 33'h03b17cae2;
      expv[17] = 33'h03b17cae2;
      expv[18] = 33'h03b17cae2;
      expv[19] = 33'h0726b7512;
      expv[20] = 33'h0027c4fa4;
      expv[21] = 33'h1fd125dec;
      expv[22] = 33'h1fd125dec;
      expv[23] = 33'h1fd125dec;
      expv[24] = 33'h13547b362;
      expv[25] = 33'h0d2d71c84;
      expv[26] = 33'h191700c84;
      expv[27] = 33'h191700c84;
      expv[28] = 33'h191700c84;
      expv[29] = 33'h191700c84;
      expv[30] = 33'h191700c84;
      expv[31] = 33'h191700c82;
      expv[32] = 33'h018d0eca8;
      expv[33] = 33'h14e28e354;
      expv[34] = 33'h14e28e352;
      expv[35] = 33'h1fedb0a3c;
      expv[36] = 33'h1fedb0a3a;
      expv[37] = 33'h1fedb0a3a;
      expv[38] = 33'h1fedb0a3a;
      expv[39] = 33'h1fedb0a3a;
      expv[40] = 33'h013ab1b3a;
      expv[41] = 33'h013ab1b3a;
      expv[42] = 33'h013ab1b38;
      expv[43] = 33'h013ab1b36;
      expv[44] = 33'h007638170;
      expv[45] = 33'h00763816e;
      expv[46] = 33'h00763816e;
      expv[47] = 33'h1a84bf306;
      expv[48] = 33'h1a84bf306;
      expv[49] = 33'h1a84bf306;
      expv[50] = 33'h09b561734;
      expv[51] = 33'h1dafea7d8;
      expv[52] = 33'h0a88b7cd4;
      expv[53] = 33'h0e98390a2;
      expv[54] = 33'h186c12da2;
      expv[55] = 33'h1a88e111a;
      expv[56] = 33'h0a212e1ea;
      expv[57] = 33'h180cd7a92;
      expv[58] = 33'h180cd7a92;
      expv[59] = 33'h180cd7a92;
      expv[60] = 33'h059762dc0;
      expv[61] = 33'h05198b600;
      expv[62] = 33'h0211fb9cc;
      expv[63] = 33'h0211fb9cc;
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
