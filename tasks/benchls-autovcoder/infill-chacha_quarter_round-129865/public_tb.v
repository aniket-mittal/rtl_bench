// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_129865 dut (
    .clk(clk),
    .rst(in_vec[128:128]),
    .a(in_vec[127:96]),
    .b(in_vec[95:64]),
    .c(in_vec[63:32]),
    .d(in_vec[31:0]),
    .out_a(out_vec[127:96]),
    .out_b(out_vec[95:64]),
    .out_c(out_vec[63:32]),
    .out_d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1eb32e744690da7d5da99b87a4648a84c;
    stim[1] = 129'h18a6d52a8bfda6af47ed7150e41d70d8d;
    stim[2] = 129'h093a67650a5f6e7346fc12a513ed3315a;
    stim[3] = 129'h0266e8ec7cb36c1f5798cfc703ae19487;
    stim[4] = 129'h09b62a215988f257fca692ca1940617c1;
    stim[5] = 129'h0871778962a7bf66e3b48a1b82922391a;
    stim[6] = 129'h09fb9705e99441bff052aca3c2003e09d;
    stim[7] = 129'h095946fbd308e4f024d38b2e6d75a641d;
    stim[8] = 129'h04313e66857ef0282c4dfe0be63519ff5;
    stim[9] = 129'h0df181f1ae756791869f5bbb402ff7574;
    stim[10] = 129'h0936416e2c2a0e1781b53eab529acc5c0;
    stim[11] = 129'h07af2283b1930cca468740072fa15b662;
    stim[12] = 129'h02d64bf910f6afe496e5417176140cff1;
    stim[13] = 129'h03738da4784b49d5a8dfdd74a54da001d;
    stim[14] = 129'h02fe205a23a3c99a2104e41e8cbbdc842;
    stim[15] = 129'h0f8cfc8e43ee8f07446dd977a6f783356;
    stim[16] = 129'h005969e83d83c146bda9638bde2ef4cef;
    stim[17] = 129'h0f37bbfa51e6f818483c16a95b29907ed;
    stim[18] = 129'h0463643726549532d82c3a2289c303658;
    stim[19] = 129'h0abd1146fa4cd9e1aa476c12b1e040dc6;
    stim[20] = 129'h0be98cd2e065ab4208920d516a99fdaab;
    stim[21] = 129'h0dbc126d2f5d163ac0942925ce75d06a4;
    stim[22] = 129'h0d883b406d44716a9ff8851bae4cfad48;
    stim[23] = 129'h0f7d6abdc15c29fe4de4476c4df6ade52;
    stim[24] = 129'h0562838e4db02d562196c39382265e950;
    stim[25] = 129'h0c9cf947a5803481287dbf5f5988b04a0;
    stim[26] = 129'h0a7b824f68e41fd8399e9ae1553e08222;
    stim[27] = 129'h0d6a6410eca8ea28a92ef796d3042cc97;
    stim[28] = 129'h0f0effbed93ba0f2a05b0442fb7f3efa5;
    stim[29] = 129'h05edce6ae0b0a829e9b4fbb11dc44ed65;
    stim[30] = 129'h024d93ef9cd10f5eae9cfd2d64876ae19;
    stim[31] = 129'h0564e92cf58384d61a2a5e39d959e7756;
    stim[32] = 129'h0c1c65edfae4a5f0bba30fefc422f325f;
    stim[33] = 129'h04689a319820c8415ae9fc957f49458a4;
    stim[34] = 129'h09b4936750e4d92f78fee0ac71b1f676d;
    stim[35] = 129'h0ef45653e6ba84473a1f3cfa937844c0c;
    stim[36] = 129'h0c98a38ae7bd90d050ae139b449fef562;
    stim[37] = 129'h0e3de5dd711c1dd8a1baffd151d5b587d;
    stim[38] = 129'h048e53c42ba126b72cf6326747c82d441;
    stim[39] = 129'h0513d156c555175d359bd66a66b72eb27;
    stim[40] = 129'h07f220ad8a387f9ad43f39ddc4ad30fd5;
    stim[41] = 129'h06c3fca994956601678536e33941685f0;
    stim[42] = 129'h0d2445cc9e489f4c4d149b8d22b911ded;
    stim[43] = 129'h08eebe9b69ffc696dc2c4e299a076ec16;
    stim[44] = 129'h0a6220f5916862fd2d0c358e3c4f9d0db;
    stim[45] = 129'h0032c0c50bc02feef24dc63ec53d89e7f;
    stim[46] = 129'h0dc2201a33f09beb299508fef902bfc77;
    stim[47] = 129'h0898537b4369fc3e6e92efaa6f9eb6681;
    stim[48] = 129'h04f3dd8db49c37c6fdcbcb3f6a49e129b;
    stim[49] = 129'h04abff8a1b5b14d879425fcf4f8a9ea42;
    stim[50] = 129'h0bc5ee62dc7d27ba001cccf2809070df4;
    stim[51] = 129'h095f2e98477f8c328c1202af5a4d22a52;
    stim[52] = 129'h0acd204c93bab31705bb2414b59f9740d;
    stim[53] = 129'h09a336f15771534cdbc54a9dffad32aff;
    stim[54] = 129'h03fcfc12c93ec24e0c9033444c8c17bfb;
    stim[55] = 129'h0ced9d59f3aec614bedb208977ef59972;
    stim[56] = 129'h070b7b5d9c2067a8004bc3ab95071b5a4;
    stim[57] = 129'h085ae56b6d653b338984c1133574133da;
    stim[58] = 129'h0b8560b1aabf35d768aad712937f8afc0;
    stim[59] = 129'h05ea9f23b69e6d89c8a2c252a61a3ff5f;
    stim[60] = 129'h053fe11635c8780ad04695c527837d710;
    stim[61] = 129'h044bcee49c9e68c3795cb01cc140feb63;
    stim[62] = 129'h00386ac02497c45046b35d466194a99b8;
    stim[63] = 129'h09d9a0c3fe3fb7c04f15bc4584d0d4a13;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
