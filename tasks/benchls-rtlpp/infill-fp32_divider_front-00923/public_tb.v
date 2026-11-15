// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00923 dut (
    .clk_i(clk),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[86:77]),
    .dvdnd_50_o(out_vec[76:27]),
    .dvsor_27_o(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hd018a8bfcad7af55;
    stim[1] = 64'h5112cea54480101d;
    stim[2] = 64'hea079bf161bab516;
    stim[3] = 64'he8b087826892e521;
    stim[4] = 64'h340333ef683d61b4;
    stim[5] = 64'h04fb592ef913f620;
    stim[6] = 64'h6f07eb3873fd8bc4;
    stim[7] = 64'h97b05eae5bebea0c;
    stim[8] = 64'h879a6bd15ee4c376;
    stim[9] = 64'h0083cec8a2ba6698;
    stim[10] = 64'hca03c7bf32c45550;
    stim[11] = 64'hc750cd67e7424b3b;
    stim[12] = 64'hd56cbde1d71b7fb1;
    stim[13] = 64'h9719bd5f7e7961fa;
    stim[14] = 64'hded4efd2a1acda79;
    stim[15] = 64'h807003bf10f6549b;
    stim[16] = 64'h7862ad18dd598827;
    stim[17] = 64'h7969304e1f5fdb13;
    stim[18] = 64'hfa906016d084400d;
    stim[19] = 64'hd8563fbb15bff7e0;
    stim[20] = 64'ha80a6da951e9fce9;
    stim[21] = 64'he30b7f03a86e9281;
    stim[22] = 64'hae1d321d441dfc00;
    stim[23] = 64'hf85ded0ae6c02f83;
    stim[24] = 64'h8bc03ebe3dbff3fb;
    stim[25] = 64'he6ab8f441feafbf0;
    stim[26] = 64'h7a18ebf29f70b33b;
    stim[27] = 64'h89ed030f43c9c6e0;
    stim[28] = 64'hc456dd6acb3429c8;
    stim[29] = 64'h65073e4b42b08446;
    stim[30] = 64'h79b4a9f2ed69409b;
    stim[31] = 64'h1283ba49dafcb7e9;
    stim[32] = 64'h108e9eccc326e71d;
    stim[33] = 64'hbc48e6bca3807891;
    stim[34] = 64'h6ff46f32d159c7cb;
    stim[35] = 64'hc0def13fecd8ed6a;
    stim[36] = 64'h3289b318cea136a7;
    stim[37] = 64'h91ca3f6d93ee4c10;
    stim[38] = 64'h85b9e29026f014a8;
    stim[39] = 64'he34f914007a67117;
    stim[40] = 64'h0a8bbfc2964a3a1e;
    stim[41] = 64'haf384b8090035abd;
    stim[42] = 64'h03d61af485d1ede0;
    stim[43] = 64'hbdb1404cefd4008d;
    stim[44] = 64'h63db9830ebb81d60;
    stim[45] = 64'h099837f00d72c0a6;
    stim[46] = 64'h61184ac65814c2d3;
    stim[47] = 64'he4c98949c66e0b14;
    stim[48] = 64'h17911538f372f9f6;
    stim[49] = 64'h024b54dc3ec03c09;
    stim[50] = 64'hba30cc6491526ed0;
    stim[51] = 64'hc137f813bc896015;
    stim[52] = 64'h6cc548560492f23a;
    stim[53] = 64'h326dbbc8782f7818;
    stim[54] = 64'hdd449043e9f98c0c;
    stim[55] = 64'he1bae5d1aa9e2b44;
    stim[56] = 64'hc886d6f42ac70f98;
    stim[57] = 64'h2f8b7f78a3df5cbf;
    stim[58] = 64'hd2b391d1fbb39bf8;
    stim[59] = 64'h45f78dc16e997d5b;
    stim[60] = 64'h7b0497ca81673701;
    stim[61] = 64'h97506a0364e6ba5f;
    stim[62] = 64'hb9dac7332ebf27de;
    stim[63] = 64'hf5f5b830704684fb;
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
      expv[0] = 87'hxxx31517e0000000d7af55;
      expv[1] = 87'hxxx259d4a000000080101d;
      expv[2] = 87'hxxx0f37e20000000bab516;
      expv[3] = 87'h115610f04000000092e521;
      expv[4] = 87'h1310667de0000000bd61b4;
      expv[5] = 87'h121f6b25c000000093f620;
      expv[6] = 87'h0ff0fd6700000000fd8bc4;
      expv[7] = 87'h02f60bd5c0000000ebea0c;
      expv[8] = 87'h72d34d7a20000000e4c376;
      expv[9] = 87'h0ed079d900000000ba6698;
      expv[10] = 87'h7ef078f7e0000000c45550;
      expv[11] = 87'h7a3a19ace0000000c24b3b;
      expv[12] = 87'h077d97bc200000009b7fb1;
      expv[13] = 87'h15d337abe0000000f961fa;
      expv[14] = 87'h07fa9dfa40000000acda79;
      expv[15] = 87'h0f7c00efc0000000f6549b;
      expv[16] = 87'h763c55a300000000d98827;
      expv[17] = 87'h1f1d2609c0000000dfdb13;
      expv[18] = 87'h0bf20c02c000000084400d;
      expv[19] = 87'h16bac7f760000000bff7e0;
      expv[20] = 87'h26714db520000000e9fce9;
      expv[21] = 87'h1a716fe060000000ee9281;
      expv[22] = 87'h2093a643a00000009dfc00;
      expv[23] = 87'h059bbda140000000c02f83;
      expv[24] = 87'h1eb807d7c0000000bff3fb;
      expv[25] = 87'h0a7571e880000000eafbf0;
      expv[26] = 87'h14531d7e40000000f0b33b;
      expv[27] = 87'h037da061e0000000c9c6e0;
      expv[28] = 87'h21badbad40000000b429c8;
      expv[29] = 87'h26b0e7c960000000b08446;
      expv[30] = 87'h0176953e40000000e9409b;
      expv[31] = 87'h0e30774920000000fcb7e9;
      expv[32] = 87'h1891d3d980000000a6e71d;
      expv[33] = 87'h13191cd780000000807891;
      expv[34] = 87'h7dfe8de640000000d9c7cb;
      expv[35] = 87'h035bde27e0000000d8ed6a;
      expv[36] = 87'h1611366300000000a136a7;
      expv[37] = 87'h179947eda0000000ee4c10;
      expv[38] = 87'h04f73c5200000000f014a8;
      expv[39] = 87'h08f9f22800000000a67117;
      expv[40] = 87'h0f7177f840000000ca3a1e;
      expv[41] = 87'h07b7097000000000835abd;
      expv[42] = 87'h26dac35e80000000d1ede0;
      expv[43] = 87'h0d16280980000000d4008d;
      expv[44] = 87'h17bb730600000000b81d60;
      expv[45] = 87'h0f7306fe00000000f2c0a6;
      expv[46] = 87'h03730958c000000094c2d3;
      expv[47] = 87'h0df9312920000000ee0b14;
      expv[48] = 87'h0f1222a700000000f2f9f6;
      expv[49] = 87'h12396a9b80000000c03c09;
      expv[50] = 87'h1796198c80000000d26ed0;
      expv[51] = 87'h7916ff0260000000896015;
      expv[52] = 87'h00d8a90ac000000092f23a;
      expv[53] = 87'h1a3db77900000000af7818;
      expv[54] = 87'h1118920860000000f98c0c;
      expv[55] = 87'h29f75cba200000009e2b44;
      expv[56] = 87'h7e70dade80000000c70f98;
      expv[57] = 87'h0cd16fef00000000df5cbf;
      expv[58] = 87'h1db6723a20000000b39bf8;
      expv[59] = 87'h177ef1b820000000997d5b;
      expv[60] = 87'h12f092f940000000e73701;
      expv[61] = 87'h05ba0d4060000000e6ba5f;
      expv[62] = 87'h05bb58e660000000bf27de;
      expv[63] = 87'h2e7eb70600000000c684fb;
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
