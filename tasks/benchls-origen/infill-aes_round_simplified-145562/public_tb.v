// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145562 dut (
    .in(in_vec[193:130]),
    .key(in_vec[129:2]),
    .mode(in_vec[1:0]),
    .out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h031a1abfa0791c20c1f737abe90f1ea4baf713c6e1eb817b5;
    stim[1] = 194'h36756a1c159a549fd2a3327bb43c6bf9c562414297d1617e1;
    stim[2] = 194'h2f7a1af212b85c81a9de53e33f3c52af029ebea32ee03e427;
    stim[3] = 194'h2bd7630b212b5a0199f7abaaf645c268e7be73a7166e54067;
    stim[4] = 194'h2bd181ab311b642b99d6e8a091e900cbcf8fdbab3d60370d6;
    stim[5] = 194'h2ce5d5704a6489626e4dce6bfb49db3d6cebee02e7b2de61e;
    stim[6] = 194'h27e40df22b700663876bc938158c04227e98d726015eaf5fa;
    stim[7] = 194'h0f48cdc33f977da2582d3fb556ce827a5ed2ec41b482ef164;
    stim[8] = 194'h3af5983322555111d2b3e2b118a0aa12583daea88a2fb74e3;
    stim[9] = 194'h3510a94599742ea45f07a07b86e888cb17c38df92c45cece1;
    stim[10] = 194'h371fd1fc62a045b694331f837048d2e1301a57b5d1cdad6c2;
    stim[11] = 194'h018b1275a8d24d8ac589c804c219d0aa9cad53bdc6d509e5d;
    stim[12] = 194'h0fb0afc326ccc2b4c58d3608b8cf6c29dcafbc54829afc262;
    stim[13] = 194'h0ecf7242c3d3effade70bfa4e085f3d75a40c83ded4e3bf7c;
    stim[14] = 194'h35a88a1885f9c0174afcc2a2d50fde427f1aeb90c7b083694;
    stim[15] = 194'h08bccea520b44c56d303b0ed37e8ff9987ddca4bfbd214a48;
    stim[16] = 194'h1003e062ab42679f66bbf9fd4f331a18ffd2af50a75d3a56c;
    stim[17] = 194'h035431a677c0b491bbbef7a840291b5f4c694d75ca483aab2;
    stim[18] = 194'h30718e7cf513cfce949858f87d26396bfe2f83b2a5e6b6d04;
    stim[19] = 194'h198da5a653f2c935854cdaa6d32e034ca8a3dd083b0e3e6d4;
    stim[20] = 194'h1c244e1abf585ff83a2e61d24c73b4d9e43124c975c7eab91;
    stim[21] = 194'h126d52d776b0cb74d7a030eef2ffe869006c05f75a029c0fc;
    stim[22] = 194'h2e1664054750fb9ff5e19579675874aa0d586f76e6261c087;
    stim[23] = 194'h004ffe64c026a684089ca51bc0b3b99fa8dc2ea031629ee6f;
    stim[24] = 194'h13aa8a3551d385c8452223ea503271eb50ea4bcf910c4388f;
    stim[25] = 194'h101455bb6e6fc45cf053da32267c12114057e98b4a3bce301;
    stim[26] = 194'h1e353dab617fbf2a2fb191a570e6d6b787fbc9afa3b86724f;
    stim[27] = 194'h2f7af45302a1724f8fd227ee6e148a2e16fbad195c457740e;
    stim[28] = 194'h3839251690d874a3e9ef67beb9754ecae09d6bd3b6a235433;
    stim[29] = 194'h3301139bca8308cfc2204049ab2d0f1b8848442af63c9c23d;
    stim[30] = 194'h336740a1fe250e1f4f4b942482a7243853ea4b3f348776a87;
    stim[31] = 194'h393efb1c33df5cf9e2fd3400e5c15e17805f54f447e286994;
    stim[32] = 194'h154ca3814495658b58eab4c45633a3a3eecbe94ec115282d7;
    stim[33] = 194'h21a63b2c0d1052888b5b318f52f7262faed8df7e7eb45bebc;
    stim[34] = 194'h25723ecdb39c40d868e30e6a54ad9d7da3ab5ed4873969e59;
    stim[35] = 194'h0b9fc43cd8e6b20890b24ce247eec30a3e3810157859257dd;
    stim[36] = 194'h0f8abd919becb12faf11d8c5e3bf305fbcf3f1e75725d96be;
    stim[37] = 194'h31c1a20e66574010b85f3cf016363dba885d7d9afd0420a64;
    stim[38] = 194'h1c600765d4289a70dda83d80e765137c1702ec4b7a6d92500;
    stim[39] = 194'h30cc37e316e09369c1b63096aabdea991df9808d9d9d65a74;
    stim[40] = 194'h310eee8b4c15d61ea72c7d9b3f091299360254f1cbfe94112;
    stim[41] = 194'h1d360dee0ae5e3c65984034a132048b314d9f1136030f13be;
    stim[42] = 194'h125e0ff3acbaf2a898411cb9485cfeadd3765dded9f749e9c;
    stim[43] = 194'h08b046f8a307bb0b8996985b2599e9c17ae9bf7338d334a09;
    stim[44] = 194'h0910e14a78f1196cef3665da700b4234267be5824a01022cd;
    stim[45] = 194'h23630eae13d224df17f12af82f30d94371a35df4fdf206566;
    stim[46] = 194'h2ba149daa1b32b36bf4b118df0617afd1dc9c514887140910;
    stim[47] = 194'h09661eeb668b5f033f8b12130f4e0875e2e4340d76daa3078;
    stim[48] = 194'h0bd7869e5dec570cc727bd1d9f82f7355a5c2c3c98d940b36;
    stim[49] = 194'h12361f7d8d5c46ed1825e899a8d51099f1184ecc66d9965f7;
    stim[50] = 194'h2166e99aa6ab56bf95b44da3c37f3aeeb1e926c1225b43c8c;
    stim[51] = 194'h27253c5732494cf8b4ff8038f39344d5412a7d81be6e0e7c2;
    stim[52] = 194'h070188e8a6d362f1e85e89f9e4ffc199cb120c415568e2bcc;
    stim[53] = 194'h21fa153fa3eacb202f294ed7b0f0f20d4d9bbc158e207037b;
    stim[54] = 194'h372d0bad6ea276c7ae3861a157a7a7b24f32253eec2043ea1;
    stim[55] = 194'h1c4b327f9f4a32d24112afae011d69314cf510b439cffd554;
    stim[56] = 194'h372eb675ea746ca1b663501373a43b3a5e484094fc8c35594;
    stim[57] = 194'h105612b4f7f59216955b148f50637fd804b11c5ba514d6fe9;
    stim[58] = 194'h370a620dee083f3e0305a80211a2630c07afe288668bc5017;
    stim[59] = 194'h30e3764960bd68c4d699e0aafdacae58dbc86a45425648a75;
    stim[60] = 194'h305e4d5bdd12d8ef1c4d231f0d412c71137b9eb39832887f9;
    stim[61] = 194'h27092106c5c8e9745d96ca2faf73797fa48f482c2a2f20d5f;
    stim[62] = 194'h137a70ccc4fed47579830a0c13e8666a5776f8394e8814385;
    stim[63] = 194'h2efa8628893f87a58a46f1825606e13a5a2c993f67e90f63a;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h51a1bb90d88282f6;
      expv[5] = 64'h51bd760e2b9c63a2;
      expv[6] = 64'h51915d476b58f508;
      expv[7] = 64'h7b4bb106d20bbc59;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h51d2f19b8e9a7684;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h5130ae3cd4d18f61;
      expv[13] = 64'h690320f7b538efdf;
      expv[14] = 64'hfc6bae431ec26ea5;
      expv[15] = 64'h1f77292fef485292;
      expv[16] = 64'hff4abd429d74e95b;
      expv[17] = 64'h51030fe499d8b781;
      expv[18] = 64'hf8be0eca979adb41;
      expv[19] = 64'ha28f7420ec38f9b5;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h01b017dd680a703f;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h51b304f850c42c01;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h017d53d11f8a1a65;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'hbb637df9fad16faf;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h5130469d3fce1131;
      expv[37] = 64'h2175f66bf410e199;
      expv[38] = 64'h5c0bb12de9b64940;
      expv[39] = 64'h77e602367675969d;
      expv[40] = 64'h51caad3af35d67db;
      expv[41] = 64'h517afee4b80df79c;
      expv[42] = 64'h4dd9777b67dd27a7;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000063;
      expv[45] = 64'h5183534418c9ec9b;
      expv[46] = 64'h7727145221c50244;
      expv[47] = 64'h8b90d035db6a8c1e;
      expv[48] = 64'h512123148960bc04;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'hc7a49b04896d0f23;
      expv[51] = 64'h51925a863e6921f6;
      expv[52] = 64'h2c48310555a38af3;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h33d442d0e73ff555;
      expv[56] = 64'h79210253f230d565;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000007c00;
      expv[63] = 64'h51b5033670ca59a3;
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
