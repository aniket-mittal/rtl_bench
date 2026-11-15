// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09453 dut (
    .clk(clk),
    .rst(in_vec[51:51]),
    .fracta_i(in_vec[50:27]),
    .fractb_i(in_vec[26:3]),
    .signa_i(in_vec[2:2]),
    .signb_i(in_vec[1:1]),
    .start_i(in_vec[0:0]),
    .fract_o(out_vec[49:2]),
    .sign_o(out_vec[1:1]),
    .ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hed843fe3f1dc0;
    stim[1] = 52'hb0798d905b010;
    stim[2] = 52'h52a524f3b6dc0;
    stim[3] = 52'h2bb8b52c09492;
    stim[4] = 52'h7513b88bf7bd3;
    stim[5] = 52'h4aec3aa343b9d;
    stim[6] = 52'h442984ec16ad2;
    stim[7] = 52'h3df2d9b207569;
    stim[8] = 52'h2be9d1b4a3a2a;
    stim[9] = 52'h152b0c6ef64a0;
    stim[10] = 52'h50ea03ede4de5;
    stim[11] = 52'h14f8dd5d68da2;
    stim[12] = 52'h032942e2372e0;
    stim[13] = 52'h010bc276b142d;
    stim[14] = 52'h41f4b9af56e64;
    stim[15] = 52'h697e23484fd29;
    stim[16] = 52'h110b9855ec86d;
    stim[17] = 52'h7e6303eba7241;
    stim[18] = 52'h0dccdccc1b6f0;
    stim[19] = 52'h043f27eef7a25;
    stim[20] = 52'h44c79b2389c01;
    stim[21] = 52'h7feaa0e719819;
    stim[22] = 52'h3f6aaa86e09b3;
    stim[23] = 52'h3b7bd857f5d81;
    stim[24] = 52'h5fe1c56f98051;
    stim[25] = 52'h45c655998f1d6;
    stim[26] = 52'h1f5ae70961992;
    stim[27] = 52'h7d99ef0a18883;
    stim[28] = 52'h102f62f49d5e8;
    stim[29] = 52'h679f55f585abd;
    stim[30] = 52'h3c66191176faa;
    stim[31] = 52'h35f091593ee9a;
    stim[32] = 52'h1e1051e66050d;
    stim[33] = 52'h1022d7ab76336;
    stim[34] = 52'h622fe64e99d28;
    stim[35] = 52'h41ee0991c4558;
    stim[36] = 52'h5144808adef15;
    stim[37] = 52'h4aa2c86698c26;
    stim[38] = 52'h503b61f4246c8;
    stim[39] = 52'h1ec388f56bee0;
    stim[40] = 52'h4430a9531cf5f;
    stim[41] = 52'h3369f169ba0c8;
    stim[42] = 52'h753c779ff0713;
    stim[43] = 52'h28d53d6058c06;
    stim[44] = 52'h4ae337e837e05;
    stim[45] = 52'h38b82f631aee0;
    stim[46] = 52'h6a814f46786e7;
    stim[47] = 52'h104fdeb17a754;
    stim[48] = 52'h61a7a0882171d;
    stim[49] = 52'h8104019a6e5d1;
    stim[50] = 52'h0bcfa9094624d;
    stim[51] = 52'h50d6ac8d7943f;
    stim[52] = 52'h00168da26802a;
    stim[53] = 52'h5521371088090;
    stim[54] = 52'h1b1e6ca7bac43;
    stim[55] = 52'h2b33567393027;
    stim[56] = 52'h1be365d606da4;
    stim[57] = 52'hc4cf752df982c;
    stim[58] = 52'h7012b11e81003;
    stim[59] = 52'h711307f33e7b5;
    stim[60] = 52'h0e6db67a206d2;
    stim[61] = 52'h591c696490b36;
    stim[62] = 52'h1234d96c560b6;
    stim[63] = 52'h16c5370dc8b08;
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
      expv[0] = 50'h0000000000000;
      expv[1] = 50'h0000000000000;
      expv[2] = 50'h0000000000000;
      expv[3] = 50'h000000000000x;
      expv[4] = 50'h0000000000002;
      expv[5] = 50'h0000000000002;
      expv[6] = 50'h0000000000002;
      expv[7] = 50'h0000000000002;
      expv[8] = 50'h00000025761d4;
      expv[9] = 50'h0000000000002;
      expv[10] = 50'h0000000000000;
      expv[11] = 50'h00000015f4e8e;
      expv[12] = 50'h00000015f4e8e;
      expv[13] = 50'h000000b7c8efc;
      expv[14] = 50'h0000000000002;
      expv[15] = 50'h0000000000002;
      expv[16] = 50'h0000000217840;
      expv[17] = 50'h0000000000002;
      expv[18] = 50'h0000000000000;
      expv[19] = 50'h0000000885cc0;
      expv[20] = 50'h0000000000002;
      expv[21] = 50'h0000000000000;
      expv[22] = 50'h0000000000000;
      expv[23] = 50'h0000000000002;
      expv[24] = 50'h0000003ff5504;
      expv[25] = 50'h0000000000000;
      expv[26] = 50'h0000000000000;
      expv[27] = 50'h0000000000002;
      expv[28] = 50'h0000000000002;
      expv[29] = 50'h0000001f5ae70;
      expv[30] = 50'h0000001f5ae72;
      expv[31] = 50'h0000000817b16;
      expv[32] = 50'h0000006fb706e;
      expv[33] = 50'h0000001e330ca;
      expv[34] = 50'h00000054239d8;
      expv[35] = 50'h00000054239d8;
      expv[36] = 50'h0000000000000;
      expv[37] = 50'h0000000000002;
      expv[38] = 50'h0000000000000;
      expv[39] = 50'h0000000000000;
      expv[40] = 50'h0000000000000;
      expv[41] = 50'h0000000000000;
      expv[42] = 50'h0000003d87110;
      expv[43] = 50'h0000014e49b52;
      expv[44] = 50'h00000019b4f88;
      expv[45] = 50'h0000008ef1702;
      expv[46] = 50'h0000000000000;
      expv[47] = 50'h0000000000000;
      expv[48] = 50'h0000000000002;
      expv[49] = 50'h0000000000000;
      expv[50] = 50'h0000000000000;
      expv[51] = 50'h0000000000002;
      expv[52] = 50'h0000000000000;
      expv[53] = 50'h0000000000002;
      expv[54] = 50'h000000286b564;
      expv[55] = 50'h000000000b46e;
      expv[56] = 50'h000000552c7dc;
      expv[57] = 50'h0000000000000;
      expv[58] = 50'h0000000000000;
      expv[59] = 50'h0000000000002;
      expv[60] = 50'h0000000000002;
      expv[61] = 50'h0000000000002;
      expv[62] = 50'h0000000000000;
      expv[63] = 50'h0000000000000;
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
