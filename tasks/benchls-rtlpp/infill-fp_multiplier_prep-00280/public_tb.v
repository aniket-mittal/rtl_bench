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

  rtlpp_00280 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .fracta_28_o(out_vec[63:36]),
    .fractb_28_o(out_vec[35:8]),
    .exp_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h18fdbc29c559834cb;
    stim[1] = 65'h18acd686df3ab976c;
    stim[2] = 65'h0a96a6a573ed97ad0;
    stim[3] = 65'h0a2142c624abd07d6;
    stim[4] = 65'h0b293d6d200ba8143;
    stim[5] = 65'h0b766d38b7a4bca28;
    stim[6] = 65'h0b5c3f7ab2d2ef50f;
    stim[7] = 65'h0f433decaf853362e;
    stim[8] = 65'h0aa7da4751ec5bf07;
    stim[9] = 65'h0379465c2f2e061ca;
    stim[10] = 65'h04e5b775a16dabe3b;
    stim[11] = 65'h0e2ada62182c35f15;
    stim[12] = 65'h0bdf23e6c89c27959;
    stim[13] = 65'h0e4163052af61c467;
    stim[14] = 65'h06562a90e0e290824;
    stim[15] = 65'h0ddba79343ed8297c;
    stim[16] = 65'h03f96dcc6bb957099;
    stim[17] = 65'h0b92be9645949c762;
    stim[18] = 65'h008b4c6aab6d5d975;
    stim[19] = 65'h01a3a1b9cad2c7b36;
    stim[20] = 65'h0863b1eb666a8c45a;
    stim[21] = 65'h0c05aeaa3aecda1ea;
    stim[22] = 65'h03b6f4d82b5f281b6;
    stim[23] = 65'h0891d2cbf0a651665;
    stim[24] = 65'h0114ad623687f5931;
    stim[25] = 65'h0e00e45a216fd906e;
    stim[26] = 65'h0bf465e4c9365d511;
    stim[27] = 65'h0bbf2fb5410adda66;
    stim[28] = 65'h0eb90aa8a2ac3acde;
    stim[29] = 65'h015ed87cd901aadce;
    stim[30] = 65'h01ca002e17e999bdf;
    stim[31] = 65'h0b50926a2b649dc61;
    stim[32] = 65'h04d79ac77861b742b;
    stim[33] = 65'h09f7c97ec565d6a49;
    stim[34] = 65'h05e1ebf1d64206e3d;
    stim[35] = 65'h021a9b3e4a41acd69;
    stim[36] = 65'h0a56ff02896bafb6e;
    stim[37] = 65'h0ee0eeaf2c0da7a03;
    stim[38] = 65'h05561c0f5add82490;
    stim[39] = 65'h0c271408ca026404a;
    stim[40] = 65'h0105ab4bf01410f1a;
    stim[41] = 65'h0e9ed52ea2f6b549f;
    stim[42] = 65'h015f46a84a93d883a;
    stim[43] = 65'h0e28fe5afaa52bf71;
    stim[44] = 65'h049f779eeb9c25878;
    stim[45] = 65'h00447286bc66eabb5;
    stim[46] = 65'h160895329a38f2b37;
    stim[47] = 65'h07183e41b0f4d2441;
    stim[48] = 65'h0a54a8cefd76dd5e4;
    stim[49] = 65'h067c7d4a99a30404a;
    stim[50] = 65'h024a94c3a382a7cfa;
    stim[51] = 65'h0713a63efa12b54a6;
    stim[52] = 65'h0e21d0e5b3e9cbf22;
    stim[53] = 65'h02b097e729c849fb1;
    stim[54] = 65'h074293ed776b4c946;
    stim[55] = 65'h06975db754c888ac2;
    stim[56] = 65'h095a35a9e11f93f57;
    stim[57] = 65'h072bf2ce87e27a75c;
    stim[58] = 65'h0b2cc6ffdf17aae57;
    stim[59] = 65'h0721e7c795eb374d6;
    stim[60] = 65'h03c79da6814b90f61;
    stim[61] = 65'h0b3b5ef540650b56e;
    stim[62] = 65'h0d60ef4fc70972805;
    stim[63] = 65'h03731733aa70ec6f3;
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
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h75352b86cbd68000;
      expv[4] = 64'h00000015e83eb07d;
      expv[5] = 64'h49eb690000000195;
      expv[6] = 64'h000000165e514065;
      expv[7] = 64'h61fbd580000001f4;
      expv[8] = 64'h00002cf699b1706b;
      expv[9] = 64'h7ed23a80062df9f0;
      expv[10] = 64'h00000097030e5054;
      expv[11] = 64'h6dbbad00000001e5;
      expv[12] = 64'h56d310800000019c;
      expv[13] = 64'h791f3600000001c5;
      expv[14] = 64'h4b1829000000017b;
      expv[15] = 64'h71548700000001c8;
      expv[16] = 64'h5d3c9a00000001ca;
      expv[17] = 64'h4b6e6300000001bb;
      expv[18] = 64'h0055f4b64e3b107f;
      expv[19] = 64'h00000016aecba8b2;
      expv[20] = 64'h0000001563d9b06d;
      expv[21] = 64'h000000154622d05a;
      expv[22] = 64'h6d755180000001cd;
      expv[23] = 64'h77a6c10000000180;
      expv[24] = 64'h0009d2d728b32876;
      expv[25] = 64'h195ac467fac98814;
      expv[26] = 64'h4722d100000001d0;
      expv[27] = 64'h632f2600000001c0;
      expv[28] = 64'h797daa000000017e;
      expv[29] = 64'h4855450000000177;
      expv[30] = 64'h76c3e680000001d7;
      expv[31] = 64'h000a0034ccdef82b;
      expv[32] = 64'h000000164ee308fd;
      expv[33] = 64'h7cd63b8136e8566c;
      expv[34] = 64'h00000016eb52489a;
      expv[35] = 64'h000000150371e8ac;
      expv[36] = 64'h00054d94d66b48c8;
      expv[37] = 64'h77f814002ebedb48;
      expv[38] = 64'h477579000000014a;
      expv[39] = 64'h70e07a80000001dc;
      expv[40] = 64'h78a04600000001aa;
      expv[41] = 64'h6d5a5f8000000184;
      expv[42] = 64'h76a9750000000120;
      expv[43] = 64'h00000015ec41d0d3;
      expv[44] = 64'h47f2d78000000152;
      expv[45] = 64'h7bbcf700000001c5;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h41f20d8669220800;
      expv[49] = 64'h000000176eaf20e3;
      expv[50] = 64'h63ea5480000001ae;
      expv[51] = 64'h0000001553e7d0cf;
      expv[52] = 64'h5d31f78000000170;
      expv[53] = 64'h4e872d80000001e2;
      expv[54] = 64'h44bf3900000001c4;
      expv[55] = 64'h00000015a64a3056;
      expv[56] = 64'h7aedba802222b1ed;
      expv[57] = 64'h51ad4f00000001d2;
      expv[58] = 64'h005f96753d3ae02b;
      expv[59] = 64'h000000d7d572b8fc;
      expv[60] = 64'h4f3e3c80000001e2;
      expv[61] = 64'h7ced3400000001e4;
      expv[62] = 64'h5af7aa0000000178;
      expv[63] = 64'h00000014b9402867;
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
