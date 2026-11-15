// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  memory dut (
    .clk_in(clk),
    .flush(in_vec[53:53]),
    .rst(in_vec[52:52]),
    .sync_flush(in_vec[51:51]),
    .clk_out(in_vec[50:50]),
    .rden(in_vec[49:49]),
    .wren(in_vec[48:48]),
    .rdaddr(in_vec[47:40]),
    .wraddr(in_vec[39:32]),
    .dataIn(in_vec[31:0]),
    .dataOut(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h114acae3ac7708;
    stim[1] = 54'h1bcf63d43dd960;
    stim[2] = 54'h0bdd244e86da3d;
    stim[3] = 54'h0eaed765259920;
    stim[4] = 54'h09a5598b4579df;
    stim[5] = 54'h27857b2518aa38;
    stim[6] = 54'h0627ebd2e0361b;
    stim[7] = 54'h005c4671b42dc4;
    stim[8] = 54'h0ba7364549df8f;
    stim[9] = 54'h0a7080f16264c1;
    stim[10] = 54'h247d304b51faf9;
    stim[11] = 54'h00f501d2da11e7;
    stim[12] = 54'h2b6dafb1d38327;
    stim[13] = 54'h227af3b4d93000;
    stim[14] = 54'h04a7a817e87ac5;
    stim[15] = 54'h2253fc5ec6c647;
    stim[16] = 54'h2981618e1889ba;
    stim[17] = 54'h2aaa72a924528b;
    stim[18] = 54'h0f53022c54ad4d;
    stim[19] = 54'h2ab8824b558e8f;
    stim[20] = 54'h070ef6b26185db;
    stim[21] = 54'h03c392110696ba;
    stim[22] = 54'h2437e9bbe5a87d;
    stim[23] = 54'h0ac0d915f5b5ac;
    stim[24] = 54'h03131d153c0dde;
    stim[25] = 54'h233e067a324f49;
    stim[26] = 54'h23832c5e232031;
    stim[27] = 54'h03b13c487df3c7;
    stim[28] = 54'h0b010e1026bdc1;
    stim[29] = 54'h06a069fa55704c;
    stim[30] = 54'h2305dd931ff407;
    stim[31] = 54'h0f570ef22f4a16;
    stim[32] = 54'h234098d2c04c2d;
    stim[33] = 54'h21a6f59a94d0c9;
    stim[34] = 54'h26b773ecc1a783;
    stim[35] = 54'h03d2d71b5dc4a7;
    stim[36] = 54'h27ca824749106f;
    stim[37] = 54'h039b86cada8886;
    stim[38] = 54'h00b1a6ea52d40e;
    stim[39] = 54'h2dea23d20a224f;
    stim[40] = 54'h2a4e7801c9177b;
    stim[41] = 54'h251e029a806865;
    stim[42] = 54'h07b062e5f28e6a;
    stim[43] = 54'h094cebf7f2cf6c;
    stim[44] = 54'h22cf73106af03e;
    stim[45] = 54'h0cd480569fcf5a;
    stim[46] = 54'h229aa248ad7596;
    stim[47] = 54'h05bf07b3d552a8;
    stim[48] = 54'h0e551167e5979f;
    stim[49] = 54'h284d06428732c1;
    stim[50] = 54'h214ecdac56a06b;
    stim[51] = 54'h24217e12e02f0d;
    stim[52] = 54'h21917c2dab4ff4;
    stim[53] = 54'h017878c3e26149;
    stim[54] = 54'h2eb54cef225c82;
    stim[55] = 54'h2120b2a73fe4fc;
    stim[56] = 54'h08ae7ac06d81a2;
    stim[57] = 54'h081a1de7e6baaf;
    stim[58] = 54'h0b68efb6c73228;
    stim[59] = 54'h03c3e42d08d102;
    stim[60] = 54'h057e329ec80c62;
    stim[61] = 54'h051acd05277203;
    stim[62] = 54'h0f561b206bf99b;
    stim[63] = 54'h2e9fbab74b2b54;
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
      expv[2] = 32'h00000000;
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
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
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
