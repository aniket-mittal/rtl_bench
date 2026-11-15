// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03531 dut (
    .CLK(clk),
    .One_A_IN(in_vec[34:34]),
    .One_B_IN(in_vec[33:33]),
    .Two_A_IN(in_vec[32:32]),
    .Two_B_IN(in_vec[31:31]),
    .MW_One_IN(in_vec[30:30]),
    .MW_Two_IN(in_vec[29:29]),
    .input_IN(in_vec[28:28]),
    .wren_IN(in_vec[27:27]),
    .writeAd_IN(in_vec[26:24]),
    .ADR_MUX_IN(in_vec[23:23]),
    .write_IN(in_vec[22:22]),
    .PC_load_IN(in_vec[21:21]),
    .SPR_w_IN(in_vec[20:20]),
    .SPR_i_IN(in_vec[19:19]),
    .SPR_d_IN(in_vec[18:18]),
    .cond_IN(in_vec[17:15]),
    .op2_IN(in_vec[14:12]),
    .SW_IN(in_vec[11:11]),
    .MAD_MUX_IN(in_vec[10:10]),
    .FLAG_WRITE_IN(in_vec[9:9]),
    .AR_IN(in_vec[8:8]),
    .BR_IN(in_vec[7:7]),
    .ALU_IN(in_vec[6:3]),
    .SPC_MUX_IN(in_vec[2:2]),
    .MX_MUX_IN(in_vec[1:1]),
    .AB_MUX_IN(in_vec[0:0]),
    .One_A_OUT(out_vec[34:34]),
    .One_B_OUT(out_vec[33:33]),
    .Two_A_OUT(out_vec[32:32]),
    .Two_B_OUT(out_vec[31:31]),
    .MW_One_OUT(out_vec[30:30]),
    .MW_Two_OUT(out_vec[29:29]),
    .input_OUT(out_vec[28:28]),
    .wren_OUT(out_vec[27:27]),
    .writeAd_OUT(out_vec[26:24]),
    .ADR_MUX_OUT(out_vec[23:23]),
    .write_OUT(out_vec[22:22]),
    .PC_load_OUT(out_vec[21:21]),
    .SPR_w_OUT(out_vec[20:20]),
    .SPR_i_OUT(out_vec[19:19]),
    .SPR_d_OUT(out_vec[18:18]),
    .cond_OUT(out_vec[17:15]),
    .op2_OUT(out_vec[14:12]),
    .SW_OUT(out_vec[11:11]),
    .MAD_MUX_OUT(out_vec[10:10]),
    .FLAG_WRITE_OUT(out_vec[9:9]),
    .AR_OUT(out_vec[8:8]),
    .BR_OUT(out_vec[7:7]),
    .ALU_OUT(out_vec[6:3]),
    .SPC_MUX_OUT(out_vec[2:2]),
    .MX_MUX_OUT(out_vec[1:1]),
    .AB_MUX_OUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h4fec09b52;
    stim[1] = 35'h151bba10b;
    stim[2] = 35'h2e35662b6;
    stim[3] = 35'h39545811f;
    stim[4] = 35'h3eba1d453;
    stim[5] = 35'h23da31e6e;
    stim[6] = 35'h530dd0528;
    stim[7] = 35'h202f26be8;
    stim[8] = 35'h3275aba39;
    stim[9] = 35'h7828ab52d;
    stim[10] = 35'h003c4ec6c;
    stim[11] = 35'h2108fa458;
    stim[12] = 35'h3ae421813;
    stim[13] = 35'h34d940716;
    stim[14] = 35'h625965e81;
    stim[15] = 35'h78de5c24a;
    stim[16] = 35'h4c2ec7f77;
    stim[17] = 35'h314b08964;
    stim[18] = 35'h0bbf54c46;
    stim[19] = 35'h4690e075e;
    stim[20] = 35'h4f99bc5fd;
    stim[21] = 35'h760e5ba1c;
    stim[22] = 35'h78498d21c;
    stim[23] = 35'h3c13aa3e6;
    stim[24] = 35'h22f5efbe5;
    stim[25] = 35'h08a8ad083;
    stim[26] = 35'h3616088e7;
    stim[27] = 35'h5b7f6232a;
    stim[28] = 35'h0e63f66bf;
    stim[29] = 35'h74e332cf2;
    stim[30] = 35'h56a1fff33;
    stim[31] = 35'h6f4235c20;
    stim[32] = 35'h0f171ed83;
    stim[33] = 35'h1956a0c50;
    stim[34] = 35'h6d101363b;
    stim[35] = 35'h3ac41e97a;
    stim[36] = 35'h0ecfde28c;
    stim[37] = 35'h77e86c612;
    stim[38] = 35'h13491defd;
    stim[39] = 35'h5d231cd7a;
    stim[40] = 35'h76edde2b9;
    stim[41] = 35'h0fdcc9798;
    stim[42] = 35'h3dde1e918;
    stim[43] = 35'h2a7f7cf67;
    stim[44] = 35'h1bfcff4a6;
    stim[45] = 35'h7d7420886;
    stim[46] = 35'h28975943c;
    stim[47] = 35'h36f664045;
    stim[48] = 35'h398773060;
    stim[49] = 35'h7c7864cff;
    stim[50] = 35'h7bcecaa04;
    stim[51] = 35'h7b4f0044f;
    stim[52] = 35'h1fb0ba833;
    stim[53] = 35'h1a59e66e5;
    stim[54] = 35'h6f1f0b1cd;
    stim[55] = 35'h39e7646dd;
    stim[56] = 35'h42137b5bb;
    stim[57] = 35'h6a7633f44;
    stim[58] = 35'h7679193a9;
    stim[59] = 35'h4b56719e5;
    stim[60] = 35'h7a5339d8b;
    stim[61] = 35'h20c932cf9;
    stim[62] = 35'h48d2876eb;
    stim[63] = 35'h7f985d3c7;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h4fec09b52;
      expv[2] = 35'h151bba10b;
      expv[3] = 35'h2e35662b6;
      expv[4] = 35'h39545811f;
      expv[5] = 35'h3eba1d453;
      expv[6] = 35'h23da31e6e;
      expv[7] = 35'h530dd0528;
      expv[8] = 35'h202f26be8;
      expv[9] = 35'h3275aba39;
      expv[10] = 35'h7828ab52d;
      expv[11] = 35'h003c4ec6c;
      expv[12] = 35'h2108fa458;
      expv[13] = 35'h3ae421813;
      expv[14] = 35'h34d940716;
      expv[15] = 35'h625965e81;
      expv[16] = 35'h78de5c24a;
      expv[17] = 35'h4c2ec7f77;
      expv[18] = 35'h314b08964;
      expv[19] = 35'h0bbf54c46;
      expv[20] = 35'h4690e075e;
      expv[21] = 35'h4f99bc5fd;
      expv[22] = 35'h760e5ba1c;
      expv[23] = 35'h78498d21c;
      expv[24] = 35'h3c13aa3e6;
      expv[25] = 35'h22f5efbe5;
      expv[26] = 35'h08a8ad083;
      expv[27] = 35'h3616088e7;
      expv[28] = 35'h5b7f6232a;
      expv[29] = 35'h0e63f66bf;
      expv[30] = 35'h74e332cf2;
      expv[31] = 35'h56a1fff33;
      expv[32] = 35'h6f4235c20;
      expv[33] = 35'h0f171ed83;
      expv[34] = 35'h1956a0c50;
      expv[35] = 35'h6d101363b;
      expv[36] = 35'h3ac41e97a;
      expv[37] = 35'h0ecfde28c;
      expv[38] = 35'h77e86c612;
      expv[39] = 35'h13491defd;
      expv[40] = 35'h5d231cd7a;
      expv[41] = 35'h76edde2b9;
      expv[42] = 35'h0fdcc9798;
      expv[43] = 35'h3dde1e918;
      expv[44] = 35'h2a7f7cf67;
      expv[45] = 35'h1bfcff4a6;
      expv[46] = 35'h7d7420886;
      expv[47] = 35'h28975943c;
      expv[48] = 35'h36f664045;
      expv[49] = 35'h398773060;
      expv[50] = 35'h7c7864cff;
      expv[51] = 35'h7bcecaa04;
      expv[52] = 35'h7b4f0044f;
      expv[53] = 35'h1fb0ba833;
      expv[54] = 35'h1a59e66e5;
      expv[55] = 35'h6f1f0b1cd;
      expv[56] = 35'h39e7646dd;
      expv[57] = 35'h42137b5bb;
      expv[58] = 35'h6a7633f44;
      expv[59] = 35'h7679193a9;
      expv[60] = 35'h4b56719e5;
      expv[61] = 35'h7a5339d8b;
      expv[62] = 35'h20c932cf9;
      expv[63] = 35'h48d2876eb;
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
