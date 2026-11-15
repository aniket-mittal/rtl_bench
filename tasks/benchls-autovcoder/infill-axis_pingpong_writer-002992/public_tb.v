// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002992 dut (
    .i_axi_clk(clk),
    .rst(in_vec[64:64]),
    .i_axi_data(in_vec[63:32]),
    .i_axi_keep(in_vec[31:28]),
    .i_axi_last(in_vec[27:27]),
    .i_axi_valid(in_vec[26:26]),
    .i_ppfifo_rdy(in_vec[25:24]),
    .i_ppfifo_size(in_vec[23:0]),
    .o_axi_ready(out_vec[36:36]),
    .o_ppfifo_clk(out_vec[35:35]),
    .o_ppfifo_act(out_vec[34:33]),
    .o_ppfifo_stb(out_vec[32:32]),
    .o_ppfifo_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h106f05e514e905534;
    stim[1] = 65'h1a2d280aaa637dc7d;
    stim[2] = 65'h02d43ffe90eb195fc;
    stim[3] = 65'h08d54e1c48254573c;
    stim[4] = 65'h08e40900c6e391caf;
    stim[5] = 65'h0e68ca24dc50ca9b1;
    stim[6] = 65'h0a0ec63e9f3566378;
    stim[7] = 65'h08a98c8924109a539;
    stim[8] = 65'h0300c6d8d7c69c135;
    stim[9] = 65'h056196c842beee6f3;
    stim[10] = 65'h04feed2bd943faa7f;
    stim[11] = 65'h0b9c4f7b794b954d4;
    stim[12] = 65'h017fe64a23ec1478e;
    stim[13] = 65'h0b96602d36d7cd4d3;
    stim[14] = 65'h021facad28dcb5425;
    stim[15] = 65'h088f844dd6016b0b7;
    stim[16] = 65'h0afb595dd2f502d0d;
    stim[17] = 65'h0dca0837ef963061f;
    stim[18] = 65'h0ecc644c90ade6a74;
    stim[19] = 65'h05d2a10f770dd3dc9;
    stim[20] = 65'h0f2ee6fbb3e01ed20;
    stim[21] = 65'h00fadf0d2dd7d1329;
    stim[22] = 65'h0c0a991fc69ec3495;
    stim[23] = 65'h0f58d58cd56cc32ac;
    stim[24] = 65'h05178e692baabcbcc;
    stim[25] = 65'h0858f67503650f7b6;
    stim[26] = 65'h05f3f8d430bdf7bfb;
    stim[27] = 65'h059d39a02e44e4fee;
    stim[28] = 65'h0d0e8ec196861e90c;
    stim[29] = 65'h0f436a4fce5470ed7;
    stim[30] = 65'h05e1ec5bc78a4ad79;
    stim[31] = 65'h04e56bbefd9fcacc8;
    stim[32] = 65'h060fcc23d4b4135e8;
    stim[33] = 65'h0e2f05c98a465c511;
    stim[34] = 65'h0d35f7564a69f3eb2;
    stim[35] = 65'h095c25a731bf9ee41;
    stim[36] = 65'h0f4ff4b4cd9c591be;
    stim[37] = 65'h09e0818e7b47102ab;
    stim[38] = 65'h05f23fcbf31815ae4;
    stim[39] = 65'h054d50368b229c2d8;
    stim[40] = 65'h04975b2aea9eb3ee9;
    stim[41] = 65'h0b15813fd7ee69382;
    stim[42] = 65'h02c088ad094262812;
    stim[43] = 65'h0274d741210cd7f3c;
    stim[44] = 65'h0bb8406552f12ccf9;
    stim[45] = 65'h0a99ccf7a715daac2;
    stim[46] = 65'h09d1166c4ec3d2809;
    stim[47] = 65'h09a5b272a4acf9b84;
    stim[48] = 65'h0dd70dba505e44f74;
    stim[49] = 65'h0d080afccca5c5abf;
    stim[50] = 65'h07d68a7eed717f7be;
    stim[51] = 65'h013fbe76c804354d1;
    stim[52] = 65'h08bc1f603cb40ae97;
    stim[53] = 65'h05f477eb76207d666;
    stim[54] = 65'h002f291a455163c5b;
    stim[55] = 65'h0879d5a34129e7720;
    stim[56] = 65'h0a21b90463c802e96;
    stim[57] = 65'h0af33682e90e6fba6;
    stim[58] = 65'h180c74df8683f10f6;
    stim[59] = 65'h0ee6ff91e15ab9c8d;
    stim[60] = 65'h0aae68f0c0ee59e87;
    stim[61] = 65'h08386b57cb4da9439;
    stim[62] = 65'h04675e41bad3aecbb;
    stim[63] = 65'h0e7cbaeecb5bc1706;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'h0000000000;
      expv[2] = 37'h0000000000;
      expv[3] = 37'h1400000000;
      expv[4] = 37'h1400000000;
      expv[5] = 37'h158e40900c;
      expv[6] = 37'h008e40900c;
      expv[7] = 37'h128e40900c;
      expv[8] = 37'h128e40900c;
      expv[9] = 37'h13300c6d8d;
      expv[10] = 37'h00300c6d8d;
      expv[11] = 37'h00300c6d8d;
      expv[12] = 37'h00300c6d8d;
      expv[13] = 37'h14300c6d8d;
      expv[14] = 37'h15b96602d3;
      expv[15] = 37'h00b96602d3;
      expv[16] = 37'h00b96602d3;
      expv[17] = 37'h12b96602d3;
      expv[18] = 37'h12b96602d3;
      expv[19] = 37'h00b96602d3;
      expv[20] = 37'h00b96602d3;
      expv[21] = 37'h14b96602d3;
      expv[22] = 37'h150fadf0d2;
      expv[23] = 37'h000fadf0d2;
      expv[24] = 37'h140fadf0d2;
      expv[25] = 37'h140fadf0d2;
      expv[26] = 37'h000fadf0d2;
      expv[27] = 37'h120fadf0d2;
      expv[28] = 37'h1359d39a02;
      expv[29] = 37'h1259d39a02;
      expv[30] = 37'h0059d39a02;
      expv[31] = 37'h0059d39a02;
      expv[32] = 37'h1259d39a02;
      expv[33] = 37'h1259d39a02;
      expv[34] = 37'h0059d39a02;
      expv[35] = 37'h1459d39a02;
      expv[36] = 37'h1459d39a02;
      expv[37] = 37'h0059d39a02;
      expv[38] = 37'h0059d39a02;
      expv[39] = 37'h1259d39a02;
      expv[40] = 37'h1259d39a02;
      expv[41] = 37'h1259d39a02;
      expv[42] = 37'h0059d39a02;
      expv[43] = 37'h0059d39a02;
      expv[44] = 37'h0059d39a02;
      expv[45] = 37'h1259d39a02;
      expv[46] = 37'h1259d39a02;
      expv[47] = 37'h139d1166c4;
      expv[48] = 37'h009d1166c4;
      expv[49] = 37'h129d1166c4;
      expv[50] = 37'h129d1166c4;
      expv[51] = 37'h009d1166c4;
      expv[52] = 37'h009d1166c4;
      expv[53] = 37'h129d1166c4;
      expv[54] = 37'h129d1166c4;
      expv[55] = 37'h1302f291a4;
      expv[56] = 37'h1202f291a4;
      expv[57] = 37'h13a21b9046;
      expv[58] = 37'h00a21b9046;
      expv[59] = 37'h0000000000;
      expv[60] = 37'h1200000000;
      expv[61] = 37'h13aae68f0c;
      expv[62] = 37'h00aae68f0c;
      expv[63] = 37'h12aae68f0c;
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
