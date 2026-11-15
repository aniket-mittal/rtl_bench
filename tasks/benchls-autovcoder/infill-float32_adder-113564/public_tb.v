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

  autovcoder_113564 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .z(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h01781c52edc62dc4;
    stim[1] = 64'h885516bfdb64b7e5;
    stim[2] = 64'he6b9487d9d95aced;
    stim[3] = 64'hc87198dc3c3297b5;
    stim[4] = 64'hfb6ab22c02da5e2c;
    stim[5] = 64'hbf21a05d744b6624;
    stim[6] = 64'h5016236c5873bd02;
    stim[7] = 64'h64bd950d0a2e7202;
    stim[8] = 64'h53a5bce5d794cf36;
    stim[9] = 64'hab6f7442accf3073;
    stim[10] = 64'h26ef147d879734d4;
    stim[11] = 64'h99c7198bd4f58e4a;
    stim[12] = 64'hf203b6a59498b11a;
    stim[13] = 64'hd350e205b0dadb89;
    stim[14] = 64'hd96a728dcdb2444f;
    stim[15] = 64'hce23b46755d1c6f7;
    stim[16] = 64'h7ac111a514c706f8;
    stim[17] = 64'h5169d6055c8622c0;
    stim[18] = 64'h256a72d546d3892e;
    stim[19] = 64'h1972860f8309e3e2;
    stim[20] = 64'hd0ba246e8d4f7a9e;
    stim[21] = 64'h13d1afc69a7d78df;
    stim[22] = 64'hf3224ed248d8526d;
    stim[23] = 64'h2617fba0366919d0;
    stim[24] = 64'h3492ebe6a72f2d7a;
    stim[25] = 64'h0925715a9149ab5b;
    stim[26] = 64'h34b71d8ebaf0e330;
    stim[27] = 64'h7b15b73e5a76aea4;
    stim[28] = 64'h5a0e2a952e265744;
    stim[29] = 64'h3d1b8d1746ea7595;
    stim[30] = 64'h347e3f993ce74a30;
    stim[31] = 64'hd879a8f7c2cd237e;
    stim[32] = 64'h6c071c5563badfae;
    stim[33] = 64'h2d550a8f6e660b15;
    stim[34] = 64'h6e2358ddf85777d2;
    stim[35] = 64'h4a8955c9bc51792d;
    stim[36] = 64'h659a8ab738f03b56;
    stim[37] = 64'h462d33b97d66bf7a;
    stim[38] = 64'ha4ce8a22e9d171d6;
    stim[39] = 64'h6f309a217687250b;
    stim[40] = 64'h1f323179d2a917ea;
    stim[41] = 64'hdbad641408cc7b6f;
    stim[42] = 64'h3d3625aa9511d4a3;
    stim[43] = 64'h9b031de5ae8bce0b;
    stim[44] = 64'h3e46634d0a0259ce;
    stim[45] = 64'h4ecd90febf2f68ac;
    stim[46] = 64'h7dd34820dfd8a250;
    stim[47] = 64'hea254bd4af144385;
    stim[48] = 64'h0619957d6d5ceb4e;
    stim[49] = 64'h55a89f508a6299f2;
    stim[50] = 64'h5a4d426f5428218b;
    stim[51] = 64'hc99a8b4fe9380153;
    stim[52] = 64'hf0946bcae19b12cc;
    stim[53] = 64'h9407327519f621bc;
    stim[54] = 64'h152883012d1d00d1;
    stim[55] = 64'haab0556fe8d55b52;
    stim[56] = 64'hf0767f80c5663e3f;
    stim[57] = 64'h1592b4e421b3d8d5;
    stim[58] = 64'h232942075e668cc4;
    stim[59] = 64'h9e20017bdba3ad91;
    stim[60] = 64'h65637835b3691435;
    stim[61] = 64'h7c884fb232685209;
    stim[62] = 64'h33562de70672efef;
    stim[63] = 64'hcdbb772db2444587;
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
      expv[0] = 32'hedc62dc4;
      expv[1] = 32'hdb64b7e5;
      expv[2] = 32'he6b9487d;
      expv[3] = 32'hc87198dc;
      expv[4] = 32'hfb6ab22c;
      expv[5] = 32'h744b6624;
      expv[6] = 32'h5873bd98;
      expv[7] = 32'h64bd950d;
      expv[8] = 32'h579574f2;
      expv[9] = 32'haced1efb;
      expv[10] = 32'h26ef147d;
      expv[11] = 32'hd4f58e4a;
      expv[12] = 32'hf203b6a5;
      expv[13] = 32'hd350e205;
      expv[14] = 32'hd96a728d;
      expv[15] = 32'hd5d1c83e;
      expv[16] = 32'h7ac111a5;
      expv[17] = 32'h5c8622c0;
      expv[18] = 32'h46d3892e;
      expv[19] = 32'h1972860f;
      expv[20] = 32'hd0ba246e;
      expv[21] = 32'h1a7d7f6c;
      expv[22] = 32'hf3224ed2;
      expv[23] = 32'h366919d0;
      expv[24] = 32'h3492ebe6;
      expv[25] = 32'h1149ac00;
      expv[26] = 32'h3af0eea1;
      expv[27] = 32'h7b15b73e;
      expv[28] = 32'h5a0e2a95;
      expv[29] = 32'h46ea75a8;
      expv[30] = 32'h3ce74aaf;
      expv[31] = 32'hd879a8f7;
      expv[32] = 32'h6c071cb2;
      expv[33] = 32'h6e660b15;
      expv[34] = 32'h785777dc;
      expv[35] = 32'h4a8955c9;
      expv[36] = 32'h659a8ab7;
      expv[37] = 32'h7d66bf7a;
      expv[38] = 32'he9d171d6;
      expv[39] = 32'h7687266c;
      expv[40] = 32'hd2a917ea;
      expv[41] = 32'hdbad6414;
      expv[42] = 32'h3d3625aa;
      expv[43] = 32'hae8bce0b;
      expv[44] = 32'h3e46634d;
      expv[45] = 32'h4ecd90fe;
      expv[46] = 32'h7dd34820;
      expv[47] = 32'hea254bd4;
      expv[48] = 32'h6d5ceb4e;
      expv[49] = 32'h55a89f50;
      expv[50] = 32'h5a4d4cf1;
      expv[51] = 32'he9380153;
      expv[52] = 32'hf0946bca;
      expv[53] = 32'h99f632a2;
      expv[54] = 32'h2d1d00d1;
      expv[55] = 32'he8d55b52;
      expv[56] = 32'hf0767f80;
      expv[57] = 32'h21b3d8d5;
      expv[58] = 32'h5e668cc4;
      expv[59] = 32'hdba3ad91;
      expv[60] = 32'h65637835;
      expv[61] = 32'h7c884fb2;
      expv[62] = 32'h33562de7;
      expv[63] = 32'hcdbb772d;
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
