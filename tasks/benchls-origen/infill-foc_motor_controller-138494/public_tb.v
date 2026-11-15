// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 200;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138494 dut (
    .clk(clk),
    .reset(in_vec[80:80]),
    .current_a(in_vec[79:64]),
    .current_b(in_vec[63:48]),
    .current_c(in_vec[47:32]),
    .position(in_vec[31:16]),
    .speed_ref(in_vec[15:0]),
    .clark_x(out_vec[199:184]),
    .clark_y(out_vec[183:168]),
    .park_x(out_vec[167:152]),
    .park_y(out_vec[151:136]),
    .error_d(out_vec[135:120]),
    .error_q(out_vec[119:104]),
    .v_a(out_vec[103:88]),
    .v_b(out_vec[87:72]),
    .v_c(out_vec[71:56]),
    .pwm_a(out_vec[55:48]),
    .pwm_b(out_vec[47:40]),
    .pwm_c(out_vec[39:32]),
    .integrator_d(out_vec[31:16]),
    .integrator_q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h1593f320ebc7d0d2e727d;
    stim[1] = 81'h1b147919fd21f6bba6c6f;
    stim[2] = 81'h0e1eb3695c7eaab77ffb9;
    stim[3] = 81'h06a0c1bb08ffca775c333;
    stim[4] = 81'h0a037c0eb92293d0f28f0;
    stim[5] = 81'h0830e3d52b3d6ea95d399;
    stim[6] = 81'h09b0a1b6498c1b0d750bc;
    stim[7] = 81'h05aacb310ffe7aaba475f;
    stim[8] = 81'h0d6ab6c27e884406d6534;
    stim[9] = 81'h0ae55582acdec801538eb;
    stim[10] = 81'h02088db9f0e39662e67b2;
    stim[11] = 81'h08543ab7e48229dd96226;
    stim[12] = 81'h01e4c2f95c1163282235f;
    stim[13] = 81'h1520e9f1dc9bb0c1bdea0;
    stim[14] = 81'h00ca7903601e481d47582;
    stim[15] = 81'h0f6dfb9cb547f7ba0df4c;
    stim[16] = 81'h04ce74a483fc79e9ccf42;
    stim[17] = 81'h01e395b9abe933126f440;
    stim[18] = 81'h0c0251659d81848edfb1c;
    stim[19] = 81'h0154ab7b5c4e6902dde61;
    stim[20] = 81'h00932a7ce2e26cd26a317;
    stim[21] = 81'h1094a0ac45d8153b4e111;
    stim[22] = 81'h0bcbc988f942ca7f57666;
    stim[23] = 81'h0465118c476ab01d6efcd;
    stim[24] = 81'h0c8df2a68beafbf5f1c1a;
    stim[25] = 81'h0952b2eacc9098ff2e76a;
    stim[26] = 81'h097dde87c830085c8115b;
    stim[27] = 81'h0d9e4c3dc54bea0adbf60;
    stim[28] = 81'h050d0432c7960208319d8;
    stim[29] = 81'h00bf35a9bc784696b9a0c;
    stim[30] = 81'h0d410539a088e07a3545f;
    stim[31] = 81'h0bd6423af6dac0469ebfc;
    stim[32] = 81'h0715b25e327be627b4d5c;
    stim[33] = 81'h098739b824295bc35c903;
    stim[34] = 81'h0539358fa7c4c5016ca33;
    stim[35] = 81'h0afa197383128b62934db;
    stim[36] = 81'h0a5f4078752064e36747f;
    stim[37] = 81'h053453ecc85da76b16013;
    stim[38] = 81'h08e45e49ca63abde60b4d;
    stim[39] = 81'h0f9848faa13740682e669;
    stim[40] = 81'h090d4dfbce4453b826c81;
    stim[41] = 81'h043d5649a38145135fa48;
    stim[42] = 81'h0b40c36c52e07a51dc10e;
    stim[43] = 81'h0950aa2ac96537a0ddb00;
    stim[44] = 81'h0e35e8d85b9d60361dba8;
    stim[45] = 81'h0e0698fbeb9c53e122bb9;
    stim[46] = 81'h0a47f13be269fbb81db71;
    stim[47] = 81'h05099ceb7e807cfb229ac;
    stim[48] = 81'h0186a337ac75920aab025;
    stim[49] = 81'h087aa45c1d8b52f17359b;
    stim[50] = 81'h015d4aa670d37e5b67f74;
    stim[51] = 81'h01b5c04292a7f2c30a460;
    stim[52] = 81'h037b95b0c8ebd08424851;
    stim[53] = 81'h097dd112f252ea46d76cd;
    stim[54] = 81'h09d6e6aea6f98ef032913;
    stim[55] = 81'h03c6c07901a1a78de4ef9;
    stim[56] = 81'h07d870fb9a6dac27215bf;
    stim[57] = 81'h064439f45b1209b172087;
    stim[58] = 81'h00126c5d8ff147c0f3d6e;
    stim[59] = 81'h057a6bc170e6c30b24fb7;
    stim[60] = 81'h0d0fdf426f92c118b6bc1;
    stim[61] = 81'h0aaa355132ae1cb49b253;
    stim[62] = 81'h02f249ec28644fa08239f;
    stim[63] = 81'h0fd92ffdaff5bcc4ae8ac;
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
      expv[0] = 200'h00000000000000000000000000000000000000000000000000;
      expv[1] = 200'h00000000000000000000000000000000000000000000000000;
      expv[2] = 200'h00000000000000000000000000000000000000000000000000;
      expv[3] = 200'he1eb001b00000000ffb9000000000000000000000000000000;
      expv[4] = 200'h6a0c003800030000c3330000000100020001000000ffb90000;
      expv[5] = 200'ha03700180002000128ed00000002000100020a150ac2ec0000;
      expv[6] = 200'h830e003800030003d397ffff000100010002150a15ebd90000;
      expv[7] = 200'h9b0a001c0002000150b9fffd0003000000030a0a15bf70ffff;
      expv[8] = 200'h5aac003300020001475dffff0001000200011f001f1029fffc;
      expv[9] = 200'hd6ab002c000300036532ffff0001000100020a150a5786fffb;
      expv[10] = 200'hae5500250001000238e8fffd0003000000000a0a15bcb8fffa;
      expv[11] = 200'h2088003c0002000267b1fffe0002000200011f0000f5a0fff7;
      expv[12] = 200'h8543003c000000036224fffe00030000000315150a5d51fff5;
      expv[13] = 200'h00000000000000000000000000000000000000000000000000;
      expv[14] = 200'h00000000000000000000000000000000000000000000000000;
      expv[15] = 200'h0ca70031000000007582000000000000000000000000000000;
      expv[16] = 200'hf6df001400000000df4c000000010002000200000075820000;
      expv[17] = 200'h4ce7002b00010002cf4200000003000000030a151554ce0000;
      expv[18] = 200'h1e39003b00020001f43ffffe0000000300001f001f24100000;
      expv[19] = 200'hc025001400000000fb1affff000100010002001f00184ffffe;
      expv[20] = 200'h154a001100010002de6100000001000200020a0a151369fffd;
      expv[21] = 200'h00000000000000000000000000000000000000000000000000;
      expv[22] = 200'h00000000000000000000000000000000000000000000000000;
      expv[23] = 200'hbcbc0038000000007666000000000000000000000000000000;
      expv[24] = 200'h4651001600010002efcd000000020001000100000076660000;
      expv[25] = 200'hc8df0032000300001c19fffe000100020001150a0a66330000;
      expv[26] = 200'h952b000500010002e76700000002000100010a150a824cfffe;
      expv[27] = 200'h97dd002f00020001115afffe000100020002150a0a69b3fffe;
      expv[28] = 200'hd9e4001c00020001bf5effff0000000300000a15157b0dfffc;
      expv[29] = 200'h50d000350000000319d6ffff000300000003001f003a6bfffb;
      expv[30] = 200'h0bf30021000300039a0cfffd0002000200011f001f5441fffa;
      expv[31] = 200'hd410000900030000545cfffd00030000000015150aee4dfff7;
      expv[32] = 200'hbd64000f00020001ebf900000000000300031f000042a9fff4;
      expv[33] = 200'h715b0034000000004d5affff000100010002001f1f2ea2fff4;
      expv[34] = 200'h9873001b00030000c90300000003000000030a0a157bfcfff3;
      expv[35] = 200'h5393001900020002ca3000000001000100021f001f44fffff3;
      expv[36] = 200'hafa100020001000234d9fffe0003000000030a0a150f2ffff3;
      expv[37] = 200'ha5f4000500000000747efffe0002000200011f001f4408fff1;
      expv[38] = 200'h53450036000000006013000000010002000215150ab886ffef;
      expv[39] = 200'h8e450026000300000b4d00000003000000030a15151899ffef;
      expv[40] = 200'hf984003d00030000e66600000001000200021f001f23e6ffef;
      expv[41] = 200'h90d40031000200016c7e00000000000300000a15150a4cffef;
      expv[42] = 200'h43d5001600000000fa46ffff000100010002001f0076caffef;
      expv[43] = 200'hb40c002d00030000c10e00000001000200010a0a157110ffee;
      expv[44] = 200'h950a003500000000dafd00000003000000000a150a321effee;
      expv[45] = 200'he35e000700030000dba800000002000100011f00000d1bffee;
      expv[46] = 200'he0690011000200012bb60000000000030000150a0ae8c3ffee;
      expv[47] = 200'ha47f001c00030000db6fffff000000030000001f001479ffee;
      expv[48] = 200'h5099003c0003000329a90000000000000003001f00efe8ffed;
      expv[49] = 200'h186a002d00000003b022fffd00010002000100001f1991ffed;
      expv[50] = 200'h87aa003200010002359bfffd0003000000030a150ac9b3ffea;
      expv[51] = 200'h15d40012000100017f73fffe0003000300001f001fff4effe7;
      expv[52] = 200'h1b5c002600030000a45fffff0000000300001f1f007ec1ffe5;
      expv[53] = 200'h37b9001f00030000484e0000000100020002001f002320ffe4;
      expv[54] = 200'h97dd003b0000000376ca00000001000200010a15156b6effe4;
      expv[55] = 200'h9d6e001c000100012913fffd0002000100010a150ae238ffe4;
      expv[56] = 200'h3c6c000d000200024ef8ffff000000030003150a0a0b4bffe1;
      expv[57] = 200'h7d8700170001000115bdfffe000000000003001f1f5a43ffe0;
      expv[58] = 200'h64430030000100022086ffff00020001000200001f7000ffde;
      expv[59] = 200'h0126003f000300033d6dfffe000200010001150a159086ffdd;
      expv[60] = 200'h57a6001b000100024fb4fffd000100020001150a0acdf3ffdb;
      expv[61] = 200'hd0fd002b000000036bc0fffe0000000300030a150a1da7ffd8;
      expv[62] = 200'haaa3000600000000b253fffd000200020001001f1f8967ffd6;
      expv[63] = 200'h2f24000c00030003239f000000010002000215150a3bbaffd3;
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
