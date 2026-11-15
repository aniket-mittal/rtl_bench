// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061663 dut (
    .in1(in_vec[63:63]),
    .in2(in_vec[62:55]),
    .in3(in_vec[54:32]),
    .in4(in_vec[31:24]),
    .in5(in_vec[23:1]),
    .in6(in_vec[0:0]),
    .out1(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h76f3d438f0a6f9bd;
    stim[1] = 64'h990e69be27d25cc8;
    stim[2] = 64'h61170658c1eecb51;
    stim[3] = 64'he6552b9ee45ca2cf;
    stim[4] = 64'hc7ec09f29660242e;
    stim[5] = 64'h2c9b0f9fa13cc7bf;
    stim[6] = 64'he021df66532a2759;
    stim[7] = 64'hc9826017fadc59fb;
    stim[8] = 64'h0a9c3b1179abb5b6;
    stim[9] = 64'h90bfaf74f4458dbb;
    stim[10] = 64'h6e553ceb9b47a018;
    stim[11] = 64'h9ef10b0dd5eca7dc;
    stim[12] = 64'h94634191d0607e20;
    stim[13] = 64'h3922eabcfe910288;
    stim[14] = 64'h0be3ed1c02ad7855;
    stim[15] = 64'h575708f6670a6375;
    stim[16] = 64'h8f7fe9ee2f4564cf;
    stim[17] = 64'h03f8f3717fbcdc19;
    stim[18] = 64'h2acc471c467eb562;
    stim[19] = 64'h875a2ceaa2fdda8e;
    stim[20] = 64'haa77090dc9161c96;
    stim[21] = 64'h1782f7c5bd144998;
    stim[22] = 64'hb15cecd8c3752364;
    stim[23] = 64'h4597916f3a66c6fd;
    stim[24] = 64'h11992c38a47f773f;
    stim[25] = 64'h79fb8a118a57f0c3;
    stim[26] = 64'h6ac6e24ed70c4780;
    stim[27] = 64'h832b69542e1313aa;
    stim[28] = 64'hdd62864967bbf690;
    stim[29] = 64'h64b3892a246fd9d9;
    stim[30] = 64'hca5dabf71af7f6e0;
    stim[31] = 64'h348c1a8abf80d3f1;
    stim[32] = 64'h3bdd432619a8996d;
    stim[33] = 64'h617633f5c86f500e;
    stim[34] = 64'h03403dc52ff9af02;
    stim[35] = 64'hf5c54fbbfab0eed3;
    stim[36] = 64'hb2e7a684ecd39da6;
    stim[37] = 64'hc374b456e9aad038;
    stim[38] = 64'h8b937bc90f48d4f0;
    stim[39] = 64'h240dd97fc7840660;
    stim[40] = 64'hc889f82fae89cc48;
    stim[41] = 64'h8214b6b06d5c493f;
    stim[42] = 64'h08082e8d65830fe6;
    stim[43] = 64'hde9f3396680ba4f4;
    stim[44] = 64'h51c2248284c6bbab;
    stim[45] = 64'h90c2e48bfb512eb3;
    stim[46] = 64'hc57a66eec752527b;
    stim[47] = 64'h02781fda746f954e;
    stim[48] = 64'h847c9f580615dc81;
    stim[49] = 64'h0a556b9946fe0314;
    stim[50] = 64'h6e0132105b8618d5;
    stim[51] = 64'h7e3ab390f71f8dc1;
    stim[52] = 64'hf38423be584c9913;
    stim[53] = 64'he42e71aa196280d1;
    stim[54] = 64'ha0399754d6c62514;
    stim[55] = 64'h8461606fb29c3c21;
    stim[56] = 64'h4d0106a9dfe45d38;
    stim[57] = 64'h70a6157fe45e9a13;
    stim[58] = 64'h9b44986fd357aea3;
    stim[59] = 64'h1711529a1a011e38;
    stim[60] = 64'hb5a7a417211cf39b;
    stim[61] = 64'hb9ba1bf6752003f3;
    stim[62] = 64'h32776590fce1d368;
    stim[63] = 64'he357956876d85466;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h0;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h0;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h1;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
