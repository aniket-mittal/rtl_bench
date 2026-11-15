// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_512x44 dut (
    .CLK(clk),
    .A(in_vec[98:90]),
    .CEN(in_vec[89:89]),
    .D(in_vec[88:45]),
    .GWEN(in_vec[44:44]),
    .WEN(in_vec[43:0]),
    .Q(out_vec[43:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h65a398a5fb384e86968e39582;
    stim[1] = 99'h767d4f4a2ef34176f6157e5fd;
    stim[2] = 99'h75bee95d93e370b98ed46cb3d;
    stim[3] = 99'h4e61f891470b9e2f0d5368906;
    stim[4] = 99'h4ed59864b01ba680b27bb4dba;
    stim[5] = 99'h5160f26b029f0cccceb2162e2;
    stim[6] = 99'h6354e25791e4c735aa4251827;
    stim[7] = 99'h4e945638d84e7bd4865d31419;
    stim[8] = 99'h07c883c2024790403eb06208e;
    stim[9] = 99'h0d8f35cf9b26ea10da5a1075f;
    stim[10] = 99'h5b87ce29aec465fdde882979f;
    stim[11] = 99'h15c97e8e69520c5836e5d50fd;
    stim[12] = 99'h42f691390ad32f999fcd62c80;
    stim[13] = 99'h6a31bfb5c142a0d1cec1750b6;
    stim[14] = 99'h3b4b76107c3616e89f39ef34d;
    stim[15] = 99'h4746a77163764b959d3c730b0;
    stim[16] = 99'h0833e6f3601b7f6de9f7c6542;
    stim[17] = 99'h530844afcf237be6c389a710d;
    stim[18] = 99'h3e11a9e6efccd257a04151c3c;
    stim[19] = 99'h790d6d99e6fb98a84f98b3b39;
    stim[20] = 99'h5798b2abea979fd360ffa114b;
    stim[21] = 99'h611929b9262f336a9b03476c7;
    stim[22] = 99'h2e03a9dd124cd703aa5d7938d;
    stim[23] = 99'h4d459751b1162f657017cb464;
    stim[24] = 99'h22f1b408082854ffcc0427f1f;
    stim[25] = 99'h0f453352908fe5d95c550a86e;
    stim[26] = 99'h40d261dab55bd0592f4f99428;
    stim[27] = 99'h509f072fdc2970b92d236c26e;
    stim[28] = 99'h175972600d596e3f9ff430272;
    stim[29] = 99'h27cfb56e409cd19ab6d61eacb;
    stim[30] = 99'h1aab138cf4d3edf783bc96814;
    stim[31] = 99'h521764e30f81a47fd12373393;
    stim[32] = 99'h09effc727ccda089b00fc4b08;
    stim[33] = 99'h3c819e367504d1af1791bd747;
    stim[34] = 99'h05d79935fc01f3f4a22b31182;
    stim[35] = 99'h100ad2b4a448cbca9a23c5a32;
    stim[36] = 99'h47578d56d16869bff2c67b3d5;
    stim[37] = 99'h0e24674bc60f584240c17df9a;
    stim[38] = 99'h24eb6701f1bae7912d4302481;
    stim[39] = 99'h17cca9afb8731045e12240936;
    stim[40] = 99'h4bc10a2bfa149bb80f5af993d;
    stim[41] = 99'h69373b7b0569f0cfede90ca31;
    stim[42] = 99'h2d91f526fd6e27d3a76d37f7f;
    stim[43] = 99'h5e4677cdde84a8ab5e9c5657f;
    stim[44] = 99'h6a77de3eb1e62332f5baf4281;
    stim[45] = 99'h4395e47f90145e3308a8265e2;
    stim[46] = 99'h042997d82560df5817a14ad76;
    stim[47] = 99'h1006a253cbd4d312aab81aaa3;
    stim[48] = 99'h2bb6660f95c6abc8b33f5071b;
    stim[49] = 99'h263d149d6d5fe1b911c2cbf7e;
    stim[50] = 99'h534612c8f4168dd3697c47adc;
    stim[51] = 99'h7f77db0a70d05a98f44e3e5c6;
    stim[52] = 99'h50ac23ac37ddb0d7a836f2007;
    stim[53] = 99'h7a033869ca7322c3237751102;
    stim[54] = 99'h1f723a485577ef7eb5ba49af1;
    stim[55] = 99'h4667d010c511acd018ecf2b08;
    stim[56] = 99'h0e1df1fa3162554ab3471ed06;
    stim[57] = 99'h6c9620f86f7c20850493f8ba5;
    stim[58] = 99'h0ff6b028a49a05e780e59a65d;
    stim[59] = 99'h1c699a4128e8575678c2b8efb;
    stim[60] = 99'h1f6a7024b71b53c8725a5f767;
    stim[61] = 99'h747cbdbbaefa578403ff52012;
    stim[62] = 99'h7b6add74f93cffb79c28bf279;
    stim[63] = 99'h2711dbc7156f0bcbb031eaad2;
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
      expv[0] = 44'hxxxxxxxxxxx;
      expv[1] = 44'hxxxxxxxxxxx;
      expv[2] = 44'hxxxxxxxxxxx;
      expv[3] = 44'hxxxxxxxxxxx;
      expv[4] = 44'hxxxxxxxxxxx;
      expv[5] = 44'hxxxxxxxxxxx;
      expv[6] = 44'hxxxxxxxxxxx;
      expv[7] = 44'hxxxxxxxxxxx;
      expv[8] = 44'hxxxxxxxxxxx;
      expv[9] = 44'h441e10123c8;
      expv[10] = 44'h79ae7xxxxxx;
      expv[11] = 44'hxxxxxxxxxxx;
      expv[12] = 44'h4bf4734a906;
      expv[13] = 44'h4bf4734a906;
      expv[14] = 44'h4bf4734a906;
      expv[15] = 44'hxxxxxxe1b0b;
      expv[16] = 44'hxxxxxxxxxxx;
      expv[17] = 44'hxxxxxxxxxxx;
      expv[18] = 44'hxxxxxxxxxxx;
      expv[19] = 44'h8d4f377e669;
      expv[20] = 44'hxxxxxx37dcc;
      expv[21] = 44'hxxxxxxxxxxx;
      expv[22] = 44'hxxxxxxxxxxx;
      expv[23] = 44'hxxxxxxxxxxx;
      expv[24] = 44'hxxxxxxxxxxx;
      expv[25] = 44'hxxxxxxxxxxx;
      expv[26] = 44'hxxxxxxxxxxx;
      expv[27] = 44'h930edxxxxxx;
      expv[28] = 44'hxxxxxxxxxxx;
      expv[29] = 44'hcb93006acb7;
      expv[30] = 44'hxxxxxxxxxxx;
      expv[31] = 44'hxxxxxxxxxxx;
      expv[32] = 44'hbb271xxxxxx;
      expv[33] = 44'hbb271xxxxxx;
      expv[34] = 44'hxxxxxxxxxxx;
      expv[35] = 44'hxxxxxxxxxxx;
      expv[36] = 44'hxxxxxxxxxxx;
      expv[37] = 44'hxxxxxxxxxxx;
      expv[38] = 44'hxxxxxxxxxxx;
      expv[39] = 44'hxxxxxxxxxxx;
      expv[40] = 44'h654d7xxxxxx;
      expv[41] = 44'hxxxxxxxxxxx;
      expv[42] = 44'hxxxxxxxxxxx;
      expv[43] = 44'hxxxxxxxxxxx;
      expv[44] = 44'hxxxxxxf4254;
      expv[45] = 44'hxxxxxxf4254;
      expv[46] = 44'haf23fc80a2f;
      expv[47] = 44'haf23fc80a2f;
      expv[48] = 44'hxxxxxxxxxxx;
      expv[49] = 44'hxxxxxxxxxxx;
      expv[50] = 44'hxxxxxxxxxxx;
      expv[51] = 44'hxxxxxxxxxxx;
      expv[52] = 44'hxxxxxxxxxxx;
      expv[53] = 44'hxxxxxxxxxxx;
      expv[54] = 44'hxxxxxxxxxxx;
      expv[55] = 44'hxxxxxxxxxxx;
      expv[56] = 44'hxxxxxxxxxxx;
      expv[57] = 44'hxxxxxxxxxxx;
      expv[58] = 44'hxxxxxxxxxxx;
      expv[59] = 44'hxxxxxxxxxxx;
      expv[60] = 44'hxxxxxxxxxxx;
      expv[61] = 44'hxxxxxxxxxxx;
      expv[62] = 44'hxxxxxxxxxxx;
      expv[63] = 44'hxxxxxxxxxxx;
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
