// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09146 dut (
    .clk(clk),
    .clr(in_vec[16:16]),
    .A(in_vec[15:8]),
    .B(in_vec[7:0]),
    .Z(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1908c;
    stim[1] = 17'h18c0f;
    stim[2] = 17'h1b6d4;
    stim[3] = 17'h0a41d;
    stim[4] = 17'h0d379;
    stim[5] = 17'h12f8f;
    stim[6] = 17'h0d6a5;
    stim[7] = 17'h0053b;
    stim[8] = 17'h0660b;
    stim[9] = 17'h0b869;
    stim[10] = 17'h185c6;
    stim[11] = 17'h06c45;
    stim[12] = 17'h1ce9a;
    stim[13] = 17'h1d263;
    stim[14] = 17'h14ef4;
    stim[15] = 17'h19df1;
    stim[16] = 17'h03980;
    stim[17] = 17'h06c71;
    stim[18] = 17'h19857;
    stim[19] = 17'h0b65c;
    stim[20] = 17'h1ba15;
    stim[21] = 17'h02972;
    stim[22] = 17'h1923d;
    stim[23] = 17'h0aff9;
    stim[24] = 17'h17ba0;
    stim[25] = 17'h14c75;
    stim[26] = 17'h03686;
    stim[27] = 17'h101c1;
    stim[28] = 17'h19e63;
    stim[29] = 17'h18cec;
    stim[30] = 17'h1c942;
    stim[31] = 17'h12352;
    stim[32] = 17'h00443;
    stim[33] = 17'h0f5a5;
    stim[34] = 17'h07cef;
    stim[35] = 17'h14122;
    stim[36] = 17'h1f16f;
    stim[37] = 17'h19b86;
    stim[38] = 17'h130e6;
    stim[39] = 17'h10816;
    stim[40] = 17'h1156a;
    stim[41] = 17'h0ab98;
    stim[42] = 17'h19179;
    stim[43] = 17'h1875a;
    stim[44] = 17'h098ba;
    stim[45] = 17'h04a49;
    stim[46] = 17'h04835;
    stim[47] = 17'h104da;
    stim[48] = 17'h03c6c;
    stim[49] = 17'h0ad2a;
    stim[50] = 17'h0f193;
    stim[51] = 17'h14f34;
    stim[52] = 17'h0e9fb;
    stim[53] = 17'h1d31b;
    stim[54] = 17'h0794b;
    stim[55] = 17'h122f8;
    stim[56] = 17'h0ff53;
    stim[57] = 17'h189bd;
    stim[58] = 17'h149b2;
    stim[59] = 17'h0bfb1;
    stim[60] = 17'h14cd9;
    stim[61] = 17'h1590f;
    stim[62] = 17'h1b4d9;
    stim[63] = 17'h01de8;
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
      expv[0] = 16'h4ec0;
      expv[1] = 16'h0834;
      expv[2] = 16'h96b8;
      expv[3] = 16'ha94c;
      expv[4] = 16'h0d07;
      expv[5] = 16'h1a41;
      expv[6] = 16'ha42f;
      expv[7] = 16'ha556;
      expv[8] = 16'ha9b8;
      expv[9] = 16'hf530;
      expv[10] = 16'h66de;
      expv[11] = 16'h83fa;
      expv[12] = 16'h7bec;
      expv[13] = 16'h5136;
      expv[14] = 16'h4a58;
      expv[15] = 16'h93cd;
      expv[16] = 16'hb04d;
      expv[17] = 16'hdff9;
      expv[18] = 16'h33a8;
      expv[19] = 16'h7510;
      expv[20] = 16'h0f42;
      expv[21] = 16'h2184;
      expv[22] = 16'h22ca;
      expv[23] = 16'hcd01;
      expv[24] = 16'h4ce0;
      expv[25] = 16'h22bc;
      expv[26] = 16'h3f00;
      expv[27] = 16'h00c1;
      expv[28] = 16'h3d1a;
      expv[29] = 16'h8110;
      expv[30] = 16'h33d2;
      expv[31] = 16'h0b36;
      expv[32] = 16'h0c42;
      expv[33] = 16'haa2b;
      expv[34] = 16'h1def;
      expv[35] = 16'h08a2;
      expv[36] = 16'h687f;
      expv[37] = 16'h5122;
      expv[38] = 16'h2b20;
      expv[39] = 16'h00b0;
      expv[40] = 16'h08b2;
      expv[41] = 16'h6e3a;
      expv[42] = 16'h4489;
      expv[43] = 16'h2f76;
      expv[44] = 16'h9de6;
      expv[45] = 16'hb300;
      expv[46] = 16'hc1e8;
      expv[47] = 16'h0368;
      expv[48] = 16'h1cb8;
      expv[49] = 16'h391a;
      expv[50] = 16'hc37d;
      expv[51] = 16'h100c;
      expv[52] = 16'hf47f;
      expv[53] = 16'h1641;
      expv[54] = 16'h39b4;
      expv[55] = 16'h20f0;
      expv[56] = 16'h739d;
      expv[57] = 16'h6525;
      expv[58] = 16'h32c2;
      expv[59] = 16'hb6d1;
      expv[60] = 16'h406c;
      expv[61] = 16'h0537;
      expv[62] = 16'h9894;
      expv[63] = 16'hb2dc;
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
