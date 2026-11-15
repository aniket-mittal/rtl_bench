// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 135;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01382 dut (
    .clk_i(clk),
    .rst_i(in_vec[134:134]),
    .cyc_i(in_vec[133:133]),
    .stb_i(in_vec[132:132]),
    .we_i(in_vec[131:131]),
    .dat_i(in_vec[130:3]),
    .cs_i(in_vec[2:2]),
    .sclk(in_vec[1:1]),
    .cts(in_vec[0:0]),
    .ack_o(out_vec[5:5]),
    .txd(out_vec[4:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 135'h6afba542098390a013ecbe67a4ab87fa96;
    stim[1] = 135'h73585ed5c3f355cefc25c4b4052e41c41e;
    stim[2] = 135'h120ad4d2cc36e97429d234b4a1523d5739;
    stim[3] = 135'h18e4ef050b244c92bcc14029f3d6d8a396;
    stim[4] = 135'h04915e89284ba0b3ae8ae258d077401568;
    stim[5] = 135'h35f5373f53299ab883ce787bc0a6dc507f;
    stim[6] = 135'h63d4f15a67e23455b9f0555037e5a6c702;
    stim[7] = 135'h222a1997b6db8f830ebb61c2e6cacd08fd;
    stim[8] = 135'h04e1b4a851e54fca5dcd3834f2067ca28a;
    stim[9] = 135'h35e3f5c3676273382e2ae0d431c2567978;
    stim[10] = 135'h0aeef6baf7ce5bb4fa94f7231808f4e08d;
    stim[11] = 135'h0c3e6ce19872d622787cb999c136fefed1;
    stim[12] = 135'h31cfa6725bd94a41c197c383a2a6a03966;
    stim[13] = 135'h09e11cd73c28e36170be66eb7df540de77;
    stim[14] = 135'h126c23497fe73940672a5b678b3196d773;
    stim[15] = 135'h347126f487b5e87fceff336192b98d4251;
    stim[16] = 135'h0489bb06e6cddfdd3dbf93dc69be82f472;
    stim[17] = 135'h2a2ed6c89992adaddf1a62794d36cc666a;
    stim[18] = 135'h0782bd373ed0c86dfc52ee5c81f92e9337;
    stim[19] = 135'h1a988c847c41bb5abb04a599a0d09d0978;
    stim[20] = 135'h13858a491f46e9518c86b7e45e34576bf4;
    stim[21] = 135'h173bd927e6a3f405d5b5699ace39383f57;
    stim[22] = 135'h29c7449516edd28ecb735c416d23603daa;
    stim[23] = 135'h17dc8712658be10067b5268ec6442bf82a;
    stim[24] = 135'h3c836c8d595b760029661c6e2464e1f0be;
    stim[25] = 135'h019e0c50fca64b43eece9970ced7232293;
    stim[26] = 135'h2369d4fa35291f7a662d6e0ca5357c2e9d;
    stim[27] = 135'h22f7bf4cba5354b2f16a8c33b8c5b653a0;
    stim[28] = 135'h264b993a140464619668bc84f8d5b569ca;
    stim[29] = 135'h02a979d683dcc82902d33139d963121fbe;
    stim[30] = 135'h20db80baf5648864fc649ba16e0b3bca9a;
    stim[31] = 135'h396e14bfb1002948da42e4b33fca39c309;
    stim[32] = 135'h083c41ddc3babcbb7841162f152e24f02f;
    stim[33] = 135'h28cfaa1b1822f9f1dd91616a3ee8fa8f88;
    stim[34] = 135'h1f7a13d8730ce8b50980a9cbf1c3e313a6;
    stim[35] = 135'h24acb43111bbaec7b943de713bcf74a505;
    stim[36] = 135'h3bf5b6537099dafea4968d7e2ee64ffe45;
    stim[37] = 135'h1fac42d12f2c3c1bc7771ea8deee3060ed;
    stim[38] = 135'h3b026125f5c8efc2b173471f5f82acb98b;
    stim[39] = 135'h4320ab94d0d5f6162f0a9bfc3a56683734;
    stim[40] = 135'h2f9dab2da2f70997a20f5453d2b1b44a18;
    stim[41] = 135'h076508439d0e0d8b0834ad5cec6ae8b6ff;
    stim[42] = 135'h0f48d5758e880188dc3f8c373e18f6848f;
    stim[43] = 135'h1b6a4c364d11a7ec631ec3b60699b26f1d;
    stim[44] = 135'h3f42d77f0a6d74b6f2d5f65e4805d81d7f;
    stim[45] = 135'h2de0af2d9a461374287d5d4386b3dd080a;
    stim[46] = 135'h11de33dff5c488cb65133cb35bb811f087;
    stim[47] = 135'h1a15558a4a8462003184d514353e6a1b08;
    stim[48] = 135'h3e9b6d520a3c428b52ea8f8493056125ca;
    stim[49] = 135'h0af1f57ac96193b38b0e0082731fb6f9a6;
    stim[50] = 135'h044db44febca61461b7902b2c9032df7d8;
    stim[51] = 135'h183ce34e6542d9da1d407d8eda1112f0ef;
    stim[52] = 135'h4892c77a3e3556c9e464a38475df498902;
    stim[53] = 135'h199ea01586299c6978608b7d07bc7f7c34;
    stim[54] = 135'h2750409d08eab8ace232a87d30eba3db7f;
    stim[55] = 135'h1dd6d205752935dc0472460391a606d6dc;
    stim[56] = 135'h2ed130238eba670c1c7d127562eecb13d2;
    stim[57] = 135'h216ea23c591fab058f7c2454bd12f9451e;
    stim[58] = 135'h0208287b657d9012346a66a353f285f664;
    stim[59] = 135'h3894e8f94fff6cf788c6d8c16e61bf7073;
    stim[60] = 135'h335de0ad78bea4d9269915df05a1b6de3e;
    stim[61] = 135'h2cc2765a34568c09d12f813d640bce376b;
    stim[62] = 135'h1a73aa2e541877a8663352cd6b8c0f73e9;
    stim[63] = 135'h139545f79389cd90806c0321846ec399f7;
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
      expv[0] = 6'h1f;
      expv[1] = 6'h3f;
      expv[2] = 6'h1f;
      expv[3] = 6'h1f;
      expv[4] = 6'h1f;
      expv[5] = 6'h3f;
      expv[6] = 6'h1f;
      expv[7] = 6'h1f;
      expv[8] = 6'h1f;
      expv[9] = 6'h1f;
      expv[10] = 6'h1f;
      expv[11] = 6'h1f;
      expv[12] = 6'h3f;
      expv[13] = 6'h1f;
      expv[14] = 6'h1f;
      expv[15] = 6'h1f;
      expv[16] = 6'h1f;
      expv[17] = 6'h1f;
      expv[18] = 6'h1f;
      expv[19] = 6'h1f;
      expv[20] = 6'h1f;
      expv[21] = 6'h1f;
      expv[22] = 6'h1f;
      expv[23] = 6'h1f;
      expv[24] = 6'h3f;
      expv[25] = 6'h1f;
      expv[26] = 6'h1f;
      expv[27] = 6'h1f;
      expv[28] = 6'h1f;
      expv[29] = 6'h1f;
      expv[30] = 6'h1f;
      expv[31] = 6'h1f;
      expv[32] = 6'h1f;
      expv[33] = 6'h1f;
      expv[34] = 6'h1f;
      expv[35] = 6'h1f;
      expv[36] = 6'h3f;
      expv[37] = 6'h1f;
      expv[38] = 6'h1f;
      expv[39] = 6'h1f;
      expv[40] = 6'h1f;
      expv[41] = 6'h1f;
      expv[42] = 6'h1f;
      expv[43] = 6'h1f;
      expv[44] = 6'h3f;
      expv[45] = 6'h1f;
      expv[46] = 6'h1f;
      expv[47] = 6'h1f;
      expv[48] = 6'h1f;
      expv[49] = 6'h1f;
      expv[50] = 6'h1f;
      expv[51] = 6'h1f;
      expv[52] = 6'h1f;
      expv[53] = 6'h1f;
      expv[54] = 6'h1f;
      expv[55] = 6'h1f;
      expv[56] = 6'h1f;
      expv[57] = 6'h1f;
      expv[58] = 6'h1f;
      expv[59] = 6'h1f;
      expv[60] = 6'h3f;
      expv[61] = 6'h1f;
      expv[62] = 6'h1f;
      expv[63] = 6'h1f;
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
