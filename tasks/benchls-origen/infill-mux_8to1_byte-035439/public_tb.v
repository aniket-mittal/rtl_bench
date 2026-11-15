// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 61;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035439 dut (
    .A(in_vec[60:53]),
    .B(in_vec[52:45]),
    .C(in_vec[44:37]),
    .D(in_vec[36:29]),
    .E(in_vec[28:21]),
    .F(in_vec[20:13]),
    .G(in_vec[12:5]),
    .Sel(in_vec[4:2]),
    .addOverflow(in_vec[1:1]),
    .shiftOverflow(in_vec[0:0]),
    .Y(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 61'h0c0903cb93ed600a;
    stim[1] = 61'h1575d5b7cc8a2021;
    stim[2] = 61'h0f28235ca2d95352;
    stim[3] = 61'h0192c97563f85a7b;
    stim[4] = 61'h15f12566277c227e;
    stim[5] = 61'h017c59d19b6d18b2;
    stim[6] = 61'h1aa2b7a1580de632;
    stim[7] = 61'h16dbbe2362fea0b3;
    stim[8] = 61'h0f81040c722f8077;
    stim[9] = 61'h01f5a2fb895f34d2;
    stim[10] = 61'h043d5d7b7a2528b3;
    stim[11] = 61'h0fe4f0fe63c1f8c6;
    stim[12] = 61'h0fea1287bc133c62;
    stim[13] = 61'h1fc5e3b4aabd21e3;
    stim[14] = 61'h0c6259fe499c129c;
    stim[15] = 61'h08621ba4bf4bee1d;
    stim[16] = 61'h1e5583ee48363709;
    stim[17] = 61'h0b46efb64f9e58f5;
    stim[18] = 61'h16aa1361c6f46baf;
    stim[19] = 61'h0b6c82015396e38b;
    stim[20] = 61'h179deccf009e9ff1;
    stim[21] = 61'h065d81f2df48a210;
    stim[22] = 61'h136bb1306d5d708b;
    stim[23] = 61'h032bbee76573d4c2;
    stim[24] = 61'h09fafeecb54ea7b3;
    stim[25] = 61'h0be5e966b9094de3;
    stim[26] = 61'h10b4968fbefba0f2;
    stim[27] = 61'h15e94a32ae373095;
    stim[28] = 61'h16ba9a21185b2bf8;
    stim[29] = 61'h08f0e9a8c372d53e;
    stim[30] = 61'h0bdb53e192854557;
    stim[31] = 61'h1821a455d60279b8;
    stim[32] = 61'h188047d8af3c6d2a;
    stim[33] = 61'h12dadf25e66eb04e;
    stim[34] = 61'h063da8b7d5879e4a;
    stim[35] = 61'h0f990df2421b8f92;
    stim[36] = 61'h1eec439c8e40c0ab;
    stim[37] = 61'h04014444abe69fdc;
    stim[38] = 61'h1e6951f4c0a36975;
    stim[39] = 61'h034915ccd3b10db1;
    stim[40] = 61'h006539bbade519c5;
    stim[41] = 61'h11379e3122b3675f;
    stim[42] = 61'h1f830654a748fa68;
    stim[43] = 61'h17c0688863170447;
    stim[44] = 61'h0dfd6eb8450dc9ea;
    stim[45] = 61'h03475b2721033498;
    stim[46] = 61'h1915009b4b322ff2;
    stim[47] = 61'h00cfeb0a6f9fb80b;
    stim[48] = 61'h114e4e915da01ad0;
    stim[49] = 61'h02ac48b32460b3bb;
    stim[50] = 61'h0bac01b0b31112a0;
    stim[51] = 61'h1aac8c7d54461812;
    stim[52] = 61'h0a450def49917749;
    stim[53] = 61'h1b336a02cac5137e;
    stim[54] = 61'h015bc966f539ee43;
    stim[55] = 61'h0677967b1d05993f;
    stim[56] = 61'h1f01f145b17316ce;
    stim[57] = 61'h09b911988a1af059;
    stim[58] = 61'h15fb175b53e7520f;
    stim[59] = 61'h1fa4900ccd9316ba;
    stim[60] = 61'h04f3f17ee3229058;
    stim[61] = 61'h01ebc4513cbc61af;
    stim[62] = 61'h1fddb84c45004681;
    stim[63] = 61'h1f3e6e091d8eafca;
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
      expv[0] = 9'h03c;
      expv[1] = 9'h156;
      expv[2] = 9'h02c;
      expv[3] = 9'h1a6;
      expv[4] = 9'h000;
      expv[5] = 9'h1b6;
      expv[6] = 9'h180;
      expv[7] = 9'h02e;
      expv[8] = 9'h0f8;
      expv[9] = 9'h094;
      expv[10] = 9'h1a2;
      expv[11] = 9'h04e;
      expv[12] = 9'h0ff;
      expv[13] = 9'h1fd;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h03e;
      expv[17] = 9'h1e4;
      expv[18] = 9'h01c;
      expv[19] = 9'h020;
      expv[20] = 9'h008;
      expv[21] = 9'h1f4;
      expv[22] = 9'h112;
      expv[23] = 9'h033;
      expv[24] = 9'h154;
      expv[25] = 9'h0bf;
      expv[26] = 9'h1ee;
      expv[27] = 9'h172;
      expv[28] = 9'h0be;
      expv[29] = 9'h000;
      expv[30] = 9'h054;
      expv[31] = 9'h19a;
      expv[32] = 9'h07c;
      expv[33] = 9'h05e;
      expv[34] = 9'h08a;
      expv[35] = 9'h020;
      expv[36] = 9'h038;
      expv[37] = 9'h000;
      expv[38] = 9'h036;
      expv[39] = 9'h13a;
      expv[40] = 9'h053;
      expv[41] = 9'h000;
      expv[42] = 9'h064;
      expv[43] = 9'h007;
      expv[44] = 9'h0ea;
      expv[45] = 9'h148;
      expv[46] = 9'h0b2;
      expv[47] = 9'h0b0;
      expv[48] = 9'h1da;
      expv[49] = 9'h13a;
      expv[50] = 9'h0ba;
      expv[51] = 9'h144;
      expv[52] = 9'h0de;
      expv[53] = 9'h000;
      expv[54] = 9'h015;
      expv[55] = 9'h000;
      expv[56] = 9'h05a;
      expv[57] = 9'h104;
      expv[58] = 9'h1b4;
      expv[59] = 9'h16a;
      expv[60] = 9'h104;
      expv[61] = 9'h112;
      expv[62] = 9'h1fc;
      expv[63] = 9'h0e0;
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
