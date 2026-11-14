// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03944 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .m_read(in_vec[65:65]),
    .m_write(in_vec[64:64]),
    .m_addr(in_vec[63:32]),
    .m_din(in_vec[31:0]),
    .m_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h5b27920963921070c;
    stim[1] = 67'h494e18b952f064c4a;
    stim[2] = 67'h2ae268e0fec33aed4;
    stim[3] = 67'h1c47528171c2f295c;
    stim[4] = 67'h17cdd981f11b92028;
    stim[5] = 67'h2632f39798160290f;
    stim[6] = 67'h0d80a869360c36f9a;
    stim[7] = 67'h06530cb5418c8d05b;
    stim[8] = 67'h3ade553ed7e8bf938;
    stim[9] = 67'h32c5539f4c5c4f840;
    stim[10] = 67'h3fe875a7e39541461;
    stim[11] = 67'h7aa4a89ed3a11df20;
    stim[12] = 67'h18b3ed8d0bffc6b5b;
    stim[13] = 67'h05610f405a9fd4de0;
    stim[14] = 67'h27d04962049752aec;
    stim[15] = 67'h1ef5311350eb61906;
    stim[16] = 67'h278c9ec676fc0d949;
    stim[17] = 67'h1543a389766dddeff;
    stim[18] = 67'h38fbdd227ba652ccf;
    stim[19] = 67'h193e1d5bb5a3e98f1;
    stim[20] = 67'h0138e17ef5f2f5a5c;
    stim[21] = 67'h23d3228dc3faba83b;
    stim[22] = 67'h0de375e14f1eb2cf0;
    stim[23] = 67'h3ebf76eeb294c45a1;
    stim[24] = 67'h25ae11ebf6ce9e6dd;
    stim[25] = 67'h3f2949526467e8e85;
    stim[26] = 67'h2d4e2736372aebff1;
    stim[27] = 67'h2356773a68317d5f3;
    stim[28] = 67'h2a89f013b9b32ecdc;
    stim[29] = 67'h3c3da2d13c0e1f7d3;
    stim[30] = 67'h1c5c1d99335d9a677;
    stim[31] = 67'h3ef56e81933b62506;
    stim[32] = 67'h017c88d25b32d0bc3;
    stim[33] = 67'h127177bd37bfe9797;
    stim[34] = 67'h2e06dd84913c96a73;
    stim[35] = 67'h36d978f4bba714cfa;
    stim[36] = 67'h3de06ce2012d7fe46;
    stim[37] = 67'h36250ceeed1fa9bf4;
    stim[38] = 67'h2adf756e9b1918a4f;
    stim[39] = 67'h13a8be9cb56a8038c;
    stim[40] = 67'h2729d71bb66a1b704;
    stim[41] = 67'h1f58aafd6a893bb87;
    stim[42] = 67'h0b081e490294c50da;
    stim[43] = 67'h25f51c553cd92077a;
    stim[44] = 67'h1664c302afab2bace;
    stim[45] = 67'h2940fc4fafa87d2fa;
    stim[46] = 67'h37ed8c9e1ea8fbd76;
    stim[47] = 67'h2f7d34fc7ab430539;
    stim[48] = 67'h0059183591d7a2cec;
    stim[49] = 67'h23c1eb0cb80185bfa;
    stim[50] = 67'h237d8da6d4b3ad5d2;
    stim[51] = 67'h346d526eae5912e28;
    stim[52] = 67'h01411aa4f2e1f53dd;
    stim[53] = 67'h00799e70183a9c6c9;
    stim[54] = 67'h2318065083ab5495b;
    stim[55] = 67'h00056beaac2bf65a2;
    stim[56] = 67'h1d2dd6d29fa160b60;
    stim[57] = 67'h22c198af0f6c75bf7;
    stim[58] = 67'h078887100b12c039c;
    stim[59] = 67'h1868c6d8f7c72f897;
    stim[60] = 67'h057be6714de5cbe6c;
    stim[61] = 67'h089b4099cb257bb7a;
    stim[62] = 67'h0da7338044e653c20;
    stim[63] = 67'h2fa8093aeed927eca;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h5a3e98f1;
      expv[42] = 32'h5a3e98f1;
      expv[43] = 32'h5a3e98f1;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
