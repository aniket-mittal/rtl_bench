// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144870 dut (
    .CLK1(clk),
    .A1ADDR(in_vec[42:38]),
    .A1DATA(in_vec[37:6]),
    .A1EN(in_vec[5:5]),
    .B1ADDR(in_vec[4:0]),
    .B1DATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h62508b09115;
    stim[1] = 43'h190fc8bb3ff;
    stim[2] = 43'h0afe4f4dfc7;
    stim[3] = 43'h4308a7a1682;
    stim[4] = 43'h30a8bb2cd1f;
    stim[5] = 43'h580b50256b8;
    stim[6] = 43'h138cc802591;
    stim[7] = 43'h3ade462a124;
    stim[8] = 43'h2588fd1300c;
    stim[9] = 43'h7ab99da8e4e;
    stim[10] = 43'h70e42095892;
    stim[11] = 43'h58a97fa3c14;
    stim[12] = 43'h70b32e8ab29;
    stim[13] = 43'h195084bbf88;
    stim[14] = 43'h576601fb646;
    stim[15] = 43'h5a6bcaef369;
    stim[16] = 43'h2be1da67b6f;
    stim[17] = 43'h4bd0eecdfbc;
    stim[18] = 43'h37d485db463;
    stim[19] = 43'h16e0ff2c45b;
    stim[20] = 43'h4cb972a55c1;
    stim[21] = 43'h581bb726538;
    stim[22] = 43'h06d78638da8;
    stim[23] = 43'h0981ea4ced0;
    stim[24] = 43'h689ad7406c8;
    stim[25] = 43'h3455a180133;
    stim[26] = 43'h265d507c002;
    stim[27] = 43'h10d5e59a109;
    stim[28] = 43'h5452ff33e8e;
    stim[29] = 43'h2298ff3f09b;
    stim[30] = 43'h5643001b3fa;
    stim[31] = 43'h7ac26069e98;
    stim[32] = 43'h76b2a2e98f2;
    stim[33] = 43'h77fd1d21dd7;
    stim[34] = 43'h6188e19d3d8;
    stim[35] = 43'h25164f857c7;
    stim[36] = 43'h0bca6604299;
    stim[37] = 43'h05d0358ee50;
    stim[38] = 43'h4f432c1c9a7;
    stim[39] = 43'h445f289573e;
    stim[40] = 43'h7a27375c210;
    stim[41] = 43'h0e31efd5d3e;
    stim[42] = 43'h38dcae8e595;
    stim[43] = 43'h193df3ad48a;
    stim[44] = 43'h19289231b69;
    stim[45] = 43'h2596d507430;
    stim[46] = 43'h26ef79ec714;
    stim[47] = 43'h0607c42ce8d;
    stim[48] = 43'h4c176b72c54;
    stim[49] = 43'h0573edf5f8f;
    stim[50] = 43'h01a9b680098;
    stim[51] = 43'h5295efc1e77;
    stim[52] = 43'h1bd680d2225;
    stim[53] = 43'h6c6669e5d8a;
    stim[54] = 43'h321d0282a13;
    stim[55] = 43'h7594dc8e0d6;
    stim[56] = 43'h74100db8aad;
    stim[57] = 43'h6f71a04d8b9;
    stim[58] = 43'h21bb481f134;
    stim[59] = 43'h148b8815999;
    stim[60] = 43'h6dc230b6402;
    stim[61] = 43'h3529e7edb2b;
    stim[62] = 43'h737d0c05301;
    stim[63] = 43'h6342709887e;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'hb7918a84;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h43f22ecf;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h2ccba2ac;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'hb7918a84;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'hf43bb37e;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h90c006cf;
      expv[44] = 32'hf87699ed;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h15686004;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'hf87699ed;
      expv[55] = 32'hd0cb0726;
      expv[56] = 32'h06edc994;
      expv[57] = 32'h15686004;
      expv[58] = 32'h00000000;
      expv[59] = 32'ha57bf079;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'hb5e18e36;
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
