// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00692 dut (
    .in0(in_vec[98:67]),
    .s0(in_vec[66:66]),
    .in1(in_vec[65:34]),
    .s1(in_vec[33:33]),
    .in2(in_vec[32:1]),
    .s2(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h6cf692db0eece1ae1253e962d;
    stim[1] = 99'h5b6898f60c85712c323cb86f5;
    stim[2] = 99'h0ef647af471c4ff2b719f7d25;
    stim[3] = 99'h5b9d302f467f5a6f275a71bbd;
    stim[4] = 99'h2da57f234669e091a49f58951;
    stim[5] = 99'h3ad2d5b575dce604bf15c2949;
    stim[6] = 99'h5838b197d9931058243ffcf54;
    stim[7] = 99'h148757d805fd482dbce32160a;
    stim[8] = 99'h352fb130ccf9890ead3afd491;
    stim[9] = 99'h7e8a3cb50072cf401406cff9d;
    stim[10] = 99'h3307f211611063f470790a031;
    stim[11] = 99'h32f3f43d6c2bd14a2e6776f86;
    stim[12] = 99'h5da25aee88c3345c2ce7963c6;
    stim[13] = 99'h0255c50340be3d7d3916d8d0e;
    stim[14] = 99'h4c4eb79d0bdb39ab7c0de2afd;
    stim[15] = 99'h6abae772be7d24a093c600890;
    stim[16] = 99'h353449b019d2381bb1fbe7a00;
    stim[17] = 99'h6147a16025ef283a35984d9a3;
    stim[18] = 99'h0babf8aef008674f939e80856;
    stim[19] = 99'h08c97b4d0f79532f42e0d4d9f;
    stim[20] = 99'h51908a520d380aa4a6acdf6fb;
    stim[21] = 99'h32ab61c77014cff1932392e78;
    stim[22] = 99'h0a450152c5e6113d2fbb6a453;
    stim[23] = 99'h0ec9f973fab491d873569b46c;
    stim[24] = 99'h30a1f64295ef1dcbec4eb8834;
    stim[25] = 99'h7a2568509a27c9cda0bfda17e;
    stim[26] = 99'h1027c2ff9b6eff45427371648;
    stim[27] = 99'h226bcbbfe5baedcdc4997bba7;
    stim[28] = 99'h4129f7af286f2e564c9c20862;
    stim[29] = 99'h6b770f0857d15527c8c4b0548;
    stim[30] = 99'h28635d8362fccbb2b28cccbd9;
    stim[31] = 99'h54805d710dabc17e249a7b3bb;
    stim[32] = 99'h12997f83aa78ff595175bd16c;
    stim[33] = 99'h798f9e8b96930c6fb8be40f77;
    stim[34] = 99'h2abb33b14f37cd2f607a393de;
    stim[35] = 99'h5d093c4387920efbf888e8f19;
    stim[36] = 99'h69159a02847562213ca5bc021;
    stim[37] = 99'h4dc08cf6070b46f3c7b45e05a;
    stim[38] = 99'h12bfb11f698a5c9027768dee5;
    stim[39] = 99'h1068a2d1c74b1b6099e869a5a;
    stim[40] = 99'h4f5c56879059136e272b209e9;
    stim[41] = 99'h745f820f0d3ec1f2a65cb3fc7;
    stim[42] = 99'h3f9b0c74b7d23adeb6f2ce736;
    stim[43] = 99'h3de8e333496838f0324744bae;
    stim[44] = 99'h1cfbbda5c8a91b553c5325511;
    stim[45] = 99'h4eb8bca12552fccfe81171d26;
    stim[46] = 99'h1dd4dee7c8b6f83ce8ee4d17f;
    stim[47] = 99'h061397ee9d8bb3e700139aecf;
    stim[48] = 99'h17df9e3994a014685efa481f1;
    stim[49] = 99'h6c1c79ea974c447406f656a7c;
    stim[50] = 99'h7d6d84a38173bf3acbfcec78a;
    stim[51] = 99'h4eedf7c0044aea6a0959d866b;
    stim[52] = 99'h7371aef806ee083a94b4dfac1;
    stim[53] = 99'h439f96910e6a7ea8cf0d69702;
    stim[54] = 99'h734adf257dbbaf6fd63b98cec;
    stim[55] = 99'h316634eb235fe84ef770c05f7;
    stim[56] = 99'h2900852bf7bb027e016e25d11;
    stim[57] = 99'h52d9c7e9c0d6ed5684b48e40d;
    stim[58] = 99'h5ec1b30fc7e9df0df41306da9;
    stim[59] = 99'h15ddc3617789d61578d0911d8;
    stim[60] = 99'h5fc5a896d537af9969a7f4054;
    stim[61] = 99'h2bf6d96ab987a9f8d1d812d26;
    stim[62] = 99'h0eda142cb1e27d8ee74b20a80;
    stim[63] = 99'h799a1d44b04c60e71c3a5b559;
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
      expv[0] = 32'h929f4b16;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'h17f520b6;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'ha0367fce;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'h230cd170;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'h6748e06e;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'h1757f15d;
      expv[19] = 32'h1706a6cf;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'h6556c38e;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'h57bc772f;
      expv[25] = 32'h689f2736;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hd6ee1e10;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'h20d145a3;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hdf48eb7a;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'h954bf33f;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h009cd767;
      expv[48] = 32'hf7d240f8;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'h4acec335;
      expv[52] = 32'ha5a6fd60;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'he695be4a;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hc789f63b;
      expv[63] = 32'he1d2daac;
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
