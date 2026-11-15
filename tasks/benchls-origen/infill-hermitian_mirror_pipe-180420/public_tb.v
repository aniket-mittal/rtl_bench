// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 146;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_180420 dut (
    .CLK(clk),
    .RST(in_vec[73:73]),
    .DATA_IN_RE(in_vec[72:45]),
    .DATA_IN_IM(in_vec[44:17]),
    .DATA_IN_INDEX(in_vec[16:1]),
    .DATA_IN_VALID(in_vec[0:0]),
    .DATA_OUT_RE(out_vec[145:118]),
    .DATA_OUT_IM(out_vec[117:90]),
    .DATA_OUT_INDEX(out_vec[89:74]),
    .DATA_OUT_VALID(out_vec[73:73]),
    .DATA_OUT_RE_HER(out_vec[72:45]),
    .DATA_OUT_IM_HER(out_vec[44:17]),
    .DATA_OUT_INDEX_HER(out_vec[16:1]),
    .DATA_OUT_VALID_HER(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h2b06a22605b623115f0;
    stim[1] = 74'h3cafe38ace1a146960d;
    stim[2] = 74'h16395eadf7fb6f0f018;
    stim[3] = 74'h0a55bd340d33a2ba0f9;
    stim[4] = 74'h122285d9a2c0edf0868;
    stim[5] = 74'h3f2a2a65dae7b91eafc;
    stim[6] = 74'h15affbf3db6550c8461;
    stim[7] = 74'h1e342b9717881dc1da1;
    stim[8] = 74'h0e4d2132acb5fabcd34;
    stim[9] = 74'h08559ac8e832e5dbf8a;
    stim[10] = 74'h0b4d928b4445df4c239;
    stim[11] = 74'h02a727e3ff54108c04d;
    stim[12] = 74'h1225bd0a37acebb457c;
    stim[13] = 74'h0d90cf75f45e9fa783f;
    stim[14] = 74'h154c26d213b0fbf7664;
    stim[15] = 74'h1ad05ca991229c72424;
    stim[16] = 74'h0ef94d1d4c3fff13c11;
    stim[17] = 74'h0ddecb447110a42a04a;
    stim[18] = 74'h0cf8ceb2bb66c80ef32;
    stim[19] = 74'h0a12b2d2899623d931d;
    stim[20] = 74'h1b18b7aa9877485a630;
    stim[21] = 74'h047169058f3d52e18f9;
    stim[22] = 74'h19816b570d620f1ce0d;
    stim[23] = 74'h10efe1b59ede049ce4a;
    stim[24] = 74'h1f0dbf7b2b352091a41;
    stim[25] = 74'h116572822b22f77215a;
    stim[26] = 74'h0076e21c0eeb4464b56;
    stim[27] = 74'h11e9fe30edf13ac50b1;
    stim[28] = 74'h11bc5236aaa5c40812a;
    stim[29] = 74'h0ac60ba4f5c49219071;
    stim[30] = 74'h0bc4e9755170c6368cb;
    stim[31] = 74'h1af0dbcf89c7dc7b1be;
    stim[32] = 74'h1b43c15e302b81623d0;
    stim[33] = 74'h1cd20e14c669454380c;
    stim[34] = 74'h1ff23d7346606e03676;
    stim[35] = 74'h127f27ba9382655fd9a;
    stim[36] = 74'h0ff03285ab42a21c3b0;
    stim[37] = 74'h1c7f01ef198b0c9a055;
    stim[38] = 74'h377182830c1e9de7a48;
    stim[39] = 74'h0d0aa514145a3ef85e0;
    stim[40] = 74'h025000355f94a7fbdb2;
    stim[41] = 74'h0e5dffc625bc8bb80f0;
    stim[42] = 74'h039a79823b89517910f;
    stim[43] = 74'h1671aeef3ae2198cbd9;
    stim[44] = 74'h3e2b58d64c1f6647ec8;
    stim[45] = 74'h1f030c913536b1dac27;
    stim[46] = 74'h1d2aa35e1b9d25ef748;
    stim[47] = 74'h070423ad50ffd467b8c;
    stim[48] = 74'h1b930cb6f55d6c518cb;
    stim[49] = 74'h0ecac051b89b80acb8f;
    stim[50] = 74'h0e469b8f93275b07d62;
    stim[51] = 74'h016fff4dbcf7a62446d;
    stim[52] = 74'h01c0566e68a0cf2674d;
    stim[53] = 74'h0e828288a33be451a73;
    stim[54] = 74'h08f4ceb59c2c391e4af;
    stim[55] = 74'h15ced0c345107f8bd22;
    stim[56] = 74'h0eda8019ff76ac8166b;
    stim[57] = 74'h222b70fe3f5c188a006;
    stim[58] = 74'h00af9cdfc664c4cf117;
    stim[59] = 74'h0bf37014dcad2fc864c;
    stim[60] = 74'h0d7184d127cf183023d;
    stim[61] = 74'h0b73ac1f896f3a42f26;
    stim[62] = 74'h1838f99604bf332f73a;
    stim[63] = 74'h00243f204694e43f8f6;
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
      expv[0] = 146'h0000000000000000000000000000000000000;
      expv[1] = 146'h0000000000000000000000000000000000000;
      expv[2] = 146'h0000000000000000000000000000000000000;
      expv[3] = 146'h0000000000000000000000000000000000000;
      expv[4] = 146'h14ab7a681a6745741f2a55bd35f2cc5d7a0f9;
      expv[5] = 146'h0000000000000000000000000000000000000;
      expv[6] = 146'h0000000000000000000000000000000000000;
      expv[7] = 146'h2b5ff7e7b6caa1908c35affbf2249aaf48461;
      expv[8] = 146'h3c68572e2f103b83b43e342b96e877e241da1;
      expv[9] = 146'h0000000000000000000000000000000000000;
      expv[10] = 146'h0000000000000000000000000000000000000;
      expv[11] = 146'h169b2516888bbe98472b4d928abbba20cc239;
      expv[12] = 146'h054e4fc7fea8211809a2a727e200abef8c04d;
      expv[13] = 146'h0000000000000000000000000000000000000;
      expv[14] = 146'h1b219eebe8bd3f4f07ed90cf740ba1606783f;
      expv[15] = 146'h0000000000000000000000000000000000000;
      expv[16] = 146'h0000000000000000000000000000000000000;
      expv[17] = 146'h1df29a3a987ffe27822ef94d1cb3c00113c11;
      expv[18] = 146'h0000000000000000000000000000000000000;
      expv[19] = 146'h0000000000000000000000000000000000000;
      expv[20] = 146'h142565a5132c47b263aa12b2d37669dc5931d;
      expv[21] = 146'h0000000000000000000000000000000000000;
      expv[22] = 146'h08e2d20b1e7aa5c31f2471690470c2ad218f9;
      expv[23] = 146'h3302d6ae1ac41e39c1b9816b56f29df11ce0d;
      expv[24] = 146'h0000000000000000000000000000000000000;
      expv[25] = 146'h3e1b7ef6566a4123483f0dbf7ad4cadf91a41;
      expv[26] = 146'h0000000000000000000000000000000000000;
      expv[27] = 146'h0000000000000000000000000000000000000;
      expv[28] = 146'h23d3fc61dbe2758a1631e9fe31120ec5450b1;
      expv[29] = 146'h0000000000000000000000000000000000000;
      expv[30] = 146'h158c1749eb8924320e2ac60ba50a3b6e19071;
      expv[31] = 146'h1789d2eaa2e18c6d196bc4e974ae8f39f68cb;
      expv[32] = 146'h0000000000000000000000000000000000000;
      expv[33] = 146'h0000000000000000000000000000000000000;
      expv[34] = 146'h0000000000000000000000000000000000000;
      expv[35] = 146'h0000000000000000000000000000000000000;
      expv[36] = 146'h0000000000000000000000000000000000000;
      expv[37] = 146'h0000000000000000000000000000000000000;
      expv[38] = 146'h0000000000000000000000000000000000000;
      expv[39] = 146'h0000000000000000000000000000000000000;
      expv[40] = 146'h0000000000000000000000000000000000000;
      expv[41] = 146'h0000000000000000000000000000000000000;
      expv[42] = 146'h0000000000000000000000000000000000000;
      expv[43] = 146'h0734f3047712a2f221e39a7983c476aeb910f;
      expv[44] = 146'h0000000000000000000000000000000000000;
      expv[45] = 146'h0000000000000000000000000000000000000;
      expv[46] = 146'h3e0619226a6d63b584ff030c90cac94e5ac27;
      expv[47] = 146'h0000000000000000000000000000000000000;
      expv[48] = 146'h0000000000000000000000000000000000000;
      expv[49] = 146'h3726196deabad8a3197b930cb70aa293d18cb;
      expv[50] = 146'h1d9580a37137015971eecac05047647f6cb8f;
      expv[51] = 146'h0000000000000000000000000000000000000;
      expv[52] = 146'h02dffe9b79ef4c488da16fff4c430859e446d;
      expv[53] = 146'h0380acdcd1419e4ce9a1c0566f975f30e674d;
      expv[54] = 146'h1d0505114677c8a34e6e8282895cc41bd1a73;
      expv[55] = 146'h11e99d6b3858723c95e8f4ceb463d3c71e4af;
      expv[56] = 146'h0000000000000000000000000000000000000;
      expv[57] = 146'h0000000000000000000000000000000000000;
      expv[58] = 146'h0000000000000000000000000000000000000;
      expv[59] = 146'h015f39bf8cc9899e22e0af9cde399b3b4f117;
      expv[60] = 146'h0000000000000000000000000000000000000;
      expv[61] = 146'h1ae309a24f9e306047ad7184d0d830e7f023d;
      expv[62] = 146'h0000000000000000000000000000000000000;
      expv[63] = 146'h0000000000000000000000000000000000000;
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
