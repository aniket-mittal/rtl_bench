// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ad_addsub dut (
    .clk(clk),
    .A(in_vec[64:33]),
    .Amax(in_vec[32:1]),
    .CE(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0bbc6bc80b37fc96f;
    stim[1] = 65'h19b5e75f1b1cc165e;
    stim[2] = 65'h17dfdb6269431856e;
    stim[3] = 65'h0511f4e62d69bce33;
    stim[4] = 65'h1b3ad9bbcd2b2f19f;
    stim[5] = 65'h122e55bd351b8cc0a;
    stim[6] = 65'h04a72c38eadbfb3ef;
    stim[7] = 65'h0f249085398c24c13;
    stim[8] = 65'h17112612cecc04d33;
    stim[9] = 65'h0999bb988b5610f2a;
    stim[10] = 65'h156f54699923a0f32;
    stim[11] = 65'h0b638f66efbadb279;
    stim[12] = 65'h14c87e2de117fcacd;
    stim[13] = 65'h0293ff0f6896d7e0d;
    stim[14] = 65'h0d024892d9e471e9a;
    stim[15] = 65'h1fe3ccedcbcd6fe95;
    stim[16] = 65'h03eda94233ac7550c;
    stim[17] = 65'h0b4c290883c616716;
    stim[18] = 65'h05bfaa47300430a59;
    stim[19] = 65'h02cad41ba1f4464bd;
    stim[20] = 65'h044b9d1c622f018e6;
    stim[21] = 65'h1f15bdd8c21a51ad9;
    stim[22] = 65'h1aef248ba94d6ecf4;
    stim[23] = 65'h08161d2f395e57152;
    stim[24] = 65'h1345075efd92ee284;
    stim[25] = 65'h18d07c6efdc17945a;
    stim[26] = 65'h1fac47aca5c6deb88;
    stim[27] = 65'h1489330275c2379fb;
    stim[28] = 65'h0ac0d1a912ba2e0cc;
    stim[29] = 65'h0463d58df060fc3db;
    stim[30] = 65'h00e9fcca37356ed44;
    stim[31] = 65'h1de7d721e24565f65;
    stim[32] = 65'h13f8d7629cbba2eec;
    stim[33] = 65'h016f0105fd4402254;
    stim[34] = 65'h1fd3e919238c024b2;
    stim[35] = 65'h137c85b627e289caf;
    stim[36] = 65'h0edf87e14d5660c0c;
    stim[37] = 65'h132a511c298addf27;
    stim[38] = 65'h0fb944ff8ad29eb72;
    stim[39] = 65'h118900329697e38b5;
    stim[40] = 65'h17edd632724a802f7;
    stim[41] = 65'h1ff404e6f833db9f7;
    stim[42] = 65'h0d39eccdbca855dd2;
    stim[43] = 65'h0d13b9f319e414aa6;
    stim[44] = 65'h0a7680fc83d377d2b;
    stim[45] = 65'h121e96ac1381b8b46;
    stim[46] = 65'h0b425d4d1368e9586;
    stim[47] = 65'h0507e325dfa94b3cc;
    stim[48] = 65'h1ef17eb464978f323;
    stim[49] = 65'h078d5926db1b06037;
    stim[50] = 65'h106e790978f029f4e;
    stim[51] = 65'h1265e0a45b01d5c8f;
    stim[52] = 65'h02aea1379fc9b4acf;
    stim[53] = 65'h1c2a559b2fa588feb;
    stim[54] = 65'h01c3c163fffab940e;
    stim[55] = 65'h03c3fd40150762e56;
    stim[56] = 65'h0b6e1e9de9179cdb1;
    stim[57] = 65'h13c79b8816a0d9e61;
    stim[58] = 65'h1a85756d94a9e6fa4;
    stim[59] = 65'h15cb3348ca19faf79;
    stim[60] = 65'h0d2322483dcb6264e;
    stim[61] = 65'h1cdf2d06f04dfdf1d;
    stim[62] = 65'h07756baf9ea09a84f;
    stim[63] = 65'h183aa03eecd0c5f53;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h5de35e3f;
      expv[5] = 32'hcdaf3af7;
      expv[6] = 32'h00000000;
      expv[7] = 32'h288fa730;
      expv[8] = 32'hd9d6cddd;
      expv[9] = 32'h9172ade8;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'hb8893095;
      expv[13] = 32'h4ccddcc3;
      expv[14] = 32'hab7aa34b;
      expv[15] = 32'h00000000;
      expv[16] = 32'ha643f16e;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'hff1e676d;
      expv[20] = 32'h1f6d4a10;
      expv[21] = 32'h00000000;
      expv[22] = 32'h2dfd5238;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h9a283af6;
      expv[29] = 32'h00000000;
      expv[30] = 32'hfd623d64;
      expv[31] = 32'h00000000;
      expv[32] = 32'h56068d47;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h9fc6bb13;
      expv[37] = 32'h00000000;
      expv[38] = 32'hfe9f48c8;
      expv[39] = 32'h00000000;
      expv[40] = 32'h76fc3f09;
      expv[41] = 32'h995288e0;
      expv[42] = 32'h7dca27fb;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'hffa02736;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h90f4b55f;
      expv[50] = 32'h5a12ea67;
      expv[51] = 32'h00000000;
      expv[52] = 32'hf78bf5a2;
      expv[53] = 32'h3c6ac935;
      expv[54] = 32'h8373c84a;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'he152acd8;
      expv[58] = 32'h0e1e0b1e;
      expv[59] = 32'h00000000;
      expv[60] = 32'h5b70f4ee;
      expv[61] = 32'h00000000;
      expv[62] = 32'hd42bab6b;
      expv[63] = 32'hae599a45;
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
