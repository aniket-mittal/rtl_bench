// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034547 dut (
    .In_A(in_vec[64:33]),
    .In_B(in_vec[32:1]),
    .valid_in(in_vec[0:0]),
    .Out(out_vec[32:1]),
    .valid_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h130dc05a2082e071e;
    stim[1] = 65'h1217da81cf4dd5469;
    stim[2] = 65'h03df0a1394721dd0d;
    stim[3] = 65'h0b02590f4e47b9b57;
    stim[4] = 65'h173212f5fa1c5cabc;
    stim[5] = 65'h190622febff87ecfa;
    stim[6] = 65'h1d608a0d8e3bc1c3e;
    stim[7] = 65'h0ac89e551d64aa099;
    stim[8] = 65'h193e142a21dede76d;
    stim[9] = 65'h0f4378c6a3cb7285e;
    stim[10] = 65'h1c31b5a845bc045b1;
    stim[11] = 65'h0cdb12e9431106fc0;
    stim[12] = 65'h12971c077f397d283;
    stim[13] = 65'h09bb9487a2c44b488;
    stim[14] = 65'h0b4e8d390f3062daa;
    stim[15] = 65'h1cb0b202401fb7cbd;
    stim[16] = 65'h15b9c94ec80349c18;
    stim[17] = 65'h089bd3533e4ce0744;
    stim[18] = 65'h1af6d0dc3c26357c9;
    stim[19] = 65'h15c7147ed7e24bd96;
    stim[20] = 65'h1347566f6eb117c14;
    stim[21] = 65'h096d3f9d9b04fab4d;
    stim[22] = 65'h1cd7ebc186d0bd220;
    stim[23] = 65'h09f60ed2ba982f1f4;
    stim[24] = 65'h0cb0942ef26cdb710;
    stim[25] = 65'h1f356d71f0232f5f3;
    stim[26] = 65'h1c1d8eb4105de3f9a;
    stim[27] = 65'h1ee88d5eead7b6ed6;
    stim[28] = 65'h026770676e6545677;
    stim[29] = 65'h065b253100db76a00;
    stim[30] = 65'h0157de7dce91ade1a;
    stim[31] = 65'h0554dfa3a3ebb5219;
    stim[32] = 65'h0f31a00a6a635c3b7;
    stim[33] = 65'h19c81082ce72e1544;
    stim[34] = 65'h05bc8cacb8232ba2d;
    stim[35] = 65'h1c2640c160c645727;
    stim[36] = 65'h135a6741fb9089572;
    stim[37] = 65'h0d1add73426526b47;
    stim[38] = 65'h01e6313dc771bf521;
    stim[39] = 65'h12594061d710b8df4;
    stim[40] = 65'h0e411bd5e16fcb808;
    stim[41] = 65'h0ff5204590c5a41e7;
    stim[42] = 65'h1bedcb4748f460979;
    stim[43] = 65'h181a96fade0983a85;
    stim[44] = 65'h04348c3b5488fa343;
    stim[45] = 65'h1e8815f0ee8d4de1e;
    stim[46] = 65'h0458cf7c5e75e510c;
    stim[47] = 65'h18fbad31b44bdbef8;
    stim[48] = 65'h0b8d233593272be55;
    stim[49] = 65'h18ebf51663ad7eb86;
    stim[50] = 65'h0f68c69a7dd01849a;
    stim[51] = 65'h188b88f87aeec4493;
    stim[52] = 65'h1e56d639a9c9fc101;
    stim[53] = 65'h1a11b5e906e19b3c2;
    stim[54] = 65'h15ab9328a71eb0d17;
    stim[55] = 65'h0c0591d55e2fc75f9;
    stim[56] = 65'h0be4a116490d4fa8a;
    stim[57] = 65'h16991f4d1bf90b747;
    stim[58] = 65'h10dbacdbbc5821dcd;
    stim[59] = 65'h084e414faabf3c2e9;
    stim[60] = 65'h0aa4ae632c5be1581;
    stim[61] = 65'h0644266bb10d2c7fb;
    stim[62] = 65'h006c4a2fa92b7e70f;
    stim[63] = 65'h018ed74f9d8fdc479;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h1ab9960bb;
      expv[2] = 33'h1746d38af;
      expv[3] = 33'h04a8bf39b;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h15530fce3;
      expv[8] = 33'h1f4f2e49f;
      expv[9] = 33'h000000000;
      expv[10] = 33'h1e643a2d1;
      expv[11] = 33'h000000000;
      expv[12] = 33'h0b4d03457;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h1480d803d;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h06c06fef9;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h16564e791;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h0701dec47;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h0bf1a177b;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h09581b7a1;
      expv[32] = 33'h0cbd21cf5;
      expv[33] = 33'h000000000;
      expv[34] = 33'h1587d3f31;
      expv[35] = 33'h134ff9425;
      expv[36] = 33'h000000000;
      expv[37] = 33'h02a45281b;
      expv[38] = 33'h026401e29;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h171f3d0ab;
      expv[42] = 33'h1ae764d6f;
      expv[43] = 33'h0200aca79;
      expv[44] = 33'h179a53333;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h10541e9dd;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h058ca385b;
      expv[52] = 33'h1c7c1f9cf;
      expv[53] = 33'h000000000;
      expv[54] = 33'h167cc04fd;
      expv[55] = 33'h15c5b844b;
      expv[56] = 33'h000000000;
      expv[57] = 33'h02900cadd;
      expv[58] = 33'h0c7259597;
      expv[59] = 33'h057efefc5;
      expv[60] = 33'h0637bcb79;
      expv[61] = 33'h1d261a22d;
      expv[62] = 33'h0f307691b;
      expv[63] = 33'h1beef9e37;
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
