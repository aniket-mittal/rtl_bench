// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031485 dut (
    .clk(clk),
    .wea(in_vec[48:48]),
    .addra(in_vec[47:40]),
    .addrb(in_vec[39:32]),
    .dia(in_vec[31:0]),
    .dob(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h09af497546274;
    stim[1] = 49'h1d9043647a66e;
    stim[2] = 49'h06d4dfba82b73;
    stim[3] = 49'h00ea993f91158;
    stim[4] = 49'h1907a8244e9db;
    stim[5] = 49'h0e3074b2416eb;
    stim[6] = 49'h04a118fda466d;
    stim[7] = 49'h04270e5a384e0;
    stim[8] = 49'h09c30ae9dcfb9;
    stim[9] = 49'h0cc99360cb93f;
    stim[10] = 49'h1e25353cd5bd8;
    stim[11] = 49'h14c035f13b293;
    stim[12] = 49'h05c3f44945757;
    stim[13] = 49'h1d67f8e6c6b4b;
    stim[14] = 49'h1bb74760de8e6;
    stim[15] = 49'h0b0393f540452;
    stim[16] = 49'h0ba33764a0ba8;
    stim[17] = 49'h04529d039c736;
    stim[18] = 49'h1e1a164f8860c;
    stim[19] = 49'h0e1b54587012c;
    stim[20] = 49'h007b1fef70fa7;
    stim[21] = 49'h0405ed7e7c124;
    stim[22] = 49'h0b861e8749df8;
    stim[23] = 49'h04d948cc585b8;
    stim[24] = 49'h02023c8b7bc8e;
    stim[25] = 49'h0f391f798f5d2;
    stim[26] = 49'h06af82a337600;
    stim[27] = 49'h0d80bcdbf59be;
    stim[28] = 49'h19ac612f24738;
    stim[29] = 49'h171eea571b852;
    stim[30] = 49'h0294cac1e6eeb;
    stim[31] = 49'h0c9585f7ce8c7;
    stim[32] = 49'h1e68f806c91c0;
    stim[33] = 49'h11d718cd6d206;
    stim[34] = 49'h0ab6a956e714e;
    stim[35] = 49'h0f55250fb5346;
    stim[36] = 49'h091c25dc3f135;
    stim[37] = 49'h191413f1a9876;
    stim[38] = 49'h1411030351566;
    stim[39] = 49'h0055131d5a897;
    stim[40] = 49'h0ae81b1b03e91;
    stim[41] = 49'h0384b01e213cc;
    stim[42] = 49'h126dbc6f9a8e4;
    stim[43] = 49'h145b30162e347;
    stim[44] = 49'h0ced09470e947;
    stim[45] = 49'h1cce035c16f63;
    stim[46] = 49'h10757c0c6a841;
    stim[47] = 49'h0ebc0f8a07da7;
    stim[48] = 49'h169a6fb7147b7;
    stim[49] = 49'h044365518a862;
    stim[50] = 49'h07a464f59aa39;
    stim[51] = 49'h1fc85bfcc8cf6;
    stim[52] = 49'h0193f97eb74a1;
    stim[53] = 49'h09cb358ff503f;
    stim[54] = 49'h073389fbd0742;
    stim[55] = 49'h1545ca98e9258;
    stim[56] = 49'h19818aa104646;
    stim[57] = 49'h0a350db0334d0;
    stim[58] = 49'h18ed1ea18e31c;
    stim[59] = 49'h0501472a79bc6;
    stim[60] = 49'h0d99af63e4e2a;
    stim[61] = 49'h104b8731ddd17;
    stim[62] = 49'h1ff9580013273;
    stim[63] = 49'h0441f70749132;
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
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
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
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h5f13b293;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'ha571b852;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h12f24738;
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
