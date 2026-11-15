// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005796 dut (
    .clk(clk),
    .reset(in_vec[53:53]),
    .reg1(in_vec[52:48]),
    .reg2(in_vec[47:43]),
    .write_reg(in_vec[42:38]),
    .write_data(in_vec[37:6]),
    .write(in_vec[5:5]),
    .load(in_vec[4:4]),
    .store(in_vec[3:3]),
    .funct3(in_vec[2:0]),
    .read1(out_vec[63:32]),
    .read2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h25980c518439e4;
    stim[1] = 54'h30b58e441fc39b;
    stim[2] = 54'h05b3e7236dbd5e;
    stim[3] = 54'h0bd16d6cdda34d;
    stim[4] = 54'h0978d902e9ea68;
    stim[5] = 54'h177a6d64731afd;
    stim[6] = 54'h1a8eb9817f75f5;
    stim[7] = 54'h070951b0a2bfd0;
    stim[8] = 54'h1988cbbf233c76;
    stim[9] = 54'h02ef93ce985b91;
    stim[10] = 54'h0ed9e10e809da2;
    stim[11] = 54'h18dadc13bb97d4;
    stim[12] = 54'h076ffe5f503e01;
    stim[13] = 54'h08fe55ec6c2005;
    stim[14] = 54'h169928d4d367b3;
    stim[15] = 54'h1ce3d89d269da1;
    stim[16] = 54'h024dffe806927f;
    stim[17] = 54'h022c79d0faa35b;
    stim[18] = 54'h1047b495008f5f;
    stim[19] = 54'h1449186914a42a;
    stim[20] = 54'h0af5bbdfc39174;
    stim[21] = 54'h0908c3064eea52;
    stim[22] = 54'h12c36a25e6b597;
    stim[23] = 54'h0ae3763e572ebe;
    stim[24] = 54'h08f89adeb9846a;
    stim[25] = 54'h1e3cbe61914236;
    stim[26] = 54'h1ee1c4cb2a4449;
    stim[27] = 54'h0d97d1735da267;
    stim[28] = 54'h14b7ac50e9c503;
    stim[29] = 54'h0b96d25037b09b;
    stim[30] = 54'h0ea450ce1b5960;
    stim[31] = 54'h1a75adde0d6549;
    stim[32] = 54'h045dadce3fdd4d;
    stim[33] = 54'h0858494f242e4e;
    stim[34] = 54'h10d6ae7ffcdc77;
    stim[35] = 54'h125eadffd26075;
    stim[36] = 54'h0f49301ad12cd3;
    stim[37] = 54'h2d71a27628c3a4;
    stim[38] = 54'h03e6c9640f409c;
    stim[39] = 54'h04d7fba29f7bb4;
    stim[40] = 54'h041945e086be44;
    stim[41] = 54'h1837243cc9d3e9;
    stim[42] = 54'h1c2a6c82715004;
    stim[43] = 54'h143bdebfb657d7;
    stim[44] = 54'h1f1f82048ea345;
    stim[45] = 54'h1292daddb9bc4f;
    stim[46] = 54'h0b4a4d04a1a69a;
    stim[47] = 54'h145e5bc8301b3b;
    stim[48] = 54'h1971521139297a;
    stim[49] = 54'h08f5c59d138684;
    stim[50] = 54'h12fa92c1a033a1;
    stim[51] = 54'h05ae49ca22a4fb;
    stim[52] = 54'h122bc7bfef96f0;
    stim[53] = 54'h05c4522e974695;
    stim[54] = 54'h0c00759b5ee4bf;
    stim[55] = 54'h1bb3760b253df3;
    stim[56] = 54'h078212930e44ec;
    stim[57] = 54'h1e0ee8388fd7c1;
    stim[58] = 54'h0777bac6e38177;
    stim[59] = 54'h190b0b2c191e25;
    stim[60] = 54'h04626db2e4aaa3;
    stim[61] = 54'h016e0df7b05819;
    stim[62] = 54'h125b19e697806a;
    stim[63] = 54'h05497735791f35;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h843a027600000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h000000000000cc6b;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h000000000000cc6b;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000cc6b00000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h00000000843a0276;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'hd8f95cbaf9864508;
      expv[29] = 64'h0000000000000045;
      expv[30] = 64'h00000000f9864508;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000fdd700000000;
      expv[33] = 64'h61a4529000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h000000000000fdd7;
      expv[36] = 64'hf986450800000000;
      expv[37] = 64'h62749a760000cc6b;
      expv[38] = 64'h62749a760000cc6b;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h90f3274f00000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h000000ee00000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h6f20c06c00000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h00000000000000ee;
      expv[52] = 64'h4844e4a500000000;
      expv[53] = 64'h000000004844e4a5;
      expv[54] = 64'h4844e4a500000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h00000000d66d7b92;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h27288a93d66d7b92;
      expv[61] = 64'h000000002cb06478;
      expv[62] = 64'hd66d7b92ffff94f7;
      expv[63] = 64'h0000000000000000;
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
