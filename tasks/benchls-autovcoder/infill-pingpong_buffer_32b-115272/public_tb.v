// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115272 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h40d96b7b6;
    stim[1] = 35'h7a3f7c903;
    stim[2] = 35'h20c9b7ce0;
    stim[3] = 35'h0d1b2a742;
    stim[4] = 35'h58d52964e;
    stim[5] = 35'h27e2aabbe;
    stim[6] = 35'h1b27bc1c8;
    stim[7] = 35'h135947564;
    stim[8] = 35'h11054e254;
    stim[9] = 35'h29ed88fd2;
    stim[10] = 35'h0195c780f;
    stim[11] = 35'h04b82dee0;
    stim[12] = 35'h2e30bfcda;
    stim[13] = 35'h3d91b3198;
    stim[14] = 35'h37d6e850c;
    stim[15] = 35'h322cd6de4;
    stim[16] = 35'h2d314f96c;
    stim[17] = 35'h1651c3cb3;
    stim[18] = 35'h13aff7942;
    stim[19] = 35'h3f1669110;
    stim[20] = 35'h3fee68e10;
    stim[21] = 35'h2cf1d121d;
    stim[22] = 35'h3fc5feac7;
    stim[23] = 35'h3edd32771;
    stim[24] = 35'h3ea9e81ce;
    stim[25] = 35'h2dd05414c;
    stim[26] = 35'h270ec8123;
    stim[27] = 35'h0245fd78e;
    stim[28] = 35'h23b558a3e;
    stim[29] = 35'h2cd73eba4;
    stim[30] = 35'h2b613b712;
    stim[31] = 35'h106e7faa0;
    stim[32] = 35'h317db282d;
    stim[33] = 35'h1ee503ffa;
    stim[34] = 35'h2567d80d2;
    stim[35] = 35'h2331a3067;
    stim[36] = 35'h1c9e28e0a;
    stim[37] = 35'h02edc0a8d;
    stim[38] = 35'h1510f5e5c;
    stim[39] = 35'h151506a52;
    stim[40] = 35'h110e9e2d0;
    stim[41] = 35'h2891b7da8;
    stim[42] = 35'h1b48df5a8;
    stim[43] = 35'h72ac7a1ab;
    stim[44] = 35'h27d5f8308;
    stim[45] = 35'h0f3c1d49b;
    stim[46] = 35'h039cf8fbd;
    stim[47] = 35'h0f915d8a0;
    stim[48] = 35'h263a1d903;
    stim[49] = 35'h027187fca;
    stim[50] = 35'h132999a50;
    stim[51] = 35'h1c4606891;
    stim[52] = 35'h308a2961d;
    stim[53] = 35'h3caa803fc;
    stim[54] = 35'h047d7a062;
    stim[55] = 35'h02dbe825b;
    stim[56] = 35'h20c26f4ae;
    stim[57] = 35'h0521cf479;
    stim[58] = 35'h3f18628c5;
    stim[59] = 35'h38a444d74;
    stim[60] = 35'h00e711c2e;
    stim[61] = 35'h36b138f19;
    stim[62] = 35'h0f4ef8dce;
    stim[63] = 35'h084b96f47;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h3a3f7c900;
      expv[3] = 35'h60c9b7ce0;
      expv[4] = 35'h4d1b2a743;
      expv[5] = 35'h0d1b2a740;
      expv[6] = 35'h67e2aabbc;
      expv[7] = 35'h5b27bc1c8;
      expv[8] = 35'h535947564;
      expv[9] = 35'h51054e254;
      expv[10] = 35'h69ed88fd2;
      expv[11] = 35'h4195c780f;
      expv[12] = 35'h4195c780f;
      expv[13] = 35'h0195c780f;
      expv[14] = 35'h0195c780f;
      expv[15] = 35'h0195c780f;
      expv[16] = 35'h0195c780f;
      expv[17] = 35'h0195c780f;
      expv[18] = 35'h6e30bfcdb;
      expv[19] = 35'h2e30bfcdb;
      expv[20] = 35'h2e30bfcdb;
      expv[21] = 35'h2e30bfcdb;
      expv[22] = 35'h53aff7942;
      expv[23] = 35'h7fc5feac6;
      expv[24] = 35'h7edd32770;
      expv[25] = 35'h7ea9e81cf;
      expv[26] = 35'h7ea9e81ce;
      expv[27] = 35'h670ec8123;
      expv[28] = 35'h270ec8123;
      expv[29] = 35'h270ec8123;
      expv[30] = 35'h270ec8123;
      expv[31] = 35'h270ec8123;
      expv[32] = 35'h270ec8123;
      expv[33] = 35'h4245fd78f;
      expv[34] = 35'h0245fd78f;
      expv[35] = 35'h0245fd78f;
      expv[36] = 35'h5ee503ffb;
      expv[37] = 35'h1ee503ffb;
      expv[38] = 35'h5c9e28e0b;
      expv[39] = 35'h5c9e28e0b;
      expv[40] = 35'h1c9e28e0b;
      expv[41] = 35'h1c9e28e0b;
      expv[42] = 35'h1c9e28e0b;
      expv[43] = 35'h1c9e28e0b;
      expv[44] = 35'h151506a50;
      expv[45] = 35'h67d5f8308;
      expv[46] = 35'h4f3c1d49a;
      expv[47] = 35'h439cf8fbc;
      expv[48] = 35'h4f915d8a0;
      expv[49] = 35'h663a1d903;
      expv[50] = 35'h263a1d903;
      expv[51] = 35'h263a1d903;
      expv[52] = 35'h427187fca;
      expv[53] = 35'h708a2961c;
      expv[54] = 35'h7caa803fc;
      expv[55] = 35'h447d7a062;
      expv[56] = 35'h42dbe825b;
      expv[57] = 35'h02dbe825b;
      expv[58] = 35'h60c26f4ae;
      expv[59] = 35'h7f18628c4;
      expv[60] = 35'h78a444d74;
      expv[61] = 35'h40e711c2e;
      expv[62] = 35'h76b138f18;
      expv[63] = 35'h4f4ef8dce;
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
