// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141388 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .select(in_vec[0:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0dcfade64afb50fd9;
    stim[1] = 65'h187c8fe6489ba9e42;
    stim[2] = 65'h154a257626ba845cf;
    stim[3] = 65'h00b781a51a6bf65c6;
    stim[4] = 65'h0c0d9e731424e001c;
    stim[5] = 65'h00d64be7ed247f1ed;
    stim[6] = 65'h0d6e275cd372a2f82;
    stim[7] = 65'h0b7569422ac10aff1;
    stim[8] = 65'h18abc66929cfac7c8;
    stim[9] = 65'h01c8e93ddfa60226a;
    stim[10] = 65'h13f83dc78a9763095;
    stim[11] = 65'h17f50cd4ee8d76203;
    stim[12] = 65'h1b09c2a95057358c7;
    stim[13] = 65'h147547c8b538e19e5;
    stim[14] = 65'h11cb7828040e147ad;
    stim[15] = 65'h06db90e75db36a691;
    stim[16] = 65'h142b7d0b04ac4c661;
    stim[17] = 65'h1d80eb8f300e32270;
    stim[18] = 65'h1ffbc4dd0087c016a;
    stim[19] = 65'h0f1bc5b4e317946e0;
    stim[20] = 65'h04abd8ec0dac6abd2;
    stim[21] = 65'h107de235255b9fc52;
    stim[22] = 65'h06691b7f023bc0657;
    stim[23] = 65'h1d5b24a049464bc34;
    stim[24] = 65'h07a86a906f9bcc75f;
    stim[25] = 65'h1b517b84595fb8aff;
    stim[26] = 65'h116c421b0828e035b;
    stim[27] = 65'h0d23a9975a5a44690;
    stim[28] = 65'h0f3555cf915e9cb26;
    stim[29] = 65'h168f19ce3757c4afd;
    stim[30] = 65'h02fe59997c3393a84;
    stim[31] = 65'h152cbb03feb8676fc;
    stim[32] = 65'h1e1b364efe3aae2ad;
    stim[33] = 65'h1ad97c997194ca222;
    stim[34] = 65'h0a661b904afe59f27;
    stim[35] = 65'h0f2e8fad34918bb0c;
    stim[36] = 65'h00201e1099cf33aca;
    stim[37] = 65'h009fc32c5ea4c8e2d;
    stim[38] = 65'h122da2b5f87c566c3;
    stim[39] = 65'h0bcea645afb18a7d7;
    stim[40] = 65'h0948da73b49ec78a7;
    stim[41] = 65'h0b5b32f5684019afa;
    stim[42] = 65'h15be1a86722fd2e4b;
    stim[43] = 65'h162940785df429f1c;
    stim[44] = 65'h11445b216fec9c3d7;
    stim[45] = 65'h15d131fa5721577e3;
    stim[46] = 65'h0834cd83e8287d870;
    stim[47] = 65'h1cc18a5fcb653a115;
    stim[48] = 65'h0c80979ea8dd57ec1;
    stim[49] = 65'h099d814db4070d809;
    stim[50] = 65'h0ff33051d19b101af;
    stim[51] = 65'h06e649461344bb700;
    stim[52] = 65'h1d9456f372c5b0347;
    stim[53] = 65'h0140f2f6561cfa0fe;
    stim[54] = 65'h0b1ab5a62f7e39eca;
    stim[55] = 65'h1c1253cb9c5a70b63;
    stim[56] = 65'h04ae2a204955ec84d;
    stim[57] = 65'h00e33581f402e9500;
    stim[58] = 65'h0f1e2cfad4bc3948a;
    stim[59] = 65'h04b1a7a2cdef52a5d;
    stim[60] = 65'h1570ca26445fb86f9;
    stim[61] = 65'h12576f93bfa3188b6;
    stim[62] = 65'h0179116da436dcff8;
    stim[63] = 65'h1ed4a7bc6d49d9706;
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
      expv[0] = 32'h282a882d;
      expv[1] = 32'h08c1ce53;
      expv[2] = 32'h0a5eb121;
      expv[3] = 32'hd91bc00b;
      expv[4] = 32'h0193f3a6;
      expv[5] = 32'hf928070a;
      expv[6] = 32'h070652a7;
      expv[7] = 32'h4a4c481e;
      expv[8] = 32'h13db972d;
      expv[9] = 32'h0b775b23;
      expv[10] = 32'h4bb8e93b;
      expv[11] = 32'h8ba87957;
      expv[12] = 32'ha6499673;
      expv[13] = 32'hbacbb47a;
      expv[14] = 32'h7113b87f;
      expv[15] = 32'h128b753d;
      expv[16] = 32'h3d61b757;
      expv[17] = 32'h6c78edb1;
      expv[18] = 32'h041c279d;
      expv[19] = 32'h919ad117;
      expv[20] = 32'h92c21d49;
      expv[21] = 32'haecc0fd2;
      expv[22] = 32'hba4f20df;
      expv[23] = 32'h350b831c;
      expv[24] = 32'h054264e1;
      expv[25] = 32'h5a025f03;
      expv[26] = 32'h7353ec5f;
      expv[27] = 32'h3bef7002;
      expv[28] = 32'h049f940f;
      expv[29] = 32'h9a4f2d1e;
      expv[30] = 32'hf98f6a0d;
      expv[31] = 32'h9f29139d;
      expv[32] = 32'h1c549d32;
      expv[33] = 32'h637235dc;
      expv[34] = 32'h501e50fb;
      expv[35] = 32'h1e00daef;
      expv[36] = 32'hcf7a8de9;
      expv[37] = 32'hf4dbd993;
      expv[38] = 32'he83294af;
      expv[39] = 32'h02763825;
      expv[40] = 32'hb472dc4d;
      expv[41] = 32'h9cda6528;
      expv[42] = 32'hd09e97a3;
      expv[43] = 32'ha0eb5350;
      expv[44] = 32'h833c65e9;
      expv[45] = 32'h8969841d;
      expv[46] = 32'h82ea5857;
      expv[47] = 32'ha7e85c77;
      expv[48] = 32'h57fa80aa;
      expv[49] = 32'hb2cbed8e;
      expv[50] = 32'h73cdfccb;
      expv[51] = 32'hd15825b0;
      expv[52] = 32'h6f22c6e1;
      expv[53] = 32'hbaef6831;
      expv[54] = 32'hd4c77c96;
      expv[55] = 32'h3ed8da53;
      expv[56] = 32'hc5516ef3;
      expv[57] = 32'ha730f68f;
      expv[58] = 32'h1ed3321b;
      expv[59] = 32'h208aad93;
      expv[60] = 32'h3102691d;
      expv[61] = 32'h8fd440f8;
      expv[62] = 32'h2d7f7369;
      expv[63] = 32'h60f40966;
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
