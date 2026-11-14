// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h067d3ce70c201c7dc6203f60e;
    stim[1] = 100'ha6b781b9f1d20af524baaf4bd;
    stim[2] = 100'hfa74d207ab0f975d8ebfa16b6;
    stim[3] = 100'h1bc0c7e4a43b10b9fc602380d;
    stim[4] = 100'h9286be028e469479977228f4c;
    stim[5] = 100'h73b4cedd70b36cc556940ca9b;
    stim[6] = 100'hd16c5d58463342f01ec94df7a;
    stim[7] = 100'hecc61f8ba25d5717bb94142a7;
    stim[8] = 100'h6440bea7a2341973819b2c06c;
    stim[9] = 100'h9e502c0680da9683805454af9;
    stim[10] = 100'hd7446c7019bc1f98eaf46b845;
    stim[11] = 100'h63df9db29957081ee9c888d5d;
    stim[12] = 100'h8ec6ab05db69ad5e33e700491;
    stim[13] = 100'hadfba738e2c0d9db8abf62ce5;
    stim[14] = 100'h1a71531f5e4be7cbf0c66eaa2;
    stim[15] = 100'h1172a3aa53ede9a0e7524853b;
    stim[16] = 100'h95164ef125b45fc02d7f8d404;
    stim[17] = 100'h7d743e44e8c4da8aed0c2531a;
    stim[18] = 100'ha8afc8bfa5a53eead25abb7c8;
    stim[19] = 100'hffaf096d39163542842c9a6c5;
    stim[20] = 100'h4281762d335f30478a12d47f8;
    stim[21] = 100'h39b3a1bdee16a2230e02894b1;
    stim[22] = 100'h67dc8d280de4dc763a7fa6fc1;
    stim[23] = 100'hfbf4bd175dfa77f84d14e0d4a;
    stim[24] = 100'hd287a148aedc2e65bad88fe2b;
    stim[25] = 100'hbf0cb413d3bc237b23a6c39f5;
    stim[26] = 100'h2e449d3761355fefdbfc5de9f;
    stim[27] = 100'h9818f1c4f6dbddc9a9f679a0a;
    stim[28] = 100'h5157783fab44f92f396e92934;
    stim[29] = 100'h3726856934dbe2f1bc49bb82b;
    stim[30] = 100'h02848a5fba18ad5eca3dba37d;
    stim[31] = 100'ha371b74682ede879e7893d6f1;
    stim[32] = 100'h286d367147b1438fbaedb45e8;
    stim[33] = 100'h569dd053a3a27c44b8ef80a52;
    stim[34] = 100'hd30078af7be1439d4aaf7a908;
    stim[35] = 100'hba3586f4c249965e79c5314d0;
    stim[36] = 100'he35731a14378ee7ea914105fe;
    stim[37] = 100'hac8df572b4f58a4efaff4f88d;
    stim[38] = 100'he2aada02283d785d3bd911094;
    stim[39] = 100'h464d08d9799109a8ed3d1bce6;
    stim[40] = 100'hf8bc03b0bc2fb8e12e240ce95;
    stim[41] = 100'h36e6428da8d38850d1e9a8d89;
    stim[42] = 100'h82b18e3cf2b81debdba36f555;
    stim[43] = 100'h2024bd78da3ea3b8b20df3bcb;
    stim[44] = 100'h48cee298a71ca90e626040617;
    stim[45] = 100'h76ffba113d62c78c58a42a9c3;
    stim[46] = 100'h93b9af66c87b3adc1ed852d09;
    stim[47] = 100'hcc014d7e3512c438643d07737;
    stim[48] = 100'hac149750e0453b20ac41318bb;
    stim[49] = 100'h5eeab8489946acce63eebd2e7;
    stim[50] = 100'h7da2a0da2f6e014598b97a6fb;
    stim[51] = 100'h061767dbb240fe6f59a1f31d0;
    stim[52] = 100'h5949b27beed5fd9c9600cc052;
    stim[53] = 100'h04a5fa7e1746e9e1ae684d277;
    stim[54] = 100'h5e2f2b33a54dfc61421405f37;
    stim[55] = 100'hd7f0e8241594f01947c5a59b1;
    stim[56] = 100'h10ea554a854b57dc3d04bcd9f;
    stim[57] = 100'ha81c48eff528634e97d042b08;
    stim[58] = 100'he49229e3f889d00cd659b5be8;
    stim[59] = 100'h199be616754485c8b109523df;
    stim[60] = 100'h6a31d25caca5abec42a80808c;
    stim[61] = 100'h86f9210905fa95eaa29317c2f;
    stim[62] = 100'hd1d32ef96cab744db22d1aa90;
    stim[63] = 100'h2902a64b9d680e7026c0bffca;
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
      expv[0] = 3'h4;
      expv[1] = 3'h4;
      expv[2] = 3'h5;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h5;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h5;
      expv[13] = 3'h5;
      expv[14] = 3'h4;
      expv[15] = 3'h5;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h5;
      expv[19] = 3'h5;
      expv[20] = 3'h4;
      expv[21] = 3'h5;
      expv[22] = 3'h5;
      expv[23] = 3'h5;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h5;
      expv[29] = 3'h4;
      expv[30] = 3'h5;
      expv[31] = 3'h5;
      expv[32] = 3'h4;
      expv[33] = 3'h5;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h5;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h5;
      expv[42] = 3'h5;
      expv[43] = 3'h4;
      expv[44] = 3'h5;
      expv[45] = 3'h5;
      expv[46] = 3'h5;
      expv[47] = 3'h4;
      expv[48] = 3'h5;
      expv[49] = 3'h5;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h5;
      expv[56] = 3'h4;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h5;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h5;
      expv[63] = 3'h4;
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
