// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055672 dut (
    .clk(clk),
    .rst(in_vec[99:99]),
    .pc(in_vec[98:67]),
    .br(in_vec[66:66]),
    .isPCjmp(in_vec[65:65]),
    .jtype(in_vec[64:64]),
    .pce(in_vec[63:32]),
    .PCjmp(in_vec[31:0]),
    .PCN(out_vec[32:1]),
    .fail(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'habcaa1b0614c76ab338e8bdb5;
    stim[1] = 100'h920de9d4f291075c1db8f6234;
    stim[2] = 100'h5899c5a3d7da878fb57e36e48;
    stim[3] = 100'h4d48e30678cd46a4250de1b25;
    stim[4] = 100'h52db8aea03110c51cc9afcb45;
    stim[5] = 100'h58da94411573301b81d0dc98d;
    stim[6] = 100'h35a53a6a7afe8f9ffe489dc9d;
    stim[7] = 100'h6ab4ca03e26d0eda1b09cb48b;
    stim[8] = 100'h1cb2de48fb4623740e05d9777;
    stim[9] = 100'h71aed0356dd74d6d5b2dff745;
    stim[10] = 100'h790b575bbc5043c01f59f8fe8;
    stim[11] = 100'h3ebfe702ff79adfd57601f590;
    stim[12] = 100'h7836103405c6b310a3d8b6a0b;
    stim[13] = 100'h27650fe41a08576e34f0b90cf;
    stim[14] = 100'h2d355d1ec27648afc69d6a7f6;
    stim[15] = 100'h0824412afd9bf9e22ec4d87ff;
    stim[16] = 100'h5da0f09a6ab74dadd58fcfb76;
    stim[17] = 100'h695a40443bf481e6cc84546f3;
    stim[18] = 100'h728b785a7890274822f90233e;
    stim[19] = 100'h0719469a9ef26aae0b17f4de7;
    stim[20] = 100'h5ccb976f863258487d4464368;
    stim[21] = 100'h2f3dae51341491783209cbd4c;
    stim[22] = 100'h6a7a1ad70bf7e25a0107f2306;
    stim[23] = 100'h0ac15d37062ba5c71eacd26d0;
    stim[24] = 100'h15260c3221c60111c0675ecc4;
    stim[25] = 100'h071714c5492826ed9391c2df7;
    stim[26] = 100'h40355403aab3a6942bde40d0e;
    stim[27] = 100'h64e282d7902e19833e1882c29;
    stim[28] = 100'h46e778ee72804ad58ca1b0f59;
    stim[29] = 100'h508348dff8db5ad4f47e30e18;
    stim[30] = 100'h6d1e723bdd05f7b6f0fbda0df;
    stim[31] = 100'h5ef390bad62d8b9be11f4d058;
    stim[32] = 100'h2118e49b4a9c9b6a07ef8c2d8;
    stim[33] = 100'h6b543d8aca3e269c0d6426c12;
    stim[34] = 100'h53eba19b3c9133a924a769f93;
    stim[35] = 100'h59481963979de5278dd7855a3;
    stim[36] = 100'h2e46dce76f029e122ec67561e;
    stim[37] = 100'h56dfd5ed8fc7c7cdea9977994;
    stim[38] = 100'h148a8411a33e7e952e9422a2e;
    stim[39] = 100'h73b01a0018ed8a2317c11bdd0;
    stim[40] = 100'h2a465fb2adeb5e7fdb8d8957f;
    stim[41] = 100'h331d156075863928e18e2d5aa;
    stim[42] = 100'h0fcec945d6ef0157bc89354d5;
    stim[43] = 100'h31f97bf4a65afefd2bf966a79;
    stim[44] = 100'h1d4db1bb8f041895368bd3a82;
    stim[45] = 100'h35986750c964fa21941e90b30;
    stim[46] = 100'h3fc96743804cc60e25be34ea1;
    stim[47] = 100'h0c6cf2483036bd1812c6b7ac0;
    stim[48] = 100'h5d7207146fbe4d27f2d68c1b2;
    stim[49] = 100'h3c3dbac95fa8a1ab4bf545f7e;
    stim[50] = 100'h27b3daa24ec80a16f5fb41a57;
    stim[51] = 100'h3bb4888e9072385f827055d9a;
    stim[52] = 100'h6f12ae028a67fa2688b94bd0b;
    stim[53] = 100'h51c6c2e8d1923956fd1b07142;
    stim[54] = 100'h6378eec66998ef2ef200f55bd;
    stim[55] = 100'h21d7897bc29647282b1fb805e;
    stim[56] = 100'h3a169d081674480ac7ef4f99c;
    stim[57] = 100'h50315ad923966598a97ff1fb3;
    stim[58] = 100'h85320b8f1ee8f5338efc73c17;
    stim[59] = 100'h7237ffc462f33d41b4e2a71a5;
    stim[60] = 100'h4a17ce59eaebc74580e80c6b3;
    stim[61] = 100'h6682a877b3283dff1117ef13a;
    stim[62] = 100'h4fbb71afdc1a8e5b46c8f7fe1;
    stim[63] = 100'h40c49186201b265f16118b9a6;
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
      expv[0] = 33'h071d17b6b;
      expv[1] = 33'h1b71ec469;
      expv[2] = 33'h0afc6dc91;
      expv[3] = 33'h0a1bc364b;
      expv[4] = 33'h14b6e2bb0;
      expv[5] = 33'h03a1b931b;
      expv[6] = 33'h1c913b93b;
      expv[7] = 33'h161396917;
      expv[8] = 33'h1c0bb2eef;
      expv[9] = 33'h165bfee8b;
      expv[10] = 33'h1eb3f1fd1;
      expv[11] = 33'h0ec03eb21;
      expv[12] = 33'h1e0d840d8;
      expv[13] = 33'h09e17219f;
      expv[14] = 33'h0b4d57482;
      expv[15] = 33'h1d89b0fff;
      expv[16] = 33'h0b1f9f6ed;
      expv[17] = 33'h1908a8de7;
      expv[18] = 33'h05f20467d;
      expv[19] = 33'h162fe9bcf;
      expv[20] = 33'h1732e5dc6;
      expv[21] = 33'h041397a99;
      expv[22] = 33'h1a9e86b64;
      expv[23] = 33'h02b0574e4;
      expv[24] = 33'h00cebd989;
      expv[25] = 33'h01c5c531c;
      expv[26] = 33'h17bc81a1d;
      expv[27] = 33'h1c3105853;
      expv[28] = 33'h194361eb3;
      expv[29] = 33'h08fc61c31;
      expv[30] = 33'h01f7b41bf;
      expv[31] = 33'h023e9a0b1;
      expv[32] = 33'h084639274;
      expv[33] = 33'h1ad50f632;
      expv[34] = 33'h094ed3f27;
      expv[35] = 33'h1baf0ab47;
      expv[36] = 33'h1d8ceac3d;
      expv[37] = 33'h15b7f57be;
      expv[38] = 33'h1d284545d;
      expv[39] = 33'h0f8237ba1;
      expv[40] = 33'h171b12aff;
      expv[41] = 33'h031c5ab55;
      expv[42] = 33'h19126a9ab;
      expv[43] = 33'h17f2cd4f3;
      expv[44] = 33'h07536c6f6;
      expv[45] = 33'h0d6619d4a;
      expv[46] = 33'h0ff259d16;
      expv[47] = 33'h058d6f581;
      expv[48] = 33'h05ad18365;
      expv[49] = 33'h17ea8befd;
      expv[50] = 33'h09ecf6a90;
      expv[51] = 33'h04e0abb35;
      expv[52] = 33'h1bc4ab812;
      expv[53] = 33'h1a360e285;
      expv[54] = 33'h0401eab7b;
      expv[55] = 33'h0875e25f6;
      expv[56] = 33'h0fde9f339;
      expv[57] = 33'h12ffe3f67;
      expv[58] = 33'h1df8e782f;
      expv[59] = 33'h09c54e34b;
      expv[60] = 33'h01d018d67;
      expv[61] = 33'h022fde275;
      expv[62] = 33'h0d91effc3;
      expv[63] = 33'h0c231734d;
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
