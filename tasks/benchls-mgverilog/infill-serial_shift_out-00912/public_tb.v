// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00912 dut (
    .clk(clk),
    .sclk_posedge(in_vec[51:51]),
    .sclk_negedge(in_vec[50:50]),
    .reset(in_vec[49:49]),
    .en(in_vec[48:48]),
    .data(in_vec[47:0]),
    .out(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hac0211c2d955e;
    stim[1] = 52'he791593cf0c18;
    stim[2] = 52'h4012e4b131e79;
    stim[3] = 52'h84ce813debc8c;
    stim[4] = 52'h57d74a94d9036;
    stim[5] = 52'hc20ee8e45639c;
    stim[6] = 52'hd864b89967a3e;
    stim[7] = 52'hcb4a2c873244d;
    stim[8] = 52'h89e72cc308bd1;
    stim[9] = 52'h4a16cfe5ea48d;
    stim[10] = 52'h4fea66e5eb580;
    stim[11] = 52'h426ade091872e;
    stim[12] = 52'h542d36b85b7fa;
    stim[13] = 52'h5e5afbc6235d9;
    stim[14] = 52'hd61813ae4a7bb;
    stim[15] = 52'h42ea149134f8e;
    stim[16] = 52'h0d6532fae4c07;
    stim[17] = 52'h4d5c30e414b52;
    stim[18] = 52'h10b02b304c878;
    stim[19] = 52'hb27c40c23b723;
    stim[20] = 52'hde99d8f41a0bd;
    stim[21] = 52'hd29ea72eca53f;
    stim[22] = 52'h5c2ba77ca210e;
    stim[23] = 52'hc6ea86f93fdf9;
    stim[24] = 52'h45a8e5cf2eede;
    stim[25] = 52'hdd40e0338de75;
    stim[26] = 52'hd37a69e6b17fa;
    stim[27] = 52'hd6ab0b4de7fa1;
    stim[28] = 52'hc9db0858decec;
    stim[29] = 52'h9056548cba866;
    stim[30] = 52'hd4d9f6ca0d13f;
    stim[31] = 52'hd8f22d421b3b8;
    stim[32] = 52'h85ed56401707b;
    stim[33] = 52'hd0a3ec5525245;
    stim[34] = 52'h906e04db523c1;
    stim[35] = 52'h477c634b43585;
    stim[36] = 52'h00186da280de4;
    stim[37] = 52'hcf4a786c41f22;
    stim[38] = 52'h0955ecf2f3fd4;
    stim[39] = 52'h916bbe04e1c9d;
    stim[40] = 52'h13ba8f11bcb2c;
    stim[41] = 52'h0967769cae58a;
    stim[42] = 52'h181082341b2d2;
    stim[43] = 52'h974381406f405;
    stim[44] = 52'h84837bff27cd2;
    stim[45] = 52'h08b1ab2b7ab81;
    stim[46] = 52'hc3654f6321d30;
    stim[47] = 52'h58181702168bb;
    stim[48] = 52'h11bd9fce71735;
    stim[49] = 52'h4b9efd8b6eb4c;
    stim[50] = 52'hd4653eddec92a;
    stim[51] = 52'hc273a2de191bb;
    stim[52] = 52'h9b6dd432e5013;
    stim[53] = 52'h49cb7546179b3;
    stim[54] = 52'h0e7b480b10dda;
    stim[55] = 52'h858526d471ff6;
    stim[56] = 52'h0a1a89173fdbc;
    stim[57] = 52'h8c3667c4a4e14;
    stim[58] = 52'hdc2f3f1e37e1b;
    stim[59] = 52'hda2eab53dd911;
    stim[60] = 52'hdea2758f5933c;
    stim[61] = 52'h0b51e30bed193;
    stim[62] = 52'h481a9ddb3fc21;
    stim[63] = 52'h11dbe9946f582;
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
      expv[0] = 2'hx;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h3;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h0;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h0;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h0;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
