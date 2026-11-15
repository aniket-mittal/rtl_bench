// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 114;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03934 dut (
    .in_valid(in_vec[113:113]),
    .in_pr(in_vec[112:81]),
    .in_t(in_vec[80:80]),
    .in_raw(in_vec[79:64]),
    .in_opl(in_vec[63:32]),
    .in_oph(in_vec[31:0]),
    .out_taken(out_vec[34:34]),
    .out_target(out_vec[33:2]),
    .out_delayslot(out_vec[1:1]),
    .out_write_pr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 114'h1d49b7adb77443353b64d96275ff3;
    stim[1] = 114'h30fe07a42cfd1617681d6ffcac06b;
    stim[2] = 114'h26a74a5d3721c9816eecf5626b419;
    stim[3] = 114'h1a0a17ad5d28b9dcce4763d97d415;
    stim[4] = 114'h1ec0b8e7577f5d93bc74c7a4ab3bb;
    stim[5] = 114'h2d826836b930d3386b72f27c0350e;
    stim[6] = 114'h19212f380ae4d74caebbe6be054a4;
    stim[7] = 114'h068e547c33fdcf5e29d67115748da;
    stim[8] = 114'h1ff70494c3781705bce2a98b6830d;
    stim[9] = 114'h339baec83874a632b8c1f9e61212c;
    stim[10] = 114'h1b9a051f25cc85ae608b8d22e97bc;
    stim[11] = 114'h0d48948b745250e1dd49fc9825e1d;
    stim[12] = 114'h073a063342510cf5888b1b698c14f;
    stim[13] = 114'h3fd4f4250b75f853fe190acb38a92;
    stim[14] = 114'h344b0b5c73c8bd179298fcd4ee8a9;
    stim[15] = 114'h102f0e89596e264db6f9f1921fb7e;
    stim[16] = 114'h35abff6a7921628b44ccdd4db3b65;
    stim[17] = 114'h061c0feb06e5336b416bf76583510;
    stim[18] = 114'h2512701c4f47d85407fa8b51294b7;
    stim[19] = 114'h3fb15bf79a8bfa1d183b1e151eb6e;
    stim[20] = 114'h291598f8de2dafa45f2cbe8b6b51e;
    stim[21] = 114'h2f9983c6a4aab9bf95dfcb253517c;
    stim[22] = 114'h23487634841bbfe54c3296cfca4a4;
    stim[23] = 114'h0463e007b21ed7c955e7deebc0f2c;
    stim[24] = 114'h38aa3d299c6d71ed01e79c988cbcd;
    stim[25] = 114'h13afa359b144ed8ec8ed367868633;
    stim[26] = 114'h0138b157f972ce5630091f7a0e8ad;
    stim[27] = 114'h1cb52619cf5e9638c6a29aef3e7a5;
    stim[28] = 114'h1ff24ac352c94503d24d38f18b302;
    stim[29] = 114'h2204e66749fe993dfec069fa88370;
    stim[30] = 114'h0dd5e90253139e683f7b7727a54a6;
    stim[31] = 114'h3532a07475e49ac1c1a6c36ec6586;
    stim[32] = 114'h2cecde5d75eebd4e1e1a8007792bf;
    stim[33] = 114'h3e3cc07165c13b5c62cd66b793738;
    stim[34] = 114'h144bb87d40a95dd043f5624e1370d;
    stim[35] = 114'h358cefb7f5c04a0bde0ec4917ae31;
    stim[36] = 114'h36ce8f889690135919ad0c18af6cd;
    stim[37] = 114'h21db4d386db291b2da2d346f065a0;
    stim[38] = 114'h25140012de5d73e3f7fbc3e0d4d7d;
    stim[39] = 114'h0356b45c66e6d196c67178cb4b6b2;
    stim[40] = 114'h3662c29bbaf699e6bd2df9c935923;
    stim[41] = 114'h39d1f466ac3e9c3d2ba2f66b8539b;
    stim[42] = 114'h23037ed0f2b6580b92c7f0bd48ae1;
    stim[43] = 114'h32865e132c8660e82cfb1781766e8;
    stim[44] = 114'h0586e55a4c7bd81002ea19ce9a696;
    stim[45] = 114'h2a64789e2af2e53edee615e5f4527;
    stim[46] = 114'h30830900d94729d6d5fc1c099108b;
    stim[47] = 114'h073679598d4bd5844a4cedee5b677;
    stim[48] = 114'h2c27a1e4fb6ecebf4035b6b20568b;
    stim[49] = 114'h116f28ad12b27715c9cd28facfc59;
    stim[50] = 114'h23b63d2272657b3d00f657e9ca618;
    stim[51] = 114'h365957a47d54b668348ad754e246a;
    stim[52] = 114'h012c354be742f09b283c0c643851e;
    stim[53] = 114'h0f786a26026a54c9ed492eb25a4eb;
    stim[54] = 114'h229f6ebb9551ebb43d02fd739a6ab;
    stim[55] = 114'h2bfe9e561d5ad9e5b50b1277ab48a;
    stim[56] = 114'h07a91f072cfabe23e8e59a62e2520;
    stim[57] = 114'h111e95f370ec497420ab772beffa2;
    stim[58] = 114'h056a1f96522e56d69ad60927e87cb;
    stim[59] = 114'h2c624b68e67bd0c663fb86b2506fe;
    stim[60] = 114'h29d6ef9557a6252698522e6acb25d;
    stim[61] = 114'h26e259034ff63d91387c21dcefc30;
    stim[62] = 114'h171d7235203c544831849327cbca3;
    stim[63] = 114'h155b24f2c9a636a8453fb03929738;
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
      expv[0] = 35'h325ec5900;
      expv[1] = 35'h185050904;
      expv[2] = 35'h3b8f68ba0;
      expv[3] = 35'h36d92e22c;
      expv[4] = 35'h14e19ec1c;
      expv[5] = 35'h16d1bb0f4;
      expv[6] = 35'h382ad0188;
      expv[7] = 35'h01ce79904;
      expv[8] = 35'h0244944dc;
      expv[9] = 35'h00632b52c;
      expv[10] = 35'h0b45281d0;
      expv[11] = 35'h35e80caf0;
      expv[12] = 35'h217c52800;
      expv[13] = 35'h4c7cdb08b;
      expv[14] = 35'h27b2048e0;
      expv[15] = 35'h1f7f5ac74;
      expv[16] = 35'h3f63e20c8;
      expv[17] = 35'h2b4312f3c;
      expv[18] = 35'h0e94c517c;
      expv[19] = 35'h60c8dbc7e;
      expv[20] = 35'h38bf29fa4;
      expv[21] = 35'h13932bde0;
      expv[22] = 35'h1ad459f34;
      expv[23] = 35'h1ad45b6a4;
      expv[24] = 35'h3a163a918;
      expv[25] = 35'h101cc5418;
      expv[26] = 35'h3740fa4f8;
      expv[27] = 35'h04a014738;
      expv[28] = 35'h37d575f54;
      expv[29] = 35'h0ce21bdd8;
      expv[30] = 35'h163f93174;
      expv[31] = 35'h38c21ffc8;
      expv[32] = 35'h35565d19c;
      expv[33] = 35'h084fd9038;
      expv[34] = 35'h00795d98c;
      expv[35] = 35'h3a7563c74;
      expv[36] = 35'h3dc724674;
      expv[37] = 35'h1887821cc;
      expv[38] = 35'h1f13334e4;
      expv[39] = 35'h298847724;
      expv[40] = 35'h4ebfcb00a;
      expv[41] = 35'h0aa2c3728;
      expv[42] = 35'h23236dd80;
      expv[43] = 35'h21a68da64;
      expv[44] = 35'h077a754dc;
      expv[45] = 35'h6c934ce22;
      expv[46] = 35'h17819c130;
      expv[47] = 35'h0dca96d14;
      expv[48] = 35'h55c51679b;
      expv[49] = 35'h0042664ac;
      expv[50] = 35'h0c9b2d5f4;
      expv[51] = 35'h36f45b45c;
      expv[52] = 35'h33fd82378;
      expv[53] = 35'h0df11e5f4;
      expv[54] = 35'h249f5db68;
      expv[55] = 35'h3175814ec;
      expv[56] = 35'h221b2cde4;
      expv[57] = 35'h028042964;
      expv[58] = 35'h3ffa0d4ac;
      expv[59] = 35'h1de2d1ad8;
      expv[60] = 35'h0e458ddfc;
      expv[61] = 35'h3db8a0fc8;
      expv[62] = 35'h1dbff53b0;
      expv[63] = 35'h1b85baccc;
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
