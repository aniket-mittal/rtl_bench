// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045782 dut (
    .CLK(clk),
    .RST(in_vec[64:64]),
    .in_a(in_vec[63:32]),
    .in_b(in_vec[31:0]),
    .Product(out_vec[64:1]),
    .Product_Valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1ebd1a6290dea480e;
    stim[1] = 65'h1a79b2778cbdf8d17;
    stim[2] = 65'h0f4849d64302535ff;
    stim[3] = 65'h1ed801e769b828760;
    stim[4] = 65'h0d6c4f2a993e15b0e;
    stim[5] = 65'h0ddb5d3a3ada7e53b;
    stim[6] = 65'h0e68acb3947b02951;
    stim[7] = 65'h01418b24b1f1834e1;
    stim[8] = 65'h0a8ad1749b53ac56b;
    stim[9] = 65'h02e863d28ef75739e;
    stim[10] = 65'h025fdb64dfb8a2a28;
    stim[11] = 65'h069a5856a021d10dc;
    stim[12] = 65'h0287da4abc2d1b08b;
    stim[13] = 65'h09c2ca2091714395f;
    stim[14] = 65'h03bd5357d48cefe93;
    stim[15] = 65'h01523672fc76f3b3b;
    stim[16] = 65'h07bc6cfe149c4cac7;
    stim[17] = 65'h07af41a28ee77bb47;
    stim[18] = 65'h0f7d450967579bdb4;
    stim[19] = 65'h0b23b1cc3ca99004c;
    stim[20] = 65'h1e3c018b9cc1205a6;
    stim[21] = 65'h0f3829fd27614053c;
    stim[22] = 65'h021f8955d34cabd0b;
    stim[23] = 65'h0e1830c092bb5c25f;
    stim[24] = 65'h03c7ddd0a72662121;
    stim[25] = 65'h045fbe9feaae345f5;
    stim[26] = 65'h01d6b1220aa79c547;
    stim[27] = 65'h0751c4ae8881f9ec2;
    stim[28] = 65'h09eba87b221142c27;
    stim[29] = 65'h0c89bb40a1e26870e;
    stim[30] = 65'h007d4ff45a30c105e;
    stim[31] = 65'h0c7e4f7b42e3cf634;
    stim[32] = 65'h04d9108b542699118;
    stim[33] = 65'h049ed9de97f54b9d1;
    stim[34] = 65'h0e0daf569547fbcc1;
    stim[35] = 65'h02bf6dcc7c199d1dd;
    stim[36] = 65'h08c5670e3e1acc104;
    stim[37] = 65'h06c7e29b973746833;
    stim[38] = 65'h16f4ec9d21b4b28b0;
    stim[39] = 65'h077ff5a9c0088270f;
    stim[40] = 65'h0f85b7264d0285263;
    stim[41] = 65'h06187514165587bb4;
    stim[42] = 65'h05245e9aaa865ec7d;
    stim[43] = 65'h08defcd6ec1b21c21;
    stim[44] = 65'h0ae32348cbc2d2238;
    stim[45] = 65'h08adaecb73f537422;
    stim[46] = 65'h04367e52bec6a1436;
    stim[47] = 65'h0511fdc69ae34c19d;
    stim[48] = 65'h0a01e92d42e49797f;
    stim[49] = 65'h0876e56894b195c46;
    stim[50] = 65'h04d7c53c861680533;
    stim[51] = 65'h09fe449d0094055e5;
    stim[52] = 65'h007b827885ceb7ba1;
    stim[53] = 65'h0ab62da2dcd2bf85e;
    stim[54] = 65'h0655d2b33e50a22d0;
    stim[55] = 65'h0c0fc6b4e03ea1c16;
    stim[56] = 65'h0ec769e32a5380a3a;
    stim[57] = 65'h0a350dd0433d36502;
    stim[58] = 65'h14d74433e25093ce8;
    stim[59] = 65'h09fbba353a32210db;
    stim[60] = 65'h0b6cbb7e6d9fb08fc;
    stim[61] = 65'h06e7e4b2ac676a17b;
    stim[62] = 65'h0988142830a8aff69;
    stim[63] = 65'h078306c034fc9a8be;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h0000000035b13caa4;
      expv[8] = 65'h00000000a113b5fec;
      expv[9] = 65'h0000000177d8a8a7c;
      expv[10] = 65'h0000000177d8a8a7c;
      expv[11] = 65'h0000000177d8a8a7c;
      expv[12] = 65'h0000000177d8a8a7c;
      expv[13] = 65'h0000000177d8a8a7c;
      expv[14] = 65'h0000001c5076fdc7c;
      expv[15] = 65'h0000005201b3a807c;
      expv[16] = 65'h0000005201b3a807c;
      expv[17] = 65'h00000128c6a65107c;
      expv[18] = 65'h000002d6508ba307c;
      expv[19] = 65'h000002d6508ba307c;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h0000000079c14fe90;
      expv[26] = 65'h000000016d43efbb0;
      expv[27] = 65'h0000000354492f5f0;
      expv[28] = 65'h000000072253aea70;
      expv[29] = 65'h000000072253aea70;
      expv[30] = 65'h000000072253aea70;
      expv[31] = 65'h0000002592a7a8e70;
      expv[32] = 65'h0000002592a7a8e70;
      expv[33] = 65'h0000009f53f791e70;
      expv[34] = 65'h0000009f53f791e70;
      expv[35] = 65'h0000009f53f791e70;
      expv[36] = 65'h0000009f53f791e70;
      expv[37] = 65'h0000009f53f791e70;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h000000000effeb538;
      expv[42] = 65'h000000002cffc1fa8;
      expv[43] = 65'h0000000068ff6f488;
      expv[44] = 65'h00000000e0fec9e48;
      expv[45] = 65'h00000000e0fec9e48;
      expv[46] = 65'h00000000e0fec9e48;
      expv[47] = 65'h00000000e0fec9e48;
      expv[48] = 65'h00000000e0fec9e48;
      expv[49] = 65'h0000000fe0ea1d648;
      expv[50] = 65'h0000002de0c0c4648;
      expv[51] = 65'h00000069e06e12648;
      expv[52] = 65'h00000069e06e12648;
      expv[53] = 65'h00000069e06e12648;
      expv[54] = 65'h00000249ddd882648;
      expv[55] = 65'h00000249ddd882648;
      expv[56] = 65'h00000249ddd882648;
      expv[57] = 65'h00000249ddd882648;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h0000000013f7746a6;
      expv[62] = 65'h000000003be65d3f2;
      expv[63] = 65'h000000003be65d3f2;
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
