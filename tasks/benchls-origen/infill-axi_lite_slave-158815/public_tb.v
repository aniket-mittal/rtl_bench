// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158815 dut (
    .AxiAClk(clk),
    .AxiAResetN(in_vec[100:100]),
    .ARaddr(in_vec[99:68]),
    .Rready(in_vec[67:67]),
    .ARvalid(in_vec[66:66]),
    .AWaddr(in_vec[65:34]),
    .Wdata(in_vec[33:2]),
    .AWvalid(in_vec[1:1]),
    .Wvalid(in_vec[0:0]),
    .Rdata(out_vec[37:6]),
    .Rvalid(out_vec[5:5]),
    .ARready(out_vec[4:4]),
    .WriteEN(out_vec[3:3]),
    .AWready(out_vec[2:2]),
    .Wready(out_vec[1:1]),
    .Bvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h0b0b9fd2d5f18c1fa1f1e8b0a0;
    stim[1] = 101'h0860721acc76d133ee60cf81db;
    stim[2] = 101'h1005105e99deb0d2d32ca075e6;
    stim[3] = 101'h1bace849ef6e531c9762510bc0;
    stim[4] = 101'h19eaca10f0c68dca1fea627b2f;
    stim[5] = 101'h165c5cfbecd3c751663a9915a3;
    stim[6] = 101'h17308ebc01b4d7679f30fa4b83;
    stim[7] = 101'h1959f20c8469ca6f8437a46371;
    stim[8] = 101'h164bd1c133016d348e949134e6;
    stim[9] = 101'h1ce667ae8c163408084e0ec671;
    stim[10] = 101'h19e633c5d33034ef210023d5de;
    stim[11] = 101'h14884ac013d9eecab096b6e1bb;
    stim[12] = 101'h114c93d03aa72ad8cccce354a6;
    stim[13] = 101'h1d412eba87d9a409f87716b1be;
    stim[14] = 101'h182524de2ac76c697ead631e93;
    stim[15] = 101'h1cdbcbc5060dcfa0fc63e89af5;
    stim[16] = 101'h1db5903b9547144ef4be5cb894;
    stim[17] = 101'h167ac140c533d72671efe6bbd0;
    stim[18] = 101'h1b98b04955d0f752eb8ab05841;
    stim[19] = 101'h1a4d57146c3de8039ef0ec0372;
    stim[20] = 101'h15760fe054c2d30fc55f87c6df;
    stim[21] = 101'h1e51313c1c39b576c73b073095;
    stim[22] = 101'h104d580cbd3fd63478f32438f6;
    stim[23] = 101'h1437e5c296019ee80272a597f6;
    stim[24] = 101'h1f1a9999cf982fc246ac2afc7d;
    stim[25] = 101'h140c268e3edec662c2a1359d71;
    stim[26] = 101'h15c95f2cd181182979e38ddb0e;
    stim[27] = 101'h1b45ec207da2195e64e86f1249;
    stim[28] = 101'h185ceb57ef9767abf08c43ef66;
    stim[29] = 101'h10f5fda6c44c60a768b6a3440f;
    stim[30] = 101'h16fc659046086554f19ab9c95a;
    stim[31] = 101'h1c002ac646cbc8a5ee6d36e835;
    stim[32] = 101'h1a9a35458414ba9c953323fc32;
    stim[33] = 101'h13ec7c7b3e9d50c780fdd37d35;
    stim[34] = 101'h1a5b468a0f7265987c12bec67e;
    stim[35] = 101'h1594dd3fbcbd163f2075672357;
    stim[36] = 101'h1b9e4f0e1fb47f534cb1479153;
    stim[37] = 101'h15a26231fc4436d9dfa14e89e5;
    stim[38] = 101'h19a100aa66bda494d717885e8c;
    stim[39] = 101'h1465b5f50064a9cde86c4261d1;
    stim[40] = 101'h1a23a68e45fa5479dbfcabcb01;
    stim[41] = 101'h149ee1fa635d6380264e125175;
    stim[42] = 101'h1dedc60946c35c17fda5055e35;
    stim[43] = 101'h1511c4e5902cb3e441323166f7;
    stim[44] = 101'h1cb84e8a34f30b8ad34fd77f19;
    stim[45] = 101'h16f0e134f947ac251909c3ac4b;
    stim[46] = 101'h18186a947f4049d4983b3a82c4;
    stim[47] = 101'h1a47944d83b1f4fe3be5c21313;
    stim[48] = 101'h1b4bd8ea4dbe6f4480efc0c161;
    stim[49] = 101'h167bc75cbba39becf0f10f4e2c;
    stim[50] = 101'h1848cae688c5dc2c6a4e6581c3;
    stim[51] = 101'h18479cae136aa8bc9bd39cd6b5;
    stim[52] = 101'h1f94558bd02e9169162ecb4a80;
    stim[53] = 101'h1a0e91298fc8f3660fa82c807e;
    stim[54] = 101'h14e7170bd354763739d572e877;
    stim[55] = 101'h11a22a31b58293e84211697375;
    stim[56] = 101'h1588a1221cc242228402b115e3;
    stim[57] = 101'h1e72b95e36c091b5fdb2c47532;
    stim[58] = 101'h122e112cb7cdaed61f2867bd8f;
    stim[59] = 101'h1d17a072b1f6d82e81c3f53239;
    stim[60] = 101'h14a2db14a591c633f9543382bc;
    stim[61] = 101'h1bc6dc7adb051e35dddfe87174;
    stim[62] = 101'h18a315c52a302e53f109a3fb2e;
    stim[63] = 101'h14fab0da70d4ff9382767925d9;
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
      expv[0] = 38'hxxxxxxxxx0;
      expv[1] = 38'hxxxxxxxxx0;
      expv[2] = 38'hxxxxxxxxx0;
      expv[3] = 38'hxxxxxxxxx4;
      expv[4] = 38'hxxxxxxxxx2;
      expv[5] = 38'hxxxxxxxxx9;
      expv[6] = 38'hxxxxxxxxxd;
      expv[7] = 38'hxxxxxxxxxb;
      expv[8] = 38'hxxxxxxxxx9;
      expv[9] = 38'hxxxxxxxxxd;
      expv[10] = 38'hxxxxxxxxxb;
      expv[11] = 38'hxxxxxxxxxb;
      expv[12] = 38'hxxxxxxxxx9;
      expv[13] = 38'hxxxxxxxxxd;
      expv[14] = 38'hxxxxxxxxxb;
      expv[15] = 38'hxxxxxxxxx9;
      expv[16] = 38'hxxxxxxxxx9;
      expv[17] = 38'hxxxxxxxxx9;
      expv[18] = 38'hxxxxxxxxx9;
      expv[19] = 38'hxxxxxxxxx9;
      expv[20] = 38'hxxxxxxxxxd;
      expv[21] = 38'hxxxxxxxxxb;
      expv[22] = 38'hxxxxxxxxx9;
      expv[23] = 38'hxxxxxxxxxd;
      expv[24] = 38'hxxxxxxxxxb;
      expv[25] = 38'hxxxxxxxxx9;
      expv[26] = 38'hxxxxxxxxx9;
      expv[27] = 38'hxxxxxxxxxd;
      expv[28] = 38'hxxxxxxxxxb;
      expv[29] = 38'hxxxxxxxxxb;
      expv[30] = 38'hxxxxxxxxx9;
      expv[31] = 38'hxxxxxxxxxd;
      expv[32] = 38'hxxxxxxxxxb;
      expv[33] = 38'hxxxxxxxxxb;
      expv[34] = 38'hxxxxxxxxx9;
      expv[35] = 38'hxxxxxxxxxd;
      expv[36] = 38'hxxxxxxxxxb;
      expv[37] = 38'hxxxxxxxxx9;
      expv[38] = 38'hxxxxxxxxx9;
      expv[39] = 38'hxxxxxxxxx9;
      expv[40] = 38'hxxxxxxxxx9;
      expv[41] = 38'hxxxxxxxxx9;
      expv[42] = 38'hxxxxxxxxx9;
      expv[43] = 38'hxxxxxxxxx9;
      expv[44] = 38'hxxxxxxxxxd;
      expv[45] = 38'hxxxxxxxxxb;
      expv[46] = 38'hxxxxxxxxx9;
      expv[47] = 38'hxxxxxxxxx9;
      expv[48] = 38'hxxxxxxxxxd;
      expv[49] = 38'hxxxxxxxxxb;
      expv[50] = 38'hxxxxxxxxxb;
      expv[51] = 38'hxxxxxxxxx9;
      expv[52] = 38'hxxxxxxxxx9;
      expv[53] = 38'hxxxxxxxxx9;
      expv[54] = 38'hxxxxxxxxxd;
      expv[55] = 38'hxxxxxxxxxb;
      expv[56] = 38'hxxxxxxxxx9;
      expv[57] = 38'hxxxxxxxxxd;
      expv[58] = 38'hxxxxxxxxxb;
      expv[59] = 38'hxxxxxxxxx9;
      expv[60] = 38'hxxxxxxxxx9;
      expv[61] = 38'hxxxxxxxxx9;
      expv[62] = 38'hxxxxxxxxx9;
      expv[63] = 38'hxxxxxxxxxd;
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
