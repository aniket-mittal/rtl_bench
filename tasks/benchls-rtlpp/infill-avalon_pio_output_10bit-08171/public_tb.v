// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08171 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[41:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h11321b3bc1;
    stim[1] = 37'h1921f10f3f;
    stim[2] = 37'h025fd4d3dd;
    stim[3] = 37'h0e20295680;
    stim[4] = 37'h1b273a4cae;
    stim[5] = 37'h1bc0eb6616;
    stim[6] = 37'h0779eb9e75;
    stim[7] = 37'h0b66ac6337;
    stim[8] = 37'h02db2f85bd;
    stim[9] = 37'h1ede7c90cc;
    stim[10] = 37'h0a28efb64f;
    stim[11] = 37'h12d8f62e99;
    stim[12] = 37'h0f2565e414;
    stim[13] = 37'h136c38a412;
    stim[14] = 37'h16a0ea0915;
    stim[15] = 37'h0a2e3c056c;
    stim[16] = 37'h0aafbe8284;
    stim[17] = 37'h0b081b4c51;
    stim[18] = 37'h0ab7570cc0;
    stim[19] = 37'h1acda0265c;
    stim[20] = 37'h12c5b49c71;
    stim[21] = 37'h07f1daf2c9;
    stim[22] = 37'h0b743a56a1;
    stim[23] = 37'h06fe0fd145;
    stim[24] = 37'h12f76371e8;
    stim[25] = 37'h12d77eb767;
    stim[26] = 37'h0675f34304;
    stim[27] = 37'h13aab7c9f6;
    stim[28] = 37'h179f65c8c5;
    stim[29] = 37'h0f47347fd7;
    stim[30] = 37'h0afb89bf52;
    stim[31] = 37'h0660c15057;
    stim[32] = 37'h0f39b09dc6;
    stim[33] = 37'h0adb4d0819;
    stim[34] = 37'h1ab9499b04;
    stim[35] = 37'h06cb6064a5;
    stim[36] = 37'h06d6aec09f;
    stim[37] = 37'h122799dfc2;
    stim[38] = 37'h1f0403c847;
    stim[39] = 37'h0652430c51;
    stim[40] = 37'h031e196765;
    stim[41] = 37'h0fa7e26ccc;
    stim[42] = 37'h12dd417b7c;
    stim[43] = 37'h0ffaf1dfde;
    stim[44] = 37'h0a162dc0c5;
    stim[45] = 37'h02574efbba;
    stim[46] = 37'h0fe5678ecb;
    stim[47] = 37'h169299b6b8;
    stim[48] = 37'h122f678fc9;
    stim[49] = 37'h06b9662b71;
    stim[50] = 37'h133b563b63;
    stim[51] = 37'h13e11cff07;
    stim[52] = 37'h0300302c1f;
    stim[53] = 37'h0f79ecf852;
    stim[54] = 37'h0aaa6583d1;
    stim[55] = 37'h0f870b6b2a;
    stim[56] = 37'h023cbd278a;
    stim[57] = 37'h12fec25806;
    stim[58] = 37'h0f0cca8e68;
    stim[59] = 37'h16aa48b969;
    stim[60] = 37'h106f0c07c0;
    stim[61] = 37'h134bd0c961;
    stim[62] = 37'h1a78a64c93;
    stim[63] = 37'h0f5137f374;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00000000000;
      expv[16] = 42'h00000000000;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h14500000000;
      expv[25] = 42'h14500000000;
      expv[26] = 42'h14500000145;
      expv[27] = 42'h30400000000;
      expv[28] = 42'h30400000000;
      expv[29] = 42'h30400000000;
      expv[30] = 42'h30400000000;
      expv[31] = 42'h30400000304;
      expv[32] = 42'h05700000000;
      expv[33] = 42'h05700000000;
      expv[34] = 42'h05700000000;
      expv[35] = 42'h05700000057;
      expv[36] = 42'h0a5000000a5;
      expv[37] = 42'h09f00000000;
      expv[38] = 42'h09f00000000;
      expv[39] = 42'h09f0000009f;
      expv[40] = 42'h05100000051;
      expv[41] = 42'h05100000000;
      expv[42] = 42'h05100000000;
      expv[43] = 42'h05100000000;
      expv[44] = 42'h05100000000;
      expv[45] = 42'h05100000051;
      expv[46] = 42'h05100000000;
      expv[47] = 42'h05100000000;
      expv[48] = 42'h05100000000;
      expv[49] = 42'h05100000051;
      expv[50] = 42'h37100000000;
      expv[51] = 42'h37100000000;
      expv[52] = 42'h37100000371;
      expv[53] = 42'h37100000000;
      expv[54] = 42'h37100000000;
      expv[55] = 42'h37100000000;
      expv[56] = 42'h37100000371;
      expv[57] = 42'h37100000000;
      expv[58] = 42'h37100000000;
      expv[59] = 42'h37100000000;
      expv[60] = 42'h00000000000;
      expv[61] = 42'h00000000000;
      expv[62] = 42'h00000000000;
      expv[63] = 42'h00000000000;
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
