// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[26:24]),
    .data0(in_vec[23:20]),
    .data1(in_vec[19:16]),
    .data2(in_vec[15:12]),
    .data3(in_vec[11:8]),
    .data4(in_vec[7:4]),
    .data5(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h14ce6e1;
    stim[1] = 27'h4238671;
    stim[2] = 27'h33cab33;
    stim[3] = 27'h6d29020;
    stim[4] = 27'h7dcd746;
    stim[5] = 27'h4926d38;
    stim[6] = 27'h3b408b7;
    stim[7] = 27'h4dc89ae;
    stim[8] = 27'h61784f9;
    stim[9] = 27'h64fb2d8;
    stim[10] = 27'h560db2b;
    stim[11] = 27'h602f30f;
    stim[12] = 27'h18b61a6;
    stim[13] = 27'h4488ea8;
    stim[14] = 27'h74a8e84;
    stim[15] = 27'h766f434;
    stim[16] = 27'h010cc75;
    stim[17] = 27'h6d5f3e4;
    stim[18] = 27'h4f838b6;
    stim[19] = 27'h659be82;
    stim[20] = 27'h3e475da;
    stim[21] = 27'h61bee94;
    stim[22] = 27'h4e07800;
    stim[23] = 27'h466f125;
    stim[24] = 27'h6d09825;
    stim[25] = 27'h2b252bb;
    stim[26] = 27'h4d6bc92;
    stim[27] = 27'h3690613;
    stim[28] = 27'h2a1541f;
    stim[29] = 27'h3902aef;
    stim[30] = 27'h74beb34;
    stim[31] = 27'h39cd3f4;
    stim[32] = 27'h06398a2;
    stim[33] = 27'h126d4a4;
    stim[34] = 27'h15691f0;
    stim[35] = 27'h25c6bcc;
    stim[36] = 27'h5f18b5f;
    stim[37] = 27'h4033b21;
    stim[38] = 27'h53024fe;
    stim[39] = 27'h59fe07b;
    stim[40] = 27'h07deb44;
    stim[41] = 27'h451ce97;
    stim[42] = 27'h0715009;
    stim[43] = 27'h13582c6;
    stim[44] = 27'h05faedc;
    stim[45] = 27'h33dcf87;
    stim[46] = 27'h2e12009;
    stim[47] = 27'h478f566;
    stim[48] = 27'h1bf6f24;
    stim[49] = 27'h1df0983;
    stim[50] = 27'h5e8a561;
    stim[51] = 27'h34ec7be;
    stim[52] = 27'h542ece4;
    stim[53] = 27'h17c95a5;
    stim[54] = 27'h4c77916;
    stim[55] = 27'h788e5ff;
    stim[56] = 27'h1ca3798;
    stim[57] = 27'h6b53d65;
    stim[58] = 27'h4befc00;
    stim[59] = 27'h437dd84;
    stim[60] = 27'h28209b7;
    stim[61] = 27'h0646842;
    stim[62] = 27'h5c7df28;
    stim[63] = 27'h642c063;
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
      expv[0] = 4'hc;
      expv[1] = 4'h7;
      expv[2] = 4'hb;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h3;
      expv[6] = 4'h8;
      expv[7] = 4'ha;
      expv[8] = 4'h9;
      expv[9] = 4'h8;
      expv[10] = 4'h0;
      expv[11] = 4'hf;
      expv[12] = 4'hb;
      expv[13] = 4'ha;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h1;
      expv[17] = 4'h4;
      expv[18] = 4'hb;
      expv[19] = 4'h2;
      expv[20] = 4'h5;
      expv[21] = 4'h4;
      expv[22] = 4'h0;
      expv[23] = 4'h2;
      expv[24] = 4'h5;
      expv[25] = 4'h5;
      expv[26] = 4'h9;
      expv[27] = 4'h6;
      expv[28] = 4'h5;
      expv[29] = 4'ha;
      expv[30] = 4'h0;
      expv[31] = 4'h3;
      expv[32] = 4'h6;
      expv[33] = 4'h6;
      expv[34] = 4'h6;
      expv[35] = 4'h6;
      expv[36] = 4'h0;
      expv[37] = 4'h2;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h7;
      expv[41] = 4'h9;
      expv[42] = 4'h7;
      expv[43] = 4'h5;
      expv[44] = 4'h5;
      expv[45] = 4'hf;
      expv[46] = 4'h2;
      expv[47] = 4'h6;
      expv[48] = 4'hf;
      expv[49] = 4'hf;
      expv[50] = 4'h0;
      expv[51] = 4'h7;
      expv[52] = 4'h0;
      expv[53] = 4'hc;
      expv[54] = 4'h1;
      expv[55] = 4'h0;
      expv[56] = 4'ha;
      expv[57] = 4'h5;
      expv[58] = 4'h0;
      expv[59] = 4'h8;
      expv[60] = 4'h0;
      expv[61] = 4'h6;
      expv[62] = 4'h0;
      expv[63] = 4'h3;
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
