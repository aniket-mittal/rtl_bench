// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03936 dut (
    .clk(clk),
    .rst(in_vec[37:37]),
    .we(in_vec[36:36]),
    .en(in_vec[35:32]),
    .d(in_vec[31:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h268c76edf3;
    stim[1] = 38'h2bb0d20108;
    stim[2] = 38'h1aeb30db1e;
    stim[3] = 38'h3c7bba06f4;
    stim[4] = 38'h124535ef66;
    stim[5] = 38'h088651970b;
    stim[6] = 38'h19c1f670bd;
    stim[7] = 38'h1a89373849;
    stim[8] = 38'h1e9b4973e8;
    stim[9] = 38'h0ad03319ef;
    stim[10] = 38'h18233de09e;
    stim[11] = 38'h1c8be6eec5;
    stim[12] = 38'h07fc1408e2;
    stim[13] = 38'h1ea5656e7b;
    stim[14] = 38'h17dc4312cf;
    stim[15] = 38'h0eff86b10f;
    stim[16] = 38'h163621f3dc;
    stim[17] = 38'h1bfa521044;
    stim[18] = 38'h074378327a;
    stim[19] = 38'h0d6c6dce0c;
    stim[20] = 38'h15954e5615;
    stim[21] = 38'h147fd78a59;
    stim[22] = 38'h1ae9eec629;
    stim[23] = 38'h168ed9b13c;
    stim[24] = 38'h1b80350f3a;
    stim[25] = 38'h154a850d86;
    stim[26] = 38'h1d9cce91c6;
    stim[27] = 38'h02ee9493d7;
    stim[28] = 38'h1dc0762c26;
    stim[29] = 38'h10daee7c58;
    stim[30] = 38'h0afed8cc16;
    stim[31] = 38'h17ea1b1b8e;
    stim[32] = 38'h1af3edabe7;
    stim[33] = 38'h0980523069;
    stim[34] = 38'h000ed3da3c;
    stim[35] = 38'h111b8e9669;
    stim[36] = 38'h05bb760fa0;
    stim[37] = 38'h16c7c48e2e;
    stim[38] = 38'h1f0fb3bdfe;
    stim[39] = 38'h193d7a5291;
    stim[40] = 38'h16770c81cc;
    stim[41] = 38'h0b62c83678;
    stim[42] = 38'h17b58f7f5e;
    stim[43] = 38'h0fc571abe0;
    stim[44] = 38'h029715dd82;
    stim[45] = 38'h0dcd5ca344;
    stim[46] = 38'h01d55cce5f;
    stim[47] = 38'h16af42025a;
    stim[48] = 38'h06a6a36991;
    stim[49] = 38'h00632c7480;
    stim[50] = 38'h00f0f05254;
    stim[51] = 38'h1d209f36d8;
    stim[52] = 38'h0c05ca03ed;
    stim[53] = 38'h1cf810fa6e;
    stim[54] = 38'h0e018194d4;
    stim[55] = 38'h04ccb2e10e;
    stim[56] = 38'h0b8addfd78;
    stim[57] = 38'h08224cd777;
    stim[58] = 38'h092913aa1c;
    stim[59] = 38'h0070671c30;
    stim[60] = 38'h09f3cf573e;
    stim[61] = 38'h018f43a945;
    stim[62] = 38'h09da91d1eb;
    stim[63] = 38'h1e8026a949;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h0000ef00;
      expv[6] = 32'h0000ef00;
      expv[7] = 32'hc100efbd;
      expv[8] = 32'h890038bd;
      expv[9] = 32'h9b4973bd;
      expv[10] = 32'h9b4973bd;
      expv[11] = 32'h234973bd;
      expv[12] = 32'h8be673bd;
      expv[13] = 32'h8be673bd;
      expv[14] = 32'ha5656ebd;
      expv[15] = 32'ha54312cf;
      expv[16] = 32'ha54312cf;
      expv[17] = 32'ha521f3cf;
      expv[18] = 32'hfa211044;
      expv[19] = 32'hfa211044;
      expv[20] = 32'hfa211044;
      expv[21] = 32'hfa4e1015;
      expv[22] = 32'hfad71015;
      expv[23] = 32'he9d7c615;
      expv[24] = 32'he9d9b115;
      expv[25] = 32'h80d90f3a;
      expv[26] = 32'h80850f86;
      expv[27] = 32'h9cce0fc6;
      expv[28] = 32'h9cce0fc6;
      expv[29] = 32'hc0760f26;
      expv[30] = 32'hc0760f26;
      expv[31] = 32'hc0760f26;
      expv[32] = 32'hc01b1b8e;
      expv[33] = 32'hf31bab8e;
      expv[34] = 32'hf31bab8e;
      expv[35] = 32'hf31bab8e;
      expv[36] = 32'hf31bab69;
      expv[37] = 32'hf31bab69;
      expv[38] = 32'hf3c48e69;
      expv[39] = 32'h0fb3bdfe;
      expv[40] = 32'h3db3bd91;
      expv[41] = 32'h3d0c8191;
      expv[42] = 32'h3d0c8191;
      expv[43] = 32'h3d8f7f5e;
      expv[44] = 32'h3d8f7f5e;
      expv[45] = 32'h3d8f7f5e;
      expv[46] = 32'h3d8f7f5e;
      expv[47] = 32'h3d8f7f5e;
      expv[48] = 32'h3d42025e;
      expv[49] = 32'h3d42025e;
      expv[50] = 32'h3d42025e;
      expv[51] = 32'h3d42025e;
      expv[52] = 32'h209f02d8;
      expv[53] = 32'h209f02d8;
      expv[54] = 32'hf81002d8;
      expv[55] = 32'hf81002d8;
      expv[56] = 32'hf81002d8;
      expv[57] = 32'hf81002d8;
      expv[58] = 32'hf81002d8;
      expv[59] = 32'hf81002d8;
      expv[60] = 32'hf81002d8;
      expv[61] = 32'hf81002d8;
      expv[62] = 32'hf81002d8;
      expv[63] = 32'hf81002d8;
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
