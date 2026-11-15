// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_66_20 dut (
    .clk(clk),
    .sclr(in_vec[66:66]),
    .din(in_vec[65:0]),
    .din_ack(out_vec[20:20]),
    .dout(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h6199788d6444b10e4;
    stim[1] = 67'h455375b71a7a9b48f;
    stim[2] = 67'h2c67c8396438b1da6;
    stim[3] = 67'h414262281ed7514da;
    stim[4] = 67'h11a87d438b6a50052;
    stim[5] = 67'h0d1740c394f531127;
    stim[6] = 67'h72dd383dc3f7d6406;
    stim[7] = 67'h3b621536c0dc90707;
    stim[8] = 67'h7fdbe8fd1f49bb61f;
    stim[9] = 67'h570b86e25262a94a8;
    stim[10] = 67'h50ffb4659baad80d9;
    stim[11] = 67'h242f5f92d8bfd3bf0;
    stim[12] = 67'h4eb4ec8f13ace4d90;
    stim[13] = 67'h24eb6edb08c0fb762;
    stim[14] = 67'h65b49e6875b9349c6;
    stim[15] = 67'h6cd0d84f385e63190;
    stim[16] = 67'h52057241b72a2dd16;
    stim[17] = 67'h6239c774393b4ea7d;
    stim[18] = 67'h7ab687bad636413c6;
    stim[19] = 67'h7e86ba092793dcc5b;
    stim[20] = 67'h4a70428bb2289548f;
    stim[21] = 67'h63ea1607254ef04a8;
    stim[22] = 67'h7c365ab5a3ab25a30;
    stim[23] = 67'h7e09c8dbdd1e79aba;
    stim[24] = 67'h2d4e91ca37623cdd5;
    stim[25] = 67'h3948e66bc63dbe3d0;
    stim[26] = 67'h17b1e288ec6d4609d;
    stim[27] = 67'h0645511ad1cc82301;
    stim[28] = 67'h7e0b47ddb2c305443;
    stim[29] = 67'h45567d76b302fce66;
    stim[30] = 67'h66a25c95aaba8daa5;
    stim[31] = 67'h250a18c1338b68f8a;
    stim[32] = 67'h3b5a7a973d5046d36;
    stim[33] = 67'h2765950e1cce75ffd;
    stim[34] = 67'h15ca726daed5ba8a3;
    stim[35] = 67'h45b4514e4bea41809;
    stim[36] = 67'h5c33cc63e96419a7a;
    stim[37] = 67'h3e3b85e210d1efd19;
    stim[38] = 67'h17f7c78f718e616aa;
    stim[39] = 67'h2a9da6ae11da1c4e2;
    stim[40] = 67'h6bedf00db45f48908;
    stim[41] = 67'h2b727eec7afcf645b;
    stim[42] = 67'h15b4a544e2d699c8b;
    stim[43] = 67'h230b8d80c93c5053e;
    stim[44] = 67'h7a07468f55ff088a0;
    stim[45] = 67'h0b481a0303c476f0b;
    stim[46] = 67'h59404a1d05bbe7fdb;
    stim[47] = 67'h759e395290196c165;
    stim[48] = 67'h7031f11021dca7df5;
    stim[49] = 67'h3e4f10e9ac3472427;
    stim[50] = 67'h599776db676c7db75;
    stim[51] = 67'h4a55d7b57ca25372a;
    stim[52] = 67'h5f0fdd46d45cdee2d;
    stim[53] = 67'h178af2c78cce5d0a3;
    stim[54] = 67'h2328d602050feb06e;
    stim[55] = 67'h3ec22e1482fb6531b;
    stim[56] = 67'h168315dabc2deb5a4;
    stim[57] = 67'h2d477873d56369b51;
    stim[58] = 67'h22c55dc66e6536bfc;
    stim[59] = 67'h207ab2ede1bec029e;
    stim[60] = 67'h513f14320dbb2c8f8;
    stim[61] = 67'h4896d458c51c0a290;
    stim[62] = 67'h67dda4174671ba377;
    stim[63] = 67'h7ac930b994d8ef80f;
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
      expv[0] = 21'hx00000;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h100000;
      expv[4] = 21'h000000;
      expv[5] = 21'h000000;
      expv[6] = 21'h100000;
      expv[7] = 21'h0514da;
      expv[8] = 21'h081ed7;
      expv[9] = 21'h042622;
      expv[10] = 21'h0d6406;
      expv[11] = 21'h0dc3f7;
      expv[12] = 21'h1d6406;
      expv[13] = 21'h0d6406;
      expv[14] = 21'h0d6406;
      expv[15] = 21'h0dc3f7;
      expv[16] = 21'h0e4d90;
      expv[17] = 21'h0f13ac;
      expv[18] = 21'h0e4d90;
      expv[19] = 21'h0e4d90;
      expv[20] = 21'h0e4d90;
      expv[21] = 21'h0e4d90;
      expv[22] = 21'h0e4d90;
      expv[23] = 21'h0e4d90;
      expv[24] = 21'h0e4d90;
      expv[25] = 21'h1e4d90;
      expv[26] = 21'h1e4d90;
      expv[27] = 21'h0e4d90;
      expv[28] = 21'h0f13ac;
      expv[29] = 21'h0b4ec8;
      expv[30] = 21'h08274e;
      expv[31] = 21'h0b1b51;
      expv[32] = 21'h14609d;
      expv[33] = 21'h14609d;
      expv[34] = 21'h04609d;
      expv[35] = 21'h08ec6d;
      expv[36] = 21'h0b1e28;
      expv[37] = 21'h07ff57;
      expv[38] = 21'h17339d;
      expv[39] = 21'h175ffd;
      expv[40] = 21'h075ffd;
      expv[41] = 21'h0e1cce;
      expv[42] = 21'h165950;
      expv[43] = 21'h1138a7;
      expv[44] = 21'h01c4e2;
      expv[45] = 21'h0e11da;
      expv[46] = 21'h19da6a;
      expv[47] = 21'h014faa;
      expv[48] = 21'h05053e;
      expv[49] = 21'h00c93c;
      expv[50] = 21'h1e7fdb;
      expv[51] = 21'h0e7fdb;
      expv[52] = 21'h0e7fdb;
      expv[53] = 21'h0d05bb;
      expv[54] = 21'h17db75;
      expv[55] = 21'h17db75;
      expv[56] = 21'h07db75;
      expv[57] = 21'h0b676c;
      expv[58] = 21'h19776d;
      expv[59] = 21'h04c6d9;
      expv[60] = 21'h00bed9;
      expv[61] = 21'h08b852;
      expv[62] = 21'h0fcfb0;
      expv[63] = 21'h06536b;
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
