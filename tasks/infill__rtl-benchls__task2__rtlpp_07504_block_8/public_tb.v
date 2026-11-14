// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07504 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .sample_clk_en(in_vec[17:17]),
    .fnum(in_vec[16:9]),
    .mult(in_vec[8:5]),
    .block(in_vec[4:2]),
    .vib(in_vec[1:1]),
    .dvb(in_vec[0:0]),
    .phase_inc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h420af;
    stim[1] = 19'h6c71f;
    stim[2] = 19'h229ac;
    stim[3] = 19'h0cf29;
    stim[4] = 19'h34172;
    stim[5] = 19'h28f37;
    stim[6] = 19'h03d70;
    stim[7] = 19'h02495;
    stim[8] = 19'h3d9c9;
    stim[9] = 19'h03068;
    stim[10] = 19'h1dd03;
    stim[11] = 19'h3e2dd;
    stim[12] = 19'h06481;
    stim[13] = 19'h36a8b;
    stim[14] = 19'h202a8;
    stim[15] = 19'h3af58;
    stim[16] = 19'h3737c;
    stim[17] = 19'h0d318;
    stim[18] = 19'h3a13f;
    stim[19] = 19'h1c8fe;
    stim[20] = 19'h17b6c;
    stim[21] = 19'h28563;
    stim[22] = 19'h26b78;
    stim[23] = 19'h3ec85;
    stim[24] = 19'h2017e;
    stim[25] = 19'h115fb;
    stim[26] = 19'h25ed8;
    stim[27] = 19'h0e645;
    stim[28] = 19'h150d0;
    stim[29] = 19'h18ca6;
    stim[30] = 19'h24990;
    stim[31] = 19'h1f2ed;
    stim[32] = 19'h30473;
    stim[33] = 19'h00418;
    stim[34] = 19'h27d04;
    stim[35] = 19'h35bb3;
    stim[36] = 19'h05de7;
    stim[37] = 19'h2c15e;
    stim[38] = 19'h2913c;
    stim[39] = 19'h0e184;
    stim[40] = 19'h03d15;
    stim[41] = 19'h10ec6;
    stim[42] = 19'h22f90;
    stim[43] = 19'h0c943;
    stim[44] = 19'h187fb;
    stim[45] = 19'h14b7e;
    stim[46] = 19'h33896;
    stim[47] = 19'h31c02;
    stim[48] = 19'h37a20;
    stim[49] = 19'h0f8a8;
    stim[50] = 19'h3a673;
    stim[51] = 19'h1efe9;
    stim[52] = 19'h25226;
    stim[53] = 19'h1bb29;
    stim[54] = 19'h2bf50;
    stim[55] = 19'h224bb;
    stim[56] = 19'h1f3a6;
    stim[57] = 19'h1e06c;
    stim[58] = 19'h15a69;
    stim[59] = 19'h1bc79;
    stim[60] = 19'h1e397;
    stim[61] = 19'h190aa;
    stim[62] = 19'h2c198;
    stim[63] = 19'h0c4ef;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'hfd80;
      expv[4] = 16'hf4bc;
      expv[5] = 16'hc400;
      expv[6] = 16'hc1e0;
      expv[7] = 16'hf4c0;
      expv[8] = 16'h0900;
      expv[9] = 16'hfc50;
      expv[10] = 16'h0120;
      expv[11] = 16'hf890;
      expv[12] = 16'hd300;
      expv[13] = 16'h00c8;
      expv[14] = 16'h0b50;
      expv[15] = 16'h0014;
      expv[16] = 16'hbd80;
      expv[17] = 16'hd500;
      expv[18] = 16'h2e00;
      expv[19] = 16'h2800;
      expv[20] = 16'h1e00;
      expv[21] = 16'hdc90;
      expv[22] = 16'hfe74;
      expv[23] = 16'hb080;
      expv[24] = 16'h07b0;
      expv[25] = 16'h0000;
      expv[26] = 16'hdd80;
      expv[27] = 16'h4680;
      expv[28] = 16'h01cc;
      expv[29] = 16'h3f00;
      expv[30] = 16'h07bc;
      expv[31] = 16'hf700;
      expv[32] = 16'h3678;
      expv[33] = 16'h1860;
      expv[34] = 16'h0040;
      expv[35] = 16'hfc20;
      expv[36] = 16'hd4c0;
      expv[37] = 16'hffa4;
      expv[38] = 16'he000;
      expv[39] = 16'h0400;
      expv[40] = 16'hfc80;
      expv[41] = 16'he200;
      expv[42] = 16'h0654;
      expv[43] = 16'hfa40;
      expv[44] = 16'hfda8;
      expv[45] = 16'hcf40;
      expv[46] = 16'h1100;
      expv[47] = 16'h4e00;
      expv[48] = 16'h0047;
      expv[49] = 16'h00bd;
      expv[50] = 16'h09b0;
      expv[51] = 16'h2790;
      expv[52] = 16'hfc24;
      expv[53] = 16'h0052;
      expv[54] = 16'he7d4;
      expv[55] = 16'hdc60;
      expv[56] = 16'h1680;
      expv[57] = 16'hf838;
      expv[58] = 16'h1680;
      expv[59] = 16'h081c;
      expv[60] = 16'ha680;
      expv[61] = 16'h8780;
      expv[62] = 16'h0fa0;
      expv[63] = 16'ha000;
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
