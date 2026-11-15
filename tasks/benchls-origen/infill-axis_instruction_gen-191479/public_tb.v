// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191479 dut (
    .clk(clk),
    .rst(in_vec[129:129]),
    .instruction(in_vec[128:1]),
    .instrc_valid(in_vec[0:0]),
    .axis_ready(out_vec[35:35]),
    .axis_data(out_vec[34:3]),
    .axis_valid(out_vec[2:2]),
    .axis_last(out_vec[1:1]),
    .generate_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h2c054ad2c54d5702d07fc27e965bf21a2;
    stim[1] = 130'h34b7ee27d8dda012921b0b50047af255c;
    stim[2] = 130'h15d45434b66ca8ed16d9210fb8e714dd2;
    stim[3] = 130'h08e8067aef092bfb50cb65762e227e09b;
    stim[4] = 130'h17d1fbd56f8f958cd352f4548209101ca;
    stim[5] = 130'h1478b47eee15c3e0c62e231b0d997163f;
    stim[6] = 130'h2682074b171cea65b17a0cc52082d54aa;
    stim[7] = 130'h15b9a26a4f943c76583dda6ce68cf8ee8;
    stim[8] = 130'h189e05dcc2e954091b897706552040a9e;
    stim[9] = 130'h18cf8ebda81aa3e1cf9eefbe0fe1f4886;
    stim[10] = 130'h068ac08185cca025e7a9b41473161a46b;
    stim[11] = 130'h147ef17f330b76e779414621cd50adbad;
    stim[12] = 130'h1c628c4f7da37602ba92a0f7b2844d596;
    stim[13] = 130'h0638f138f669ead5e991818493f072a0c;
    stim[14] = 130'h18d2d0380298f726337b0e126f04e7080;
    stim[15] = 130'h0a685b1b908effc92315211d82a365372;
    stim[16] = 130'h282e8c54545eb7874c9eceb8696048bf0;
    stim[17] = 130'h131c0d69690737d9f5fb04bb3c56a1717;
    stim[18] = 130'h16ac994e04ba909ced2e40d615853c291;
    stim[19] = 130'h09bbbd4a0256d25b5ca0e95dbfd005ce6;
    stim[20] = 130'h050828b54be79826ff4e3bae0067ed594;
    stim[21] = 130'h186ab658bcce3340deb7cf6975cd627ae;
    stim[22] = 130'h1d0a0843c0cd6871b1e3ed82ab889e5ee;
    stim[23] = 130'h11785ef7b1ae8e93d07c0d34fe0c778f4;
    stim[24] = 130'h1ae2f632f1bb756a6645c667b4e84f7a6;
    stim[25] = 130'h001c43f2a8b005b8e886b30a7352d7c6a;
    stim[26] = 130'h12795f5ae603565572e80a443faff42a9;
    stim[27] = 130'h055ffed07a76f889bb3e7dc4292d9e421;
    stim[28] = 130'h0cc44d75f3c1332b46af6ff461fecbba0;
    stim[29] = 130'h0a3afbc17e7e8419efd2e12fb2f4e87a3;
    stim[30] = 130'h012fa3b3c60b421886311dd1916096672;
    stim[31] = 130'h16ff68c3d90fe1882191b0bbe98fb5259;
    stim[32] = 130'h18ee5515bc6c77f106aed25478194aaa7;
    stim[33] = 130'h30ad95ab161f4ccc5043e212f77c6b8d0;
    stim[34] = 130'h1be7434c3257e20bcb42ec05eb351ae60;
    stim[35] = 130'h135c791f469a24494330e7a607553e50d;
    stim[36] = 130'h0a72bba5585149f45a40ef30b153c52f5;
    stim[37] = 130'h1ecad5232eacaffbea7869dac234e17dd;
    stim[38] = 130'h1820ddb5d38885c43819132f09462d367;
    stim[39] = 130'h063f725b25aae24a96035733046827c4d;
    stim[40] = 130'h0704f3ae274b0c95f9561df5ec92b7e7f;
    stim[41] = 130'h1c1562cf1c8c1d7b2bd951c2353d5434a;
    stim[42] = 130'h115ba12eb4ad3b8ba8ade808b24c3e9c2;
    stim[43] = 130'h1dfca91e9f7d7b6ce7ec950836967ce00;
    stim[44] = 130'h08630f376d1d8f3d29e1c2af843a9b3bd;
    stim[45] = 130'h0461c8542713ad148a80bd15c23b3de1e;
    stim[46] = 130'h18864f3436b23d69a4b65adb4c11b2be3;
    stim[47] = 130'h1ac0436c29944b5eb03491c1e42a1c517;
    stim[48] = 130'h01a3e29fd200ad47f1d774e8bbb60a43c;
    stim[49] = 130'h014aabacf263a3145ddc07a73784296a4;
    stim[50] = 130'h1b2619eebb8195929ccd3620f9a3c9abb;
    stim[51] = 130'h01ed181787c7566bac57e93cc8196bd14;
    stim[52] = 130'h0437dff8e149e72cbb0ea72f7497920b4;
    stim[53] = 130'h12550c6c3397e24862b2b48e1f95bf60d;
    stim[54] = 130'h1b77997f66df7fec3db83b1ae3cde6943;
    stim[55] = 130'h12fd8397fd28466d7847a913997eb0117;
    stim[56] = 130'h0819e8c0facae029574dd957371edd1f5;
    stim[57] = 130'h04af256c8e7f4fb18749afca608253cdb;
    stim[58] = 130'h1a343a4c2ac326f6e109b7bb020978877;
    stim[59] = 130'h0bb85e930eac9cd9892a54f2cbdea61f2;
    stim[60] = 130'h1b3b218cef4cf56d052a8614ae38faeaa;
    stim[61] = 130'h00efea2351c76cf4f09ee32096152323a;
    stim[62] = 130'h13584a1eb94c3cb33b55598ed7c5669dd;
    stim[63] = 130'h13397b8a76a70cecee5567276b3b9e44e;
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
      expv[0] = 36'hd96fc8688;
      expv[1] = 36'h91ebc9570;
      expv[2] = 36'he39c53748;
      expv[3] = 36'hb889f8268;
      expv[4] = 36'h882440728;
      expv[5] = 36'hb665c58f8;
      expv[6] = 36'h820b552a8;
      expv[7] = 36'h9a33e3ba0;
      expv[8] = 36'hd48102a78;
      expv[9] = 36'hbf87d2218;
      expv[10] = 36'hcc58691a8;
      expv[11] = 36'hb542b6eb0;
      expv[12] = 36'hca1135658;
      expv[13] = 36'hcfc1ca830;
      expv[14] = 36'hbc139c200;
      expv[15] = 36'h8a8d94dc8;
      expv[16] = 36'ha58122fc0;
      expv[17] = 36'hf15a85c58;
      expv[18] = 36'hd614f0a40;
      expv[19] = 36'hff4017398;
      expv[20] = 36'h819fb5650;
      expv[21] = 36'hd73589eb8;
      expv[22] = 36'hae22797b8;
      expv[23] = 36'hf831de3d0;
      expv[24] = 36'hd3a13de98;
      expv[25] = 36'hcd4b5f1a8;
      expv[26] = 36'hfebfd0aa0;
      expv[27] = 36'ha4b679080;
      expv[28] = 36'h87fb2ee80;
      expv[29] = 36'hcbd3a1e88;
      expv[30] = 36'hc582599c8;
      expv[31] = 36'ha63ed4960;
      expv[32] = 36'he0652aa98;
      expv[33] = 36'hddf1ae340;
      expv[34] = 36'hacd46b980;
      expv[35] = 36'h9d54f9430;
      expv[36] = 36'hc54f14bd0;
      expv[37] = 36'h88d385f70;
      expv[38] = 36'ha518b4d98;
      expv[39] = 36'h91a09f130;
      expv[40] = 36'hb24adf9f8;
      expv[41] = 36'hd4f550d28;
      expv[42] = 36'hc930fa708;
      expv[43] = 36'hda59f3800;
      expv[44] = 36'h90ea6cef0;
      expv[45] = 36'h88ecf7878;
      expv[46] = 36'hb046caf88;
      expv[47] = 36'h90a871458;
      expv[48] = 36'heed8290f0;
      expv[49] = 36'hde10a5a90;
      expv[50] = 36'he68f26ae8;
      expv[51] = 36'ha065af450;
      expv[52] = 36'hd25e482d0;
      expv[53] = 36'hfe56fd830;
      expv[54] = 36'h8f379a508;
      expv[55] = 36'he5fac0458;
      expv[56] = 36'hdc7b747d0;
      expv[57] = 36'h82094f368;
      expv[58] = 36'h8825e21d8;
      expv[59] = 36'haf7a987c8;
      expv[60] = 36'hb8e3ebaa8;
      expv[61] = 36'hd8548c8e8;
      expv[62] = 36'hdf159a770;
      expv[63] = 36'hacee79138;
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
