// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03944 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .m_read(in_vec[65:65]),
    .m_write(in_vec[64:64]),
    .m_addr(in_vec[63:32]),
    .m_din(in_vec[31:0]),
    .m_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4c19eb1035c0a6c73;
    stim[1] = 67'h657694996f2e71f13;
    stim[2] = 67'h01f7d97abe2cf61f3;
    stim[3] = 67'h0db13ab61120d8325;
    stim[4] = 67'h23db98343cd084de4;
    stim[5] = 67'h2562b55a47cab73c3;
    stim[6] = 67'h1e86269a817c70a63;
    stim[7] = 67'h0d052b844e2872f2d;
    stim[8] = 67'h3dac00b1d6f74c887;
    stim[9] = 67'h0098441f0fc80747a;
    stim[10] = 67'h32d2d8b2fbc309df1;
    stim[11] = 67'h18d008c90d8765a77;
    stim[12] = 67'h0ae3abeca63d9a974;
    stim[13] = 67'h3cdf5b1359b096eb4;
    stim[14] = 67'h0fbe326b7affc5517;
    stim[15] = 67'h1fe9427f4a3e6747c;
    stim[16] = 67'h114611e88c7568bd7;
    stim[17] = 67'h3794dcb9b7bc1425f;
    stim[18] = 67'h0e2522c0135ab83de;
    stim[19] = 67'h1cd1102b9d1bb8646;
    stim[20] = 67'h2c5868869dbd276d8;
    stim[21] = 67'h062f7232763b0c0fe;
    stim[22] = 67'h30a69110305c99c62;
    stim[23] = 67'h06d34d6fab48aefce;
    stim[24] = 67'h2d1bf21f4e6c15748;
    stim[25] = 67'h2e574c5f55aade872;
    stim[26] = 67'h20d1824cbcee52871;
    stim[27] = 67'h1bf46e5d1b7edc487;
    stim[28] = 67'h1e9c6707f4335408e;
    stim[29] = 67'h1bf2c02a9d3147e41;
    stim[30] = 67'h2dbf4cf078cc579bd;
    stim[31] = 67'h2e6f9913503c110fc;
    stim[32] = 67'h1dea563ab1814b485;
    stim[33] = 67'h10d78338afe5eea18;
    stim[34] = 67'h04bf308e6ab591dd6;
    stim[35] = 67'h0f7ab80a37a043f5d;
    stim[36] = 67'h2a78740ce2abe36cd;
    stim[37] = 67'h19512d477e2958213;
    stim[38] = 67'h08de52707d244a577;
    stim[39] = 67'h3cd48c885b4f5883f;
    stim[40] = 67'h23c32504e4da43c15;
    stim[41] = 67'h2f04222e039d46fea;
    stim[42] = 67'h3cb4e5307b479e9a3;
    stim[43] = 67'h116cb082c9f2d90ba;
    stim[44] = 67'h025a64c47231fdaeb;
    stim[45] = 67'h0254bbdbabfd86116;
    stim[46] = 67'h3d91383eb19d2402e;
    stim[47] = 67'h32d2d3702136d4dd6;
    stim[48] = 67'h3218ed764f3e1b4f0;
    stim[49] = 67'h27a5d5dc93477131d;
    stim[50] = 67'h2273e8d94cef4d22e;
    stim[51] = 67'h29cb9f9ad5ae78ea4;
    stim[52] = 67'h13b5c1eb5bc8240d9;
    stim[53] = 67'h106d66d39c76b0537;
    stim[54] = 67'h3e7bd6a18efd57756;
    stim[55] = 67'h1f9d92e8e61df79da;
    stim[56] = 67'h022866cde24c58ce5;
    stim[57] = 67'h2560cd9e4a6120c75;
    stim[58] = 67'h18652f8d7e72f26ef;
    stim[59] = 67'h1c00b77cea4c5cefe;
    stim[60] = 67'h0621a97fe85d835a5;
    stim[61] = 67'h35b217d1c813d0330;
    stim[62] = 67'h03009cffb97888001;
    stim[63] = 67'h01d2e498c9500eb8d;
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
      expv[32] = 32'h9b096eb4;
      expv[33] = 32'h9b096eb4;
      expv[34] = 32'h9b096eb4;
      expv[35] = 32'h9b096eb4;
      expv[36] = 32'h9b096eb4;
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
