// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00049 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[57:48]),
    .fracta_24_o(out_vec[47:24]),
    .fractb_24_o(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1468cf86aa6935fa4;
    stim[1] = 65'h1ef60539e095666d2;
    stim[2] = 65'h0b3d711e7e430ab76;
    stim[3] = 65'h0e9f22d224e40bcf7;
    stim[4] = 65'h002612eb35b8f401b;
    stim[5] = 65'h0649ec8a7d394892e;
    stim[6] = 65'h08482a9473f03dc7b;
    stim[7] = 65'h00d00e167b372d7d7;
    stim[8] = 65'h0df60a366ccbc2d57;
    stim[9] = 65'h0eac9822fccd46a99;
    stim[10] = 65'h03b620ba8697eb61a;
    stim[11] = 65'h0eea49ae6dc213a4d;
    stim[12] = 65'h0558fa7c733a7a6e7;
    stim[13] = 65'h0e9efccae0b936ffc;
    stim[14] = 65'h021f981a08a43762b;
    stim[15] = 65'h0a90460a253f97f6f;
    stim[16] = 65'h1c64b75c40bf5032e;
    stim[17] = 65'h0ef7594bdce40a5c0;
    stim[18] = 65'h035ffc0a194fe82a9;
    stim[19] = 65'h0af1c8424701934ef;
    stim[20] = 65'h0d908584680279616;
    stim[21] = 65'h076a3ca3a97b6d1fc;
    stim[22] = 65'h022536477a66f5784;
    stim[23] = 65'h07be3417fab140631;
    stim[24] = 65'h0310518b3d777d86f;
    stim[25] = 65'h032509af429591689;
    stim[26] = 65'h0dae860f939eae0d7;
    stim[27] = 65'h0e8ebf6c998351266;
    stim[28] = 65'h0afc5ca33dd205774;
    stim[29] = 65'h07f9034114e57bc7a;
    stim[30] = 65'h078a3397096c2ada2;
    stim[31] = 65'h03eba31d432a3acf7;
    stim[32] = 65'h0b1e4cffb2d5d610e;
    stim[33] = 65'h01262d32a87508cfe;
    stim[34] = 65'h03ecdeddd3f9635fd;
    stim[35] = 65'h028406ac10b527fe6;
    stim[36] = 65'h0b56ca714ed6a9e6b;
    stim[37] = 65'h0bc87714396fbeb4b;
    stim[38] = 65'h0ae19e7dac02bdf73;
    stim[39] = 65'h0d0180cbd1f56c4c2;
    stim[40] = 65'h0169e46591af7eb90;
    stim[41] = 65'h017221a00b3dd6bc1;
    stim[42] = 65'h0cc74153543dbdb7d;
    stim[43] = 65'h026ea305fb6596917;
    stim[44] = 65'h18394619daf550fe0;
    stim[45] = 65'h01531c1a839321c01;
    stim[46] = 65'h0af79592cd8596be7;
    stim[47] = 65'h0b551e02dfab6ec85;
    stim[48] = 65'h0f0b42651c0c2d2c7;
    stim[49] = 65'h03b308d5b7f6e6e9e;
    stim[50] = 65'h04f8de850bd8ffd33;
    stim[51] = 65'h0206e73ab4f26fefb;
    stim[52] = 65'h03a5cee84a1ef909f;
    stim[53] = 65'h075c594853b6f5851;
    stim[54] = 65'h0d6db566d836f7337;
    stim[55] = 65'h089c6a57a4221c206;
    stim[56] = 65'h060c5a7fe68b8d9a7;
    stim[57] = 65'h0fce7a52f0f4b6366;
    stim[58] = 65'h0e8786dfd6f4d8a41;
    stim[59] = 65'h093ef8681596f72c5;
    stim[60] = 65'h01ced9a758598c0ac;
    stim[61] = 65'h09b4872b050bd7da6;
    stim[62] = 65'h0ab293c6dc954e5ea;
    stim[63] = 65'h0d56f9e08d1d8b4de;
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
      expv[0] = 58'h000000000000000;
      expv[1] = 58'h000000000000000;
      expv[2] = 58'h000000000000000;
      expv[3] = 58'h0b0d711e7b0ab76;
      expv[4] = 58'h0f0f22d22c0bcf7;
      expv[5] = 58'h03ce12eb38f401b;
      expv[6] = 58'h0f19ec8a794892e;
      expv[7] = 58'h00882a94783dc7b;
      expv[8] = 58'h00180e167f2d7d7;
      expv[9] = 58'h0d8e0a366bc2d57;
      expv[10] = 58'h0efc9822fd46a99;
      expv[11] = 58'h0c9e20ba8feb61a;
      expv[12] = 58'h116a49ae6a13a4d;
      expv[13] = 58'h0938fa7c7a7a6e7;
      expv[14] = 58'h06befccae936ffc;
      expv[15] = 58'h3d8f981a0c3762b;
      expv[16] = 58'h000000000000000;
      expv[17] = 58'h000000000000000;
      expv[18] = 58'h0fbf594bdc0a5c0;
      expv[19] = 58'h015ffc0a1fe82a9;
      expv[20] = 58'h0bf9c84249934ef;
      expv[21] = 58'h034885846279616;
      expv[22] = 58'h09da3ca3ab6d1fc;
      expv[23] = 58'h011d36477ef5784;
      expv[24] = 58'h0cee3417f940631;
      expv[25] = 58'h0918518b3f7d86f;
      expv[26] = 58'h037d09af4d91689;
      expv[27] = 58'h0a9e860f9eae0d7;
      expv[28] = 58'h082ebf6c9b51266;
      expv[29] = 58'h09ac5ca33a05774;
      expv[30] = 58'h11c903411d7bc7a;
      expv[31] = 58'h09fa33970c2ada2;
      expv[32] = 58'h063ba31d4a3acf7;
      expv[33] = 58'h03ee4cffbdd610e;
      expv[34] = 58'h3b3e2d32ad08cfe;
      expv[35] = 58'h07dcdeddd9635fd;
      expv[36] = 58'h3e7c06ac1d27fe6;
      expv[37] = 58'h0c5eca714ea9e6b;
      expv[38] = 58'h027877143fbeb4b;
      expv[39] = 58'h05d99e7daabdf73;
      expv[40] = 58'h05f980cbdd6c4c2;
      expv[41] = 58'h3e39e4659f7eb90;
      expv[42] = 58'h016a21a00dd6bc1;
      expv[43] = 58'h0a0f41535dbdb7d;
      expv[44] = 58'h000000000000000;
      expv[45] = 58'h000000000000000;
      expv[46] = 58'h01db1c1a8b21c01;
      expv[47] = 58'h08ff9592cd96be7;
      expv[48] = 58'h0e0d1e02db6ec85;
      expv[49] = 58'h0e3b42651c2d2c7;
      expv[50] = 58'h0f5b08d5bee6e9e;
      expv[51] = 58'h09b8de8508ffd33;
      expv[52] = 58'h05fee73aba6fefb;
      expv[53] = 58'h038dcee84ef909f;
      expv[54] = 58'h0e2c59485ef5851;
      expv[55] = 58'h034db566def7337;
      expv[56] = 58'h018c6a57aa1c206;
      expv[57] = 58'h113c5a7feb8d9a7;
      expv[58] = 58'h098e7a52fcb6366;
      expv[59] = 58'h12ff86dfdcd8a41;
      expv[60] = 58'h05aef8681ef72c5;
      expv[61] = 58'h3c5ed9a7598c0ac;
      expv[62] = 58'h058c872b0bd7da6;
      expv[63] = 58'h069a93c6dd4e5ea;
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
