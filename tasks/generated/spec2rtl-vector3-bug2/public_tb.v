// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3c29ff9c;
    stim[1] = 30'h018fe52b;
    stim[2] = 30'h009a116a;
    stim[3] = 30'h28de97f7;
    stim[4] = 30'h2f7258c9;
    stim[5] = 30'h3dff887f;
    stim[6] = 30'h2016a8e2;
    stim[7] = 30'h16a2f0fd;
    stim[8] = 30'h3ba6a007;
    stim[9] = 30'h36e12b13;
    stim[10] = 30'h3c451379;
    stim[11] = 30'h0b2635a6;
    stim[12] = 30'h0872a366;
    stim[13] = 30'h0a9dc6b6;
    stim[14] = 30'h3e8dcc71;
    stim[15] = 30'h399b5ac6;
    stim[16] = 30'h3e29d6a7;
    stim[17] = 30'h1e049ebf;
    stim[18] = 30'h28f842b3;
    stim[19] = 30'h1ca99164;
    stim[20] = 30'h203ce0ae;
    stim[21] = 30'h3e572d36;
    stim[22] = 30'h30e57cbf;
    stim[23] = 30'h31dd7af6;
    stim[24] = 30'h0217c98c;
    stim[25] = 30'h038f2b78;
    stim[26] = 30'h168fe5ef;
    stim[27] = 30'h39361119;
    stim[28] = 30'h05c15a5c;
    stim[29] = 30'h06ecf31b;
    stim[30] = 30'h2f2098be;
    stim[31] = 30'h29d6352b;
    stim[32] = 30'h3f4348a6;
    stim[33] = 30'h33405e3a;
    stim[34] = 30'h204c7cf1;
    stim[35] = 30'h2844eb91;
    stim[36] = 30'h3264abdc;
    stim[37] = 30'h3673ce90;
    stim[38] = 30'h14eff163;
    stim[39] = 30'h07f93c1e;
    stim[40] = 30'h359bc1ce;
    stim[41] = 30'h2f375af0;
    stim[42] = 30'h2da78c3a;
    stim[43] = 30'h1c376a11;
    stim[44] = 30'h3c8a3791;
    stim[45] = 30'h239e04f3;
    stim[46] = 30'h22753d64;
    stim[47] = 30'h1c416e3d;
    stim[48] = 30'h249f635a;
    stim[49] = 30'h34919adf;
    stim[50] = 30'h1aa3b896;
    stim[51] = 30'h384f7257;
    stim[52] = 30'h2e023865;
    stim[53] = 30'h302c94d8;
    stim[54] = 30'h3d95698c;
    stim[55] = 30'h15398d9e;
    stim[56] = 30'h092ef3e0;
    stim[57] = 30'h0695bcc5;
    stim[58] = 30'h3d370390;
    stim[59] = 30'h39eaec91;
    stim[60] = 30'h1720769b;
    stim[61] = 30'h3144c82c;
    stim[62] = 30'h0486d28f;
    stim[63] = 30'h0acf11c0;
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
      expv[0] = 32'hf0a7cff3;
      expv[1] = 32'h063e9caf;
      expv[2] = 32'h0268b22b;
      expv[3] = 32'ha37bf2df;
      expv[4] = 32'hbdc86b27;
      expv[5] = 32'hf7fe317f;
      expv[6] = 32'h805a750b;
      expv[7] = 32'h5a8a7e77;
      expv[8] = 32'hee9a041f;
      expv[9] = 32'hdb85854f;
      expv[10] = 32'hf115b267;
      expv[11] = 32'h2c98d69b;
      expv[12] = 32'h21cbb41b;
      expv[13] = 32'h2a7758db;
      expv[14] = 32'hfa3639c7;
      expv[15] = 32'he66d6b1b;
      expv[16] = 32'hf8a75a9f;
      expv[17] = 32'h781353ff;
      expv[18] = 32'ha3e1584f;
      expv[19] = 32'h72a6b213;
      expv[20] = 32'h80f25c3b;
      expv[21] = 32'hf95c95db;
      expv[22] = 32'hc3945fff;
      expv[23] = 32'hc7757f5b;
      expv[24] = 32'h085ec933;
      expv[25] = 32'h0e3db563;
      expv[26] = 32'h5a3efcbf;
      expv[27] = 32'he4d88267;
      expv[28] = 32'h17052b73;
      expv[29] = 32'h1bb38e6f;
      expv[30] = 32'hbc82537b;
      expv[31] = 32'ha75896af;
      expv[32] = 32'hfd0c591b;
      expv[33] = 32'hcd011beb;
      expv[34] = 32'h81307fc7;
      expv[35] = 32'ha113cd47;
      expv[36] = 32'hc993e573;
      expv[37] = 32'hd9cf49c3;
      expv[38] = 32'h53bebe0f;
      expv[39] = 32'h1fe407fb;
      expv[40] = 32'hd66ee83b;
      expv[41] = 32'hbcdd7b43;
      expv[42] = 32'hb69e11eb;
      expv[43] = 32'h70dd0d47;
      expv[44] = 32'hf229c6c7;
      expv[45] = 32'h8e7870cf;
      expv[46] = 32'h89d4b793;
      expv[47] = 32'h71051df7;
      expv[48] = 32'h927dac6b;
      expv[49] = 32'hd247637f;
      expv[50] = 32'h6a8e475b;
      expv[51] = 32'he13d2e5f;
      expv[52] = 32'hb8083717;
      expv[53] = 32'hc0b262e3;
      expv[54] = 32'hf654cd33;
      expv[55] = 32'h54e6c1fb;
      expv[56] = 32'h24bbfe03;
      expv[57] = 32'h1a566797;
      expv[58] = 32'hf4ddc043;
      expv[59] = 32'he7aa4dc7;
      expv[60] = 32'h5c814eef;
      expv[61] = 32'hc5121933;
      expv[62] = 32'h121b4a3f;
      expv[63] = 32'h2b3ce203;
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
