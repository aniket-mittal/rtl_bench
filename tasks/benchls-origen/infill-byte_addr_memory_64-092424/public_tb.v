// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092424 dut (
    .clk(clk),
    .Mem_Addr(in_vec[129:66]),
    .Write_Data(in_vec[65:2]),
    .MemWrite(in_vec[1:1]),
    .MemRead(in_vec[0:0]),
    .Read_Data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h0fdfbbb38a8e7cdabe60cffe45eb01915;
    stim[1] = 130'h0189313eb0989a6dcf98c9f2d6986e42f;
    stim[2] = 130'h3b6ae8851661daf0265b5c2bb82718b4a;
    stim[3] = 130'h12296cec838053873c71594cd804d2019;
    stim[4] = 130'h36c5819d492fb9fd007f66f3ca7957971;
    stim[5] = 130'h0aeb68b4dd44911b20bb2f04b4a626081;
    stim[6] = 130'h136acfcc709ff1279f561d23bd93eebf6;
    stim[7] = 130'h2b125d24bdf19b4e5ff70663af263d2eb;
    stim[8] = 130'h04a38010ce43df6bb9c591dd05622b465;
    stim[9] = 130'h03a78a5651200915bf92b585b481a5214;
    stim[10] = 130'h25139b535096e6db3a47cd7eb5126cfc5;
    stim[11] = 130'h0d8b05456f6253264448098631bf2c70e;
    stim[12] = 130'h3ccbafdc1f10a2364e108d09864ca56ee;
    stim[13] = 130'h386cd0babd48a27e450301ec858f53f5a;
    stim[14] = 130'h3382d0b249ad11fb53379a0227dd129de;
    stim[15] = 130'h13b1526c74d91284ef7356cf8498a1e9f;
    stim[16] = 130'h1532a6f1f65298f5faa9f73144a7421d1;
    stim[17] = 130'h3de403607db1fe728b0a0f9173dac23f2;
    stim[18] = 130'h26423addf36b1be815f71352fd7333bf0;
    stim[19] = 130'h18648d8252fcc3281f4c9edf82cb285e6;
    stim[20] = 130'h10119b53bb8c168c5c0dd5597017288d3;
    stim[21] = 130'h22c78236b29d1979ab477bc5d583cd64e;
    stim[22] = 130'h1e3aa00ab521fdfdc0a751ebbc5fc00c3;
    stim[23] = 130'h3c5f9d2be2b6d1b412332f8f8520a6879;
    stim[24] = 130'h0f9467e51bc91eef1db61fd41ee9fe4d0;
    stim[25] = 130'h2308ab98a396781c10d9d02b44c4f316e;
    stim[26] = 130'h11e5269738478a834d647b570d2dcc2ec;
    stim[27] = 130'h2d24b497ecb127c356d13609c186f2614;
    stim[28] = 130'h05beb773d75b601f30473cc617e36f178;
    stim[29] = 130'h1be838ea25c47395d6a33c9aaf11ecc55;
    stim[30] = 130'h256daf00d2f895971f52945d163840070;
    stim[31] = 130'h39910ce8716ff61a8ac5cfad87c8566be;
    stim[32] = 130'h05489884cdaf6a30d15d5302edc9b440a;
    stim[33] = 130'h3bfc7f91ab657ab3ec6e4cca4478cf928;
    stim[34] = 130'h157923eabf66b3b5576f882672596ed28;
    stim[35] = 130'h3a4c49978d798e2fd93f2dea8b8f59520;
    stim[36] = 130'h16635f784e683d110895bb1fb3d426c65;
    stim[37] = 130'h1790eeb0cd0bc97451948dfaff326542c;
    stim[38] = 130'h27b11c0eb07657c84f3cbf184941922f8;
    stim[39] = 130'h08da6be52f4fd3ac8fed69c08e076fe1a;
    stim[40] = 130'h0a0d39d1add1bfa0f3858b92eba4061f7;
    stim[41] = 130'h19e97ef9d0ec4115fad1acb64105336c9;
    stim[42] = 130'h0949a1ee4c17ec2a08d7639b0f00c957a;
    stim[43] = 130'h2203f8a40654b84334bc57712989d9f40;
    stim[44] = 130'h0fa3ff8c1b4c11ce18cef2e38b692c23c;
    stim[45] = 130'h090a46b5a41a98fd4246777eb0a5282c1;
    stim[46] = 130'h09f51d037e3df630dcc1c6c9fd64a7e09;
    stim[47] = 130'h1ca8a26607ba34233a297a731d036e42c;
    stim[48] = 130'h12b981e9cf748e8c3050f39b7efa5e519;
    stim[49] = 130'h029feee3dcb86fc273a5c67a3c4f37536;
    stim[50] = 130'h2b612360d483d688c548511eda3c86022;
    stim[51] = 130'h23c85c8df0ba6d00356e57b6249c87179;
    stim[52] = 130'h1ed98551270ce5fe73f8103313def55ce;
    stim[53] = 130'h297cebad73dd6fbee8f9e6609a67068ee;
    stim[54] = 130'h29d34fcf4b8a5282f040529a6eb3015da;
    stim[55] = 130'h33f100584bd6c85ff3150aa5c55cb9b38;
    stim[56] = 130'h1d71d1a938c8008007232386afbcc51ef;
    stim[57] = 130'h23172aee43223352cac9954d537ea29b3;
    stim[58] = 130'h0b617f9a66e24f231ecbd3618298bb212;
    stim[59] = 130'h2d2aa98763f8f35c73dd3c117cf5fc734;
    stim[60] = 130'h3e76bb5a512c0ee89093fe5782c22520a;
    stim[61] = 130'h22ae3afaf435daa2ff4b64acf55797f6c;
    stim[62] = 130'h0975336684288865a7e63ed1ac494bc13;
    stim[63] = 130'h3e7ce87e03b4de1da90733d1bb3c37304;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'h0000000000000000;
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
