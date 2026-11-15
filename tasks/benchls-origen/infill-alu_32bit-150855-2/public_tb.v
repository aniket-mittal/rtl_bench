// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150855 dut (
    .X(in_vec[68:37]),
    .Y(in_vec[36:5]),
    .S(in_vec[4:0]),
    .result1(out_vec[66:35]),
    .result2(out_vec[34:3]),
    .OF(out_vec[2:2]),
    .UOF(out_vec[1:1]),
    .Equal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h082f3cbb96cca5ea0a;
    stim[1] = 69'h11b75a3fd92933ee87;
    stim[2] = 69'h0b38cba0e4a29ad2d3;
    stim[3] = 69'h1c850f8ced9a090569;
    stim[4] = 69'h1e78890a213a7d3944;
    stim[5] = 69'h0226701df26d0970e7;
    stim[6] = 69'h10a3320729e0718444;
    stim[7] = 69'h1dc19a2743b3306e1c;
    stim[8] = 69'h0501e5f9d9b39d509e;
    stim[9] = 69'h0ac5eb660632bb71f3;
    stim[10] = 69'h0cfe08b103b0dc6081;
    stim[11] = 69'h056817c3c87f4aae97;
    stim[12] = 69'h0d56df8147723eae22;
    stim[13] = 69'h1477210d872afcc90f;
    stim[14] = 69'h1b17c0c9c0da68e3ea;
    stim[15] = 69'h0f10e0c3f92477f305;
    stim[16] = 69'h0755801c686c2a9d2e;
    stim[17] = 69'h1f1b2e1507db13f1d2;
    stim[18] = 69'h07de682c98350f63e7;
    stim[19] = 69'h08892f1bb639c86510;
    stim[20] = 69'h166154b72c6597c961;
    stim[21] = 69'h115b79762851888b8f;
    stim[22] = 69'h0c63b1f3b577ff86a9;
    stim[23] = 69'h1584bc85cff9e8dbb4;
    stim[24] = 69'h008c93df9d0b11aa67;
    stim[25] = 69'h011da8153725a12c4d;
    stim[26] = 69'h15a04b5990e69ed162;
    stim[27] = 69'h000ede9b55bbb3d4c7;
    stim[28] = 69'h0973a031f93a6336d7;
    stim[29] = 69'h08aae7a031ef9f8f9f;
    stim[30] = 69'h061daf97d189674893;
    stim[31] = 69'h053ad7b7f56c8ea6f8;
    stim[32] = 69'h1c1265310258cb545b;
    stim[33] = 69'h0d8d60c2bb0172c287;
    stim[34] = 69'h07b42fdda91d558f1e;
    stim[35] = 69'h1dd0e00af4c3052fd2;
    stim[36] = 69'h1c027d198db9197f56;
    stim[37] = 69'h0ee89f5ff3091ac3f5;
    stim[38] = 69'h04eadd3f535e9477e8;
    stim[39] = 69'h0858653e4e0147fd9f;
    stim[40] = 69'h09b927721aaa0c13b7;
    stim[41] = 69'h169ab62be2b7f07322;
    stim[42] = 69'h11467dd7aaca6c9928;
    stim[43] = 69'h04384c2eb0b96e5949;
    stim[44] = 69'h032b2483445dc25b9c;
    stim[45] = 69'h0295ee4fb05a2dd5da;
    stim[46] = 69'h13990da9b05ac7846b;
    stim[47] = 69'h1f4d29e5c8cc415c75;
    stim[48] = 69'h0c0725fd9b233dca65;
    stim[49] = 69'h1c4b789d9eb950dfe6;
    stim[50] = 69'h1a223d71bb41ba32ab;
    stim[51] = 69'h19c6debaff7f5dd34b;
    stim[52] = 69'h1ec9deadddea15b66c;
    stim[53] = 69'h1baa21e7267880c96f;
    stim[54] = 69'h124f8cbb79fa6a3359;
    stim[55] = 69'h08932ec9b2ef092d4e;
    stim[56] = 69'h12e1c9590c32b3b899;
    stim[57] = 69'h07d71d6c5e499c5ef7;
    stim[58] = 69'h1904b9aa323eb6c3ac;
    stim[59] = 69'h0ac2772c85f69eeddf;
    stim[60] = 69'h131178782e84b7e122;
    stim[61] = 69'h11972d939a13acc45d;
    stim[62] = 69'h0fc6d0941ced730c26;
    stim[63] = 69'h0ae24711070d9cc231;
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
      expv[0] = 67'h04410811800000000;
      expv[1] = 67'h448448ba000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h447c1a26000000000;
      expv[4] = 67'h7ffffffffecc190d8;
      expv[5] = 67'h08900043800000000;
      expv[6] = 67'h7fffffffea0e8e2d8;
      expv[7] = 67'h00000000000000000;
      expv[8] = 67'h00000000000000000;
      expv[9] = 67'h00000000000000000;
      expv[10] = 67'h033f822c000000000;
      expv[11] = 67'h00000000000000000;
      expv[12] = 67'h00001aad800000000;
      expv[13] = 67'h00000000000000000;
      expv[14] = 67'h10805c50000000000;
      expv[15] = 67'h20d562db800000000;
      expv[16] = 67'h00000000000000000;
      expv[17] = 67'h00000000000000000;
      expv[18] = 67'h00502082000000000;
      expv[19] = 67'h00000000000000000;
      expv[20] = 67'h000b30aa000000000;
      expv[21] = 67'h00000000000000000;
      expv[22] = 67'h645139d4000000000;
      expv[23] = 67'h00000000000000000;
      expv[24] = 67'h00204628000000000;
      expv[25] = 67'h00000000000000000;
      expv[26] = 67'h7ffad025800000000;
      expv[27] = 67'h002a4a41000000000;
      expv[28] = 67'h00000000000000000;
      expv[29] = 67'h00000000000000000;
      expv[30] = 67'h00000000000000000;
      expv[31] = 67'h00000000000000000;
      expv[32] = 67'h00000000000000000;
      expv[33] = 67'h2405830a000000000;
      expv[34] = 67'h00000000000000000;
      expv[35] = 67'h00000000000000000;
      expv[36] = 67'h00000000000000000;
      expv[37] = 67'h00000000000000000;
      expv[38] = 67'h5ffb75ff800000000;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h00000000000000000;
      expv[41] = 67'h7fffffed000000000;
      expv[42] = 67'h6f39f77e800000000;
      expv[43] = 67'h520489df800000000;
      expv[44] = 67'h00000000000000000;
      expv[45] = 67'h00000000000000000;
      expv[46] = 67'h00000000000000000;
      expv[47] = 67'h00000000000000000;
      expv[48] = 67'h1ca98f1f800000000;
      expv[49] = 67'h76489ef6800000006;
      expv[50] = 67'h00000000800000000;
      expv[51] = 67'h00000000800000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h00000000000000000;
      expv[54] = 67'h00000000000000000;
      expv[55] = 67'h00000000000000000;
      expv[56] = 67'h00000000000000000;
      expv[57] = 67'h00000000000000000;
      expv[58] = 67'h00000000000000000;
      expv[59] = 67'h00000000000000000;
      expv[60] = 67'h7fe622f0800000000;
      expv[61] = 67'h00000000000000000;
      expv[62] = 67'h4b65761f800000000;
      expv[63] = 67'h00000000000000000;
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
