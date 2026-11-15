// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  bilbo_lfsr dut (
    .clk(clk),
    .pin(in_vec[35:4]),
    .shift_in(in_vec[3:3]),
    .mode(in_vec[2:1]),
    .rst(in_vec[0:0]),
    .pout(out_vec[32:1]),
    .shift_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb9d562a83;
    stim[1] = 36'hf7e00cec9;
    stim[2] = 36'h48dc434ca;
    stim[3] = 36'h90cab0b7e;
    stim[4] = 36'h6a7d2bc30;
    stim[5] = 36'h1fd3c4a3a;
    stim[6] = 36'hb30f7c2d8;
    stim[7] = 36'h090f1e68a;
    stim[8] = 36'h2bd3892fc;
    stim[9] = 36'hb279df7d6;
    stim[10] = 36'h11636aa2e;
    stim[11] = 36'h56c0cf7f2;
    stim[12] = 36'h313f2743a;
    stim[13] = 36'hee43fc1e6;
    stim[14] = 36'h00754ccfe;
    stim[15] = 36'h7998b1f58;
    stim[16] = 36'h04dc2f3bc;
    stim[17] = 36'hda0e194a4;
    stim[18] = 36'hfd2dc8f90;
    stim[19] = 36'h323b3fa92;
    stim[20] = 36'h7e2b2207c;
    stim[21] = 36'h83cb29790;
    stim[22] = 36'h94d8a9b92;
    stim[23] = 36'h9bebe9a9e;
    stim[24] = 36'h3b932856c;
    stim[25] = 36'h04d1b0d9e;
    stim[26] = 36'h019d94114;
    stim[27] = 36'hab3a81890;
    stim[28] = 36'heb9c8bcb0;
    stim[29] = 36'h0a5aac788;
    stim[30] = 36'hea81994a4;
    stim[31] = 36'h5374cb834;
    stim[32] = 36'h83a1cda30;
    stim[33] = 36'hd8299c9d2;
    stim[34] = 36'hf9b46875e;
    stim[35] = 36'h6fcee1894;
    stim[36] = 36'h10983cbe6;
    stim[37] = 36'h66d0990dc;
    stim[38] = 36'h9cf971052;
    stim[39] = 36'h57d00f35e;
    stim[40] = 36'h4c80e4b52;
    stim[41] = 36'hce195cc02;
    stim[42] = 36'h2e131fe22;
    stim[43] = 36'h4a5a922fc;
    stim[44] = 36'h3c66ce870;
    stim[45] = 36'ha030ede94;
    stim[46] = 36'h976d31ca8;
    stim[47] = 36'hf09475c90;
    stim[48] = 36'hc1a1b6128;
    stim[49] = 36'h32226166e;
    stim[50] = 36'hd67db1450;
    stim[51] = 36'h8ce25653a;
    stim[52] = 36'h2ec0fd71a;
    stim[53] = 36'hff2f69f6a;
    stim[54] = 36'h60b908ecc;
    stim[55] = 36'h216259a0e;
    stim[56] = 36'hcab68a7c0;
    stim[57] = 36'ha20a725fe;
    stim[58] = 36'h35a7551e4;
    stim[59] = 36'hf452060e2;
    stim[60] = 36'h14c93b256;
    stim[61] = 36'h068d635d0;
    stim[62] = 36'h40aa5c380;
    stim[63] = 36'h5d105761e;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000002;
      expv[4] = 33'h12195616b;
      expv[5] = 33'h0d4fa5786;
      expv[6] = 33'h1a9f4af0f;
      expv[7] = 33'h1661ef85b;
      expv[8] = 33'h0cc3df0b6;
      expv[9] = 33'h1987be16d;
      expv[10] = 33'h054047c22;
      expv[11] = 33'h08ace2d00;
      expv[12] = 33'h1159c5a01;
      expv[13] = 33'h02b38b402;
      expv[14] = 33'h18af6903b;
      expv[15] = 33'h11507b9e9;
      expv[16] = 33'h0f33163ea;
      expv[17] = 33'h1e662c7d7;
      expv[18] = 33'h1ccc58fad;
      expv[19] = 33'h1fa5b91f3;
      expv[20] = 33'h1f4b723e5;
      expv[21] = 33'h1e96e47c9;
      expv[22] = 33'h1079652f3;
      expv[23] = 33'h00f2ca5e4;
      expv[24] = 33'h1298e9899;
      expv[25] = 33'h0531d3130;
      expv[26] = 33'h0af9903d2;
      expv[27] = 33'h15f3207a7;
      expv[28] = 33'h156750313;
      expv[29] = 33'h1d7391797;
      expv[30] = 33'h014b558f0;
      expv[31] = 33'h0296ab1e2;
      expv[32] = 33'h052d563c4;
      expv[33] = 33'h107439b47;
      expv[34] = 33'h00e87368c;
      expv[35] = 33'h1ee66bdf1;
      expv[36] = 33'h1dccd7be1;
      expv[37] = 33'h198aa8ebd;
      expv[38] = 33'h131551d7b;
      expv[39] = 33'h062aa3af4;
      expv[40] = 33'h06af46b80;
      expv[41] = 33'h0d5e8d700;
      expv[42] = 33'h1abd1ae01;
      expv[43] = 33'h157a35c01;
      expv[44] = 33'h0af46b800;
      expv[45] = 33'h078cd9d0e;
      expv[46] = 33'h0f19b3a1c;
      expv[47] = 33'h12eda6395;
      expv[48] = 33'h1e128eb93;
      expv[49] = 33'h183436c25;
      expv[50] = 33'h162c21a87;
      expv[51] = 33'h1acfb628b;
      expv[52] = 33'h159f6c517;
      expv[53] = 33'h0b3ed8a2e;
      expv[54] = 33'h167db145f;
      expv[55] = 33'h0cfb628be;
      expv[56] = 33'h1dda8e23f;
      expv[57] = 33'h1956d14f9;
      expv[58] = 33'h06ececd4e;
      expv[59] = 33'h0dd9d9a9c;
      expv[60] = 33'h1bb3b3539;
      expv[61] = 33'h15fe41c3b;
      expv[62] = 33'h00d1ac6ba;
      expv[63] = 33'h08154b870;
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
