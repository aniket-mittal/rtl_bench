// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186972 dut (
    .clk(clk),
    .rst_n(in_vec[107:107]),
    .idexregwrite(in_vec[106:106]),
    .idexmemtoreg(in_vec[105:105]),
    .idexbranch(in_vec[104:104]),
    .idexmemwrite(in_vec[103:103]),
    .addout(in_vec[102:71]),
    .aluresult(in_vec[70:39]),
    .idrd(in_vec[38:34]),
    .zero(in_vec[33:33]),
    .exr2_dout(in_vec[32:1]),
    .flush(in_vec[0:0]),
    .exmemregwrite(out_vec[72:72]),
    .exmemmemtoreg(out_vec[71:71]),
    .exmembranch(out_vec[70:70]),
    .exmemmemwrite(out_vec[69:69]),
    .memaddr(out_vec[68:37]),
    .memdata(out_vec[36:5]),
    .memrd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h3b80a5e5754531c49c8084e96f8;
    stim[1] = 108'h675d34827f833af2e5c66d59cd3;
    stim[2] = 108'hf104c5b4482aaf2097e42385c3c;
    stim[3] = 108'hef8873795f9931240ec53c09362;
    stim[4] = 108'h8f5fb9fe9b7ecb8b079ad45f149;
    stim[5] = 108'h882432a31aff93801bab33ed33e;
    stim[6] = 108'he40fb6e67322625e73d1b4749ab;
    stim[7] = 108'h9064984f4851dcbf963bc1c883d;
    stim[8] = 108'h884e029f23711323db8abbd196e;
    stim[9] = 108'he2283103fa98a4303051bc9030d;
    stim[10] = 108'h88d147cb29d4a23a8f47bce5007;
    stim[11] = 108'h9df416ee0ff2fa3c0fb9cfcbe4f;
    stim[12] = 108'hd713637e70e4969488de6fb7cfa;
    stim[13] = 108'hf345ba40bb53884a4b1eaf8ac97;
    stim[14] = 108'he53afa42a46c0469fa28ae9c915;
    stim[15] = 108'hfc8532e3dbe12755a1cb5143986;
    stim[16] = 108'h8b1afbabd6dc26c9a19441ca3d7;
    stim[17] = 108'hf0d77044973ab585c03ce21bfef;
    stim[18] = 108'h9f18d5e063ec3a32d7912558cea;
    stim[19] = 108'h3f7afaeecb92e8e96fb12c12d6b;
    stim[20] = 108'hee77a549b85384e8471f7edad3a;
    stim[21] = 108'hf6580b1358b41120f754b3519e4;
    stim[22] = 108'hf9550f22a490ed673ecbc825972;
    stim[23] = 108'h839ced612cd99d3fdde1c98da95;
    stim[24] = 108'hd50610f8098fac84514c370c444;
    stim[25] = 108'ha53ff2fc844470492a230405b42;
    stim[26] = 108'h872877fcf92aa1905d66e102a0f;
    stim[27] = 108'hfc7ffce637827c2b4a7889552db;
    stim[28] = 108'h8977b95bd38d3e2dba7c1bf780e;
    stim[29] = 108'hdc139a5df4dd4f04e62133942d3;
    stim[30] = 108'heef6ba8960bfd5eb74dc22442b5;
    stim[31] = 108'hc7fb53ecd89001c7abc3bda9cf2;
    stim[32] = 108'hb2c13c32ad4cd7c11020bcc35fe;
    stim[33] = 108'he3b43f28f42e3fe2d1729bea3d0;
    stim[34] = 108'hc48fd47ab762e44517351e62ab6;
    stim[35] = 108'h9cc92152d6dcfc0783d1335dfe3;
    stim[36] = 108'heca1d0ad3041a970ae9784b713c;
    stim[37] = 108'he23c316f534469cf14eef9ccee8;
    stim[38] = 108'hd89a8659e55dd1c99749412a320;
    stim[39] = 108'hb201d8042fe068bc15cfa6afe78;
    stim[40] = 108'hd80751262b500d429d73b4c5e4f;
    stim[41] = 108'ha8e4dbfe0a7f3969c7946946886;
    stim[42] = 108'he6f81c591378c40104f312a765f;
    stim[43] = 108'he7edc2c02a6fa22a3c0ede65ef7;
    stim[44] = 108'h9fef742e6cbdee66dcc3fb681ed;
    stim[45] = 108'hb55bdc247ec10c0b7c1f82c7d84;
    stim[46] = 108'hc71a2e05af3f98b8b0dc043393d;
    stim[47] = 108'hf8c0623c2ef34b3f25cdbcd5d39;
    stim[48] = 108'hd99d2807c47ad52e87bbec306cd;
    stim[49] = 108'hbad04d7107b7b8d35b3bb6df570;
    stim[50] = 108'h80fefdecdc37aa3000dd84fe9e1;
    stim[51] = 108'hae4ffa1f9a6c4df537a46ca52a4;
    stim[52] = 108'hacd59b49c249ce01edfc4be059b;
    stim[53] = 108'h96af303576ca99681696c15825b;
    stim[54] = 108'hb5e2a0d308b80a26793d551ff84;
    stim[55] = 108'hc605deaadf93c5f95d02e24907c;
    stim[56] = 108'hdde48a4b3c299630d8b05ff0897;
    stim[57] = 108'h90590d5311401475e68129924ee;
    stim[58] = 108'h97740fd235539f3963209b2395a;
    stim[59] = 108'hf83589260ab4684e3b51ac3fecb;
    stim[60] = 108'hf90cfc06b22bd2af33285143c6d;
    stim[61] = 108'h8cced72189b0081e90336f29093;
    stim[62] = 108'h9bc4888f27039aa04722e9cb51b;
    stim[63] = 108'ha1322ac9767cb4858a54024fb3d;
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
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h1c41316d1242385c3df;
      expv[4] = 73'h1be21cde5653c09363b;
      expv[5] = 73'h0000000000000000000;
      expv[6] = 73'h02090ca8c6b33ed33ee;
      expv[7] = 73'h0000000000000000000;
      expv[8] = 73'h0000000000000000000;
      expv[9] = 73'h021380a7c8abbd196ee;
      expv[10] = 73'h0000000000000000000;
      expv[11] = 73'h0000000000000000000;
      expv[12] = 73'h0000000000000000000;
      expv[13] = 73'h15c4d8df9de6fb7cfa3;
      expv[14] = 73'h0000000000000000000;
      expv[15] = 73'h0000000000000000000;
      expv[16] = 73'h1f214cb8f6b51439867;
      expv[17] = 73'h0000000000000000000;
      expv[18] = 73'h0000000000000000000;
      expv[19] = 73'h07c635781912558cebe;
      expv[20] = 73'h0000000000000000000;
      expv[21] = 73'h1b9de9526ff7edad3bc;
      expv[22] = 73'h1d9602c4d74b3519e5d;
      expv[23] = 73'h1e5543c8a8bc825973b;
      expv[24] = 73'h0000000000000000000;
      expv[25] = 73'h1541843e02c370c4445;
      expv[26] = 73'h094ffcbf2030405b428;
      expv[27] = 73'h0000000000000000000;
      expv[28] = 73'h0000000000000000000;
      expv[29] = 73'h025dee56f5c1bf780e9;
      expv[30] = 73'h0000000000000000000;
      expv[31] = 73'h0000000000000000000;
      expv[32] = 73'h11fed4fb363bda9cf2f;
      expv[33] = 73'h0cb04f0caa0bcc35fe0;
      expv[34] = 73'h18ed0fca3d29bea3d05;
      expv[35] = 73'h1123f51ead51e62ab7c;
      expv[36] = 73'h0000000000000000000;
      expv[37] = 73'h1b28742b4d784b713da;
      expv[38] = 73'h188f0c5bd4ef9ccee93;
      expv[39] = 73'h1626a196789412a321d;
      expv[40] = 73'h0c8076010afa6afe797;
      expv[41] = 73'h0000000000000000000;
      expv[42] = 73'h0a3936ff8346946887e;
      expv[43] = 73'h0000000000000000000;
      expv[44] = 73'h0000000000000000000;
      expv[45] = 73'h0000000000000000000;
      expv[46] = 73'h0d56f7091ff82c7d850;
      expv[47] = 73'h0000000000000000000;
      expv[48] = 73'h0000000000000000000;
      expv[49] = 73'h0000000000000000000;
      expv[50] = 73'h0eb4135c41bb6df570c;
      expv[51] = 73'h0000000000000000000;
      expv[52] = 73'h0b93fe87e646ca52a5e;
      expv[53] = 73'h0000000000000000000;
      expv[54] = 73'h0000000000000000000;
      expv[55] = 73'h0d78a834c3d551ff844;
      expv[56] = 73'h118177aab62e24907d4;
      expv[57] = 73'h0000000000000000000;
      expv[58] = 73'h04164354c4129924efa;
      expv[59] = 73'h05dd03f48c09b2395ac;
      expv[60] = 73'h0000000000000000000;
      expv[61] = 73'h0000000000000000000;
      expv[62] = 73'h0000000000000000000;
      expv[63] = 73'h0000000000000000000;
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
