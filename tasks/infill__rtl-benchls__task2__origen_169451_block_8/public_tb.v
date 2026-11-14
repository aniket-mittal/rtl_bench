// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169451 dut (
    .afl(in_vec[63:32]),
    .bfl(in_vec[31:0]),
    .fl(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hdb238f849e3b7f71;
    stim[1] = 64'h62838a562130a717;
    stim[2] = 64'h9fa573d9e098d898;
    stim[3] = 64'ha3a3f29ac1e5a072;
    stim[4] = 64'h74796a17a6cf08eb;
    stim[5] = 64'h69e977e1bd1e8b5b;
    stim[6] = 64'hd2697c73b92d2b4d;
    stim[7] = 64'h074ad745c6027b00;
    stim[8] = 64'h091a92f4459651e7;
    stim[9] = 64'hbc81259b6967f34e;
    stim[10] = 64'hd124e458f69712a5;
    stim[11] = 64'h38453a3b68717637;
    stim[12] = 64'h1ac991af770860fe;
    stim[13] = 64'h7a16b118f7a85f72;
    stim[14] = 64'hb82c48c76f7b92b8;
    stim[15] = 64'hcbe93afb0df65ea1;
    stim[16] = 64'h25438d26914e9f7f;
    stim[17] = 64'h3ebb67e59ef629b4;
    stim[18] = 64'h0f19a80eee5f3350;
    stim[19] = 64'hc2f77701996b3f6f;
    stim[20] = 64'h3361ac394e5b6999;
    stim[21] = 64'ha5101953f99c028d;
    stim[22] = 64'h981b81768dd6c4ca;
    stim[23] = 64'h49c0d05eabdffee4;
    stim[24] = 64'h8af03730267403d5;
    stim[25] = 64'hcf79f99c201e3d58;
    stim[26] = 64'h7e1c04cf984aaf94;
    stim[27] = 64'h6dd67a4849e43a84;
    stim[28] = 64'h9a7c803a4c511288;
    stim[29] = 64'h5abeaa24104bce99;
    stim[30] = 64'h9c9cb6756af790d4;
    stim[31] = 64'he4fe8d7056fbb5c2;
    stim[32] = 64'he0fddea93a120c45;
    stim[33] = 64'hed09dbed79b2907b;
    stim[34] = 64'h6fc06390b631295b;
    stim[35] = 64'h6067d18c9d3f15da;
    stim[36] = 64'hee6dd068c5ca6e78;
    stim[37] = 64'h3aebaaa64ae3ac57;
    stim[38] = 64'h607d9a1b531234a2;
    stim[39] = 64'h9a7d0eebb9532cae;
    stim[40] = 64'hbc6a2dbef3019128;
    stim[41] = 64'h073bd45501ccf466;
    stim[42] = 64'h948ad9634255a09a;
    stim[43] = 64'h37c999ed3b061b61;
    stim[44] = 64'hdf5e0603b4a89efc;
    stim[45] = 64'he1fb52542bf30cd5;
    stim[46] = 64'h6212b01e141cb8e2;
    stim[47] = 64'h65bab459f7059032;
    stim[48] = 64'hae6580ccbbe5a82d;
    stim[49] = 64'hdd845c9676069ddb;
    stim[50] = 64'h61ce4364235b3625;
    stim[51] = 64'h2162b42b212f300a;
    stim[52] = 64'h59b7aea0baca2aa0;
    stim[53] = 64'h3504f4a2d16f816d;
    stim[54] = 64'h30162e57cfb20291;
    stim[55] = 64'h2ac3a138cffbe25a;
    stim[56] = 64'h9a729df9ae30ff16;
    stim[57] = 64'hb344221a63cae181;
    stim[58] = 64'ha9c66a2727608e72;
    stim[59] = 64'hdac6897256559198;
    stim[60] = 64'hb1dec5ed5bb5282f;
    stim[61] = 64'hedd6c66d5300e01c;
    stim[62] = 64'hda8c96df7a91da8f;
    stim[63] = 64'hb55c3e8dc2324cbe;
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
      expv[0] = 32'h3990878e;
      expv[1] = 32'h4401587f;
      expv[2] = 32'h40874518;
      expv[3] = 32'h259c8a7c;
      expv[4] = 32'hdb4af7ef;
      expv[5] = 32'he7192aeb;
      expv[6] = 32'h4ba5396f;
      expv[7] = 32'h8d817347;
      expv[8] = 32'h0f04a242;
      expv[9] = 32'he600ee70;
      expv[10] = 32'h0806a667;
      expv[11] = 32'h60bd5d57;
      expv[12] = 32'h5204d0da;
      expv[13] = 32'hb2072843;
      expv[14] = 32'he7aac0b1;
      expv[15] = 32'h99e1502b;
      expv[16] = 32'hf6a97e2f;
      expv[17] = 32'h9db6d721;
      expv[18] = 32'hbd931503;
      expv[19] = 32'h1c6418af;
      expv[20] = 32'h41c5c104;
      expv[21] = 32'h5f0385dc;
      expv[22] = 32'h6612a544;
      expv[23] = 32'hb5b09bb6;
      expv[24] = 32'hf165b55f;
      expv[25] = 32'haf9cd0f5;
      expv[26] = 32'hd6905936;
      expv[27] = 32'h77c3b710;
      expv[28] = 32'ha6cedb2b;
      expv[29] = 32'h2b251cd5;
      expv[30] = 32'hc79ad21d;
      expv[31] = 32'hfbfa4f9d;
      expv[32] = 32'hdb11bf60;
      expv[33] = 32'ha703e509;
      expv[34] = 32'he618baea;
      expv[35] = 32'hbdb32adc;
      expv[36] = 32'h743fdb42;
      expv[37] = 32'h45d3d6f2;
      expv[38] = 32'h7391dd51;
      expv[39] = 32'h13d14353;
      expv[40] = 32'h6f814cc4;
      expv[41] = 32'h4923f84e;
      expv[42] = 32'h970741f8;
      expv[43] = 32'h330382f5;
      expv[44] = 32'h541dd6a9;
      expv[45] = 32'hcdeed854;
      expv[46] = 32'h36843184;
      expv[47] = 32'h9d028d2d;
      expv[48] = 32'h2a509cfd;
      expv[49] = 32'h940039b8;
      expv[50] = 32'h4537c504;
      expv[51] = 32'h02a46333;
      expv[52] = 32'hd4a0437f;
      expv[53] = 32'hc6845127;
      expv[54] = 32'hc008aa8b;
      expv[55] = 32'hbac17484;
      expv[56] = 32'h08abdfa7;
      expv[57] = 32'hd727dbbf;
      expv[58] = 32'h91351df9;
      expv[59] = 32'hf12f2781;
      expv[60] = 32'hcda75bb4;
      expv[61] = 32'h810097ee;
      expv[62] = 32'h9581c188;
      expv[63] = 32'h37a43fbd;
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
