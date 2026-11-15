// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023924 dut (
    .clk(clk),
    .reset_n(in_vec[65:65]),
    .enable(in_vec[64:64]),
    .i_data(in_vec[63:0]),
    .o_code(out_vec[70:1]),
    .o_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h08d630cc792f5c7fa;
    stim[1] = 66'h1b9ca4453e11e5212;
    stim[2] = 66'h3b55fb648e9d3da28;
    stim[3] = 66'h319a3ab116869a21f;
    stim[4] = 66'h332f26ccb795bcbc7;
    stim[5] = 66'h3e92201c2b6b7a0e3;
    stim[6] = 66'h27398298cbe3b2cf9;
    stim[7] = 66'h2ba90447f1a9f1ecd;
    stim[8] = 66'h281a8e01b1ea0910e;
    stim[9] = 66'h3cfca45a29634ee63;
    stim[10] = 66'h3836c6442098305cd;
    stim[11] = 66'h3356967198b91dac3;
    stim[12] = 66'h28127d568dacd0abc;
    stim[13] = 66'h22f8ab95806a9a002;
    stim[14] = 66'h2db80917c101aad2a;
    stim[15] = 66'h268eea8c9f2f9e67b;
    stim[16] = 66'h391ab4dfe2a7e99c7;
    stim[17] = 66'h364df433f9152b71f;
    stim[18] = 66'h38acd29e006ca5269;
    stim[19] = 66'h2daf6a6fafe7d8f3e;
    stim[20] = 66'h2ea0262c3e5729073;
    stim[21] = 66'h35a849ff7dfb26c15;
    stim[22] = 66'h3bcca9bb54b6b8a79;
    stim[23] = 66'h3bf157594cb48ca76;
    stim[24] = 66'h219ef921b914e9606;
    stim[25] = 66'h2b44a8e7db2ec139a;
    stim[26] = 66'h2e64cc46b280f7ca9;
    stim[27] = 66'h23814dc0bd23cd57e;
    stim[28] = 66'h3c1ef17816bdd1b52;
    stim[29] = 66'h29b51e139333257d8;
    stim[30] = 66'h309526dfe0b21d403;
    stim[31] = 66'h0af62e10e28faf7b6;
    stim[32] = 66'h3cfeeb0323f70c73c;
    stim[33] = 66'h2048ece27a246a189;
    stim[34] = 66'h3d7981aa6d178255a;
    stim[35] = 66'h223dae87f46bec19c;
    stim[36] = 66'h3090fb78609f803ba;
    stim[37] = 66'h38281ee12506d2150;
    stim[38] = 66'h217bfc19f5a93cb70;
    stim[39] = 66'h3b1de188716b21adc;
    stim[40] = 66'h3b716939dfeb2bd69;
    stim[41] = 66'h22f9a63a1c61649c1;
    stim[42] = 66'h29602903a6c75adf8;
    stim[43] = 66'h20ad4bc08c93098be;
    stim[44] = 66'h225239f3b92ed3341;
    stim[45] = 66'h258f2227a4a000db8;
    stim[46] = 66'h20b30ebd922192bca;
    stim[47] = 66'h2fc3580394d833810;
    stim[48] = 66'h2cfb9421f7172ac39;
    stim[49] = 66'h2fdf326f661e55e49;
    stim[50] = 66'h2a6de9e8c6e181496;
    stim[51] = 66'h3635aa2e3ed434e1e;
    stim[52] = 66'h38c935e6239f6745e;
    stim[53] = 66'h27d30641ccc56b960;
    stim[54] = 66'h1240eba81d7e89c56;
    stim[55] = 66'h2b45a617f0495add2;
    stim[56] = 66'h29d7e498258233db8;
    stim[57] = 66'h2b9e6d9973ea0783a;
    stim[58] = 66'h248e14be02b6054ec;
    stim[59] = 66'h2f452f17fcceaa4fa;
    stim[60] = 66'h2298af2b951a6c7a4;
    stim[61] = 66'h3ed78aa275b884cb5;
    stim[62] = 66'h2657d98ee61a6b290;
    stim[63] = 66'h34b3f9305d481b5db;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h000000000000000001;
      expv[4] = 71'h776abf6c91d3a7b451;
      expv[5] = 71'h3833475622d0d3443f;
      expv[6] = 71'h3e65e4d996f2b7978f;
      expv[7] = 71'h3e65e4d996f2b7978f;
      expv[8] = 71'h3e65e4d996f2b7978f;
      expv[9] = 71'h3e65e4d996f2b7978f;
      expv[10] = 71'h4bd24403856d6f41c7;
      expv[11] = 71'h399f948b452c69dcc7;
      expv[12] = 71'h0b06d8c88413060b9b;
      expv[13] = 71'h0b06d8c88413060b9b;
      expv[14] = 71'h0b06d8c88413060b9b;
      expv[15] = 71'h0b06d8c88413060b9b;
      expv[16] = 71'h0b06d8c88413060b9b;
      expv[17] = 71'h066ad2ce331723b587;
      expv[18] = 71'h5523569bfc54fd338f;
      expv[19] = 71'h1ec9be867f22a56e3f;
      expv[20] = 71'h1ec9be867f22a56e3f;
      expv[21] = 71'h1ec9be867f22a56e3f;
      expv[22] = 71'h39159a53c00d94a4d3;
      expv[23] = 71'h4cb5093fefbf64d82b;
      expv[24] = 71'h1f7995376a96d714f3;
      expv[25] = 71'h1f7995376a96d714f3;
      expv[26] = 71'h1f7995376a96d714f3;
      expv[27] = 71'h1f7995376a96d714f3;
      expv[28] = 71'h1f7995376a96d714f3;
      expv[29] = 71'h237e2aeb29969194ed;
      expv[30] = 71'h237e2aeb29969194ed;
      expv[31] = 71'h000000000000000000;
      expv[32] = 71'h000000000000000000;
      expv[33] = 71'h000000000000000001;
      expv[34] = 71'h000000000000000001;
      expv[35] = 71'h0b9fdd60647ee18e79;
      expv[36] = 71'h0b9fdd60647ee18e79;
      expv[37] = 71'h53af30354da2f04ab5;
      expv[38] = 71'h76121f6f0c13f00775;
      expv[39] = 71'h76121f6f0c13f00775;
      expv[40] = 71'h030503dc24a0da42a1;
      expv[41] = 71'h0963bc310e2d6435b9;
      expv[42] = 71'h0963bc310e2d6435b9;
      expv[43] = 71'h0963bc310e2d6435b9;
      expv[44] = 71'h0963bc310e2d6435b9;
      expv[45] = 71'h0963bc310e2d6435b9;
      expv[46] = 71'h0963bc310e2d6435b9;
      expv[47] = 71'h0963bc310e2d6435b9;
      expv[48] = 71'h0963bc310e2d6435b9;
      expv[49] = 71'h0963bc310e2d6435b9;
      expv[50] = 71'h0963bc310e2d6435b9;
      expv[51] = 71'h0963bc310e2d6435b9;
      expv[52] = 71'h636e2d273bfd657ad3;
      expv[53] = 71'h54c6b545c7da869c3d;
      expv[54] = 71'h000000000000000000;
      expv[55] = 71'h000000000000000000;
      expv[56] = 71'h000000000000000000;
      expv[57] = 71'h000000000000000000;
      expv[58] = 71'h000000000000000000;
      expv[59] = 71'h000000000000000000;
      expv[60] = 71'h000000000000000000;
      expv[61] = 71'h000000000000000000;
      expv[62] = 71'h000000000000000001;
      expv[63] = 71'h000000000000000001;
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
