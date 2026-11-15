// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065521 dut (
    .clk(clk),
    .rst(in_vec[103:103]),
    .ph1(in_vec[102:102]),
    .ph2(in_vec[101:101]),
    .ph3(in_vec[100:100]),
    .ph4(in_vec[99:99]),
    .prgmReq(in_vec[98:98]),
    .prgmDirection(in_vec[97:96]),
    .prgmAcceleration(in_vec[95:64]),
    .prgmAccelSamples(in_vec[63:32]),
    .prgmCruiseSamples(in_vec[31:0]),
    .prgmAck(out_vec[3:3]),
    .busy(out_vec[2:2]),
    .mDir(out_vec[1:1]),
    .mStep(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'hf4747f47fbd3aa0a307c1e71d6;
    stim[1] = 104'h8d6dd1b8e9e2607e3409efac46;
    stim[2] = 104'h47f554b39813e1bdd53bc96d6f;
    stim[3] = 104'h75bdb1f00cd912905861e3e620;
    stim[4] = 104'h29711ea302c385c191520948db;
    stim[5] = 104'h07cd6eeba2429f7443506a1452;
    stim[6] = 104'h6feb0928f92a380f00a5a29a7f;
    stim[7] = 104'h0e3d8e1e8b9716cb76c5d44c6b;
    stim[8] = 104'h4cec8240c8d488aeb6604eeb2f;
    stim[9] = 104'h0915a65a019ede2cf080e19a42;
    stim[10] = 104'h6c4b57aac7fda40026cbea62e4;
    stim[11] = 104'h0f8f9c013d7bb9069ba0f4588c;
    stim[12] = 104'h41d59f0d093fbe2a8c73e38c64;
    stim[13] = 104'h39f160520924e4f3be5e8acaa3;
    stim[14] = 104'h649ebbe36ee4cf76eeb6884a25;
    stim[15] = 104'h166bcc073ee1451293c3194425;
    stim[16] = 104'h6b5e117d4d1f6874cb2f76b9b8;
    stim[17] = 104'h369561254f96f249ff47309256;
    stim[18] = 104'h60d97498cb887cd44095aac13f;
    stim[19] = 104'h628ca06784e0fffc3e08738723;
    stim[20] = 104'h67aa03b1f4127e8418815cbcc7;
    stim[21] = 104'h6a410e7ccfd4b2d7001907e886;
    stim[22] = 104'h50db9977be8f5bf1f00a32d28d;
    stim[23] = 104'h1f62f9d586de5583fc3a1468f3;
    stim[24] = 104'h0aaa2d0c9a779895b7a8b92666;
    stim[25] = 104'h3c414ebb555be2ef6648cb5ee5;
    stim[26] = 104'h3dbc7607cc81bb303e93caf973;
    stim[27] = 104'h6f52ede2a98394226f415ce5e5;
    stim[28] = 104'h63dc7258ce47d60787e0847cc2;
    stim[29] = 104'h2b7662fac7d23e6cb36a48c6be;
    stim[30] = 104'h1ba896a1c00aef532ce57306ab;
    stim[31] = 104'h07f4f98b0a2d3b4d6f35de4005;
    stim[32] = 104'h65ab1c3a19781254823e47c665;
    stim[33] = 104'h20e5ba1b0d79dbf804f359e6e9;
    stim[34] = 104'h0c8dce022ec2c11e0df27e0d78;
    stim[35] = 104'h3ba7c1c3ad6dca3d1cb7225e2f;
    stim[36] = 104'h7a767f0a7085ec39995369d953;
    stim[37] = 104'h14744e27d1ede50c3ee149977e;
    stim[38] = 104'h23742a439d54aba6eac20a20df;
    stim[39] = 104'h5d3266f99337f9d5a22d9ad241;
    stim[40] = 104'h019ce41706c05b311987d4d1f9;
    stim[41] = 104'h5c3b9a863e928cdd372a88ce39;
    stim[42] = 104'h07affc87a1ee6d7bc5f4ee5902;
    stim[43] = 104'h28307652e59ffb420d85bf00ca;
    stim[44] = 104'h6924e54b741108938b571d3742;
    stim[45] = 104'h5bd4095fd43fa94a471c288e54;
    stim[46] = 104'h27557bf31d6f7ca82159f15157;
    stim[47] = 104'h4acb8db3e0693dcef10c2e5753;
    stim[48] = 104'h3aa015322edd18e0e2e2a2d614;
    stim[49] = 104'h64da61203587d2037ef3a4d6fa;
    stim[50] = 104'h694c217a7f6161b43309ed746b;
    stim[51] = 104'h0e756a3d6ecd3d20b1ace992ea;
    stim[52] = 104'hd2e98f20a55117b879596b7737;
    stim[53] = 104'h5e11e31d596e3f47cb6a9b0cb9;
    stim[54] = 104'h7dcf83780fbdc581daf5504c7b;
    stim[55] = 104'h7fb46767d164770e93e8dcb54f;
    stim[56] = 104'h7cb561796f568f46d644d58ef7;
    stim[57] = 104'h7e6af65a294d16c221dfd17626;
    stim[58] = 104'h67d748bd29713379e8f41b9475;
    stim[59] = 104'h695a5b36e61aaaaddb2020210a;
    stim[60] = 104'h29e515d607b0c9489a74bb0dec;
    stim[61] = 104'h2671e426f063d17bc229c7fb91;
    stim[62] = 104'h719f28ed8ca039ffc916b4c074;
    stim[63] = 104'h5babf2ef8234d6ccf498cb4244;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'hc;
      expv[8] = 4'h4;
      expv[9] = 4'h4;
      expv[10] = 4'h4;
      expv[11] = 4'h4;
      expv[12] = 4'h4;
      expv[13] = 4'h4;
      expv[14] = 4'h4;
      expv[15] = 4'h4;
      expv[16] = 4'h7;
      expv[17] = 4'h7;
      expv[18] = 4'h7;
      expv[19] = 4'h7;
      expv[20] = 4'h7;
      expv[21] = 4'h7;
      expv[22] = 4'h7;
      expv[23] = 4'h7;
      expv[24] = 4'h6;
      expv[25] = 4'h6;
      expv[26] = 4'h6;
      expv[27] = 4'h7;
      expv[28] = 4'h7;
      expv[29] = 4'h7;
      expv[30] = 4'h7;
      expv[31] = 4'h7;
      expv[32] = 4'h7;
      expv[33] = 4'h7;
      expv[34] = 4'h7;
      expv[35] = 4'h7;
      expv[36] = 4'h7;
      expv[37] = 4'h7;
      expv[38] = 4'h7;
      expv[39] = 4'h7;
      expv[40] = 4'h7;
      expv[41] = 4'h7;
      expv[42] = 4'h6;
      expv[43] = 4'h6;
      expv[44] = 4'h6;
      expv[45] = 4'h6;
      expv[46] = 4'h7;
      expv[47] = 4'h7;
      expv[48] = 4'h7;
      expv[49] = 4'h7;
      expv[50] = 4'h7;
      expv[51] = 4'h7;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'hc;
      expv[55] = 4'h4;
      expv[56] = 4'h4;
      expv[57] = 4'h4;
      expv[58] = 4'h7;
      expv[59] = 4'h7;
      expv[60] = 4'h7;
      expv[61] = 4'h7;
      expv[62] = 4'h7;
      expv[63] = 4'h7;
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
