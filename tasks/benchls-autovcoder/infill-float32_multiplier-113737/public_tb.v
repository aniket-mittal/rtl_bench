// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113737 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .z(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h7039ff9052ba2e7c;
    stim[1] = 64'ha62e4a35de819357;
    stim[2] = 64'hbff710bbe7be6ef9;
    stim[3] = 64'h372e0ec52b30874b;
    stim[4] = 64'h002a0e75ffc89361;
    stim[5] = 64'hd10dbbf2d6eae8f2;
    stim[6] = 64'hecf19cbeef954984;
    stim[7] = 64'h5aa726b4b100baa5;
    stim[8] = 64'h72818a27a48543b7;
    stim[9] = 64'h9bcfa027f2ad519f;
    stim[10] = 64'h5376a7de3c32d9c5;
    stim[11] = 64'hed9e201c57b9c6d2;
    stim[12] = 64'h1d2ba6f26a85af0a;
    stim[13] = 64'h1b7b4868b752f8cd;
    stim[14] = 64'hb76e43497b02003c;
    stim[15] = 64'h9e919285b87b4c01;
    stim[16] = 64'h710c23786f94c9d1;
    stim[17] = 64'h57ca8ffb86d622f1;
    stim[18] = 64'hd0851630846c0e38;
    stim[19] = 64'heb173a21d6517236;
    stim[20] = 64'h9cd4649226e04e4b;
    stim[21] = 64'ha4bbbb611509609a;
    stim[22] = 64'h3a336ed455d74ac1;
    stim[23] = 64'hab905795c1dcd19a;
    stim[24] = 64'h5f58758818315d35;
    stim[25] = 64'h3dad899d85aed327;
    stim[26] = 64'h11c38d11677ae5d5;
    stim[27] = 64'h5322e9543a755ee5;
    stim[28] = 64'h6829e14156b9c211;
    stim[29] = 64'ha5278b69d5ac78d5;
    stim[30] = 64'h338793406fe822ed;
    stim[31] = 64'h63c92fa462ef040b;
    stim[32] = 64'h7c328145e72254dc;
    stim[33] = 64'h409ed78ffe4ce2c1;
    stim[34] = 64'hbe034ddad727ad8c;
    stim[35] = 64'h31676ce8cfd892e2;
    stim[36] = 64'hccd00ebdc56c54ed;
    stim[37] = 64'hd9af39868380fc03;
    stim[38] = 64'h260f0fc49ad68e8e;
    stim[39] = 64'hf1e3d9044caeb413;
    stim[40] = 64'h99368c05c4aa6aee;
    stim[41] = 64'hd9ad32f116e457f1;
    stim[42] = 64'ha6136f5162d02a4d;
    stim[43] = 64'h158b6d235aa44c1c;
    stim[44] = 64'h6bd1bdb993bb8c26;
    stim[45] = 64'h8194156986a59f3a;
    stim[46] = 64'h0976b554f32446d2;
    stim[47] = 64'hc9aed5c2d72eeb54;
    stim[48] = 64'he924bdbd0f779c4a;
    stim[49] = 64'hb10fec83eebb9041;
    stim[50] = 64'h1025317bb6848bd4;
    stim[51] = 64'h3edf715b4ef5850d;
    stim[52] = 64'h97be2608d9c07a19;
    stim[53] = 64'hb1c6d52bbdc88399;
    stim[54] = 64'h175b5b6575466500;
    stim[55] = 64'h243cba6d676c1de6;
    stim[56] = 64'h411d3fd46a13dc21;
    stim[57] = 64'h362924021c17a596;
    stim[58] = 64'h0237e9213e38d692;
    stim[59] = 64'he3383f8fd31c2577;
    stim[60] = 64'h394095cf1445b714;
    stim[61] = 64'h0e9eb88134a3adfa;
    stim[62] = 64'h3451c549db425391;
    stim[63] = 64'h4bdf9929a9057145;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'h45306f69;
      expv[2] = 32'h6837c984;
      expv[3] = 32'h22f00c48;
      expv[4] = 32'hc0853d32;
      expv[5] = 32'h68820ec3;
      expv[6] = 32'hffffffff;
      expv[7] = 32'hcc281a6f;
      expv[8] = 32'hd786de14;
      expv[9] = 32'h4f0c916c;
      expv[10] = 32'h502c528a;
      expv[11] = 32'hffffffff;
      expv[12] = 32'h48334633;
      expv[13] = 32'h934f159c;
      expv[14] = 32'hf2f1fcc5;
      expv[15] = 32'h178ee5e0;
      expv[16] = 32'hffffffff;
      expv[17] = 32'h9f297001;
      expv[18] = 32'h15756fb1;
      expv[19] = 32'hffffffff;
      expv[20] = 32'h843a18f4;
      expv[21] = 32'hffffffff;
      expv[22] = 32'h5096e679;
      expv[23] = 32'h2df902e4;
      expv[24] = 32'h3815f812;
      expv[25] = 32'h83ed0557;
      expv[26] = 32'h39bfa752;
      expv[27] = 32'h4e1c25b0;
      expv[28] = 32'h7f76891f;
      expv[29] = 32'h3b61c17e;
      expv[30] = 32'h63f5dfe2;
      expv[31] = 32'hffffffff;
      expv[32] = 32'hffffffff;
      expv[33] = 32'hff7e40f0;
      expv[34] = 32'h55ac0199;
      expv[35] = 32'hc1c3c8ac;
      expv[36] = 32'h52c0129b;
      expv[37] = 32'h1db09283;
      expv[38] = 32'h816fcdaf;
      expv[39] = 32'hff1b7dc6;
      expv[40] = 32'h1e730a76;
      expv[41] = 32'hb11a7cde;
      expv[42] = 32'hc96fc59c;
      expv[43] = 32'h30b2f6bc;
      expv[44] = 32'hc019a869;
      expv[45] = 32'hffffffff;
      expv[46] = 32'hbd1e5069;
      expv[47] = 32'h616eec02;
      expv[48] = 32'hb91f57a4;
      expv[49] = 32'h6052e5ba;
      expv[50] = 32'h872b0f7c;
      expv[51] = 32'h4e564b9d;
      expv[52] = 32'h320ef736;
      expv[53] = 32'h301bbcbf;
      expv[54] = 32'h4d29ff3b;
      expv[55] = 32'h4c2e11e7;
      expv[56] = 32'h6bb5a5bb;
      expv[57] = 32'h12c86348;
      expv[58] = 32'h0104c9b5;
      expv[59] = 32'h76e0c363;
      expv[60] = 32'h0e14bd02;
      expv[61] = 32'h03caf6af;
      expv[62] = 32'hd01f3bfb;
      expv[63] = 32'hb5691b02;
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
