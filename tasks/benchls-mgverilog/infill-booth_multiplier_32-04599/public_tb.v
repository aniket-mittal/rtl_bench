// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04599 dut (
    .i_clk(clk),
    .i_core_stall(in_vec[67:67]),
    .i_a_in(in_vec[66:35]),
    .i_b_in(in_vec[34:3]),
    .i_function(in_vec[2:1]),
    .i_execute(in_vec[0:0]),
    .o_out(out_vec[34:3]),
    .o_flags(out_vec[2:1]),
    .o_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'he345d5ecf8dfe0148;
    stim[1] = 68'hf24f57b100ea89abb;
    stim[2] = 68'h2013b7a72258d6e5f;
    stim[3] = 68'h445c99e395f2a1330;
    stim[4] = 68'h657b14157c653073b;
    stim[5] = 68'h1de6d9c63e08f3fdd;
    stim[6] = 68'hb8789375bc36fc065;
    stim[7] = 68'h78813e61878136afc;
    stim[8] = 68'h73c0dd6fe58b8deee;
    stim[9] = 68'h932f5dd2c5fe933cd;
    stim[10] = 68'h2efc5427dfa7beb71;
    stim[11] = 68'h143c0a59a413076f4;
    stim[12] = 68'he2189247fd8695619;
    stim[13] = 68'ha80f5437e88bdab25;
    stim[14] = 68'h3301c94ac1e1578be;
    stim[15] = 68'h8490de7d7bae0dcf4;
    stim[16] = 68'h6c32cea315620257a;
    stim[17] = 68'h9621ca48b797d7c90;
    stim[18] = 68'hdfa56850d99e84e73;
    stim[19] = 68'h309f937d6d983deab;
    stim[20] = 68'h69bf94460c3edb1f0;
    stim[21] = 68'h54c81d58287aad3ce;
    stim[22] = 68'h7844a6cd8835a6e92;
    stim[23] = 68'h97b728a98bc57a6c0;
    stim[24] = 68'h8f88e1c29baa674de;
    stim[25] = 68'h4167b9b6889b832f3;
    stim[26] = 68'h171da4980317104a0;
    stim[27] = 68'h6ce517ffec9b1199e;
    stim[28] = 68'h7b206246ede380c5b;
    stim[29] = 68'h48d5b07a3d35af46e;
    stim[30] = 68'h5d0605a0c07e1166e;
    stim[31] = 68'h90fa08480ca46ac2a;
    stim[32] = 68'hec04a2a3bf5d49535;
    stim[33] = 68'hfc0506ebb79a77fa4;
    stim[34] = 68'h24cc340402308b42d;
    stim[35] = 68'hfbad8f8be60a9805c;
    stim[36] = 68'hc4e7303cdd6407046;
    stim[37] = 68'h9d6fc3f988c9b59fd;
    stim[38] = 68'h499cba8d5921a58a1;
    stim[39] = 68'hba14de00f59309a77;
    stim[40] = 68'h88159ec2a057d40a6;
    stim[41] = 68'h624de6edd4473b7e9;
    stim[42] = 68'hc6257b543264e5a07;
    stim[43] = 68'h3e2eaf38e3e26f992;
    stim[44] = 68'hba6b6e81f17b7a438;
    stim[45] = 68'h29719b00793985c74;
    stim[46] = 68'hef9213101fa5f1b87;
    stim[47] = 68'h91bad38d3698e36c0;
    stim[48] = 68'hd83ba944482c0b5a8;
    stim[49] = 68'hd910580f419aba071;
    stim[50] = 68'hecce58e964e641ec9;
    stim[51] = 68'hb742b25a6ba08fedc;
    stim[52] = 68'h5be47e30786020d0b;
    stim[53] = 68'h03dc8afc43bd68e13;
    stim[54] = 68'h80254c8586e383829;
    stim[55] = 68'h595a22a1f72dc2bb2;
    stim[56] = 68'h06f0fd1a9685d20be;
    stim[57] = 68'h81220071191c2d2c9;
    stim[58] = 68'h0696fd409ae9eeb97;
    stim[59] = 68'h317d51d36a4ee5412;
    stim[60] = 68'hc5cc77cd04db8b695;
    stim[61] = 68'hf534a66e3918adf23;
    stim[62] = 68'hbbf938575f278b174;
    stim[63] = 68'h5c8815a49e1419144;
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
      expv[0] = 35'h000000002;
      expv[1] = 35'h000000002;
      expv[2] = 35'h000000002;
      expv[3] = 35'h2258d6e58;
      expv[4] = 35'h2258d6e58;
      expv[5] = 35'h112c6b728;
      expv[6] = 35'h089635b90;
      expv[7] = 35'h089635b90;
      expv[8] = 35'h089635b90;
      expv[9] = 35'h089635b90;
      expv[10] = 35'h089635b90;
      expv[11] = 35'h444b1adcc;
      expv[12] = 35'h444b1adcc;
      expv[13] = 35'h444b1adcc;
      expv[14] = 35'h444b1adcc;
      expv[15] = 35'h444b1adcc;
      expv[16] = 35'h444b1adcc;
      expv[17] = 35'h444b1adcc;
      expv[18] = 35'h444b1adcc;
      expv[19] = 35'h444b1adcc;
      expv[20] = 35'h22258d6e0;
      expv[21] = 35'h22258d6e0;
      expv[22] = 35'h22258d6e0;
      expv[23] = 35'h22258d6e0;
      expv[24] = 35'h22258d6e0;
      expv[25] = 35'h22258d6e0;
      expv[26] = 35'h1112c6b70;
      expv[27] = 35'h1112c6b70;
      expv[28] = 35'h1112c6b70;
      expv[29] = 35'h4889635bc;
      expv[30] = 35'h4889635bc;
      expv[31] = 35'h4889635bc;
      expv[32] = 35'h4889635bc;
      expv[33] = 35'h4889635bc;
      expv[34] = 35'h4889635bc;
      expv[35] = 35'h2444b1ad8;
      expv[36] = 35'h2444b1ad8;
      expv[37] = 35'h2444b1ad8;
      expv[38] = 35'h2444b1ad8;
      expv[39] = 35'h122258d68;
      expv[40] = 35'h122258d68;
      expv[41] = 35'h122258d68;
      expv[42] = 35'h09112c6b0;
      expv[43] = 35'h09112c6b0;
      expv[44] = 35'h09112c6b0;
      expv[45] = 35'h09112c6b0;
      expv[46] = 35'h09112c6b0;
      expv[47] = 35'h09112c6b0;
      expv[48] = 35'h09112c6b0;
      expv[49] = 35'h09112c6b0;
      expv[50] = 35'h09112c6b0;
      expv[51] = 35'h09112c6b0;
      expv[52] = 35'h09112c6b0;
      expv[53] = 35'h048896358;
      expv[54] = 35'h42444b1ac;
      expv[55] = 35'h42444b1ac;
      expv[56] = 35'h42444b1ac;
      expv[57] = 35'h42444b1ac;
      expv[58] = 35'h42444b1ac;
      expv[59] = 35'h6122258d4;
      expv[60] = 35'h6122258d4;
      expv[61] = 35'h6122258d4;
      expv[62] = 35'h6122258d4;
      expv[63] = 35'h6122258d4;
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
