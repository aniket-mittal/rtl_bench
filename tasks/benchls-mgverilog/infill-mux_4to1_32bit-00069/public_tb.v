// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00069 dut (
    .op0(in_vec[129:98]),
    .op1(in_vec[97:66]),
    .op2(in_vec[65:34]),
    .op3(in_vec[33:2]),
    .select(in_vec[1:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h277411a9900767394f69ef356600327b7;
    stim[1] = 130'h0188ff7abdb5c8398b76c8b718cf28567;
    stim[2] = 130'h3307950e520cf5a51c6df33960c1c799a;
    stim[3] = 130'h125a661ac293056f184a53668900c5d28;
    stim[4] = 130'h30e71f7614fdcfb587459c454d2b9e64c;
    stim[5] = 130'h34c3fc303c86514d00c211d1b37d68503;
    stim[6] = 130'h300a1f4684cfbff3cb177884d27fc14c1;
    stim[7] = 130'h190eeb0c1b7b49cf68244f1f43c175f89;
    stim[8] = 130'h14c58a7359058def3be9c2df26e001cea;
    stim[9] = 130'h17224a032b5d2caa2c947d716cd373146;
    stim[10] = 130'h02c6a4eb34f89b311250fc26b1e33fbfa;
    stim[11] = 130'h0b8b78be2eec001c23c0866f483c43a8a;
    stim[12] = 130'h1a88ccb84abe7970d6ceba517bfe4edaf;
    stim[13] = 130'h21fce80ff104d1079f8311a6684e1f91d;
    stim[14] = 130'h2c68bf635a9322664c5a412d429f028d5;
    stim[15] = 130'h0e9ed0c5dd345ac726a0fa2f618f3e131;
    stim[16] = 130'h065010dab4826b66a52f2d698fd23d78f;
    stim[17] = 130'h3ed29346715eb8e7c242d367b48b67342;
    stim[18] = 130'h31b2b2b3b1cb24c34e0ec0a096b84dee3;
    stim[19] = 130'h0d6b2fa68b7977c8dec345e0f9614ef2e;
    stim[20] = 130'h0f9b2253bc688e559c962b182ffcb8b77;
    stim[21] = 130'h31e57bdf820da341e634167f4375332ff;
    stim[22] = 130'h121d481b8e46b3dd538cdad308ddac211;
    stim[23] = 130'h290b26f815485c75eec04a880f7e62270;
    stim[24] = 130'h19a1fd098c7146baaac8471bd7f094ab2;
    stim[25] = 130'h08edb78d2b6aa370f40344934324bdec4;
    stim[26] = 130'h21809d524cbf72ecaff1c768db8710b00;
    stim[27] = 130'h330108a0df894919c4e9a5ff1d1419180;
    stim[28] = 130'h25d8cc429a2b312a8214bcaba19a84df3;
    stim[29] = 130'h23c8e28502e5db3c3c221142113aed4b8;
    stim[30] = 130'h3c365384cbc4cb3d6cae8f8bcf1580a8e;
    stim[31] = 130'h09abc191e56970043df032cbb6ecf1755;
    stim[32] = 130'h0d00a776694bf6e010539e607160fee63;
    stim[33] = 130'h0e7d1b52299c807e47dfb08ebabc27dc5;
    stim[34] = 130'h3664da66f0cac3b01ac8eacf2c1ce1db5;
    stim[35] = 130'h3a7d087965ddfdc35ddcf12d6fac04fc4;
    stim[36] = 130'h022dd35181f2d39dec4059bcb9425d24e;
    stim[37] = 130'h147be6d25bcd348c778135511614190e3;
    stim[38] = 130'h3b4c08ae4f70ee9870ed470d1df21409a;
    stim[39] = 130'h3f9851eb5c29bf2ce047e833f64b276da;
    stim[40] = 130'h2dfb5b7c12d137624b603856b8181a167;
    stim[41] = 130'h12311d43826869614d86ecf06bb7c6f6f;
    stim[42] = 130'h011d6b476a8a78101ec4bcc4d2afe1cc1;
    stim[43] = 130'h196086d5c668f4823704283e65f3cadc1;
    stim[44] = 130'h3a5eb52451427c5b5588ecc6784578d7c;
    stim[45] = 130'h2b5e5ff1758937b77818b208e221239b0;
    stim[46] = 130'h0f26991e935a088a9caca9a50f148615d;
    stim[47] = 130'h0e892dbd79973b744ffe66539c16ce017;
    stim[48] = 130'h273532cb8de499c6e32dc0673c77ccf19;
    stim[49] = 130'h3be8496a503ed6accc0b4f6ab001b4e88;
    stim[50] = 130'h047a0cc4e8ebb8e304226b01a2fbea83e;
    stim[51] = 130'h2b7995797e6a1d33f460d7e153847ef67;
    stim[52] = 130'h0782cda257d3116006e30ed12fcb2dc17;
    stim[53] = 130'h3839cedd48086916a33ffb60cb483dd7c;
    stim[54] = 130'h26d14cd2805eeb9f9cfc4a679ec097b0f;
    stim[55] = 130'h3bba25d3d4a75bfef5308343a41afe456;
    stim[56] = 130'h147f898b4288114ab12c0b11cbf79101e;
    stim[57] = 130'h225e58effe8d0c4760ed463711cbd066c;
    stim[58] = 130'h024b1add980d5d8e0180228e22f621bb4;
    stim[59] = 130'h3227efe864367ecf21024d0b75ca25418;
    stim[60] = 130'h0b0e80f01733e6f0a9017ae322fe3e48a;
    stim[61] = 130'h15db0d8cd80715674dfcb3426aa7c3fc8;
    stim[62] = 130'h253c1e7df29f914628f8fb73d5b14fd8b;
    stim[63] = 130'h38e270ce36f22fa5bac498c3f95d2062a;
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
      expv[0] = 32'h9800c9ed;
      expv[1] = 32'h633ca159;
      expv[2] = 32'h71b7cce5;
      expv[3] = 32'h4969986b;
      expv[4] = 32'hc39c7dd8;
      expv[5] = 32'hcdf5a140;
      expv[6] = 32'h133effcf;
      expv[7] = 32'h6ded273d;
      expv[8] = 32'hefa70b7c;
      expv[9] = 32'hb251f5c5;
      expv[10] = 32'h4943f09a;
      expv[11] = 32'h8f0219bd;
      expv[12] = 32'heff93b6b;
      expv[13] = 32'hc413441e;
      expv[14] = 32'h6a4c8999;
      expv[15] = 32'h74d16b1c;
      expv[16] = 32'h3f48f5e3;
      expv[17] = 32'h090b4d9e;
      expv[18] = 32'h5ae137b8;
      expv[19] = 32'h7b0d1783;
      expv[20] = 32'hbff2e2dd;
      expv[21] = 32'h0dd4ccbf;
      expv[22] = 32'h391acf75;
      expv[23] = 32'ha42c9be0;
      expv[24] = 32'hab211c6f;
      expv[25] = 32'h23b6de34;
      expv[26] = 32'h86027549;
      expv[27] = 32'hcc042283;
      expv[28] = 32'h866a137c;
      expv[29] = 32'h8f238a14;
      expv[30] = 32'hb2ba3e2f;
      expv[31] = 32'h95a5c010;
      expv[32] = 32'hc583fb98;
      expv[33] = 32'ha67201f9;
      expv[34] = 32'hc32b0ec0;
      expv[35] = 32'he9f421e5;
      expv[36] = 32'hb10166f2;
      expv[37] = 32'h58506438;
      expv[38] = 32'hc3b51c34;
      expv[39] = 32'h811fa0cf;
      expv[40] = 32'he0606859;
      expv[41] = 32'haedf1bdb;
      expv[42] = 32'haa29e040;
      expv[43] = 32'h19a3d208;
      expv[44] = 32'he97ad491;
      expv[45] = 32'had797fc5;
      expv[46] = 32'h4d68222a;
      expv[47] = 32'h705b3805;
      expv[48] = 32'h3792671b;
      expv[49] = 32'hefa125a9;
      expv[50] = 32'h1089ac06;
      expv[51] = 32'h4e11fbd9;
      expv[52] = 32'hbf2cb705;
      expv[53] = 32'he0e73b75;
      expv[54] = 32'h7b025ec3;
      expv[55] = 32'hd4c20d0e;
      expv[56] = 32'hc4b02c47;
      expv[57] = 32'h897963bf;
      expv[58] = 32'h092c6b76;
      expv[59] = 32'hc89fbfa1;
      expv[60] = 32'ha405eb8c;
      expv[61] = 32'h576c3633;
      expv[62] = 32'h56c53f62;
      expv[63] = 32'heb12630f;
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
