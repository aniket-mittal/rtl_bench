// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02830 dut (
    .clk(clk),
    .datain(in_vec[33:2]),
    .clr(in_vec[1:1]),
    .WE(in_vec[0:0]),
    .dataout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0c771d2c3;
    stim[1] = 34'h3598e7b6a;
    stim[2] = 34'h16b1b2101;
    stim[3] = 34'h0b143a751;
    stim[4] = 34'h24868424d;
    stim[5] = 34'h3f68feb05;
    stim[6] = 34'h37e7e2029;
    stim[7] = 34'h0dc4afe15;
    stim[8] = 34'h0f8487055;
    stim[9] = 34'h2d53f9ab8;
    stim[10] = 34'h1c0338ed1;
    stim[11] = 34'h0d4b281c0;
    stim[12] = 34'h2f6e40e34;
    stim[13] = 34'h2410cf03d;
    stim[14] = 34'h04fe9efc9;
    stim[15] = 34'h1ac41a595;
    stim[16] = 34'h0c13cdf95;
    stim[17] = 34'h18efdfc7d;
    stim[18] = 34'h3696c5105;
    stim[19] = 34'h009199cc0;
    stim[20] = 34'h38d8cb9f8;
    stim[21] = 34'h18135fd4c;
    stim[22] = 34'h339900679;
    stim[23] = 34'h399b34189;
    stim[24] = 34'h19b3931ed;
    stim[25] = 34'h15f77d4b9;
    stim[26] = 34'h05d126a51;
    stim[27] = 34'h2f4dde2ad;
    stim[28] = 34'h0cd4b88cd;
    stim[29] = 34'h38fa506ac;
    stim[30] = 34'h05847e761;
    stim[31] = 34'h2c76b78f4;
    stim[32] = 34'h215c4c92d;
    stim[33] = 34'h38364baa9;
    stim[34] = 34'h3ff62d3cc;
    stim[35] = 34'h31fb65985;
    stim[36] = 34'h3edd80575;
    stim[37] = 34'h07ab52619;
    stim[38] = 34'h206baf8fd;
    stim[39] = 34'h23a464994;
    stim[40] = 34'h2d597b85c;
    stim[41] = 34'h2d6460e2c;
    stim[42] = 34'h2bd682fa0;
    stim[43] = 34'h08ec3d5cd;
    stim[44] = 34'h3429208ec;
    stim[45] = 34'h0b6a30848;
    stim[46] = 34'h244f9f42d;
    stim[47] = 34'h13e4e23c8;
    stim[48] = 34'h08a809e4c;
    stim[49] = 34'h3f23aa798;
    stim[50] = 34'h2d4e0d3dd;
    stim[51] = 34'h1dac0cb9c;
    stim[52] = 34'h30a3dc6d1;
    stim[53] = 34'h0a6bc4a14;
    stim[54] = 34'h3a538a03d;
    stim[55] = 34'h01aafd609;
    stim[56] = 34'h2eb3b9d9c;
    stim[57] = 34'h25cdb9468;
    stim[58] = 34'h160e88555;
    stim[59] = 34'h1ec669b49;
    stim[60] = 34'h07e2c3585;
    stim[61] = 34'h3a5e07349;
    stim[62] = 34'h083974971;
    stim[63] = 34'h26550de01;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h5ac6c840;
      expv[4] = 32'h2c50e9d4;
      expv[5] = 32'h921a1093;
      expv[6] = 32'hfda3fac1;
      expv[7] = 32'hdf9f880a;
      expv[8] = 32'h3712bf85;
      expv[9] = 32'h3e121c15;
      expv[10] = 32'h3e121c15;
      expv[11] = 32'h700ce3b4;
      expv[12] = 32'h700ce3b4;
      expv[13] = 32'h700ce3b4;
      expv[14] = 32'h90433c0f;
      expv[15] = 32'h13fa7bf2;
      expv[16] = 32'h6b106965;
      expv[17] = 32'h304f37e5;
      expv[18] = 32'h63bf7f1f;
      expv[19] = 32'hda5b1441;
      expv[20] = 32'hda5b1441;
      expv[21] = 32'hda5b1441;
      expv[22] = 32'hda5b1441;
      expv[23] = 32'hce64019e;
      expv[24] = 32'he66cd062;
      expv[25] = 32'h66ce4c7b;
      expv[26] = 32'h57ddf52e;
      expv[27] = 32'h17449a94;
      expv[28] = 32'hbd3778ab;
      expv[29] = 32'h3352e233;
      expv[30] = 32'h3352e233;
      expv[31] = 32'h1611f9d8;
      expv[32] = 32'h1611f9d8;
      expv[33] = 32'h8571324b;
      expv[34] = 32'he0d92eaa;
      expv[35] = 32'he0d92eaa;
      expv[36] = 32'hc7ed9661;
      expv[37] = 32'hfb76015d;
      expv[38] = 32'h1ead4986;
      expv[39] = 32'h81aebe3f;
      expv[40] = 32'h81aebe3f;
      expv[41] = 32'h81aebe3f;
      expv[42] = 32'h81aebe3f;
      expv[43] = 32'h81aebe3f;
      expv[44] = 32'h23b0f573;
      expv[45] = 32'h23b0f573;
      expv[46] = 32'h23b0f573;
      expv[47] = 32'h913e7d0b;
      expv[48] = 32'h913e7d0b;
      expv[49] = 32'h913e7d0b;
      expv[50] = 32'h913e7d0b;
      expv[51] = 32'hb53834f7;
      expv[52] = 32'hb53834f7;
      expv[53] = 32'hc28f71b4;
      expv[54] = 32'hc28f71b4;
      expv[55] = 32'he94e280f;
      expv[56] = 32'h06abf582;
      expv[57] = 32'h06abf582;
      expv[58] = 32'h06abf582;
      expv[59] = 32'h583a2155;
      expv[60] = 32'h7b19a6d2;
      expv[61] = 32'h1f8b0d61;
      expv[62] = 32'he9781cd2;
      expv[63] = 32'h20e5d25c;
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
