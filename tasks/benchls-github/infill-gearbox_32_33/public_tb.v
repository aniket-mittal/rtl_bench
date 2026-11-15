// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_32_33 dut (
    .clk(clk),
    .arst(in_vec[34:34]),
    .din(in_vec[33:2]),
    .din_valid(in_vec[1:1]),
    .din_slip(in_vec[0:0]),
    .dout(out_vec[33:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h7773d5e85;
    stim[1] = 35'h440e56ac9;
    stim[2] = 35'h064a74720;
    stim[3] = 35'h3fc4ff5cf;
    stim[4] = 35'h2e35f0e60;
    stim[5] = 35'h1067595e2;
    stim[6] = 35'h38b51e36f;
    stim[7] = 35'h00fb3311f;
    stim[8] = 35'h109ca699e;
    stim[9] = 35'h018cdf935;
    stim[10] = 35'h3706d40b8;
    stim[11] = 35'h275421396;
    stim[12] = 35'h37098c91e;
    stim[13] = 35'h1461373c2;
    stim[14] = 35'h0c5ee086a;
    stim[15] = 35'h2896ce793;
    stim[16] = 35'h2371b3263;
    stim[17] = 35'h0c61cdb13;
    stim[18] = 35'h3bf9742c1;
    stim[19] = 35'h2b7a45b65;
    stim[20] = 35'h2e07d87fe;
    stim[21] = 35'h106d21290;
    stim[22] = 35'h24dd12183;
    stim[23] = 35'h074059d73;
    stim[24] = 35'h103982b17;
    stim[25] = 35'h06ddf1e80;
    stim[26] = 35'h0605b3863;
    stim[27] = 35'h3627745e6;
    stim[28] = 35'h09814dff4;
    stim[29] = 35'h314fd1c22;
    stim[30] = 35'h3aaf46a86;
    stim[31] = 35'h12c4c7f85;
    stim[32] = 35'h090a2ff36;
    stim[33] = 35'h1ec44bf15;
    stim[34] = 35'h33025e8e7;
    stim[35] = 35'h275617c27;
    stim[36] = 35'h29b197214;
    stim[37] = 35'h1778f1133;
    stim[38] = 35'h11512a1ac;
    stim[39] = 35'h16d1e00de;
    stim[40] = 35'h180e9b069;
    stim[41] = 35'h36a1762d6;
    stim[42] = 35'h09de9225a;
    stim[43] = 35'h30e9c0b00;
    stim[44] = 35'h49d93e574;
    stim[45] = 35'h0c9d8c830;
    stim[46] = 35'h2c951c175;
    stim[47] = 35'h0e2ba142c;
    stim[48] = 35'h33583596d;
    stim[49] = 35'h272a9f214;
    stim[50] = 35'h2e1169497;
    stim[51] = 35'h2091f5ddd;
    stim[52] = 35'h3419fedac;
    stim[53] = 35'h3a81dc0e7;
    stim[54] = 35'h294beb3cd;
    stim[55] = 35'h30786bef1;
    stim[56] = 35'h3ffd4d800;
    stim[57] = 35'h1f2813cb6;
    stim[58] = 35'h145a93ac0;
    stim[59] = 35'h065a4d022;
    stim[60] = 35'h02fb6276f;
    stim[61] = 35'h233bcf3b5;
    stim[62] = 35'h3d47ac737;
    stim[63] = 35'h01d625213;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h0ff13fd72;
      expv[5] = 34'h0ff13fd72;
      expv[6] = 34'h000000001;
      expv[7] = 34'h2e0ceb2bd;
      expv[8] = 34'h07c5a8f1b;
      expv[9] = 34'h3381f6663;
      expv[10] = 34'h3381f6662;
      expv[11] = 34'h3381f6662;
      expv[12] = 34'h39509ca69;
      expv[13] = 34'h08f3aa109;
      expv[14] = 34'h0f0dc2633;
      expv[15] = 34'h10d28c26f;
      expv[16] = 34'h33c8c5ee1;
      expv[17] = 34'h264ca25b3;
      expv[18] = 34'h26d8a371b;
      expv[19] = 34'h26d8a371a;
      expv[20] = 34'h26d8a371a;
      expv[21] = 34'h361ff3187;
      expv[22] = 34'h361ff3186;
      expv[23] = 34'h112185c0f;
      expv[24] = 34'h01675d26f;
      expv[25] = 34'h3982b14e9;
      expv[26] = 34'h3982b14e8;
      expv[27] = 34'h016ce1881;
      expv[28] = 34'h04ee8bc8d;
      expv[29] = 34'h04ee8bc8c;
      expv[30] = 34'h14fd1c237;
      expv[31] = 34'h157a35439;
      expv[32] = 34'h157a35438;
      expv[33] = 34'h2428bfcdf;
      expv[34] = 34'h2428bfcde;
      expv[35] = 34'h33025e8e5;
      expv[36] = 34'h09d585f08;
      expv[37] = 34'h09d585f08;
      expv[38] = 34'h200000001;
      expv[39] = 34'h200000000;
      expv[40] = 34'h1d778f113;
      expv[41] = 34'h1d778f112;
      expv[42] = 34'h2ab68f007;
      expv[43] = 34'h16da85d8b;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h0b845a524;
      expv[52] = 34'h0b845a524;
      expv[53] = 34'h0b845a524;
      expv[54] = 34'h080000001;
      expv[55] = 34'h080000000;
      expv[56] = 34'h080000000;
      expv[57] = 34'h080000000;
      expv[58] = 34'h37a81dc0f;
      expv[59] = 34'h37a81dc0e;
      expv[60] = 34'h10f9409e5;
      expv[61] = 34'h2d9969341;
      expv[62] = 34'h2d9969340;
      expv[63] = 34'h39a2fb627;
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
