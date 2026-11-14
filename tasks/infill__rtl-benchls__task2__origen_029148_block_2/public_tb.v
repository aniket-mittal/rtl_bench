// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029148 dut (
    .clk(clk),
    .reset(in_vec[26:26]),
    .clear_error(in_vec[25:25]),
    .ack(in_vec[24:24]),
    .transfer_complete(in_vec[23:23]),
    .rom_data(in_vec[22:0]),
    .data_out(out_vec[29:7]),
    .rom_address(out_vec[6:2]),
    .auto_init_complete(out_vec[1:1]),
    .auto_init_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h7face16;
    stim[1] = 27'h74742ed;
    stim[2] = 27'h25c7839;
    stim[3] = 27'h08221a1;
    stim[4] = 27'h1aa5dc0;
    stim[5] = 27'h3c3b405;
    stim[6] = 27'h2fc4627;
    stim[7] = 27'h038c16d;
    stim[8] = 27'h392e918;
    stim[9] = 27'h130df46;
    stim[10] = 27'h0428191;
    stim[11] = 27'h2173e1f;
    stim[12] = 27'h3da49e2;
    stim[13] = 27'h1ec082c;
    stim[14] = 27'h2f1ad5c;
    stim[15] = 27'h135c9b8;
    stim[16] = 27'h03cc1c6;
    stim[17] = 27'h1295544;
    stim[18] = 27'h302df91;
    stim[19] = 27'h33561df;
    stim[20] = 27'h39a79ab;
    stim[21] = 27'h0bdb46e;
    stim[22] = 27'h30deb08;
    stim[23] = 27'h2190b74;
    stim[24] = 27'h297d516;
    stim[25] = 27'h0ac4a04;
    stim[26] = 27'h3a4d2e9;
    stim[27] = 27'h0a0c50b;
    stim[28] = 27'h13cc222;
    stim[29] = 27'h3520f83;
    stim[30] = 27'h2d4f99e;
    stim[31] = 27'h035f4ac;
    stim[32] = 27'h22c4a11;
    stim[33] = 27'h00d342d;
    stim[34] = 27'h17687b5;
    stim[35] = 27'h2f5cc20;
    stim[36] = 27'h18819cc;
    stim[37] = 27'h3bbee45;
    stim[38] = 27'h05d2d52;
    stim[39] = 27'h3c8de65;
    stim[40] = 27'h1365415;
    stim[41] = 27'h3e41b4f;
    stim[42] = 27'h159709d;
    stim[43] = 27'h0967bd5;
    stim[44] = 27'h2a0359d;
    stim[45] = 27'h3b88046;
    stim[46] = 27'h3acb60d;
    stim[47] = 27'h0d4ff3f;
    stim[48] = 27'h27b8a4f;
    stim[49] = 27'h1aa7387;
    stim[50] = 27'h26c78b4;
    stim[51] = 27'h1c21605;
    stim[52] = 27'h288d30a;
    stim[53] = 27'h1cec146;
    stim[54] = 27'h251fc6b;
    stim[55] = 27'h2c47127;
    stim[56] = 27'h01d5a17;
    stim[57] = 27'h03d2157;
    stim[58] = 27'h2240b1a;
    stim[59] = 27'h1b670c6;
    stim[60] = 27'h1068f29;
    stim[61] = 27'h1e866ca;
    stim[62] = 27'h2d3e9d7;
    stim[63] = 27'h0b90c66;
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
      expv[0] = 30'h00000000;
      expv[1] = 30'h00000000;
      expv[2] = 30'h00000000;
      expv[3] = 30'h2e3c1c80;
      expv[4] = 30'h0110d084;
      expv[5] = 30'h152ee008;
      expv[6] = 30'h21da028c;
      expv[7] = 30'h3e231390;
      expv[8] = 30'h1c60b690;
      expv[9] = 30'h09748c14;
      expv[10] = 30'h186fa315;
      expv[11] = 30'h186fa315;
      expv[12] = 30'h186fa314;
      expv[13] = 30'h2d24f114;
      expv[14] = 30'h36041618;
      expv[15] = 30'h38d6ae1c;
      expv[16] = 30'h1ae4dc1d;
      expv[17] = 30'h1ae4dc1d;
      expv[18] = 30'h1ae4dc1d;
      expv[19] = 30'h1ae4dc1c;
      expv[20] = 30'h1ab0ef9c;
      expv[21] = 30'h0d3cd5a0;
      expv[22] = 30'h1eda3724;
      expv[23] = 30'h06f58425;
      expv[24] = 30'h06f58424;
      expv[25] = 30'h0bea8b24;
      expv[26] = 30'h16250228;
      expv[27] = 30'h126974ac;
      expv[28] = 30'h106285b0;
      expv[29] = 30'h1e611131;
      expv[30] = 30'h1e611130;
      expv[31] = 30'h2a7ccf30;
      expv[32] = 30'h1afa5630;
      expv[33] = 30'h162508b0;
      expv[34] = 30'h069a16b0;
      expv[35] = 30'h3b43dab1;
      expv[36] = 30'h3b43dab0;
      expv[37] = 30'h040ce630;
      expv[38] = 30'h1df722b4;
      expv[39] = 30'h2e96a934;
      expv[40] = 30'h246f32b8;
      expv[41] = 30'h1b2a0ab9;
      expv[42] = 30'h1b2a0ab8;
      expv[43] = 30'h2cb84eb8;
      expv[44] = 30'h0b3deabc;
      expv[45] = 30'h101acec0;
      expv[46] = 30'h1c402344;
      expv[47] = 30'h165b06c8;
      expv[48] = 30'h2a7f9fcc;
      expv[49] = 30'h3dc527cc;
      expv[50] = 30'h1539c3d0;
      expv[51] = 30'h363c5a50;
      expv[52] = 30'h210b02d4;
      expv[53] = 30'h04698558;
      expv[54] = 30'h2760a35c;
      expv[55] = 30'h28fe35dc;
      expv[56] = 30'h223893e0;
      expv[57] = 30'h0ead0be0;
      expv[58] = 30'h1e90abe0;
      expv[59] = 30'h12058d60;
      expv[60] = 30'h1b386364;
      expv[61] = 30'h034794e5;
      expv[62] = 30'h034794e5;
      expv[63] = 30'h034794e4;
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
