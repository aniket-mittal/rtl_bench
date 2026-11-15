// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_042189 dut (
    .i_clk(clk),
    .i_aresetn(in_vec[85:85]),
    .i_enable(in_vec[84:84]),
    .i_data_to_transmit(in_vec[83:68]),
    .i_tkeep(in_vec[67:66]),
    .i_tdest(in_vec[65:34]),
    .i_tlast(in_vec[33:33]),
    .i_core_TID(in_vec[32:1]),
    .i_tready(in_vec[0:0]),
    .o_idle(out_vec[36:36]),
    .o_tvalid(out_vec[35:35]),
    .o_tdata(out_vec[34:19]),
    .o_tkeep(out_vec[18:17]),
    .o_tdest(out_vec[16:9]),
    .o_tid(out_vec[8:1]),
    .o_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h035b8e342886db2df40409;
    stim[1] = 86'h177e7fa364372504ce652f;
    stim[2] = 86'h20abed79772990900d445d;
    stim[3] = 86'h312eda213fae26fbe71be5;
    stim[4] = 86'h2370661218a280781f7444;
    stim[5] = 86'h3d34fa0d8dceddbf63b5fd;
    stim[6] = 86'h213f193033b9a4f011b4bd;
    stim[7] = 86'h21b7e1e684490dbc866699;
    stim[8] = 86'h25593cf58a383ecd209902;
    stim[9] = 86'h272b27d3ea15427de05562;
    stim[10] = 86'h268df4813538e8fee65281;
    stim[11] = 86'h3ae51117363accfc8b90c1;
    stim[12] = 86'h2bbaab81a488699107207f;
    stim[13] = 86'h2e889862627ca8f29b0017;
    stim[14] = 86'h36702fd51fa5a97657b3f8;
    stim[15] = 86'h2391860ef9579ab9369cc3;
    stim[16] = 86'h215891f13fe6dbd1219a90;
    stim[17] = 86'h0f3f9f041d28ddd48b2e8f;
    stim[18] = 86'h24bc570c5869a9e691b51c;
    stim[19] = 86'h2d5d7406bfebb4573634fd;
    stim[20] = 86'h2a8076e6e8fc643d462168;
    stim[21] = 86'h3a1609e6ddb69755792ecf;
    stim[22] = 86'h2d159c388e07d4ceb72af8;
    stim[23] = 86'h300b410861264800946532;
    stim[24] = 86'h35e07e17ce177a4f028bab;
    stim[25] = 86'h3921220ec7ea8de2006534;
    stim[26] = 86'h2ac87a26a3978e661ebade;
    stim[27] = 86'h32138ec89b13be2dc13095;
    stim[28] = 86'h2e39e4091b7acf3475f80e;
    stim[29] = 86'h348c13688285288ff1a3bc;
    stim[30] = 86'h23319bd4975c06ac96b92a;
    stim[31] = 86'h209a66590e30fc83a671bb;
    stim[32] = 86'h37a26f3ea6b79f879b35cc;
    stim[33] = 86'h27512d3dad4435df1b5150;
    stim[34] = 86'h2c1e2e0a8343f1d5bdc2d1;
    stim[35] = 86'h37bd43fb380ccb8ded3dc7;
    stim[36] = 86'h27dbd4bcecba678866ee1f;
    stim[37] = 86'h3f1a48ac86a6c79591de83;
    stim[38] = 86'h397558dbfb0ed1957ac60c;
    stim[39] = 86'h32b7cdea81f329c9170eb2;
    stim[40] = 86'h21564769f339567ff0ac1b;
    stim[41] = 86'h37970f292c7f41d6e6e497;
    stim[42] = 86'h28b9c61bde9b6269eec9ab;
    stim[43] = 86'h2bd8a0fb8a293671751ac1;
    stim[44] = 86'h30248d2241bc43493ff47a;
    stim[45] = 86'h2a3e3248cad51b255fa010;
    stim[46] = 86'h3ebd90a9ce1751a919d0f4;
    stim[47] = 86'h28b59ee602ce9661d93c96;
    stim[48] = 86'h2525aae2be78f6a2ff7dd0;
    stim[49] = 86'h329b2eec5965ee89f42416;
    stim[50] = 86'h36b47e7a016e474dc1d897;
    stim[51] = 86'h274ab07cd96f0da12983f7;
    stim[52] = 86'h2ed7fa2e2965f8285e2cc9;
    stim[53] = 86'h2fec15969687ad30a41764;
    stim[54] = 86'h376237533335a816a57f6e;
    stim[55] = 86'h2b478f9aedafad05a95607;
    stim[56] = 86'h3fcba251caef6d0d34f2ed;
    stim[57] = 86'h22873ea0aefaf53205e48e;
    stim[58] = 86'h3f26e5cbbd0f868ac2a92d;
    stim[59] = 86'h34c82c068a593bbb17f1c4;
    stim[60] = 86'h21c68518ae034cf6c89f66;
    stim[61] = 86'h3d56878cb811a27a4049cd;
    stim[62] = 86'h24f7d3e00c6fc08f815a26;
    stim[63] = 86'h3bf4707e9d9cc8f8273981;
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
      expv[0] = 37'h1000000008;
      expv[1] = 37'h100000012e;
      expv[2] = 37'h100000005c;
      expv[3] = 37'h10000001e4;
      expv[4] = 37'h08976d1245;
      expv[5] = 37'h08976d13fd;
      expv[6] = 37'h10976d12bd;
      expv[7] = 37'h10976d1299;
      expv[8] = 37'h10976d1303;
      expv[9] = 37'h10976d1363;
      expv[10] = 37'h10976d1281;
      expv[11] = 37'h10976d12c1;
      expv[12] = 37'h0d7289667e;
      expv[13] = 37'h1572896616;
      expv[14] = 37'h15728967f8;
      expv[15] = 37'h0b3816d4c2;
      expv[16] = 37'h133816d490;
      expv[17] = 37'h100000008e;
      expv[18] = 37'h100000011c;
      expv[19] = 37'h10000000fc;
      expv[20] = 37'h1000000168;
      expv[21] = 37'h10000000ce;
      expv[22] = 37'h0d0b054af9;
      expv[23] = 37'h0d0b054b33;
      expv[24] = 37'h0d0b054bab;
      expv[25] = 37'h150b054b35;
      expv[26] = 37'h0c909146de;
      expv[27] = 37'h0c90914694;
      expv[28] = 37'h149091460e;
      expv[29] = 37'h14909147bc;
      expv[30] = 37'h0a4608952a;
      expv[31] = 37'h0a460895ba;
      expv[32] = 37'h12460895cc;
      expv[33] = 37'h0bd137cf51;
      expv[34] = 37'h0bd137ced1;
      expv[35] = 37'h13d137cfc7;
      expv[36] = 37'h0bdea0641f;
      expv[37] = 37'h13dea06483;
      expv[38] = 37'h0f8d25620d;
      expv[39] = 37'h0f8d2562b3;
      expv[40] = 37'h0f8d25621b;
      expv[41] = 37'h178d256297;
      expv[42] = 37'h0bcb87a1aa;
      expv[43] = 37'h13cb87a0c0;
      expv[44] = 37'h13cb87a07a;
      expv[45] = 37'h0812462011;
      expv[46] = 37'h08124620f5;
      expv[47] = 37'h0812462097;
      expv[48] = 37'h08124621d1;
      expv[49] = 37'h0812462017;
      expv[50] = 37'h0812462097;
      expv[51] = 37'h10124621f7;
      expv[52] = 37'h10124620c9;
      expv[53] = 37'h1012462165;
      expv[54] = 37'h101246216f;
      expv[55] = 37'h0bb11ad406;
      expv[56] = 37'h13b11ad4ec;
      expv[57] = 37'h0fe5d1b68e;
      expv[58] = 37'h0fe5d1b72c;
      expv[59] = 37'h17e5d1b7c4;
      expv[60] = 37'h0a64169d67;
      expv[61] = 37'h0a64169dcd;
      expv[62] = 37'h1264169c27;
      expv[63] = 37'h1264169d81;
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
