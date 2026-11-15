// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093405 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .in_V_dout(in_vec[33:2]),
    .in_V_empty_n(in_vec[1:1]),
    .out_V_full_n(in_vec[0:0]),
    .in_V_read(out_vec[33:33]),
    .out_V_din(out_vec[32:1]),
    .out_V_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6f2c200df;
    stim[1] = 35'h68914123e;
    stim[2] = 35'h131e2ff1f;
    stim[3] = 35'h20ae75411;
    stim[4] = 35'h1cdc09590;
    stim[5] = 35'h30fe19bfd;
    stim[6] = 35'h3f6b50ec1;
    stim[7] = 35'h1e663ad3a;
    stim[8] = 35'h23dcd0774;
    stim[9] = 35'h3cf5ceb6a;
    stim[10] = 35'h068881ddf;
    stim[11] = 35'h3e2f43421;
    stim[12] = 35'h35a1bb692;
    stim[13] = 35'h56748b9a1;
    stim[14] = 35'h0c1db75a4;
    stim[15] = 35'h39061f8bf;
    stim[16] = 35'h3b28881b1;
    stim[17] = 35'h2e7bcbc5c;
    stim[18] = 35'h0f9ac61d7;
    stim[19] = 35'h3ac1d365f;
    stim[20] = 35'h3402a1ace;
    stim[21] = 35'h1c8602e2b;
    stim[22] = 35'h0e521eb5e;
    stim[23] = 35'h0f492623f;
    stim[24] = 35'h3f6e7a292;
    stim[25] = 35'h3be2825ab;
    stim[26] = 35'h2c8fbda6e;
    stim[27] = 35'h2b2c44699;
    stim[28] = 35'h02994408d;
    stim[29] = 35'h127413214;
    stim[30] = 35'h3ada3071c;
    stim[31] = 35'h1ba2248ea;
    stim[32] = 35'h3a68abaca;
    stim[33] = 35'h3e7a67caf;
    stim[34] = 35'h2e5dd0772;
    stim[35] = 35'h37371affc;
    stim[36] = 35'h0aaea2809;
    stim[37] = 35'h36679cadc;
    stim[38] = 35'h30ff14a35;
    stim[39] = 35'h11589d548;
    stim[40] = 35'h324b452d2;
    stim[41] = 35'h274acb1c3;
    stim[42] = 35'h08c81fc29;
    stim[43] = 35'h3502e5d99;
    stim[44] = 35'h2b24f644a;
    stim[45] = 35'h14f1baba4;
    stim[46] = 35'h26838aa42;
    stim[47] = 35'h11b358d70;
    stim[48] = 35'h00dc659ec;
    stim[49] = 35'h19ea4ddbc;
    stim[50] = 35'h2924ee8c7;
    stim[51] = 35'h2f2a36e10;
    stim[52] = 35'h0055069e0;
    stim[53] = 35'h32f10ff40;
    stim[54] = 35'h2d43bc2a7;
    stim[55] = 35'h23bab439f;
    stim[56] = 35'h0087da104;
    stim[57] = 35'h093310aa7;
    stim[58] = 35'h1d10293d7;
    stim[59] = 35'h0aea4f675;
    stim[60] = 35'h00c8eab21;
    stim[61] = 35'h0399fc2ea;
    stim[62] = 35'h22ebe147d;
    stim[63] = 35'h39a436ea2;
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
      expv[0] = 34'h0f2c200de;
      expv[1] = 34'h08914123e;
      expv[2] = 34'h131e2ff1e;
      expv[3] = 34'h00ae75412;
      expv[4] = 34'h1cdc09592;
      expv[5] = 34'h10fe19bfe;
      expv[6] = 34'h1f6b50ec2;
      expv[7] = 34'h1e663ad3a;
      expv[8] = 34'h03dcd0776;
      expv[9] = 34'h1cf5ceb6a;
      expv[10] = 34'h268881ddf;
      expv[11] = 34'h1e2f43422;
      expv[12] = 34'h15a1bb692;
      expv[13] = 34'h16748b9a2;
      expv[14] = 34'h0c1db75a6;
      expv[15] = 34'h39061f8bf;
      expv[16] = 34'h1b28881b2;
      expv[17] = 34'h0e7bcbc5e;
      expv[18] = 34'h2f9ac61d7;
      expv[19] = 34'h3ac1d365f;
      expv[20] = 34'h1402a1ace;
      expv[21] = 34'h3c8602e2b;
      expv[22] = 34'h0e521eb5e;
      expv[23] = 34'h2f492623f;
      expv[24] = 34'h1f6e7a292;
      expv[25] = 34'h1be2825aa;
      expv[26] = 34'h0c8fbda6e;
      expv[27] = 34'h0b2c4469a;
      expv[28] = 34'h02994408e;
      expv[29] = 34'h127413216;
      expv[30] = 34'h1ada3071e;
      expv[31] = 34'h1ba2248ea;
      expv[32] = 34'h1a68abaca;
      expv[33] = 34'h3e7a67caf;
      expv[34] = 34'h0e5dd0772;
      expv[35] = 34'h17371affe;
      expv[36] = 34'h0aaea280a;
      expv[37] = 34'h16679cade;
      expv[38] = 34'h10ff14a36;
      expv[39] = 34'h11589d54a;
      expv[40] = 34'h124b452d2;
      expv[41] = 34'h274acb1c3;
      expv[42] = 34'h08c81fc2a;
      expv[43] = 34'h1502e5d9a;
      expv[44] = 34'h0b24f644a;
      expv[45] = 34'h14f1baba6;
      expv[46] = 34'h06838aa42;
      expv[47] = 34'h11b358d72;
      expv[48] = 34'h00dc659ee;
      expv[49] = 34'h19ea4ddbe;
      expv[50] = 34'h2924ee8c7;
      expv[51] = 34'h0f2a36e12;
      expv[52] = 34'h0055069e2;
      expv[53] = 34'h12f10ff42;
      expv[54] = 34'h2d43bc2a7;
      expv[55] = 34'h23bab439f;
      expv[56] = 34'h0087da106;
      expv[57] = 34'h093310aa6;
      expv[58] = 34'h3d10293d7;
      expv[59] = 34'h0aea4f676;
      expv[60] = 34'h00c8eab22;
      expv[61] = 34'h0399fc2ea;
      expv[62] = 34'h02ebe147e;
      expv[63] = 34'h19a436ea2;
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
