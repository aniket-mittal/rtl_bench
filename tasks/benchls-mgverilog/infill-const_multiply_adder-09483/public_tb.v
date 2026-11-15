// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09483 dut (
    .clk(clk),
    .din(in_vec[55:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h4e337b4f13c53c;
    stim[1] = 56'h3c8c79b291631c;
    stim[2] = 56'h0ee686aba481b7;
    stim[3] = 56'hb38aa4a35de8b5;
    stim[4] = 56'hb496a3be0cb5ff;
    stim[5] = 56'he6bc35d03b921c;
    stim[6] = 56'h8e45d42d18996d;
    stim[7] = 56'h7a9e197a485501;
    stim[8] = 56'hf86d38f9b12afe;
    stim[9] = 56'h3784c0f84d4029;
    stim[10] = 56'he3039e2aac94a5;
    stim[11] = 56'h628049204b6012;
    stim[12] = 56'h1b853862f44f4e;
    stim[13] = 56'h7f79aa1d828746;
    stim[14] = 56'hcf4a0b8da9eb48;
    stim[15] = 56'hdf31df8077336a;
    stim[16] = 56'h33e8231cf9b16c;
    stim[17] = 56'ha0a0d39ba8c76e;
    stim[18] = 56'h05bb96a89076c0;
    stim[19] = 56'h3152bbbf181e57;
    stim[20] = 56'ha001d6a42961a8;
    stim[21] = 56'hb61cc1b412b1bf;
    stim[22] = 56'h0a0e408e159033;
    stim[23] = 56'h69c71c2e730fc0;
    stim[24] = 56'h4ef94ac610b8fb;
    stim[25] = 56'h3f9bd9a6f68e43;
    stim[26] = 56'hfab1efc4c771a0;
    stim[27] = 56'h52875db504c7ab;
    stim[28] = 56'hfdb48df1f1482a;
    stim[29] = 56'h2a96011a1b4b26;
    stim[30] = 56'hb568c4234ba128;
    stim[31] = 56'h080ef1f27195a4;
    stim[32] = 56'had183cc2043702;
    stim[33] = 56'hc27dbab2064874;
    stim[34] = 56'h4927a53b31678f;
    stim[35] = 56'h2ee4b76ad344aa;
    stim[36] = 56'h79507a8556170c;
    stim[37] = 56'h582836129e2834;
    stim[38] = 56'h9afe0988a94fb9;
    stim[39] = 56'h3a1c2948f0e06b;
    stim[40] = 56'h6e48c166cb06ed;
    stim[41] = 56'h2729cdc02829b6;
    stim[42] = 56'h004c29b9a5a91f;
    stim[43] = 56'he423ca32fcbb6f;
    stim[44] = 56'h7232aaf2b6f81d;
    stim[45] = 56'h42cbe11c4d4f1b;
    stim[46] = 56'h740e64b3b80964;
    stim[47] = 56'h114338a1dad8fe;
    stim[48] = 56'h8c30edf5cdb470;
    stim[49] = 56'ha7050297f7ec2c;
    stim[50] = 56'hc50684cca3932b;
    stim[51] = 56'h142cd80a5d9169;
    stim[52] = 56'hc6f43d63ae04f1;
    stim[53] = 56'h2d4bec9525ba7b;
    stim[54] = 56'hdbdb8fa2fa2cd8;
    stim[55] = 56'h9ef0028b65e2f8;
    stim[56] = 56'hbf548e72d23185;
    stim[57] = 56'hdddaa3699c880d;
    stim[58] = 56'h5889749aaad846;
    stim[59] = 56'h0181901a02e9b3;
    stim[60] = 56'h8682e34436992c;
    stim[61] = 56'h0ad6319be45277;
    stim[62] = 56'h2bee5ac227ecf9;
    stim[63] = 56'hb7016944b41038;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'h3043;
      expv[4] = 16'h4506;
      expv[5] = 16'h5644;
      expv[6] = 16'h5188;
      expv[7] = 16'h4048;
      expv[8] = 16'h339e;
      expv[9] = 16'hffcc;
      expv[10] = 16'h27ae;
      expv[11] = 16'h3b83;
      expv[12] = 16'h01e1;
      expv[13] = 16'h4bad;
      expv[14] = 16'h2f04;
      expv[15] = 16'h08e0;
      expv[16] = 16'h4d9e;
      expv[17] = 16'h3db9;
      expv[18] = 16'h08bd;
      expv[19] = 16'h17c6;
      expv[20] = 16'h2560;
      expv[21] = 16'h50d5;
      expv[22] = 16'hf09e;
      expv[23] = 16'hf917;
      expv[24] = 16'hfb0f;
      expv[25] = 16'h1d83;
      expv[26] = 16'h2f05;
      expv[27] = 16'h390d;
      expv[28] = 16'hed84;
      expv[29] = 16'heb32;
      expv[30] = 16'h30e7;
      expv[31] = 16'h1ccd;
      expv[32] = 16'h196c;
      expv[33] = 16'h097c;
      expv[34] = 16'h0ed8;
      expv[35] = 16'h13fd;
      expv[36] = 16'hf65e;
      expv[37] = 16'h348e;
      expv[38] = 16'he202;
      expv[39] = 16'h2f45;
      expv[40] = 16'h2e0a;
      expv[41] = 16'h400d;
      expv[42] = 16'h0994;
      expv[43] = 16'hd096;
      expv[44] = 16'hf4de;
      expv[45] = 16'h3a54;
      expv[46] = 16'he767;
      expv[47] = 16'h1a01;
      expv[48] = 16'h0f3b;
      expv[49] = 16'hf698;
      expv[50] = 16'h0c14;
      expv[51] = 16'he4f2;
      expv[52] = 16'h0361;
      expv[53] = 16'h4425;
      expv[54] = 16'h08a8;
      expv[55] = 16'h43bb;
      expv[56] = 16'h08f9;
      expv[57] = 16'h2115;
      expv[58] = 16'h3f00;
      expv[59] = 16'h0d59;
      expv[60] = 16'h59ec;
      expv[61] = 16'h533a;
      expv[62] = 16'h3b58;
      expv[63] = 16'h0c6a;
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
