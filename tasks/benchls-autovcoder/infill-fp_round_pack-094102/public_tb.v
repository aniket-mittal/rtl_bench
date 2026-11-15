// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094102 dut (
    .ZeroSum(in_vec[45:45]),
    .NormE(in_vec[44:36]),
    .NormM(in_vec[35:13]),
    .R(in_vec[12:12]),
    .S(in_vec[11:11]),
    .G(in_vec[10:10]),
    .Sa(in_vec[9:9]),
    .Sb(in_vec[8:8]),
    .Ctrl(in_vec[7:7]),
    .MaxAB(in_vec[6:6]),
    .NegE(in_vec[5:5]),
    .InputExc(in_vec[4:0]),
    .P(out_vec[36:5]),
    .Flags(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h25af675d9f35;
    stim[1] = 46'h24c3bed7cc88;
    stim[2] = 46'h00895c1efb29;
    stim[3] = 46'h1c218742867c;
    stim[4] = 46'h010ffe9c44cd;
    stim[5] = 46'h3bba31e349b1;
    stim[6] = 46'h0e9a32470209;
    stim[7] = 46'h23a19e215457;
    stim[8] = 46'h17ff636c8571;
    stim[9] = 46'h363869f42d42;
    stim[10] = 46'h11824b5ce664;
    stim[11] = 46'h237379361485;
    stim[12] = 46'h12434133cbb7;
    stim[13] = 46'h3ee87fb10318;
    stim[14] = 46'h0005dd972588;
    stim[15] = 46'h28253e237a02;
    stim[16] = 46'h3c7bb429630b;
    stim[17] = 46'h14c310554c63;
    stim[18] = 46'h2b5ba90d2461;
    stim[19] = 46'h24f1c5bd2314;
    stim[20] = 46'h0268a1bf79ba;
    stim[21] = 46'h1c5e5da2af89;
    stim[22] = 46'h0b0696b4a920;
    stim[23] = 46'h3622bfa36dc2;
    stim[24] = 46'h27815482e38a;
    stim[25] = 46'h0741193970dc;
    stim[26] = 46'h09ed6bd9b1d4;
    stim[27] = 46'h029063e1d2fa;
    stim[28] = 46'h25acede508dd;
    stim[29] = 46'h2d6ca90df8d4;
    stim[30] = 46'h3d376b5304b5;
    stim[31] = 46'h3692a3b9c0d6;
    stim[32] = 46'h0b2d9fd341dd;
    stim[33] = 46'h33734fa8d586;
    stim[34] = 46'h2a80fd55575a;
    stim[35] = 46'h092d0640b248;
    stim[36] = 46'h1d11c45acce4;
    stim[37] = 46'h22d60a1bf629;
    stim[38] = 46'h3891e1205b60;
    stim[39] = 46'h242cc5433b3f;
    stim[40] = 46'h2e759114b27a;
    stim[41] = 46'h01016d9854ee;
    stim[42] = 46'h27915ec25b62;
    stim[43] = 46'h1fae985ba51e;
    stim[44] = 46'h3494de1d608c;
    stim[45] = 46'h0331e8c62274;
    stim[46] = 46'h07d8d49c5d6f;
    stim[47] = 46'h019edb008242;
    stim[48] = 46'h27f9260c9ac3;
    stim[49] = 46'h3b95f845453f;
    stim[50] = 46'h37c77f00db63;
    stim[51] = 46'h377671a0bb36;
    stim[52] = 46'h28ce66129d5c;
    stim[53] = 46'h314b3da1ce37;
    stim[54] = 46'h1ee0835a3a03;
    stim[55] = 46'h2a079b36c54f;
    stim[56] = 46'h3b5e64fa2af0;
    stim[57] = 46'h3859a24c38f0;
    stim[58] = 46'h1ba52e19d168;
    stim[59] = 46'h273e7e168d29;
    stim[60] = 46'h06cb7bf57015;
    stim[61] = 46'h08a33c49ffe2;
    stim[62] = 46'h2f4ffbf6f707;
    stim[63] = 46'h0dddec662f09;
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
      expv[0] = 37'h100f675dbb;
      expv[1] = 37'h0003bed7e3;
      expv[2] = 37'h10895c1efb;
      expv[3] = 37'h0c21874293;
      expv[4] = 37'h110ffe9c53;
      expv[5] = 37'h100a31e35b;
      expv[6] = 37'h1e9a324713;
      expv[7] = 37'h00019e2173;
      expv[8] = 37'h17ff636c93;
      expv[9] = 37'h100869f451;
      expv[10] = 37'h01824b5d13;
      expv[11] = 37'h0003793633;
      expv[12] = 37'h12434133db;
      expv[13] = 37'h10087fb102;
      expv[14] = 37'h0005dd9742;
      expv[15] = 37'h10053e2371;
      expv[16] = 37'h100bb42973;
      expv[17] = 37'h04c3105579;
      expv[18] = 37'h000ba90d51;
      expv[19] = 37'h1001c5bd22;
      expv[20] = 37'h0268a1bf7b;
      expv[21] = 37'h1c5e5da2d3;
      expv[22] = 37'h0b0696b4a9;
      expv[23] = 37'h1002bfa391;
      expv[24] = 37'h00015482f3;
      expv[25] = 37'h1741193963;
      expv[26] = 37'h09ed6bd9a3;
      expv[27] = 37'h129063e1db;
      expv[28] = 37'h000cede513;
      expv[29] = 37'h000ca90de3;
      expv[30] = 37'h00076b5313;
      expv[31] = 37'h0002a3b9d3;
      expv[32] = 37'h0b2d9fd353;
      expv[33] = 37'h10034fa8f3;
      expv[34] = 37'h1000fd5573;
      expv[35] = 37'h092d0640a3;
      expv[36] = 37'h1d11c45afb;
      expv[37] = 37'h10060a1c1b;
      expv[38] = 37'h1001e12049;
      expv[39] = 37'h100cc5433b;
      expv[40] = 37'h10059114bb;
      expv[41] = 37'h11016d987b;
      expv[42] = 37'h10015ec259;
      expv[43] = 37'h0fae985bd3;
      expv[44] = 37'h0004de1d62;
      expv[45] = 37'h0331e8c622;
      expv[46] = 37'h17d8d49c7b;
      expv[47] = 37'h019edb0091;
      expv[48] = 37'h1009260c91;
      expv[49] = 37'h1005f84553;
      expv[50] = 37'h10077f00d9;
      expv[51] = 37'h100671a0bb;
      expv[52] = 37'h100e6612a3;
      expv[53] = 37'h100b3da1fb;
      expv[54] = 37'h1ee0835a31;
      expv[55] = 37'h10079b36d3;
      expv[56] = 37'h100e64fa2b;
      expv[57] = 37'h0009a24c2b;
      expv[58] = 37'h1ba52e19db;
      expv[59] = 37'h100e7e16bb;
      expv[60] = 37'h06cb7bf573;
      expv[61] = 37'h08a33c4a19;
      expv[62] = 37'h100ffbf713;
      expv[63] = 37'h1dddec6653;
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
