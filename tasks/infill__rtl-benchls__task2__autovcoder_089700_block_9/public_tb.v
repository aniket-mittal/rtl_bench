// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 85;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089700 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .clear(in_vec[29:29]),
    .frames_per_packet(in_vec[28:21]),
    .data_i(in_vec[20:2]),
    .src_rdy_i(in_vec[1:1]),
    .dst_rdy_i(in_vec[0:0]),
    .dst_rdy_o(out_vec[84:84]),
    .data_o(out_vec[83:65]),
    .src_rdy_o(out_vec[64:64]),
    .debug0(out_vec[63:32]),
    .debug1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h727ab863;
    stim[1] = 31'h67d81a77;
    stim[2] = 31'h3f01a1c4;
    stim[3] = 31'h1a0ba555;
    stim[4] = 31'h2646510f;
    stim[5] = 31'h053d699a;
    stim[6] = 31'h30c3534d;
    stim[7] = 31'h7af2452f;
    stim[8] = 31'h11e227d1;
    stim[9] = 31'h227eb5e7;
    stim[10] = 31'h32276a92;
    stim[11] = 31'h79e87427;
    stim[12] = 31'h2cf7627b;
    stim[13] = 31'h1ecf9e5a;
    stim[14] = 31'h10603c64;
    stim[15] = 31'h08975a21;
    stim[16] = 31'h1e33288d;
    stim[17] = 31'h222664f9;
    stim[18] = 31'h27e8fed0;
    stim[19] = 31'h293c32ab;
    stim[20] = 31'h0c7783a0;
    stim[21] = 31'h01488a50;
    stim[22] = 31'h16f40282;
    stim[23] = 31'h39f6ce0f;
    stim[24] = 31'h0e2cca82;
    stim[25] = 31'h3d54d26b;
    stim[26] = 31'h1c46351d;
    stim[27] = 31'h1c2b7fb2;
    stim[28] = 31'h0a6f62bb;
    stim[29] = 31'h3deca6b4;
    stim[30] = 31'h376a7336;
    stim[31] = 31'h278fb7a6;
    stim[32] = 31'h1b66b01d;
    stim[33] = 31'h349df2f3;
    stim[34] = 31'h3d2a28ed;
    stim[35] = 31'h00e7676f;
    stim[36] = 31'h5586cde9;
    stim[37] = 31'h2b80ea31;
    stim[38] = 31'h116f946e;
    stim[39] = 31'h3061070b;
    stim[40] = 31'h3f3a2504;
    stim[41] = 31'h3f43efe6;
    stim[42] = 31'h019e6bf2;
    stim[43] = 31'h05e29a98;
    stim[44] = 31'h0b4bf512;
    stim[45] = 31'h199d613a;
    stim[46] = 31'h36d08dc8;
    stim[47] = 31'h20684a0e;
    stim[48] = 31'h1d3d50cd;
    stim[49] = 31'h3bf87afa;
    stim[50] = 31'h1a5d23b4;
    stim[51] = 31'h24f30f38;
    stim[52] = 31'h15cf1ec9;
    stim[53] = 31'h0d44a6b9;
    stim[54] = 31'h0e19f9ce;
    stim[55] = 31'h3044cd3c;
    stim[56] = 31'h3c78b3a2;
    stim[57] = 31'h2a695abb;
    stim[58] = 31'h1956c0bc;
    stim[59] = 31'h0d00ba79;
    stim[60] = 31'h35904bea;
    stim[61] = 31'h1f04eae9;
    stim[62] = 31'h103d1009;
    stim[63] = 31'h24a1ee44;
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
      expv[0] = 85'hxx5c3100xxxx93xxxxxxxx;
      expv[1] = 85'h120d3b00c8003exxxxxxxx;
      expv[2] = 85'h02d0e2000800f8xxxxxxxx;
      expv[3] = 85'h13d2aa008800d0xxxxxxxx;
      expv[4] = 85'h13288700c80032xxxxxxxx;
      expv[5] = 85'h02b4cd00480029xxxxxxxx;
      expv[6] = 85'h13a9a600880086xxxxxxxx;
      expv[7] = 85'h13229700c800d7xxxxxxxx;
      expv[8] = 85'h1313e80088008fxxxxxxxx;
      expv[9] = 85'h135af300c80013xxxxxxxx;
      expv[10] = 85'h03b54900480091xxxxxxxx;
      expv[11] = 85'h123a1300c800cfxxxxxxxx;
      expv[12] = 85'h13b13d00c80067xxxxxxxx;
      expv[13] = 85'h03cf2d004800f6xxxxxxxx;
      expv[14] = 85'h021e3200080083xxxxxxxx;
      expv[15] = 85'h13ad1000880044xxxxxxxx;
      expv[16] = 85'h139446008800f1xxxxxxxx;
      expv[17] = 85'h13327c00880011xxxxxxxx;
      expv[18] = 85'h027f680008003fxxxxxxxx;
      expv[19] = 85'h12195500c80049xxxxxxxx;
      expv[20] = 85'h03c1d000080063xxxxxxxx;
      expv[21] = 85'h0245280008000axxxxxxxx;
      expv[22] = 85'h020141004800b7xxxxxxxx;
      expv[23] = 85'h13670700c800cfxxxxxxxx;
      expv[24] = 85'h02654100480071xxxxxxxx;
      expv[25] = 85'h12693500c800eaxxxxxxxx;
      expv[26] = 85'h131a8e008800e2xxxxxxxx;
      expv[27] = 85'h03bfd9004800e1xxxxxxxx;
      expv[28] = 85'h13b15d00c80053xxxxxxxx;
      expv[29] = 85'h00535a000101efb15c0100;
      expv[30] = 85'h03399b004800bbb15c0100;
      expv[31] = 85'h03dbd30048003cb15c0100;
      expv[32] = 85'h13580e008800dbb15c0100;
      expv[33] = 85'h12f97900c800a4b15c0100;
      expv[34] = 85'h131476008800e9b15c0100;
      expv[35] = 85'h13b3b700c80007b15c0100;
      expv[36] = 85'h1166f4008101acb3b60100;
      expv[37] = 85'h1275180088005cb3b60100;
      expv[38] = 85'h03ca370048008bb3b60100;
      expv[39] = 85'h12838500c80083b3b60100;
      expv[40] = 85'h031282000800f9b3b60100;
      expv[41] = 85'h03f7f3004800fab3b60100;
      expv[42] = 85'h0335f90048000cb3b60100;
      expv[43] = 85'h034d4c0008002fb3b60100;
      expv[44] = 85'h03fa890048005ab3b60100;
      expv[45] = 85'h02b09d004800ccb3b60100;
      expv[46] = 85'h0246e4000800b6b3b60100;
      expv[47] = 85'h02250700480003b3b60100;
      expv[48] = 85'h12a866008800e9b3b60100;
      expv[49] = 85'h023d7d004800dfb3b60100;
      expv[50] = 85'h0291da000800d2b3b60100;
      expv[51] = 85'h03879c00080027b3b60100;
      expv[52] = 85'h138f64008800aeb3b60100;
      expv[53] = 85'h12535c0088006ab3b60100;
      expv[54] = 85'h02fce700480070b3b60100;
      expv[55] = 85'h02669e00080082b3b60100;
      expv[56] = 85'h0259d1004800e3b3b60100;
      expv[57] = 85'h12ad5d00c80053b3b60100;
      expv[58] = 85'h03605e000800cab3b60100;
      expv[59] = 85'h125d3c00880068b3b60100;
      expv[60] = 85'h0225f5004800acb3b60100;
      expv[61] = 85'h127574008800f8b3b60100;
      expv[62] = 85'h12880400880081b3b60100;
      expv[63] = 85'h02f72200080025b3b60100;
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
