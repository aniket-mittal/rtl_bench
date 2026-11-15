// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062550 dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .din(in_vec[34:3]),
    .din_last(in_vec[2:2]),
    .din_valid(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[34:34]),
    .dout(out_vec[33:2]),
    .dout_last(out_vec[1:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha3da2c271;
    stim[1] = 36'hc6570d5f4;
    stim[2] = 36'h4467c7c99;
    stim[3] = 36'h68bae8503;
    stim[4] = 36'h7f2045353;
    stim[5] = 36'h6a08f793f;
    stim[6] = 36'h10a135b45;
    stim[7] = 36'h5dfbbf6f1;
    stim[8] = 36'h4c765c355;
    stim[9] = 36'h7e60377b2;
    stim[10] = 36'h455adcdfc;
    stim[11] = 36'h5b0fd8d0d;
    stim[12] = 36'h2e2832408;
    stim[13] = 36'h13859f5d7;
    stim[14] = 36'h0e43f33f7;
    stim[15] = 36'h5b7558f4b;
    stim[16] = 36'h26733b2a7;
    stim[17] = 36'h6855ed287;
    stim[18] = 36'h26a39126a;
    stim[19] = 36'h0a8a7fc15;
    stim[20] = 36'h263e70461;
    stim[21] = 36'h0fd48932f;
    stim[22] = 36'hbe95aa9c0;
    stim[23] = 36'h68e2f0a0d;
    stim[24] = 36'h55453b202;
    stim[25] = 36'h7b1d1ac55;
    stim[26] = 36'h73cbdc318;
    stim[27] = 36'h68e20b981;
    stim[28] = 36'h0bd241d6a;
    stim[29] = 36'h6432686e9;
    stim[30] = 36'h2c555b5f5;
    stim[31] = 36'h5de2584e9;
    stim[32] = 36'h44ebfff50;
    stim[33] = 36'h0c1d217b9;
    stim[34] = 36'h7284b5d8d;
    stim[35] = 36'h7501d2579;
    stim[36] = 36'h52fc3e21e;
    stim[37] = 36'h22cbaebb5;
    stim[38] = 36'h294cb5c41;
    stim[39] = 36'h3e9a0033e;
    stim[40] = 36'h2d7d27f64;
    stim[41] = 36'h3544fc6ec;
    stim[42] = 36'h435cdea97;
    stim[43] = 36'h7e91d3d87;
    stim[44] = 36'h76fc88701;
    stim[45] = 36'h49f63d034;
    stim[46] = 36'h2c3c6a520;
    stim[47] = 36'h22af264a5;
    stim[48] = 36'h102dae639;
    stim[49] = 36'h25673ec2e;
    stim[50] = 36'h775100cf7;
    stim[51] = 36'h54f66f85d;
    stim[52] = 36'h0d4bdede3;
    stim[53] = 36'h105bb5b4d;
    stim[54] = 36'h63b98764b;
    stim[55] = 36'h15f405289;
    stim[56] = 36'h6532cfefd;
    stim[57] = 36'h39efcd60e;
    stim[58] = 36'h793232b9a;
    stim[59] = 36'h31a550dce;
    stim[60] = 36'h3cd72a78d;
    stim[61] = 36'h38847ac52;
    stim[62] = 36'h0919fe45a;
    stim[63] = 36'h2ffb325c0;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h400000000;
      expv[2] = 35'h400000000;
      expv[3] = 35'h400000000;
      expv[4] = 35'h745d74281;
      expv[5] = 35'h7f90229a9;
      expv[6] = 35'h75047bc9f;
      expv[7] = 35'h75047bc9e;
      expv[8] = 35'h75047bc9e;
      expv[9] = 35'h75047bc9e;
      expv[10] = 35'h3f301bbd9;
      expv[11] = 35'h7f301bbd9;
      expv[12] = 35'h7f301bbd8;
      expv[13] = 35'h7f301bbd8;
      expv[14] = 35'h49c2cfaeb;
      expv[15] = 35'h4721f99fb;
      expv[16] = 35'h6dbaac7a5;
      expv[17] = 35'h53399d953;
      expv[18] = 35'h342af6943;
      expv[19] = 35'h742af6943;
      expv[20] = 35'h742af6942;
      expv[21] = 35'h742af6942;
      expv[22] = 35'h07ea44997;
      expv[23] = 35'h400000000;
      expv[24] = 35'h400000000;
      expv[25] = 35'h6aa29d901;
      expv[26] = 35'h6aa29d900;
      expv[27] = 35'h6aa29d900;
      expv[28] = 35'h6aa29d900;
      expv[29] = 35'h45e920eb5;
      expv[30] = 35'h45e920eb4;
      expv[31] = 35'h45e920eb4;
      expv[32] = 35'h45e920eb4;
      expv[33] = 35'h45e920eb4;
      expv[34] = 35'h45e920eb4;
      expv[35] = 35'h45e920eb4;
      expv[36] = 35'h45e920eb4;
      expv[37] = 35'h697e1f10f;
      expv[38] = 35'h697e1f10e;
      expv[39] = 35'h697e1f10e;
      expv[40] = 35'h1f4d0019f;
      expv[41] = 35'h1f4d0019f;
      expv[42] = 35'h5f4d0019f;
      expv[43] = 35'h61ae6f54b;
      expv[44] = 35'h7f48e9ec3;
      expv[45] = 35'h7f48e9ec2;
      expv[46] = 35'h7f48e9ec2;
      expv[47] = 35'h7f48e9ec2;
      expv[48] = 35'h7f48e9ec2;
      expv[49] = 35'h7f48e9ec2;
      expv[50] = 35'h52b39f617;
      expv[51] = 35'h7ba88067b;
      expv[52] = 35'h7ba88067a;
      expv[53] = 35'h46a5ef6f1;
      expv[54] = 35'h46a5ef6f0;
      expv[55] = 35'h71dcc3b25;
      expv[56] = 35'h71dcc3b24;
      expv[57] = 35'h71dcc3b24;
      expv[58] = 35'h1cf7e6b07;
      expv[59] = 35'h1cf7e6b07;
      expv[60] = 35'h5cf7e6b07;
      expv[61] = 35'h5cf7e6b06;
      expv[62] = 35'h1c423d629;
      expv[63] = 35'h1c423d629;
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
