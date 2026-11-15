// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061963 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h610865385fa7ec;
    stim[1] = 55'h297a64450a071c;
    stim[2] = 55'h185eb0b599c14e;
    stim[3] = 55'h43a4eaa3c3999d;
    stim[4] = 55'h25d81ce52f32c1;
    stim[5] = 55'h62528b00398b04;
    stim[6] = 55'h55d4530ec5ee0b;
    stim[7] = 55'h2095e2162ffc0f;
    stim[8] = 55'h78a98b46f4cae7;
    stim[9] = 55'h00dbf46c90d6ff;
    stim[10] = 55'h24815eb5552976;
    stim[11] = 55'h6335ecea998c5c;
    stim[12] = 55'h75e444f9bc2d54;
    stim[13] = 55'h42a10408b56144;
    stim[14] = 55'h38671cdcd71431;
    stim[15] = 55'h6d1cbfebd6777e;
    stim[16] = 55'h29d3bbc4220fa4;
    stim[17] = 55'h5f15dbdf9a9b13;
    stim[18] = 55'h4db43f77077234;
    stim[19] = 55'h3d6589c6774b74;
    stim[20] = 55'h101a338fbf0cc8;
    stim[21] = 55'h7daa231b3f3cd7;
    stim[22] = 55'h7dc79f5de60773;
    stim[23] = 55'h19fde3e4d0230d;
    stim[24] = 55'h40c1228cc66278;
    stim[25] = 55'h11d5b43436dbd1;
    stim[26] = 55'h11a00cfd8071c6;
    stim[27] = 55'h17fea904ec1a5e;
    stim[28] = 55'h4334814b63054c;
    stim[29] = 55'h29147b00ff62ed;
    stim[30] = 55'h0f1d3c7efed62f;
    stim[31] = 55'h0f34780829a200;
    stim[32] = 55'h4e45640fc4b8c4;
    stim[33] = 55'h26203c3eedf553;
    stim[34] = 55'h432d8b06a3f348;
    stim[35] = 55'h77f060ac1c6b15;
    stim[36] = 55'h64c12441974925;
    stim[37] = 55'h017b526bdb37c5;
    stim[38] = 55'h67a943cb23c9ee;
    stim[39] = 55'h3a180d3a3620ef;
    stim[40] = 55'h2340d6eae07062;
    stim[41] = 55'h08f3518912695e;
    stim[42] = 55'h40e6aa24359ff3;
    stim[43] = 55'h5b0c13fe58f4ea;
    stim[44] = 55'h6781d84fcb74ff;
    stim[45] = 55'h399084565ed8eb;
    stim[46] = 55'h0e097d642112a3;
    stim[47] = 55'h36a5ac21ad9855;
    stim[48] = 55'h109d5cc9853186;
    stim[49] = 55'h36ec4137dceeb5;
    stim[50] = 55'h0bd7845c84465c;
    stim[51] = 55'h2bc0eb22cf2c9f;
    stim[52] = 55'h788eca84bac7f7;
    stim[53] = 55'h5ec220bef4f820;
    stim[54] = 55'h414c92888e7bf1;
    stim[55] = 55'h624be90aab84e9;
    stim[56] = 55'h18e89303588f2c;
    stim[57] = 55'h00c2cd651a9ee1;
    stim[58] = 55'h43c0f9ffce579a;
    stim[59] = 55'h230537b47fa59d;
    stim[60] = 55'h5e614d16f255ae;
    stim[61] = 55'h41cc59819a0ef1;
    stim[62] = 55'h3345203e32e957;
    stim[63] = 55'h48cf94135abf04;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h610865385fa7ec;
      expv[2] = 55'h297a64450a071c;
      expv[3] = 55'h185eb0b599c14e;
      expv[4] = 55'h43a4eaa3c3999d;
      expv[5] = 55'h25d81ce52f32c1;
      expv[6] = 55'h62528b00398b04;
      expv[7] = 55'h55d4530ec5ee0b;
      expv[8] = 55'h2095e2162ffc0f;
      expv[9] = 55'h78a98b46f4cae7;
      expv[10] = 55'h00dbf46c90d6ff;
      expv[11] = 55'h24815eb5552976;
      expv[12] = 55'h6335ecea998c5c;
      expv[13] = 55'h75e444f9bc2d54;
      expv[14] = 55'h42a10408b56144;
      expv[15] = 55'h38671cdcd71431;
      expv[16] = 55'h6d1cbfebd6777e;
      expv[17] = 55'h29d3bbc4220fa4;
      expv[18] = 55'h5f15dbdf9a9b13;
      expv[19] = 55'h4db43f77077234;
      expv[20] = 55'h3d6589c6774b74;
      expv[21] = 55'h101a338fbf0cc8;
      expv[22] = 55'h7daa231b3f3cd7;
      expv[23] = 55'h7dc79f5de60773;
      expv[24] = 55'h19fde3e4d0230d;
      expv[25] = 55'h40c1228cc66278;
      expv[26] = 55'h11d5b43436dbd1;
      expv[27] = 55'h11a00cfd8071c6;
      expv[28] = 55'h17fea904ec1a5e;
      expv[29] = 55'h4334814b63054c;
      expv[30] = 55'h29147b00ff62ed;
      expv[31] = 55'h0f1d3c7efed62f;
      expv[32] = 55'h0f34780829a200;
      expv[33] = 55'h4e45640fc4b8c4;
      expv[34] = 55'h26203c3eedf553;
      expv[35] = 55'h432d8b06a3f348;
      expv[36] = 55'h77f060ac1c6b15;
      expv[37] = 55'h64c12441974925;
      expv[38] = 55'h017b526bdb37c5;
      expv[39] = 55'h67a943cb23c9ee;
      expv[40] = 55'h3a180d3a3620ef;
      expv[41] = 55'h2340d6eae07062;
      expv[42] = 55'h08f3518912695e;
      expv[43] = 55'h40e6aa24359ff3;
      expv[44] = 55'h5b0c13fe58f4ea;
      expv[45] = 55'h6781d84fcb74ff;
      expv[46] = 55'h399084565ed8eb;
      expv[47] = 55'h0e097d642112a3;
      expv[48] = 55'h36a5ac21ad9855;
      expv[49] = 55'h109d5cc9853186;
      expv[50] = 55'h36ec4137dceeb5;
      expv[51] = 55'h0bd7845c84465c;
      expv[52] = 55'h2bc0eb22cf2c9f;
      expv[53] = 55'h788eca84bac7f7;
      expv[54] = 55'h5ec220bef4f820;
      expv[55] = 55'h414c92888e7bf1;
      expv[56] = 55'h624be90aab84e9;
      expv[57] = 55'h18e89303588f2c;
      expv[58] = 55'h00c2cd651a9ee1;
      expv[59] = 55'h43c0f9ffce579a;
      expv[60] = 55'h230537b47fa59d;
      expv[61] = 55'h5e614d16f255ae;
      expv[62] = 55'h41cc59819a0ef1;
      expv[63] = 55'h3345203e32e957;
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
