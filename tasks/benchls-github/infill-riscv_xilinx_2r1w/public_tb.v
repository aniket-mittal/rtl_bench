// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  riscv_xilinx_2r1w dut (
    .clk_i(clk),
    .rst_i(in_vec[47:47]),
    .rd0_i(in_vec[46:42]),
    .rd0_value_i(in_vec[41:10]),
    .ra_i(in_vec[9:5]),
    .rb_i(in_vec[4:0]),
    .ra_value_o(out_vec[63:32]),
    .rb_value_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h8ae85ef7aee6;
    stim[1] = 48'hc3a9344a002e;
    stim[2] = 48'h7c498b76513d;
    stim[3] = 48'h32846e875adf;
    stim[4] = 48'h5ad7aafb8d27;
    stim[5] = 48'h50a994c08ee1;
    stim[6] = 48'h213b3a861bb0;
    stim[7] = 48'h08e08b1a1081;
    stim[8] = 48'h632445fadb7b;
    stim[9] = 48'h5f8093f67e48;
    stim[10] = 48'h6772f20c79a3;
    stim[11] = 48'h490cf3aba150;
    stim[12] = 48'h4d2c75d7b667;
    stim[13] = 48'h539922196a1b;
    stim[14] = 48'h4d5ddea53d84;
    stim[15] = 48'h629860edf03d;
    stim[16] = 48'h387518fd6b93;
    stim[17] = 48'h79e874e02377;
    stim[18] = 48'h35f6c5b1799a;
    stim[19] = 48'h483f77f39a0e;
    stim[20] = 48'h145c2727bb20;
    stim[21] = 48'h1b5f3090b9f4;
    stim[22] = 48'h5396162528ab;
    stim[23] = 48'h3892843571b2;
    stim[24] = 48'h16649b3cda09;
    stim[25] = 48'h249c70c39eed;
    stim[26] = 48'h32c2f0e67de0;
    stim[27] = 48'h3fb0031d242b;
    stim[28] = 48'h3617bb5e6119;
    stim[29] = 48'h7b3172a40952;
    stim[30] = 48'h32b48db2812d;
    stim[31] = 48'h63af44d32f89;
    stim[32] = 48'h7b27d831967c;
    stim[33] = 48'h20ac2d4873b6;
    stim[34] = 48'h5c7919d85cf7;
    stim[35] = 48'h437268d26c96;
    stim[36] = 48'h7b3ead4eb40b;
    stim[37] = 48'h7bca16fb96b9;
    stim[38] = 48'h24728ed28739;
    stim[39] = 48'h5fd989a7f1a5;
    stim[40] = 48'h30c7ec24c6e3;
    stim[41] = 48'h0028a81b447b;
    stim[42] = 48'hbc18b4c85f9c;
    stim[43] = 48'h7a2b0f779a70;
    stim[44] = 48'h604109500966;
    stim[45] = 48'h2b4c2a6828c9;
    stim[46] = 48'h0d69a66ad544;
    stim[47] = 48'h1317d2d31b94;
    stim[48] = 48'h5b5d7f41b6ec;
    stim[49] = 48'h22f0272fdfee;
    stim[50] = 48'h334c54772c35;
    stim[51] = 48'h0c0317072611;
    stim[52] = 48'h4f6b003697b1;
    stim[53] = 48'h2e33901169a7;
    stim[54] = 48'h664575b930ef;
    stim[55] = 48'h692b795af94f;
    stim[56] = 48'h7109e839a004;
    stim[57] = 48'ha5dac9fe3d0d;
    stim[58] = 48'h5325921d33ca;
    stim[59] = 48'h746fb78651be;
    stim[60] = 48'h6d460dc4f889;
    stim[61] = 48'h66a52aa592de;
    stim[62] = 48'h210481071ed5;
    stim[63] = 48'h4bf799a7eca0;
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
      expv[3] = 64'h000000001262dd94;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h00000000ea4d1280;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h000000004ecea186;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h00000000ea4d1280;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'hea4d128000000000;
      expv[14] = 64'ha11ba1d600000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h000000005777a94f;
      expv[17] = 64'h00000000e024fd9f;
      expv[18] = 64'ha11ba1d600000000;
      expv[19] = 64'hea4d12801d463f5a;
      expv[20] = 64'hdcbc831e00000000;
      expv[21] = 64'h00000000e648865a;
      expv[22] = 64'h1709c9ee00000000;
      expv[23] = 64'h7db16c5e0fddfce6;
      expv[24] = 64'hea4d128000000000;
      expv[25] = 64'he024fd9f7db16c5e;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h4ecea186dcbc831e;
      expv[29] = 64'h000000000fddfce6;
      expv[30] = 64'h271c30e785eed798;
      expv[31] = 64'h00000000271c30e7;
      expv[32] = 64'h5777a94f00000000;
      expv[33] = 64'h00000000b5eabee3;
      expv[34] = 64'h00000000e024fd9f;
      expv[35] = 64'h00000000b5eabee3;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h00000000dcbc831e;
      expv[38] = 64'hdcbc831edcbc831e;
      expv[39] = 64'h85eed7989926cf36;
      expv[40] = 64'hf66269fc00000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h5777a94fdc9a349b;
      expv[44] = 64'h00000000d7cc242e;
      expv[45] = 64'hd7cc242e1ca3b4a1;
      expv[46] = 64'hd30a9a0a00000000;
      expv[47] = 64'h00000000e585894a;
      expv[48] = 64'hf66269fc31fb0931;
      expv[49] = 64'h1262dd9424a10d5c;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'hdc9a349b00000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h85eed79800000000;
      expv[54] = 64'h00000000062d3217;
      expv[55] = 64'hd30a9a0a062d3217;
      expv[56] = 64'h00000000c5f4b4c6;
      expv[57] = 64'hbc09cbf785eed798;
      expv[58] = 64'h8ac3dde6d30a9a0a;
      expv[59] = 64'h85eed7988ac3dde6;
      expv[60] = 64'hc5f4b4c676b27f8f;
      expv[61] = 64'hd75fd06d8ac3dde6;
      expv[62] = 64'hd75fd06d00000000;
      expv[63] = 64'h9926cf3600000000;
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
