// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04882 dut (
    .clk(clk),
    .a_in(in_vec[64:33]),
    .b_in(in_vec[32:1]),
    .enable(in_vec[0:0]),
    .a_out(out_vec[63:32]),
    .b_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0dc53c6979d51e251;
    stim[1] = 65'h14114e4982ba43831;
    stim[2] = 65'h02c43c472fc20692a;
    stim[3] = 65'h14a0dc3ddf6d05004;
    stim[4] = 65'h1bcd550ea921b23f9;
    stim[5] = 65'h13fb3339dd1d314b0;
    stim[6] = 65'h17a004f4a6f0cbc36;
    stim[7] = 65'h1553b4f432dfcf0df;
    stim[8] = 65'h0fd68997023b0d588;
    stim[9] = 65'h0fce91af50b46374e;
    stim[10] = 65'h1ecf5829bf23fe67f;
    stim[11] = 65'h0a210c83e3ac423e2;
    stim[12] = 65'h122525fbed4c9cb2a;
    stim[13] = 65'h030803d1ce14131a6;
    stim[14] = 65'h173cd486dd185101a;
    stim[15] = 65'h1bc790e0d6c1c6403;
    stim[16] = 65'h1b30a1b424041780e;
    stim[17] = 65'h185cb56684a151dd9;
    stim[18] = 65'h12cef4c809cf5218e;
    stim[19] = 65'h0fe7fcb81e0585872;
    stim[20] = 65'h0793387a2910dae50;
    stim[21] = 65'h01f09aea46d6c8302;
    stim[22] = 65'h1863041c4a1fdc124;
    stim[23] = 65'h0bc34026c4acffaa8;
    stim[24] = 65'h0aee9887bf7473f5d;
    stim[25] = 65'h01b849dab2cb17fea;
    stim[26] = 65'h01edb48806db01515;
    stim[27] = 65'h0f4b4d2c31a03742c;
    stim[28] = 65'h0e1ad29d759c9d8b3;
    stim[29] = 65'h1db111d963dd8a676;
    stim[30] = 65'h06678d9aca4edf2ef;
    stim[31] = 65'h15d89f75b60307b33;
    stim[32] = 65'h040b96d3def622c0c;
    stim[33] = 65'h0e53f5d95d88cce64;
    stim[34] = 65'h17f0101d383292666;
    stim[35] = 65'h1cb587647a1f11e1b;
    stim[36] = 65'h0e6672dab682679e0;
    stim[37] = 65'h12079f1fe6906c449;
    stim[38] = 65'h10695df844459e7c1;
    stim[39] = 65'h14c92445af20c67a8;
    stim[40] = 65'h19846998bb9b639e7;
    stim[41] = 65'h14265c96c77e9cf0a;
    stim[42] = 65'h1f9b2ed066b0c9dde;
    stim[43] = 65'h0f1e6dde08c33087e;
    stim[44] = 65'h1b6212b9e02e5cef3;
    stim[45] = 65'h1558a12b2252499aa;
    stim[46] = 65'h155230a40b550dc87;
    stim[47] = 65'h05f9409881b99410c;
    stim[48] = 65'h1a7d41cf0b8dbac8b;
    stim[49] = 65'h0d2520587816609b9;
    stim[50] = 65'h12ab2ca8bdec1614f;
    stim[51] = 65'h04b1a7eadf537af7f;
    stim[52] = 65'h1886d4f4505c481d3;
    stim[53] = 65'h15876f4229e8fd2e7;
    stim[54] = 65'h1bea1605b18c9c354;
    stim[55] = 65'h0dad5b1fd1a44cd4c;
    stim[56] = 65'h10b562055256ce219;
    stim[57] = 65'h18466ede5ac32f279;
    stim[58] = 65'h18c5e35f782aeec23;
    stim[59] = 65'h0fd1516df12709313;
    stim[60] = 65'h065be951d5b02a2f9;
    stim[61] = 65'h0e69224ba8864f80d;
    stim[62] = 65'h05b027cd0a27c76a6;
    stim[63] = 65'h0f5cf531d32785643;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h6e29e34bcea8f128;
      expv[2] = 64'ha08a724c15d21c18;
      expv[3] = 64'ha08a724c15d21c18;
      expv[4] = 64'ha08a724c15d21c18;
      expv[5] = 64'hde6aa875490d91fc;
      expv[6] = 64'hde6aa875490d91fc;
      expv[7] = 64'hde6aa875490d91fc;
      expv[8] = 64'haa9da7a196fe786f;
      expv[9] = 64'haa9da7a196fe786f;
      expv[10] = 64'haa9da7a196fe786f;
      expv[11] = 64'hf67ac14df91ff33f;
      expv[12] = 64'hf67ac14df91ff33f;
      expv[13] = 64'hf67ac14df91ff33f;
      expv[14] = 64'hf67ac14df91ff33f;
      expv[15] = 64'hf67ac14df91ff33f;
      expv[16] = 64'hde3c8706b60e3201;
      expv[17] = 64'hde3c8706b60e3201;
      expv[18] = 64'hc2e5ab34250a8eec;
      expv[19] = 64'hc2e5ab34250a8eec;
      expv[20] = 64'hc2e5ab34250a8eec;
      expv[21] = 64'hc2e5ab34250a8eec;
      expv[22] = 64'hc2e5ab34250a8eec;
      expv[23] = 64'hc2e5ab34250a8eec;
      expv[24] = 64'hc2e5ab34250a8eec;
      expv[25] = 64'h5774c43dfba39fae;
      expv[26] = 64'h5774c43dfba39fae;
      expv[27] = 64'h0f6da44036d80a8a;
      expv[28] = 64'h0f6da44036d80a8a;
      expv[29] = 64'h70d694ebace4ec59;
      expv[30] = 64'h70d694ebace4ec59;
      expv[31] = 64'h333c6cd65276f977;
      expv[32] = 64'haec4fbadb0183d99;
      expv[33] = 64'haec4fbadb0183d99;
      expv[34] = 64'haec4fbadb0183d99;
      expv[35] = 64'haec4fbadb0183d99;
      expv[36] = 64'he5ac3b23d0f88f0d;
      expv[37] = 64'he5ac3b23d0f88f0d;
      expv[38] = 64'h903cf8ff34836224;
      expv[39] = 64'h834aefc2222cf3e0;
      expv[40] = 64'h834aefc2222cf3e0;
      expv[41] = 64'hcc234cc5dcdb1cf3;
      expv[42] = 64'hcc234cc5dcdb1cf3;
      expv[43] = 64'hcc234cc5dcdb1cf3;
      expv[44] = 64'hcc234cc5dcdb1cf3;
      expv[45] = 64'hdb1095cf0172e779;
      expv[46] = 64'hdb1095cf0172e779;
      expv[47] = 64'haa9185205aa86e43;
      expv[48] = 64'haa9185205aa86e43;
      expv[49] = 64'hd3ea0e785c6dd645;
      expv[50] = 64'h692902c3c0b304dc;
      expv[51] = 64'h95596545ef60b0a7;
      expv[52] = 64'h258d3f56fa9bd7bf;
      expv[53] = 64'hc436a7a282e240e9;
      expv[54] = 64'hac3b7a114f47e973;
      expv[55] = 64'hac3b7a114f47e973;
      expv[56] = 64'hac3b7a114f47e973;
      expv[57] = 64'h85ab102a92b6710c;
      expv[58] = 64'hc23376f2d619793c;
      expv[59] = 64'hc62f1afbc1577611;
      expv[60] = 64'h7e8a8b6f89384989;
      expv[61] = 64'h32df4a8ead81517c;
      expv[62] = 64'h7349125d44327c06;
      expv[63] = 64'h7349125d44327c06;
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
