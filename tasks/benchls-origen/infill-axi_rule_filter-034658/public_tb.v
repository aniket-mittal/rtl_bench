// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034658 dut (
    .clk(clk),
    .rst_n(in_vec[129:129]),
    .fifo_data(in_vec[128:65]),
    .avalid(in_vec[64:64]),
    .rulein(in_vec[63:0]),
    .validout(out_vec[1:1]),
    .killout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h08afe10afb7faa0a8b63b0a030c60d211;
    stim[1] = 130'h0c21ccce13b4b6e637ad1ede11dc6528c;
    stim[2] = 130'h2c83db79764e2c2f78b91294e80df2f9b;
    stim[3] = 130'h21db463edc5d913082d18376c12f129c8;
    stim[4] = 130'h36420ba99e84fa49cc4f17d0a9900b43c;
    stim[5] = 130'h3d5959660fbeeef795d053d361b662175;
    stim[6] = 130'h2d3a2c773b8a3f6b4575fa7fdcda4ce4c;
    stim[7] = 130'h2f25d6b9dc1afa4a7818bd33efe397420;
    stim[8] = 130'h21d2a518b29030ac19492e31fcf72f7d5;
    stim[9] = 130'h24df97beaee67262a1f0085224a747ec7;
    stim[10] = 130'h2c35a9acfa58be05f7562a7d09481016b;
    stim[11] = 130'h26dcecd00ae705c66a5d5d5efae7f5a27;
    stim[12] = 130'h3a7d22a6ca1fdf38f514bd309e5293859;
    stim[13] = 130'h382eaa270e9928b8659e6aaf36c1a9427;
    stim[14] = 130'h2e016b43aed107c471abe8b792f39a626;
    stim[15] = 130'h2f1fc7af25db9bc5208a8cceee5b4d6c1;
    stim[16] = 130'h26e054d84f8acbbada819b19893efdadd;
    stim[17] = 130'h2ff9ad40af548fa29853584f51ab2bc4d;
    stim[18] = 130'h3eaed953a6afd5d215af66985d9eb7bb0;
    stim[19] = 130'h3b2173353457f9aba734cb6c36b4fc671;
    stim[20] = 130'h3a47c479e7381f7c97259c927a2e1bc8f;
    stim[21] = 130'h27cc7df0d0873eea5a893ecfbc2391bdd;
    stim[22] = 130'h34324fe412045caf9d27d7c13241ef204;
    stim[23] = 130'h251900066fc64905f8ee184c1ded7d112;
    stim[24] = 130'h35fb5c41dd01dc09aca9500b4c330c7bf;
    stim[25] = 130'h2ca1e72063c8dee1fa3890e9d736195ec;
    stim[26] = 130'h3844d79ab78336c84cc8ff3c6ec4181bc;
    stim[27] = 130'h3d160dfbc54920e35d231e30de096becb;
    stim[28] = 130'h32f41c22371d54ff9642b95448908e279;
    stim[29] = 130'h3c78338e2613349270268a8e7cdfd9970;
    stim[30] = 130'h3ead3ae8c277516531cfd4741a1336c30;
    stim[31] = 130'h27e9bf0cac15ff8248cfc86c086eadf23;
    stim[32] = 130'h2fe5fa3e97e364ad8a658f122276aebbb;
    stim[33] = 130'h222951de0daa34b8e5d4f879352e9fb03;
    stim[34] = 130'h27d2c267ba5c674b83d6b5ac804314c3b;
    stim[35] = 130'h320a86322e11196ead3fc7b36f790d4aa;
    stim[36] = 130'h25f7463eca38d4bb867061f66cc9e3b78;
    stim[37] = 130'h3b756229306a4fe025cd2a1e3ea4f1e3a;
    stim[38] = 130'h2ca2654e82475b72f913db40037a51754;
    stim[39] = 130'h227c9c3af36f56a3828ca14e5d839c073;
    stim[40] = 130'h359093e5447c603e744609c26fc45c491;
    stim[41] = 130'h250a1c48ccba9680807df2f2e3dc0bff8;
    stim[42] = 130'h3bd6eea908d2a8b8255bb22f151c9a2ca;
    stim[43] = 130'h334842d5b4f4cb3c890752635dcc10d2e;
    stim[44] = 130'h2b6960909bc2bb43fcb8ff0f2223efc04;
    stim[45] = 130'h331cc7948fc972537ea14d50152628f65;
    stim[46] = 130'h33ffbf78e339bb29f9afd9b8e39963630;
    stim[47] = 130'h28a62d53a311211df630f39b99fbfaf7e;
    stim[48] = 130'h29f9ec7256cf1385fc33d66c5185c88bd;
    stim[49] = 130'h28da424a3cd60ddac49a452306cbe4bcf;
    stim[50] = 130'h2a2e47ccd4b2ea6ea3132646bb190057b;
    stim[51] = 130'h27370084e0a8612e8391002e4a51fc8a8;
    stim[52] = 130'h34e3a8b901f6920b1cb4ee9005f371bd9;
    stim[53] = 130'h277492f1c9dfe908da89602e61c75121a;
    stim[54] = 130'h2b560accd443342c019bbc5080aa44f3d;
    stim[55] = 130'h3c712921a39ec8eb301d1df5d6066b20d;
    stim[56] = 130'h3f0bb75636c382aacf7efd2a9fbbaade5;
    stim[57] = 130'h21773ec83fedd6ccc96943915319caabc;
    stim[58] = 130'h34ca1c677a36535f8969aafd79a5b8693;
    stim[59] = 130'h3882c6449265b1b64567a33a53b7da257;
    stim[60] = 130'h17d8ffbfea779e4d0bd9bc018e3ac7422;
    stim[61] = 130'h22ea561f9c4345d4fce4dba9fc1977069;
    stim[62] = 130'h38f76c7a03688192fd9eaf876600ea024;
    stim[63] = 130'h28fdbc806b6db80be5eb04a647b90bbb2;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h2;
      expv[7] = 2'h0;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h0;
      expv[11] = 2'h2;
      expv[12] = 2'h0;
      expv[13] = 2'h2;
      expv[14] = 2'h0;
      expv[15] = 2'h2;
      expv[16] = 2'h0;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h0;
      expv[26] = 2'h2;
      expv[27] = 2'h0;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h2;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
