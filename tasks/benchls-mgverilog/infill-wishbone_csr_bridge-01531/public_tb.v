// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01531 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[99:99]),
    .wb_adr_i(in_vec[98:67]),
    .wb_dat_i(in_vec[66:35]),
    .wb_cyc_i(in_vec[34:34]),
    .wb_stb_i(in_vec[33:33]),
    .wb_we_i(in_vec[32:32]),
    .csr_di(in_vec[31:0]),
    .wb_dat_o(out_vec[79:48]),
    .wb_ack_o(out_vec[47:47]),
    .csr_a(out_vec[46:33]),
    .csr_we(out_vec[32:32]),
    .csr_do(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h83ff02d93165fa2eff6d384ee;
    stim[1] = 100'he2705e89e093b9eb3d92d2c84;
    stim[2] = 100'h585dd0522d938b1b82d9a7cd1;
    stim[3] = 100'h23c5e792e2e867eea4dffcf49;
    stim[4] = 100'h175158589ba80394199fa898b;
    stim[5] = 100'h34640592fcced11688abe4a2a;
    stim[6] = 100'h20573fc0b77176ba9b7dd7307;
    stim[7] = 100'h7be878e458f6b0abd98bd8ebb;
    stim[8] = 100'h522421e99968fdda30ae2ee24;
    stim[9] = 100'h60b501e0b58026990ebbfb3c5;
    stim[10] = 100'h4e76f8f208d5e4c45fbd1e078;
    stim[11] = 100'h581b85ed9440685d868278b53;
    stim[12] = 100'h32e83e9b05549e8f4700eb77c;
    stim[13] = 100'h1804a7c63f185498c208334c3;
    stim[14] = 100'h3229ac09489bc4a43af72f367;
    stim[15] = 100'h64c5043ad529ea8745e963a22;
    stim[16] = 100'h568afd4f2c1fa922bfacd45bb;
    stim[17] = 100'h58bb3acd1a34c15c343e97bce;
    stim[18] = 100'h0f9b0f04e5f34a9a074d0b6c2;
    stim[19] = 100'h379a23466b92ab480e14527b2;
    stim[20] = 100'h4d2d9722d77b8a6e0770ade92;
    stim[21] = 100'h22f42009b0472d7ab32536794;
    stim[22] = 100'h79bea9e34f62d1aceccbe098d;
    stim[23] = 100'h5dca2fe5a172bd45ca1247e0a;
    stim[24] = 100'h52659530efd9b3b267712685a;
    stim[25] = 100'h771d920f0a6d4c3fbe734a0f5;
    stim[26] = 100'h295c24e93de81e42aa03b9452;
    stim[27] = 100'h62b2295da4bd723c5f203add0;
    stim[28] = 100'h437198e9ac44062a07b56ea8c;
    stim[29] = 100'h1c7faa53c9250d7807e55a894;
    stim[30] = 100'h1c863c10c9bf92b611bac4fab;
    stim[31] = 100'h45fb3397ef15466586dd2eace;
    stim[32] = 100'h75a3dad0ccc9337a31c0a1083;
    stim[33] = 100'h103f6ea52b7c8cb9f40ce4a74;
    stim[34] = 100'h631d945dec958b139ade90680;
    stim[35] = 100'h7a7534367c8a0d6c392dab16a;
    stim[36] = 100'h6f80e9e8fda278580977ac680;
    stim[37] = 100'h49a670669feb6bc0e5280c8dd;
    stim[38] = 100'h70fca17afa47f1d163ca9ae19;
    stim[39] = 100'hd12dff548da80286fce9900ac;
    stim[40] = 100'h35ad847bdacc021562e6420b4;
    stim[41] = 100'h29d6d994d0e577770e9b5e2fa;
    stim[42] = 100'h2b9fcb4a72fb6ec4fba6b70fe;
    stim[43] = 100'h56324ce21695157eb17bdbcbf;
    stim[44] = 100'h6123d3554fa384e979384f570;
    stim[45] = 100'h460c595591a9968efb579f9a4;
    stim[46] = 100'h7d6e965a4c2c7f542bd46486d;
    stim[47] = 100'h0875ae08ad3a0d73264f90fca;
    stim[48] = 100'h6b7d441932e867526bac4ebf8;
    stim[49] = 100'h7ac6d4a5c5162abd01e50e915;
    stim[50] = 100'h34ddfe1f2d31829bc1dbeaef2;
    stim[51] = 100'h3754466b14dd9ba0a00d27138;
    stim[52] = 100'h00dc4e90a15f3335346171cb8;
    stim[53] = 100'h780dd29ed9e79eea4017dc02a;
    stim[54] = 100'h720094cec512bc65ccd41174d;
    stim[55] = 100'h6353940c832acc65caaa5eae7;
    stim[56] = 100'h158c6c73bd8220e0b62545df5;
    stim[57] = 100'h74fcb6a6855aa25628dd3da40;
    stim[58] = 100'h412ea4b6f240ccab31e3e5c41;
    stim[59] = 100'h2c9521ca0eeda2f9de6fbdf0a;
    stim[60] = 100'h7d46d972db56ea68543c2063d;
    stim[61] = 100'h291ce6a48c49999c626a9dc08;
    stim[62] = 100'h422356c236dc722c7b4e7d1d8;
    stim[63] = 100'h302d366382de62734aa1730d4;
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
      expv[0] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 80'hf6d384ee02d862cbf45d;
      expv[2] = 80'hd92d2c845e88c12773d6;
      expv[3] = 80'h2d9a7cd150525b271637;
      expv[4] = 80'h4dffcf496792c5d0cfdd;
      expv[5] = 80'h99fa898b585837500728;
      expv[6] = 80'h8abe4a2a0592f99da22d;
      expv[7] = 80'hb7dd73073fc06ee2ed75;
      expv[8] = 80'h98bd8ebb78e4b1ed6157;
      expv[9] = 80'h0ae2ee2421e832d1fbb4;
      expv[10] = 80'hebbfb3c501e06b004d32;
      expv[11] = 80'hfbd1e07878f211abc988;
      expv[12] = 80'h68278b5305ec2880d0bb;
      expv[13] = 80'h700eb77c3e9a0aa93d1e;
      expv[14] = 80'h208334c327c67e30a931;
      expv[15] = 80'haf72f3672c0891378948;
      expv[16] = 80'h5e963a22043aaa53d50e;
      expv[17] = 80'hfacd45bb7d4e583f5245;
      expv[18] = 80'h43e97bce3acc346982b8;
      expv[19] = 80'h74d0b6c20f04cbe69534;
      expv[20] = 80'he14527b22346d7255690;
      expv[21] = 80'h770ade921722aef714dc;
      expv[22] = 80'h325367942008608e5af5;
      expv[23] = 80'hccbe098d29e29ec5a359;
      expv[24] = 80'ha1247e0a2fe442e57a8b;
      expv[25] = 80'h7712685a9530dfb36764;
      expv[26] = 80'he734a0f5120e14da987f;
      expv[27] = 80'ha03b945224e87bd03c85;
      expv[28] = 80'hf203add0295c497ae478;
      expv[29] = 80'h7b56ea8c18e858880c54;
      expv[30] = 80'h7e55a8942a52924a1af0;
      expv[31] = 80'h1bac4fab3c10937f256c;
      expv[32] = 80'h6dd2eace3396de2a8ccb;
      expv[33] = 80'h1c0a10835ad0999266f4;
      expv[34] = 80'h40ce4a74eea556f91973;
      expv[35] = 80'hade90680145cd92b1627;
      expv[36] = 80'h92dab16a3436f9141ad8;
      expv[37] = 80'h977ac68069e8fb44f0b0;
      expv[38] = 80'h5280c8dd70663fd6d781;
      expv[39] = 80'h3ca9ae19217af48fe3a2;
      expv[40] = 80'hce9900ac7f541b50050d;
      expv[41] = 80'h2e6420b4047ab598042a;
      expv[42] = 80'he9b5e2fa5994a1caeeee;
      expv[43] = 80'hba6b70fecb4ae5f6dd89;
      expv[44] = 80'h17bdbcbf4ce22d2a2afd;
      expv[45] = 80'h9384f570d3559f4709d2;
      expv[46] = 80'hb579f9a4595423532d1d;
      expv[47] = 80'hbd46486d165a9858fea8;
      expv[48] = 80'h64f90fca2e085a741ae6;
      expv[49] = 80'hbac4ebf8441865d0cea4;
      expv[50] = 80'h1e50e91554a48a2c557a;
      expv[51] = 80'h1dbeaef2fe1e5a630537;
      expv[52] = 80'h00d27138466a29bb3741;
      expv[53] = 80'h46171cb84e9042be666a;
      expv[54] = 80'h017dc02a529eb3cf3dd4;
      expv[55] = 80'hcd41174d14ce8a2578cb;
      expv[56] = 80'haaa5eae7140c065598cb;
      expv[57] = 80'h62545df56c727b0441c1;
      expv[58] = 80'h8dd3da4036a60ab544ac;
      expv[59] = 80'h1e3e5c4124b6e4819956;
      expv[60] = 80'he6fbdf0a21ca1ddb45f3;
      expv[61] = 80'h43c2063d5972b6add4d0;
      expv[62] = 80'h26a9dc0866a418933338;
      expv[63] = 80'hb4e7d1d856c26db8e458;
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
