// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_094655 dut (
    .IN0(in_vec[49:34]),
    .IN1(in_vec[33:18]),
    .IN2(in_vec[17:2]),
    .SELECT(in_vec[1:0]),
    .OUT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h1800a3a13bf98;
    stim[1] = 50'h1d31b4da38040;
    stim[2] = 50'h0ba66f601e1f3;
    stim[3] = 50'h24ad5da0c12fc;
    stim[4] = 50'h0ecc9c3757755;
    stim[5] = 50'h0e7d29233a3be;
    stim[6] = 50'h226356fd0ebfe;
    stim[7] = 50'h1640cdc341639;
    stim[8] = 50'h2fa2424522550;
    stim[9] = 50'h2aaed76e8a066;
    stim[10] = 50'h3f2f99318a351;
    stim[11] = 50'h214320a787d41;
    stim[12] = 50'h01f1d0c8de8c1;
    stim[13] = 50'h0f23e8ff0c16a;
    stim[14] = 50'h31c0b7b5bb8c7;
    stim[15] = 50'h25fad59829af4;
    stim[16] = 50'h39889521d4f81;
    stim[17] = 50'h132be73e93b47;
    stim[18] = 50'h1978f1cdc3a5b;
    stim[19] = 50'h2f489b340bb3b;
    stim[20] = 50'h2dc989a35df89;
    stim[21] = 50'h3a8c87b7f2d10;
    stim[22] = 50'h03bdccd97436d;
    stim[23] = 50'h07ac2b3e96a1c;
    stim[24] = 50'h321e49dc62e62;
    stim[25] = 50'h23e2f121127e1;
    stim[26] = 50'h25a98cb159ffd;
    stim[27] = 50'h33fa8b41befb3;
    stim[28] = 50'h279ca51014461;
    stim[29] = 50'h27d0e145edc56;
    stim[30] = 50'h1140b135b70d3;
    stim[31] = 50'h0cc1f6ff0457e;
    stim[32] = 50'h119f35f71501a;
    stim[33] = 50'h1c3c1037a46d5;
    stim[34] = 50'h0f51fe79f192a;
    stim[35] = 50'h13655e2313482;
    stim[36] = 50'h31fda6081d590;
    stim[37] = 50'h21ed6ea4df648;
    stim[38] = 50'h07d118965ef9e;
    stim[39] = 50'h0c5378fe6563b;
    stim[40] = 50'h3a1c8edeefacf;
    stim[41] = 50'h079e0c0df44d2;
    stim[42] = 50'h25665f1324d60;
    stim[43] = 50'h09ba96805909c;
    stim[44] = 50'h0df0b07000642;
    stim[45] = 50'h05b42bf77a8db;
    stim[46] = 50'h02bcc5db108bf;
    stim[47] = 50'h35c9dbf1de9ba;
    stim[48] = 50'h153fd1212d776;
    stim[49] = 50'h089ec1f484c3c;
    stim[50] = 50'h077b57fdb8c56;
    stim[51] = 50'h0dcea6ff37f81;
    stim[52] = 50'h3029401ea3e38;
    stim[53] = 50'h291766e6a4736;
    stim[54] = 50'h1c6bd980d7d36;
    stim[55] = 50'h2960882ea13d9;
    stim[56] = 50'h2927f0c7f84d6;
    stim[57] = 50'h12059c75de3d0;
    stim[58] = 50'h05aabdc0ba0dd;
    stim[59] = 50'h349fd685b7882;
    stim[60] = 50'h00fd090fead95;
    stim[61] = 50'h39d5c1e17353b;
    stim[62] = 50'h091b2380056f5;
    stim[63] = 50'h2d1ed0d8f271a;
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
      expv[0] = 16'h6002;
      expv[1] = 16'h74c6;
      expv[2] = 16'h0000;
      expv[3] = 16'h92b5;
      expv[4] = 16'h70dd;
      expv[5] = 16'he8ef;
      expv[6] = 16'h3aff;
      expv[7] = 16'h370d;
      expv[8] = 16'hbe89;
      expv[9] = 16'h2819;
      expv[10] = 16'h64c6;
      expv[11] = 16'h829e;
      expv[12] = 16'h4323;
      expv[13] = 16'h305a;
      expv[14] = 16'h0000;
      expv[15] = 16'h97eb;
      expv[16] = 16'h5487;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h268d;
      expv[21] = 16'hea32;
      expv[22] = 16'h3365;
      expv[23] = 16'h1eb0;
      expv[24] = 16'h8b98;
      expv[25] = 16'hc484;
      expv[26] = 16'h32c5;
      expv[27] = 16'h0000;
      expv[28] = 16'h9440;
      expv[29] = 16'hb715;
      expv[30] = 16'h0000;
      expv[31] = 16'h115f;
      expv[32] = 16'h5406;
      expv[33] = 16'h40de;
      expv[34] = 16'hc64a;
      expv[35] = 16'h4d20;
      expv[36] = 16'hc7f6;
      expv[37] = 16'h87b5;
      expv[38] = 16'h7be7;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'hd134;
      expv[42] = 16'h9599;
      expv[43] = 16'h26ea;
      expv[44] = 16'h0190;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h7a6e;
      expv[48] = 16'hb5dd;
      expv[49] = 16'h227b;
      expv[50] = 16'he315;
      expv[51] = 16'h9bfc;
      expv[52] = 16'hc0a5;
      expv[53] = 16'h91cd;
      expv[54] = 16'h5f4d;
      expv[55] = 16'h20ba;
      expv[56] = 16'he135;
      expv[57] = 16'h4816;
      expv[58] = 16'hf702;
      expv[59] = 16'hde20;
      expv[60] = 16'h243f;
      expv[61] = 16'h0000;
      expv[62] = 16'h8e00;
      expv[63] = 16'hc9c6;
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
