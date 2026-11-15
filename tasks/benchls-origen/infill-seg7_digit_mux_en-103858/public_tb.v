// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103858 dut (
    .data_7(in_vec[34:31]),
    .data_6(in_vec[30:27]),
    .data_5(in_vec[26:23]),
    .data_4(in_vec[22:19]),
    .data_3(in_vec[18:15]),
    .data_2(in_vec[14:11]),
    .data_1(in_vec[10:7]),
    .data_0(in_vec[6:3]),
    .counter(in_vec[2:0]),
    .anodos(out_vec[11:4]),
    .DIG(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h383bd8a5b;
    stim[1] = 35'h13c6e541b;
    stim[2] = 35'h28c015d0f;
    stim[3] = 35'h3c74e8c61;
    stim[4] = 35'h2657fb104;
    stim[5] = 35'h38a7e0adf;
    stim[6] = 35'h147f5234c;
    stim[7] = 35'h1c703d29f;
    stim[8] = 35'h20736454e;
    stim[9] = 35'h1ec0aeb8f;
    stim[10] = 35'h6c52d685c;
    stim[11] = 35'h63a8051ef;
    stim[12] = 35'h1c55d4a67;
    stim[13] = 35'h6d77d1fb2;
    stim[14] = 35'h25fd77738;
    stim[15] = 35'h0c4842b0d;
    stim[16] = 35'h1216c2168;
    stim[17] = 35'h212e67751;
    stim[18] = 35'h23c1cc953;
    stim[19] = 35'h700cccce1;
    stim[20] = 35'h698b0f5b7;
    stim[21] = 35'h2babd7339;
    stim[22] = 35'h22f24422c;
    stim[23] = 35'h3f00d8bf5;
    stim[24] = 35'h1f92d9527;
    stim[25] = 35'h2ac425431;
    stim[26] = 35'h1b5c3109c;
    stim[27] = 35'h6d8daf1be;
    stim[28] = 35'h14b352e99;
    stim[29] = 35'h067ee55bb;
    stim[30] = 35'h1d5af6cb7;
    stim[31] = 35'h1cb024c60;
    stim[32] = 35'h57c31e891;
    stim[33] = 35'h6129f61f2;
    stim[34] = 35'h7a26b6e7e;
    stim[35] = 35'h05eb82e22;
    stim[36] = 35'h558c328f5;
    stim[37] = 35'h0b995bc7d;
    stim[38] = 35'h3e831ef12;
    stim[39] = 35'h0db16e995;
    stim[40] = 35'h732430897;
    stim[41] = 35'h47da7e0c2;
    stim[42] = 35'h7e3915f53;
    stim[43] = 35'h19a3012ae;
    stim[44] = 35'h49436f5ab;
    stim[45] = 35'h343a76fa3;
    stim[46] = 35'h1e4aeb956;
    stim[47] = 35'h41c397a3d;
    stim[48] = 35'h0b6f8e3e1;
    stim[49] = 35'h03b6c7624;
    stim[50] = 35'h692694456;
    stim[51] = 35'h73f222f8b;
    stim[52] = 35'h43014dbe0;
    stim[53] = 35'h2eceed243;
    stim[54] = 35'h3b7fb557f;
    stim[55] = 35'h700e8feeb;
    stim[56] = 35'h683873d1f;
    stim[57] = 35'h2acb7bfa5;
    stim[58] = 35'h3aafeff08;
    stim[59] = 35'h243c8e920;
    stim[60] = 35'h6d38064f3;
    stim[61] = 35'h696448bee;
    stim[62] = 35'h1459bb3e5;
    stim[63] = 35'h1e165ff5e;
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
      expv[0] = 12'hff0;
      expv[1] = 12'hff0;
      expv[2] = 12'hff0;
      expv[3] = 12'hfd8;
      expv[4] = 12'hff0;
      expv[5] = 12'hff0;
      expv[6] = 12'hff0;
      expv[7] = 12'hff0;
      expv[8] = 12'hff0;
      expv[9] = 12'hff0;
      expv[10] = 12'hff0;
      expv[11] = 12'hff0;
      expv[12] = 12'hff0;
      expv[13] = 12'hff0;
      expv[14] = 12'hfe7;
      expv[15] = 12'hff0;
      expv[16] = 12'hfed;
      expv[17] = 12'hfde;
      expv[18] = 12'hff0;
      expv[19] = 12'hfd9;
      expv[20] = 12'hff0;
      expv[21] = 12'hfd6;
      expv[22] = 12'hff0;
      expv[23] = 12'hff0;
      expv[24] = 12'hff0;
      expv[25] = 12'hfd8;
      expv[26] = 12'hff0;
      expv[27] = 12'hff0;
      expv[28] = 12'hfdd;
      expv[29] = 12'hff0;
      expv[30] = 12'hff0;
      expv[31] = 12'hfec;
      expv[32] = 12'hfd1;
      expv[33] = 12'hff0;
      expv[34] = 12'hff0;
      expv[35] = 12'hff0;
      expv[36] = 12'hff0;
      expv[37] = 12'hff0;
      expv[38] = 12'hff0;
      expv[39] = 12'hff0;
      expv[40] = 12'hff0;
      expv[41] = 12'hff0;
      expv[42] = 12'hff0;
      expv[43] = 12'hff0;
      expv[44] = 12'hff0;
      expv[45] = 12'hff0;
      expv[46] = 12'hff0;
      expv[47] = 12'hff0;
      expv[48] = 12'hfd7;
      expv[49] = 12'hff0;
      expv[50] = 12'hff0;
      expv[51] = 12'hff0;
      expv[52] = 12'hfec;
      expv[53] = 12'hff0;
      expv[54] = 12'hff0;
      expv[55] = 12'hff0;
      expv[56] = 12'hff0;
      expv[57] = 12'hff0;
      expv[58] = 12'hfe1;
      expv[59] = 12'hfe4;
      expv[60] = 12'hff0;
      expv[61] = 12'hff0;
      expv[62] = 12'hff0;
      expv[63] = 12'hff0;
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
