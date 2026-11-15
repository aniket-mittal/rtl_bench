// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 79;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041765 dut (
    .clk(clk),
    .rst(in_vec[78:78]),
    .mfc0(in_vec[77:77]),
    .mtc0(in_vec[76:76]),
    .pc(in_vec[75:44]),
    .Rd(in_vec[43:39]),
    .wdata(in_vec[38:7]),
    .exception(in_vec[6:6]),
    .eret(in_vec[5:5]),
    .cause(in_vec[4:0]),
    .rdata(out_vec[63:32]),
    .exc_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 79'h6008212eead548a85fcf;
    stim[1] = 79'h725a057954f080480a0e;
    stim[2] = 79'h24dda4c90fb849e3bef4;
    stim[3] = 79'h233a84160a8178d2e870;
    stim[4] = 79'h31c89391cee6546192b1;
    stim[5] = 79'h2b5049aae338775fadf6;
    stim[6] = 79'h1b508dfd90a0e0bc4620;
    stim[7] = 79'h0f82f5bd747c83495c71;
    stim[8] = 79'h2dda0da85f8a151bc294;
    stim[9] = 79'h27eba35341ad96ba82c2;
    stim[10] = 79'h37d8e9ad21a56216fe73;
    stim[11] = 79'h2a97530b1f8539dabb38;
    stim[12] = 79'h2663c089c0addad547fe;
    stim[13] = 79'h3b3bd1eaee9d6029d30a;
    stim[14] = 79'h0278e193aa85eccdcd2e;
    stim[15] = 79'h0f7e0e7f30fe6e4bd963;
    stim[16] = 79'h2d13791f9606e64783b4;
    stim[17] = 79'h0ff2a877f9867d20ce5d;
    stim[18] = 79'h2a87051b852792c79d8c;
    stim[19] = 79'h1ddc89e8adad9914c202;
    stim[20] = 79'h0f1931a48e6f4d100b52;
    stim[21] = 79'h36c13ee77e3b6b22ac1a;
    stim[22] = 79'h09aad0bbedff20e5a4eb;
    stim[23] = 79'h173796d57ebb058f81eb;
    stim[24] = 79'h2b35c3a1e315c504a567;
    stim[25] = 79'h3b3db06f78c547f345cb;
    stim[26] = 79'h333f0bd5fac149c036bf;
    stim[27] = 79'h0dbd76364ad302cfe3de;
    stim[28] = 79'h3810c81dde4f344d3229;
    stim[29] = 79'h0e9bf072333c4821f1fc;
    stim[30] = 79'h0b605abfa84c4b830184;
    stim[31] = 79'h2c286a19ba57fda96393;
    stim[32] = 79'h3ef5a7bddd39394060cf;
    stim[33] = 79'h3828e3091e894a31e9b0;
    stim[34] = 79'h368fe6260393121a4455;
    stim[35] = 79'h2f693bfd687268a5a59a;
    stim[36] = 79'h3f562ee33db5daff7880;
    stim[37] = 79'h25077106c3eac7a7d442;
    stim[38] = 79'h3096fad4dc36047cca12;
    stim[39] = 79'h2aae757004d6f8fec1f1;
    stim[40] = 79'h3baf16d2d9b0e4c2d4aa;
    stim[41] = 79'h3c4f8cb5ac83e2ffb987;
    stim[42] = 79'h195e26eeca5c3d5cb3fe;
    stim[43] = 79'h3fad5ad8ac2706afb689;
    stim[44] = 79'h2310bf154b3949bec790;
    stim[45] = 79'h5d80e20b9f8fddf516a8;
    stim[46] = 79'h291ae93ecf91bae97aa9;
    stim[47] = 79'h2d001f0780d272f4a0eb;
    stim[48] = 79'h2c9ad5a6c179dd3cccf2;
    stim[49] = 79'h29c7bd8630e3a3143718;
    stim[50] = 79'h2da9cd0a5ef46af47256;
    stim[51] = 79'h0027aa49a9d77f80fbfd;
    stim[52] = 79'h15121e8993333313cb7e;
    stim[53] = 79'h127bb872c9e6c1247daa;
    stim[54] = 79'h38a9746b6c6203356e1c;
    stim[55] = 79'h01051dc331e56fa38b96;
    stim[56] = 79'h13ec07f01a7d59014c6f;
    stim[57] = 79'h140259ee14ff833c0407;
    stim[58] = 79'h354c45e8dd0e4ddc0f6b;
    stim[59] = 79'h06822a6e42c9338edbba;
    stim[60] = 79'h62bca37b3b2047abf707;
    stim[61] = 79'h01300b92b8f5edcad9b6;
    stim[62] = 79'h1cd269520af5f7676ba9;
    stim[63] = 79'h284866248613147e7e1a;
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
      expv[0] = 64'hxxxxxxxx00400004;
      expv[1] = 64'h0000000000400004;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'hxxxxxxxx00000000;
      expv[7] = 64'hxxxxxxxx00000000;
      expv[8] = 64'h0000000000400004;
      expv[9] = 64'h0000000000400004;
      expv[10] = 64'h000000007eba3534;
      expv[11] = 64'h000000007eba3534;
      expv[12] = 64'h41c1788c7eba3534;
      expv[13] = 64'hcca8c32500400004;
      expv[14] = 64'hxxxxxxxx7eba3534;
      expv[15] = 64'hxxxxxxxx7eba3534;
      expv[16] = 64'h000000007eba3534;
      expv[17] = 64'hxxxxxxxx00400004;
      expv[18] = 64'h0000000000400004;
      expv[19] = 64'hxxxxxxxx00400004;
      expv[20] = 64'hxxxxxxxx00400004;
      expv[21] = 64'h0000000000400004;
      expv[22] = 64'hxxxxxxxxf1931a48;
      expv[23] = 64'hxxxxxxxxf1931a48;
      expv[24] = 64'h00000000f1931a48;
      expv[25] = 64'h0000000000400004;
      expv[26] = 64'h00000000b3db06f7;
      expv[27] = 64'hxxxxxxxx00400004;
      expv[28] = 64'h76d64558dbd76364;
      expv[29] = 64'hxxxxxxxxdbd76364;
      expv[30] = 64'hxxxxxxxx00400004;
      expv[31] = 64'h0000000000400004;
      expv[32] = 64'h0000000000400004;
      expv[33] = 64'h760b1f03ef5a7bdd;
      expv[34] = 64'h0000000000400004;
      expv[35] = 64'h0000000000400004;
      expv[36] = 64'h5b32298400400004;
      expv[37] = 64'h2624348800400004;
      expv[38] = 64'h0000000000400004;
      expv[39] = 64'h000000005077106c;
      expv[40] = 64'h000000005077106c;
      expv[41] = 64'h0000000000400004;
      expv[42] = 64'hxxxxxxxx5077106c;
      expv[43] = 64'h6c08f99400400004;
      expv[44] = 64'h0000000000400004;
      expv[45] = 64'hxxxxxxxx5077106c;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000400004;
      expv[50] = 64'h0000000000400004;
      expv[51] = 64'hxxxxxxxxda9cd0a5;
      expv[52] = 64'hxxxxxxxxda9cd0a5;
      expv[53] = 64'hxxxxxxxxda9cd0a5;
      expv[54] = 64'h0000000000400004;
      expv[55] = 64'hxxxxxxxx00400004;
      expv[56] = 64'hxxxxxxxxda9cd0a5;
      expv[57] = 64'hxxxxxxxx00400004;
      expv[58] = 64'h00000000da9cd0a5;
      expv[59] = 64'hxxxxxxxxda9cd0a5;
      expv[60] = 64'h0000000000400004;
      expv[61] = 64'hxxxxxxxx00000000;
      expv[62] = 64'hxxxxxxxx00000000;
      expv[63] = 64'h0000000000400004;
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
