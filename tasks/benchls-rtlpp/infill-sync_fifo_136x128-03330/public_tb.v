// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 139;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03330 dut (
    .clk(clk),
    .rstn(in_vec[138:138]),
    .data_in(in_vec[137:2]),
    .data_valid(in_vec[1:1]),
    .rdreq(in_vec[0:0]),
    .data_out(out_vec[137:2]),
    .data_out_valid(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 139'h1464504a24dddeb23da7b1df4a68b5932b2;
    stim[1] = 139'h0c553b03109afbb36bb83251589b02d69e7;
    stim[2] = 139'h5cc0f68f5b0dea07500814e845185c0b24b;
    stim[3] = 139'h633c7c0cde273c3c125b3e1452f77b84163;
    stim[4] = 139'h62573bf0bc90b7c37dc08ebe52a8dd13076;
    stim[5] = 139'h5430649836e30a7fd9a46924bc7f5e95c3a;
    stim[6] = 139'h4c481978dfe781d80e14b69b6c6da29d0a8;
    stim[7] = 139'h6e697ca323fdf859e78f3c48bfa7d9bcc43;
    stim[8] = 139'h59935f6b754d7c122f4889d4fb952264eca;
    stim[9] = 139'h761afc209150306b0ce43fd8b3b7e4bb700;
    stim[10] = 139'h5ee8b9f5b3b1c9721655068d7671835fbca;
    stim[11] = 139'h573d2617e9ba7f42cddfadb99f064d20405;
    stim[12] = 139'h7dadbdedd372e5aa56227fcbb37753ffd4a;
    stim[13] = 139'h5a608dccecc26590389c9b0f6ce1b43f178;
    stim[14] = 139'h5e9532a1a942ad4464bb2059d42c86a22ae;
    stim[15] = 139'h499f45a58e188d81c4ae091b512a711c801;
    stim[16] = 139'h4e2ea6784d7c74b320ca5d91c54043d078a;
    stim[17] = 139'h7ca53659696e0c6867fbf514118b01af5fe;
    stim[18] = 139'h4fa5a9118b8423c788a62f123de0124dae9;
    stim[19] = 139'h7526ef88502e14c92f61a1c44e72b46e9ba;
    stim[20] = 139'h41a51257b0bbe12438b8e311d50d571b9b6;
    stim[21] = 139'h53d0406bd5216ef01ca2e6b5f3d9af61484;
    stim[22] = 139'h16a087ef45260980c150932b4c6e08a0767;
    stim[23] = 139'h70382988407c13ee8c668b222265071ac02;
    stim[24] = 139'h2878ad71742e21802d8ecbcde729425af62;
    stim[25] = 139'h7c0be5d586b62736237269dacdd8fc73cd3;
    stim[26] = 139'h6c3abf9ee0600738f28ca36e7aa82e4ae0a;
    stim[27] = 139'h4513eeb6651499e27064ee760327f858052;
    stim[28] = 139'h4cf20c23fcf345dd6f86502ce1a67e53c94;
    stim[29] = 139'h4685bcd5465cfdf85fa2cfb1a7eca1b98cd;
    stim[30] = 139'h4b4cb2432311d5772506dd91877f1b9b590;
    stim[31] = 139'h7c6f343173a95afeb55546c64842fd63d33;
    stim[32] = 139'h772ebb348cb0681d508a73cbc4740db9832;
    stim[33] = 139'h6e91f9576a73dfe744c2a4e99feeabb3d18;
    stim[34] = 139'h59e18a2930f68887862d26902d4805be73f;
    stim[35] = 139'h68821f407320891b9cc7c5cdd16f3a82ce8;
    stim[36] = 139'h7ca7a847745d8027661c5f870b1b5bf3e25;
    stim[37] = 139'h6e69b14ce3ae03464ee047f084a58a2be24;
    stim[38] = 139'h7c547aac1f8c28ef35f871ae6eaca574444;
    stim[39] = 139'h4047f125ce407d209b7628a645adacfd978;
    stim[40] = 139'h6c0d6c678797dc7e8c1d92029a6b8b1ecb7;
    stim[41] = 139'h722acdc7cf3e5a530f897924a8f74e5c28a;
    stim[42] = 139'h4620bbb5c2d5859f4b484a0febbff0e6cb8;
    stim[43] = 139'h606728e46797f1297b5e4d8ab5c2d41e7ad;
    stim[44] = 139'h50ce80368c2f9d2dad90c7f9da505a9180a;
    stim[45] = 139'h53ad7d096e9737ccd989fb0e7d1404aab17;
    stim[46] = 139'h45f6264405f9d8c5e223b0b1c4ed02644b6;
    stim[47] = 139'h5ac3841aad338c0356b89a9786383478d4b;
    stim[48] = 139'h539127bf29e8f9d5e9208b3d21c44667b1a;
    stim[49] = 139'h45ac631e5d6c6a00fcaa1617aafa69fdddc;
    stim[50] = 139'h797041f96b84fd6e6c3d7508dc0da1634dd;
    stim[51] = 139'h5c6497c795692330534cc270b3b600ab1cf;
    stim[52] = 139'h681c3e4010d8d714f629cb577ce9aabe373;
    stim[53] = 139'h5cb5091a1a0d76a225383962c057cab4a57;
    stim[54] = 139'h7c66bd94053b01e602da7a41c9d1d888387;
    stim[55] = 139'h63b5293be259f3b3a7f2d28b9bb0e967775;
    stim[56] = 139'h7f995f05eee32ceb9449dd34fa61cb917b5;
    stim[57] = 139'h5a13f5c002428adb74ce07c29f43887cd5a;
    stim[58] = 139'h7b87326b39a090fe6a6abcca5ac15977fd1;
    stim[59] = 139'h4255ea8a9e6b024cbf3425fd770d0e5372e;
    stim[60] = 139'h5c36110eddd03fd16e23e63146d542a74a2;
    stim[61] = 139'h49dda97010938db55c4d565a00f8490ce6f;
    stim[62] = 139'h441513fd8cb70ad020e22b9de722b45f219;
    stim[63] = 139'h4bc4905f5f334e78e79ac1d2871d9db5fce;
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
      expv[0] = 138'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 138'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 138'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 138'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[5] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[6] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[7] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[8] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[9] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[10] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[11] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[12] = 138'h22573bf0bc90b7c37dc08ebe52a8dd13076;
      expv[13] = 138'h22573bf0bc90b7c37dc08ebe52a8dd13074;
      expv[14] = 138'h22573bf0bc90b7c37dc08ebe52a8dd13074;
      expv[15] = 138'h22573bf0bc90b7c37dc08ebe52a8dd13074;
      expv[16] = 138'h1430649836e30a7fd9a46924bc7f5e95c3a;
      expv[17] = 138'h1430649836e30a7fd9a46924bc7f5e95c38;
      expv[18] = 138'h1430649836e30a7fd9a46924bc7f5e95c38;
      expv[19] = 138'h2e697ca323fdf859e78f3c48bfa7d9bcc42;
      expv[20] = 138'h2e697ca323fdf859e78f3c48bfa7d9bcc40;
      expv[21] = 138'h2e697ca323fdf859e78f3c48bfa7d9bcc40;
      expv[22] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[23] = 138'h233c7c0cde273c3c125b3e1452f77b84160;
      expv[24] = 138'h30382988407c13ee8c668b222265071ac00;
      expv[25] = 138'h30382988407c13ee8c668b222265071ac00;
      expv[26] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[27] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[28] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[29] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[30] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[31] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[32] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[33] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[34] = 138'h3c0be5d586b62736237269dacdd8fc73cd0;
      expv[35] = 138'h2c3abf9ee0600738f28ca36e7aa82e4ae0a;
      expv[36] = 138'h2c3abf9ee0600738f28ca36e7aa82e4ae08;
      expv[37] = 138'h0513eeb6651499e27064ee760327f858052;
      expv[38] = 138'h0513eeb6651499e27064ee760327f858050;
      expv[39] = 138'h0513eeb6651499e27064ee760327f858050;
      expv[40] = 138'h0513eeb6651499e27064ee760327f858050;
      expv[41] = 138'h3c6f343173a95afeb55546c64842fd63d32;
      expv[42] = 138'h3c6f343173a95afeb55546c64842fd63d30;
      expv[43] = 138'h3c6f343173a95afeb55546c64842fd63d30;
      expv[44] = 138'h372ebb348cb0681d508a73cbc4740db9832;
      expv[45] = 138'h372ebb348cb0681d508a73cbc4740db9830;
      expv[46] = 138'h19e18a2930f68887862d26902d4805be73e;
      expv[47] = 138'h19e18a2930f68887862d26902d4805be73c;
      expv[48] = 138'h19e18a2930f68887862d26902d4805be73c;
      expv[49] = 138'h19e18a2930f68887862d26902d4805be73c;
      expv[50] = 138'h19e18a2930f68887862d26902d4805be73c;
      expv[51] = 138'h2c0d6c678797dc7e8c1d92029a6b8b1ecb6;
      expv[52] = 138'h322acdc7cf3e5a530f897924a8f74e5c28a;
      expv[53] = 138'h10ce80368c2f9d2dad90c7f9da505a9180a;
      expv[54] = 138'h10ce80368c2f9d2dad90c7f9da505a91808;
      expv[55] = 138'h13ad7d096e9737ccd989fb0e7d1404aab16;
      expv[56] = 138'h13ad7d096e9737ccd989fb0e7d1404aab14;
      expv[57] = 138'h05f6264405f9d8c5e223b0b1c4ed02644b6;
      expv[58] = 138'h05f6264405f9d8c5e223b0b1c4ed02644b4;
      expv[59] = 138'h1ac3841aad338c0356b89a9786383478d4a;
      expv[60] = 138'h1ac3841aad338c0356b89a9786383478d48;
      expv[61] = 138'h1ac3841aad338c0356b89a9786383478d48;
      expv[62] = 138'h139127bf29e8f9d5e9208b3d21c44667b1a;
      expv[63] = 138'h1c6497c795692330534cc270b3b600ab1ce;
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
