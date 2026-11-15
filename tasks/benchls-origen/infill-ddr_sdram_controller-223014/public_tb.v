// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_223014 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .en(in_vec[66:66]),
    .addr(in_vec[65:34]),
    .wr_en(in_vec[33:33]),
    .wr_data(in_vec[32:1]),
    .rd_en(in_vec[0:0]),
    .rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hc5ac965b2a4432e15;
    stim[1] = 68'hf9db538fcad5e3415;
    stim[2] = 68'h75af671a3da83f6fe;
    stim[3] = 68'h3a95b9147fac21c7f;
    stim[4] = 68'h118737ae6681a4073;
    stim[5] = 68'h42473416faff4ec95;
    stim[6] = 68'h48e96baa965dc4d0d;
    stim[7] = 68'h06d55ebbde2c40c40;
    stim[8] = 68'h7ec90aa555c5b55e1;
    stim[9] = 68'h797409633f20cf8c3;
    stim[10] = 68'h2c7353e852e564f25;
    stim[11] = 68'h479e668a1d044ece1;
    stim[12] = 68'h65bb24da9b7d9d1bd;
    stim[13] = 68'h35523f58ce130ea7b;
    stim[14] = 68'h7fb0cedd20b040502;
    stim[15] = 68'h0c01026ee26d1c4ab;
    stim[16] = 68'h28196cebde551d928;
    stim[17] = 68'hc89f9c4aeacb5ba20;
    stim[18] = 68'h4dfef902e567f997c;
    stim[19] = 68'h78bdde0f68e620464;
    stim[20] = 68'h372124fc122c31d4f;
    stim[21] = 68'h57d781720986c58c0;
    stim[22] = 68'h05ef4c78f5fa7d566;
    stim[23] = 68'h5061701b2b18b5a13;
    stim[24] = 68'h08d6333c81016880a;
    stim[25] = 68'h65263c4371ed592d7;
    stim[26] = 68'h78f9f2850b2ce8232;
    stim[27] = 68'h4ec2c65983823f7a5;
    stim[28] = 68'h2c8b9edfc6a4c537c;
    stim[29] = 68'h6dc1ae894708041b5;
    stim[30] = 68'h5ac50a9f4b4e67c66;
    stim[31] = 68'h2fc585d6b84190b24;
    stim[32] = 68'h68ebb76fa599668aa;
    stim[33] = 68'h08c0c938eec6ee197;
    stim[34] = 68'h66eff6f69ced54587;
    stim[35] = 68'h7176c8f6b16f39595;
    stim[36] = 68'h40069802bc9a3a294;
    stim[37] = 68'h5fd748c17f50e9f37;
    stim[38] = 68'h76ec6cf91f9e28cbd;
    stim[39] = 68'h6507728644298b18e;
    stim[40] = 68'h690a4ddc86f37bda5;
    stim[41] = 68'h78bf73ecc5aa37624;
    stim[42] = 68'h631421a6c1995282a;
    stim[43] = 68'h7af814c482e42a743;
    stim[44] = 68'h5709293f121095698;
    stim[45] = 68'h08ceff2e4624e61bb;
    stim[46] = 68'h46152b4523db13c07;
    stim[47] = 68'h05d38bc15c7e2ace9;
    stim[48] = 68'h122361471af052c11;
    stim[49] = 68'h7d84439a0eb190411;
    stim[50] = 68'h1644d252959992c88;
    stim[51] = 68'h5ee6bfd3e7d103ef2;
    stim[52] = 68'h17fe0fcc208301850;
    stim[53] = 68'h4fc585c7a35bf62ba;
    stim[54] = 68'h457122e26f0dbbcfa;
    stim[55] = 68'h3d8341ce75cc0c2af;
    stim[56] = 68'h4012c038369d7f59b;
    stim[57] = 68'h44b64d768ce0509f8;
    stim[58] = 68'h0b955d9f53e44e204;
    stim[59] = 68'h74757fc1a25a8dccc;
    stim[60] = 68'h1322db0de4f52361f;
    stim[61] = 68'h563e979a75d06e206;
    stim[62] = 68'h10a72a4ccedf9a0dd;
    stim[63] = 68'h255171a7de9ca627a;
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
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
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
      expv[63] = 32'h00000000;
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
