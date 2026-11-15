// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00751 dut (
    .i_data_A(in_vec[67:36]),
    .i_data_B(in_vec[35:4]),
    .i_alu_control(in_vec[3:0]),
    .o_zero_flag(out_vec[32:32]),
    .o_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'habdcb804ec3556978;
    stim[1] = 68'h32698c85bb4fd5ec0;
    stim[2] = 68'h56cdc4d34117820fc;
    stim[3] = 68'h2555449743a8ac6cc;
    stim[4] = 68'h5b52d82569b1103b9;
    stim[5] = 68'h3f49092532a0ad3b1;
    stim[6] = 68'h85527aeb53eff5dec;
    stim[7] = 68'h13b422aa89c92891d;
    stim[8] = 68'h20adee570b30af2ef;
    stim[9] = 68'h73e0f105772ecd51e;
    stim[10] = 68'h4dff50b5911a6151b;
    stim[11] = 68'haa208a18f89470e82;
    stim[12] = 68'h1dc6246fbfefa06a3;
    stim[13] = 68'hfb06b6913b648f0d1;
    stim[14] = 68'hf970e72db294d1833;
    stim[15] = 68'hdd3d93caaf331f0ab;
    stim[16] = 68'ha67787210d391c488;
    stim[17] = 68'hfc5c7c9a2d4d5b9a2;
    stim[18] = 68'hb68eccb13f1eb6310;
    stim[19] = 68'h6388fdca0d9f1bd2b;
    stim[20] = 68'h65efa795c9377aeb0;
    stim[21] = 68'h6c317e090ba23f946;
    stim[22] = 68'h29c446a6ef45f4ba9;
    stim[23] = 68'h3321e2c94697e790f;
    stim[24] = 68'he9da48b90cd5aa0b4;
    stim[25] = 68'h5674709fd30bfd035;
    stim[26] = 68'h7b9baa57d16c8bba8;
    stim[27] = 68'hb4586e4f3912e2573;
    stim[28] = 68'h2516bcb9b804a7459;
    stim[29] = 68'hccb2b3cf9aed5da3d;
    stim[30] = 68'h4c7337e29ea2cecbb;
    stim[31] = 68'h7b3e1247ec3c31040;
    stim[32] = 68'h2aec7d250a804a07a;
    stim[33] = 68'h040f354655a21be71;
    stim[34] = 68'h475a881e4bc1cee4c;
    stim[35] = 68'h41e48a4b1f44d8476;
    stim[36] = 68'hafb2cf0ba82329def;
    stim[37] = 68'hf37367fbfc4f51649;
    stim[38] = 68'hc6096aa6fa1f27d7f;
    stim[39] = 68'h829939f61b3337f87;
    stim[40] = 68'hc46755d752cc0f83b;
    stim[41] = 68'h47b17dfbe6cac8bed;
    stim[42] = 68'h4026d17d766de0b71;
    stim[43] = 68'h90cd35172af76ed1f;
    stim[44] = 68'hfdb66c0875fe196a1;
    stim[45] = 68'h7db78c52bbe0c5d40;
    stim[46] = 68'h6dfcaa3c014798a54;
    stim[47] = 68'h8c8ddd36553ae7209;
    stim[48] = 68'h16662f59e110456d9;
    stim[49] = 68'h5a9187dc64ced15e4;
    stim[50] = 68'h8ff78dfe8cd4576e1;
    stim[51] = 68'hd0e48e4d7d324d115;
    stim[52] = 68'hd7df0fe2471dfc390;
    stim[53] = 68'h4e04a4e36458a90c2;
    stim[54] = 68'haa7b59e2f1285ca54;
    stim[55] = 68'hfa2fcdd01f166ddf4;
    stim[56] = 68'h65be0dc69f280ce70;
    stim[57] = 68'h8822dace19bcfcad9;
    stim[58] = 68'hac0b2c0c25fcf6caa;
    stim[59] = 68'h9be48b6c0bc250305;
    stim[60] = 68'hf9bf6855668c9539f;
    stim[61] = 68'hc1511ff95473005ea;
    stim[62] = 68'hbf64eb0832b498a03;
    stim[63] = 68'h66f17bebbf3b1c1a5;
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
      expv[0] = 33'h0c3556970;
      expv[1] = 33'h032498484;
      expv[2] = 33'h000000822;
      expv[3] = 33'h000000087;
      expv[4] = 33'h0034d8881;
      expv[5] = 33'h03fe9ad3f;
      expv[6] = 33'h0000a7dfe;
      expv[7] = 33'hxxxxxxxxx;
      expv[8] = 33'hxxxxxxxxx;
      expv[9] = 33'hxxxxxxxxx;
      expv[10] = 33'h0d30a8c88;
      expv[11] = 33'h0a2b4fb00;
      expv[12] = 33'h0a2298405;
      expv[13] = 33'h0fb66bf9d;
      expv[14] = 33'h04be436ae;
      expv[15] = 33'h0c2abccc7;
      expv[16] = 33'h01a723890;
      expv[17] = 33'h029a9d834;
      expv[18] = 33'h0360e8431;
      expv[19] = 33'h0f48367c6;
      expv[20] = 33'h041272281;
      expv[21] = 33'h0608f3e75;
      expv[22] = 33'h003bd17d2;
      expv[23] = 33'hxxxxxxxxx;
      expv[24] = 33'h012201544;
      expv[25] = 33'hxxxxxxxxx;
      expv[26] = 33'h0dd000000;
      expv[27] = 33'h08d4a8c18;
      expv[28] = 33'h00000005c;
      expv[29] = 33'hxxxxxxxxx;
      expv[30] = 33'h0e7a8b3b2;
      expv[31] = 33'h0683c1004;
      expv[32] = 33'h0500940e1;
      expv[33] = 33'h055af3fe7;
      expv[34] = 33'h000000001;
      expv[35] = 33'h0229fb204;
      expv[36] = 33'hxxxxxxxxx;
      expv[37] = 33'h00000001f;
      expv[38] = 33'hxxxxxxxxx;
      expv[39] = 33'h100000000;
      expv[40] = 33'h0981f06a5;
      expv[41] = 33'hxxxxxxxxx;
      expv[42] = 33'h0766ff1ff;
      expv[43] = 33'hxxxxxxxxx;
      expv[44] = 33'h0fdfe7d6a;
      expv[45] = 33'h039a08450;
      expv[46] = 33'h092004542;
      expv[47] = 33'h000000154;
      expv[48] = 33'h000000070;
      expv[49] = 33'h081202821;
      expv[50] = 33'h08ff7dffe;
      expv[51] = 33'hxxxxxxxxx;
      expv[52] = 33'h0471d0c20;
      expv[53] = 33'h0b25d4def;
      expv[54] = 33'h00484a218;
      expv[55] = 33'h000c01220;
      expv[56] = 33'h005280cc6;
      expv[57] = 33'h0000066f3;
      expv[58] = 33'h0cf6ca25f;
      expv[59] = 33'hxxxxxxxxx;
      expv[60] = 33'hxxxxxxxxx;
      expv[61] = 33'h0bca8e600;
      expv[62] = 33'h08dd073a8;
      expv[63] = 33'hxxxxxxxxx;
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
