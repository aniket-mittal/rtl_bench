// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_217283 dut (
    .X(in_vec[67:36]),
    .Y(in_vec[35:4]),
    .S(in_vec[3:0]),
    .Result(out_vec[66:35]),
    .Result2(out_vec[34:3]),
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
    stim[0] = 68'h8c669fe9014b62dab;
    stim[1] = 68'h48ff8673864e80bbe;
    stim[2] = 68'hb4f6da5a5c13567c0;
    stim[3] = 68'h7c5bc16d9a1cb82f0;
    stim[4] = 68'h7c3ee222fefcfb7e9;
    stim[5] = 68'h57c2ee69ce73addcb;
    stim[6] = 68'hff3741cb1c8636059;
    stim[7] = 68'h1f613129a7fee7e5e;
    stim[8] = 68'hb4ee0400a838f2b32;
    stim[9] = 68'hae34a1241069d4e36;
    stim[10] = 68'h9b57fbb7d1116f7af;
    stim[11] = 68'h251f69c980c70232b;
    stim[12] = 68'ha9975923e7889a56b;
    stim[13] = 68'hb7d0f14b741e9d74d;
    stim[14] = 68'h1cc431cad4d3c0076;
    stim[15] = 68'h101d8c13a786f7372;
    stim[16] = 68'hf14e11bc10f80faac;
    stim[17] = 68'h0d3836f969db78df6;
    stim[18] = 68'h2afa18372f61b38b6;
    stim[19] = 68'hce8e98f055d7d2fd9;
    stim[20] = 68'h805ad69dc4102164f;
    stim[21] = 68'h4da846ec9b8a7bb1c;
    stim[22] = 68'h9073569bfa011ec2c;
    stim[23] = 68'hd7fa4f2ed6b442efb;
    stim[24] = 68'h2cd4884ea240f061e;
    stim[25] = 68'h45c9f35f4b2fd56bb;
    stim[26] = 68'h525bee1f505f3a671;
    stim[27] = 68'h69da5c2fbfbbbc336;
    stim[28] = 68'h2060a064cb3d3aae2;
    stim[29] = 68'h19644a3faf37a6d4c;
    stim[30] = 68'h700162064949163d8;
    stim[31] = 68'h9dc1d05643a71c6e4;
    stim[32] = 68'h8524a63fc9019d6ae;
    stim[33] = 68'hde3d5406e34d09abe;
    stim[34] = 68'hfb85b8f9d6d5a3371;
    stim[35] = 68'h06ec39c0b67f37ea5;
    stim[36] = 68'hec82beb39d83cf151;
    stim[37] = 68'h1761ca95e182660c7;
    stim[38] = 68'hcf8f80f884d0c0cef;
    stim[39] = 68'h21c9d3e946e7b52de;
    stim[40] = 68'h9b0ab374c35505316;
    stim[41] = 68'hd11a777f87649111d;
    stim[42] = 68'hbb77384a341977ecf;
    stim[43] = 68'ha0e109e1086933fac;
    stim[44] = 68'hcb5820d7819138b74;
    stim[45] = 68'hab4e1a6f8da625c50;
    stim[46] = 68'h76d87861a98b61284;
    stim[47] = 68'hb0d89d807547adfcf;
    stim[48] = 68'h8d3458864c979de06;
    stim[49] = 68'h7c1a65eb32e1ee822;
    stim[50] = 68'he7b6931a115ac8c08;
    stim[51] = 68'h20d9637ef26462299;
    stim[52] = 68'h7457374385130381d;
    stim[53] = 68'hb374b270e61779284;
    stim[54] = 68'hf9b06d8e14de1a61a;
    stim[55] = 68'h3b9cd4bd5c0ee3991;
    stim[56] = 68'h5b0be439312792918;
    stim[57] = 68'ha1d95ed0d402569ef;
    stim[58] = 68'hc43b279172ec3d4a0;
    stim[59] = 68'hedf6dc22250b3796c;
    stim[60] = 68'hf2317ec1604594261;
    stim[61] = 68'h4d169c41952e33ce1;
    stim[62] = 68'hb69f973103fe57ebb;
    stim[63] = 68'h4428be4df5041fcdc;
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
      expv[0] = 67'h00000000800000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h50000000000000000;
      expv[3] = 67'h705b4000000000000;
      expv[4] = 67'h41610cae000000000;
      expv[5] = 67'h00000000000000000;
      expv[6] = 67'h71d8bbe7000000000;
      expv[7] = 67'h00000000000000000;
      expv[8] = 67'h00000b4e800000000;
      expv[9] = 67'h4ee56620800000000;
      expv[10] = 67'h00000000000000000;
      expv[11] = 67'h00000000000000000;
      expv[12] = 67'h00000000800000000;
      expv[13] = 67'h00000000000000000;
      expv[14] = 67'h23f838e1800000004;
      expv[15] = 67'h00000010000000000;
      expv[16] = 67'h00000000000000000;
      expv[17] = 67'h51ae5f0d000000004;
      expv[18] = 67'h7dcc3256000000004;
      expv[19] = 67'h4daca506800000000;
      expv[20] = 67'h00000000000000000;
      expv[21] = 67'h00000000800000000;
      expv[22] = 67'h00000000800000000;
      expv[23] = 67'h00000000000000000;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h00000000800000000;
      expv[26] = 67'h00525bee000000000;
      expv[27] = 67'h550f4ffe000000006;
      expv[28] = 67'h000040c1000000000;
      expv[29] = 67'h00000000800000000;
      expv[30] = 67'h3ca4bb1f800000000;
      expv[31] = 67'h000000010b39cbbd0;
      expv[32] = 67'h00000000000000000;
      expv[33] = 67'h00000000000000000;
      expv[34] = 67'h7ffffffb800000000;
      expv[35] = 67'h5eb5b8d5000000000;
      expv[36] = 67'h7fffffb2000000000;
      expv[37] = 67'h00802102000000000;
      expv[38] = 67'h00000000000000000;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h6bdad721800000004;
      expv[41] = 67'h00000000000000000;
      expv[42] = 67'h00000000000000000;
      expv[43] = 67'h00000000000000000;
      expv[44] = 67'h00000000a4e374100;
      expv[45] = 67'h34e1a6f0000000000;
      expv[46] = 67'h000000003b6c3c308;
      expv[47] = 67'h00000000000000000;
      expv[48] = 67'h204e5d53000000002;
      expv[49] = 67'h0f834cbd000000000;
      expv[50] = 67'h7bff6ded000000000;
      expv[51] = 67'h695e80ab800000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h0000000059ba59380;
      expv[54] = 67'h0100c008000000000;
      expv[55] = 67'h0000000e800000000;
      expv[56] = 67'h3d97fb5c800000000;
      expv[57] = 67'h00000000000000000;
      expv[58] = 67'h764f2200000000000;
      expv[59] = 67'h00000000000000000;
      expv[60] = 67'h7fe462fd800000000;
      expv[61] = 67'h00009a2d000000000;
      expv[62] = 67'h00000000800000000;
      expv[63] = 67'h00000000800000000;
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
