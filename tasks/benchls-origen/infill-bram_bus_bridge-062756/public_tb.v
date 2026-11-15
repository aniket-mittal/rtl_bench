// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 105;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062756 dut (
    .g_clk(clk),
    .g_resetn(in_vec[104:104]),
    .bram_stall(in_vec[103:103]),
    .bram_rdata(in_vec[102:71]),
    .enable(in_vec[70:70]),
    .mem_req(in_vec[69:69]),
    .mem_wen(in_vec[68:68]),
    .mem_strb(in_vec[67:64]),
    .mem_wdata(in_vec[63:32]),
    .mem_addr(in_vec[31:0]),
    .bram_cen(out_vec[104:104]),
    .bram_addr(out_vec[103:72]),
    .bram_wdata(out_vec[71:40]),
    .bram_wstrb(out_vec[39:36]),
    .mem_gnt(out_vec[35:35]),
    .mem_recv(out_vec[34:34]),
    .mem_ack(out_vec[33:33]),
    .mem_error(out_vec[32:32]),
    .mem_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 105'h08d185eed4be0f1c02b5ef6df52;
    stim[1] = 105'h02dc44b31f69370d2539f675ea5;
    stim[2] = 105'h120d5458c51254a3a301c002806;
    stim[3] = 105'h1f90d901b0140f27e532ad1549d;
    stim[4] = 105'h134b6dfd1cfbe5765288541bc58;
    stim[5] = 105'h1df4d2218cca5f7c6edd8d175a4;
    stim[6] = 105'h10b5141bb10c56b62dc7f2c2a1f;
    stim[7] = 105'h103139ccca29a633a86642afe17;
    stim[8] = 105'h12131f6eb2e9310038a1c1bbf09;
    stim[9] = 105'h1cee2ad7f800fa2e958dde32c03;
    stim[10] = 105'h1da0476d0b85387fa7844889949;
    stim[11] = 105'h1f32f4dcfc938dda6236514930b;
    stim[12] = 105'h172cec7f169c1e0c84c35d55765;
    stim[13] = 105'h1ad8d62679ee62e61852fa2301e;
    stim[14] = 105'h117faff48bf82a68c971826e268;
    stim[15] = 105'h1e6eb3e13041d4a43fb1ebc7297;
    stim[16] = 105'h12c9881c16f3817a1271734a018;
    stim[17] = 105'h1e124a0f833a3b7adbff69a0ea7;
    stim[18] = 105'h14664dc43a58d297cb642986424;
    stim[19] = 105'h125dc89b48aac46462ecd13172d;
    stim[20] = 105'h19eb366939c6339941c836d628d;
    stim[21] = 105'h150c1136bb96f81e2eb43fa2ae0;
    stim[22] = 105'h1a55a475d53ee4719ccad76c619;
    stim[23] = 105'h1e1a7ef57a978f61875c6f99c8c;
    stim[24] = 105'h14d811c76c37237127a9f78453f;
    stim[25] = 105'h187f477c95a0b5107a4eb78d192;
    stim[26] = 105'h16839463bf866067480e97a1a2c;
    stim[27] = 105'h14494c1f541d9dd3bd131ccb43c;
    stim[28] = 105'h12d8f5cb6bb04e68da1083a98fa;
    stim[29] = 105'h1a20be5e2e8af4622046becdda3;
    stim[30] = 105'h1edeb191d0fd84490159e4dc2c4;
    stim[31] = 105'h1458d31536f5dcfa3e3a1b90994;
    stim[32] = 105'h104a3adbf1077236611d3db5fe6;
    stim[33] = 105'h10a41901fe6d4ee6f2e6d778e6d;
    stim[34] = 105'h1c5a42e7aca91fa5a8d5c344c44;
    stim[35] = 105'h1b4dbfd42a0a9f7df151a3c4d80;
    stim[36] = 105'h1189a98e5cafaf5fe1c15c72be8;
    stim[37] = 105'h18608ab5b2fa65366e091414d4b;
    stim[38] = 105'h18f3b566f46f21e562ca01badc7;
    stim[39] = 105'h1b0cb7a115b1a5d2e47ff26c6ce;
    stim[40] = 105'h15fdb385396d670dfb4cfecf937;
    stim[41] = 105'h1a0a05d50d4ff01e57d8bcebafd;
    stim[42] = 105'h180a881a6a2886a5614b1515d46;
    stim[43] = 105'h1fa437e56e5b29b346658636e46;
    stim[44] = 105'h114a179f7e735d963b3cb36c132;
    stim[45] = 105'h1a29ec1d67813234354af5a0682;
    stim[46] = 105'h1dda5021d888b36f6428074f80b;
    stim[47] = 105'h1406119e5904328693e0fff2290;
    stim[48] = 105'h123b57e35b0a7ea7af0b660a3b1;
    stim[49] = 105'h16ce44aa6235945069b243ea351;
    stim[50] = 105'h1f2e6d6a58a3cd4e99de863f38f;
    stim[51] = 105'h1d98cc9814c345e0038e2d36a70;
    stim[52] = 105'h11e23e335d5cdcf131f85bf8307;
    stim[53] = 105'h1c437013cdbf9676050e551960d;
    stim[54] = 105'h133398f98c619ebf3e13c21fbd3;
    stim[55] = 105'h1aabbe341f8ab4fdeed3b6cc11c;
    stim[56] = 105'h1d2ba836b2022bc929265121285;
    stim[57] = 105'h10a01a54063dfb741b459725a8b;
    stim[58] = 105'h1a44d8132e7d01611c4d86ab669;
    stim[59] = 105'h1d242e9ac0101a040848cdf2431;
    stim[60] = 105'h14d6560b1add543ab78b401954a;
    stim[61] = 105'h10f204719148b40e9c04896b3e0;
    stim[62] = 105'h18a864d3b6717100da64d0991f3;
    stim[63] = 105'h1f228708b4b3c1c775638aa2551;
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
      expv[0] = 105'h05ef6df52e0f1c02b0000000000;
      expv[1] = 105'h19f675ea59370d2536000000000;
      expv[2] = 105'h01c002806254a3a301000000000;
      expv[3] = 105'h02ad1549d40f27e530000000000;
      expv[4] = 105'h08541bc58be5765280000000000;
      expv[5] = 105'h0d8d175a4a5f7c6ed0000000000;
      expv[6] = 105'h07f2c2a1fc56b62dc0000000000;
      expv[7] = 105'h0642afe179a633a860000000000;
      expv[8] = 105'h01c1bbf099310038a0000000000;
      expv[9] = 105'h0dde32c030fa2e9580000000000;
      expv[10] = 105'h0448899495387fa788000000000;
      expv[11] = 105'h06514930b38dda6230000000000;
      expv[12] = 105'h135d55765c1e0c84c0000000000;
      expv[13] = 105'h02fa2301ee62e6185e800000000;
      expv[14] = 105'h01826e26882a68c97fe5b1ac4cf;
      expv[15] = 105'h01ebc72971d4a43fb085b1ac4cf;
      expv[16] = 105'h11734a0183817a127005b1ac4cf;
      expv[17] = 105'h0f69a0ea7a3b7adbf385b1ac4cf;
      expv[18] = 105'h0429864248d297cb60ec24941f0;
      expv[19] = 105'h0cd13172dac46462e08c24941f0;
      expv[20] = 105'h0836d628d6339941cc0c24941f0;
      expv[21] = 105'h043fa2ae06f81e2eb90c24941f0;
      expv[22] = 105'h0ad76c619ee4719cc30c24941f0;
      expv[23] = 105'h0c6f99c8c78f6187500c24941f0;
      expv[24] = 105'h09f78453f7237127a00c24941f0;
      expv[25] = 105'h0eb78d1920b5107a4a0c24941f0;
      expv[26] = 105'h1e97a1a2c6606748080c24941f0;
      expv[27] = 105'h031ccb43cd9dd3bd108c24941f0;
      expv[28] = 105'h0083a98fa04e68da1be892983ea;
      expv[29] = 105'h06becdda3af46220408892983ea;
      expv[30] = 105'h06becdda3af46220400892983ea;
      expv[31] = 105'h16becdda3af46220408892983ea;
      expv[32] = 105'h0d3db5fe6772366110e8b1a62a6;
      expv[33] = 105'h06d778e6dd4ee6f2e0e09475b7e;
      expv[34] = 105'h05c344c4491fa5a8d0809475b7e;
      expv[35] = 105'h01a3c4d80a9f7df150009475b7e;
      expv[36] = 105'h015c72be8faf5fe1c0009475b7e;
      expv[37] = 105'h091414d4ba65366e00009475b7e;
      expv[38] = 105'h0a01badc7f21e562c0009475b7e;
      expv[39] = 105'h0ff26c6ce1a5d2e47b009475b7e;
      expv[40] = 105'h0cfecf937d670dfb46009475b7e;
      expv[41] = 105'h08bcebafdff01e57d4009475b7e;
      expv[42] = 105'h0b1515d46886a56140009475b7e;
      expv[43] = 105'h058636e46b29b34660009475b7e;
      expv[44] = 105'h158636e46b29b34660009475b7e;
      expv[45] = 105'h0af5a0682132343548e2942f3ef;
      expv[46] = 105'h08074f80b8b36f6420e453d83ac;
      expv[47] = 105'h00fff22904328693e08453d83ac;
      expv[48] = 105'h0b660a3b1a7ea7af008453d83ac;
      expv[49] = 105'h0243ea3515945069b00453d83ac;
      expv[50] = 105'h0e863f38f3cd4e99d00453d83ac;
      expv[51] = 105'h0e2d36a70345e003800453d83ac;
      expv[52] = 105'h085bf8307cdcf131f50453d83ac;
      expv[53] = 105'h0e551960df9676050b0453d83ac;
      expv[54] = 105'h03c21fbd319ebf3e100453d83ac;
      expv[55] = 105'h03b6cc11cab4fdeed80453d83ac;
      expv[56] = 105'h03b6cc11cab4fdeed80453d83ac;
      expv[57] = 105'h13b6cc11cab4fdeed88453d83ac;
      expv[58] = 105'h0d86ab669d01611c40e14034a80;
      expv[59] = 105'h08cdf243101a040840e489b0265;
      expv[60] = 105'h0b401954ad543ab7808489b0265;
      expv[61] = 105'h04896b3e08b40e9c048489b0265;
      expv[62] = 105'h04d0991f317100da600489b0265;
      expv[63] = 105'h04d0991f317100da600489b0265;
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
