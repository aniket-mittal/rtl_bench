// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139535 dut (
    .clk(clk),
    .rst(in_vec[100:100]),
    .input_data(in_vec[99:68]),
    .input_valid(in_vec[67:67]),
    .feedback_data(in_vec[66:35]),
    .feedback_valid(in_vec[34:34]),
    .output_ready(in_vec[33:33]),
    .rdcmd_ready(in_vec[32:32]),
    .mem_data(in_vec[31:0]),
    .input_ready(out_vec[56:56]),
    .feedback_ready(out_vec[55:55]),
    .output_data(out_vec[54:23]),
    .output_valid(out_vec[22:22]),
    .rdcmd_data(out_vec[21:2]),
    .rdcmd_valid(out_vec[1:1]),
    .mem_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1099b81226f0568abc7edfcdee;
    stim[1] = 101'h10c267ba70a3ce92458b7b9f4e;
    stim[2] = 101'h0a2eb01ea4f2d3243c05fa5bc3;
    stim[3] = 101'h0572ace031914b387b09c97f6c;
    stim[4] = 101'h07a269f806df2026014d6e9a62;
    stim[5] = 101'h0a5fb6fbbf2de6eaa733b61fb7;
    stim[6] = 101'h097804627aa92c979d0ac2ec4e;
    stim[7] = 101'h09f6588e5bce855e0e144879ed;
    stim[8] = 101'h00d1c9cccc5e120106ed39e23a;
    stim[9] = 101'h06ced131d7614d2108ea26d5b8;
    stim[10] = 101'h05879aa0b768cd3eaf8bea8f78;
    stim[11] = 101'h0cb0d29f740bdefc52c4c36b91;
    stim[12] = 101'h022aab6ce225c803760ad97ab8;
    stim[13] = 101'h0fca2bff5bc74c1370671f1ba0;
    stim[14] = 101'h07fee29f16a9a024c3219ea622;
    stim[15] = 101'h0d23a5c775918330ceeab745f6;
    stim[16] = 101'h0d220fd70997402fedd15c1386;
    stim[17] = 101'h0fa9fb8fe815f185f7586ca8b7;
    stim[18] = 101'h0c0274d0c4a2692b4613efc379;
    stim[19] = 101'h0b4fe39995d56339c1966c07cc;
    stim[20] = 101'h0da063518bea82a5e94d4d9e64;
    stim[21] = 101'h0cb6f73c7011e7f9059ead66b7;
    stim[22] = 101'h07d3009fb494c604020a66714d;
    stim[23] = 101'h097f4d5141fb7098e229ed4ac4;
    stim[24] = 101'h05a549aaf61878b712e6d7dedb;
    stim[25] = 101'h0d18bcaf0ccdf6f4cf7e266c0b;
    stim[26] = 101'h03713bcf3be4233931c0e46610;
    stim[27] = 101'h00e0819bd80fb28345dabf1e56;
    stim[28] = 101'h0d1579b3c26c7d0e592ac8b3e8;
    stim[29] = 101'h0c4ecda94e28efb9b13a886b3b;
    stim[30] = 101'h035a8ab2e73ec9cbb9b03a9cfc;
    stim[31] = 101'h079520f315d32f646561e3ea2c;
    stim[32] = 101'h08406559d8c17c52a81dc6a130;
    stim[33] = 101'h033b3e54470ebab35bbaea1b8f;
    stim[34] = 101'h0031c9d03a015117eec2a8da3d;
    stim[35] = 101'h0cf71c599e2d656b1957dea37f;
    stim[36] = 101'h06ddd857a3e09b4f0c0700cb18;
    stim[37] = 101'h08af82e477bcb28046a0193d31;
    stim[38] = 101'h04a4d21ed7f2de91cdd57d760f;
    stim[39] = 101'h08de694c7bad3d75861d9b1804;
    stim[40] = 101'h0e496f796cdf254fe626c7bbde;
    stim[41] = 101'h01625f42b18cdec9591a64b906;
    stim[42] = 101'h047d1dafa82409040e0d520e51;
    stim[43] = 101'h02b04b9f2ba452a904c4b276e9;
    stim[44] = 101'h0d335526553aa82ba61c7cf32d;
    stim[45] = 101'h036285c9cbf35d132bcb86c801;
    stim[46] = 101'h003b9d668c328ae4a1f4a34733;
    stim[47] = 101'h0831315b17eedc27fe158ac863;
    stim[48] = 101'h0e45f5a5f11abeb96c9ad17eb6;
    stim[49] = 101'h0a9b6de367ac9aef71a8357d30;
    stim[50] = 101'h061273f830d7164c1bc30de9bb;
    stim[51] = 101'h001b720312e23f608559f3410a;
    stim[52] = 101'h0b3049fba524262c08e3f04230;
    stim[53] = 101'h07461ccb834f34a374fc5b62c8;
    stim[54] = 101'h06a2d9d95e28c1e707b580f419;
    stim[55] = 101'h04179567106d36814e99236846;
    stim[56] = 101'h0ec51f91ca03ad88e877bfd5e6;
    stim[57] = 101'h0869d70a751f43a5dd9033687f;
    stim[58] = 101'h0e9120b7abaee80b5ab1dfe208;
    stim[59] = 101'h11d3fdbbba1574e81f8ba213b4;
    stim[60] = 101'h0f413a35f8eadebb3d1fcb3842;
    stim[61] = 101'h04290227012e6aace27b0f208f;
    stim[62] = 101'h057f58280a1b413784250871f6;
    stim[63] = 101'h099c140697b6d78db63d4d0a5c;
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
      expv[0] = 57'h1xxxxxxxxxxxxxx;
      expv[1] = 57'h1xxxxxxxxxxxxxx;
      expv[2] = 57'h1xxxxxxxxxxxxxx;
      expv[3] = 57'h1xxxxxxxxxxxxxx;
      expv[4] = 57'h1xxxxxxxxxxxxxx;
      expv[5] = 57'h1xxxxxxxxxxxxxx;
      expv[6] = 57'h0xxxxxxxxxdbeec;
      expv[7] = 57'h0xxxxxxxxxdbeee;
      expv[8] = 57'h0xxxxxxxxxdbeee;
      expv[9] = 57'h1f69cf11d6dbeef;
      expv[10] = 57'h1f69cf11d6dbeef;
      expv[11] = 57'h1f69cf11d2dbeee;
      expv[12] = 57'h1f69cf11d2dbeee;
      expv[13] = 57'h1f69cf11d2dbeee;
      expv[14] = 57'h0f69cf11d0affd6;
      expv[15] = 57'h0f69cf11d0affd6;
      expv[16] = 57'h0f69cf11d0affd6;
      expv[17] = 57'h1e8ae09c34affd7;
      expv[18] = 57'h0e8ae09c33ee3fa;
      expv[19] = 57'h0e8ae09c33ee3fa;
      expv[20] = 57'h0e8ae09c33ee3f8;
      expv[21] = 57'h1a6a6cf327ee3f9;
      expv[22] = 57'h1a6a6cf327ee3f9;
      expv[23] = 57'h1a6a6cf323ee3f8;
      expv[24] = 57'h1a6a6cf323ee3f8;
      expv[25] = 57'h1a6a6cf323ee3f8;
      expv[26] = 57'h0a6a6cf322f2bc0;
      expv[27] = 57'h0a6a6cf322f2bc2;
      expv[28] = 57'h0a6a6cf322f2bc0;
      expv[29] = 57'h1956459f46f2bc1;
      expv[30] = 57'h0956459f4736a51;
      expv[31] = 57'h0956459f4736a53;
      expv[32] = 57'h0956459f4736a51;
      expv[33] = 57'h18ee35098736a51;
      expv[34] = 57'h18ee35098336a50;
      expv[35] = 57'h08ee3509832740c;
      expv[36] = 57'h08ee3509832740e;
      expv[37] = 57'h08ee3509832740e;
      expv[38] = 57'h1d00c9e98f2740f;
      expv[39] = 57'h1d00c9e98f2740f;
      expv[40] = 57'h0d00c9e989a531e;
      expv[41] = 57'h0d00c9e989a531e;
      expv[42] = 57'h0d00c9e989a531c;
      expv[43] = 57'h186a90728da531d;
      expv[44] = 57'h086a90728d2e7c9;
      expv[45] = 57'h086a9072892e7ca;
      expv[46] = 57'h086a9072892e7c8;
      expv[47] = 57'h1fa51a399d2e7c9;
      expv[48] = 57'h1fa51a39992e7c8;
      expv[49] = 57'h1fa51a39992e7c8;
      expv[50] = 57'h1fa51a39992e7c8;
      expv[51] = 57'h1fa51a39992e7c8;
      expv[52] = 57'h1fa51a39992e7c8;
      expv[53] = 57'h1fa51a39992e7c8;
      expv[54] = 57'h1fa51a39992e7c8;
      expv[55] = 57'h0fa51a399b67654;
      expv[56] = 57'h0fa51a399b67656;
      expv[57] = 57'h0fa51a399b67656;
      expv[58] = 57'h1c819b43ff67657;
      expv[59] = 57'h1c819b43f882de8;
      expv[60] = 57'h1c819b43f882de8;
      expv[61] = 57'h0c819b43f8e8d7c;
      expv[62] = 57'h0c819b43f8e8d7e;
      expv[63] = 57'h0c819b43f8e8d7e;
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
