// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 95;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143170 dut (
    .a(in_vec[94:63]),
    .b(in_vec[62:31]),
    .cin(in_vec[30:30]),
    .sel(in_vec[29:24]),
    .data(in_vec[23:0]),
    .final_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 95'h478fe123df0ca65932258b0a;
    stim[1] = 95'h7fc78519427532c9273fab37;
    stim[2] = 95'h499222ba08ca1cbd5a9eb739;
    stim[3] = 95'h3159a086fd188314e488122f;
    stim[4] = 95'h5491c13d41cedacfef4eb677;
    stim[5] = 95'h3df5d927b19934e14e39dc7d;
    stim[6] = 95'h1cd815bbf2f4ee32a872834f;
    stim[7] = 95'h30f869642882279b62015fdb;
    stim[8] = 95'h63872c7eba888acd393768fb;
    stim[9] = 95'h54ff82f8f04e8cb965e29ed7;
    stim[10] = 95'h7f9675ffd01594f8c7386280;
    stim[11] = 95'h484f4458acb38303f30a88e5;
    stim[12] = 95'h1e3148ae7399bfb32f0f81f0;
    stim[13] = 95'h0bdbee4596dcd0d5053de38c;
    stim[14] = 95'h65c7c94507b1d878f2d3cf31;
    stim[15] = 95'h168f03446e52580b5deaf776;
    stim[16] = 95'h3a7c5b3f382e4d115e1fbf9b;
    stim[17] = 95'h7c724621b1099b973abd7f61;
    stim[18] = 95'h2d25a1d87ac9c84de358ee55;
    stim[19] = 95'h22062087e1fd1adb8767fec7;
    stim[20] = 95'h2f028cd8d5c90db5b72e1d21;
    stim[21] = 95'h0c39567ad53a0cf2c65a64b1;
    stim[22] = 95'h435a24534af4e4e9051da076;
    stim[23] = 95'h61de2e344b50019a4e5c9a8b;
    stim[24] = 95'h28f063f25faf8914d78f21fa;
    stim[25] = 95'h14c31d203a803738786ceb3b;
    stim[26] = 95'h642474efc358a76ff3131478;
    stim[27] = 95'h0c87218df03ef106e4ce0ade;
    stim[28] = 95'h57ef2dd31eaa24cb5701c464;
    stim[29] = 95'h59352c045ef47b37630931c5;
    stim[30] = 95'h4e55e8b205a9f54c03e54990;
    stim[31] = 95'h1c427aef6052e9ad73b7e1dc;
    stim[32] = 95'h3d00d371124539298e04c7e4;
    stim[33] = 95'h207b2cb5aec4cb4ba9e05b84;
    stim[34] = 95'h32998debe7ffdbbb85870f7c;
    stim[35] = 95'h5a43af2fb6a20fc8d9935a32;
    stim[36] = 95'h2001710f938267accc042caf;
    stim[37] = 95'h152bb432793a8cf0251cc922;
    stim[38] = 95'h43c698fd9f5a67d563f8e004;
    stim[39] = 95'h720cb9d572945ce0a83aee4f;
    stim[40] = 95'h560124b8d0200e05a18cc3d6;
    stim[41] = 95'h2fdfd93ecdfc7102d747823e;
    stim[42] = 95'h47de613ccad5cbe88c2c9cbe;
    stim[43] = 95'h1ef501cf3f9d3682066ccfc3;
    stim[44] = 95'h50813fccb4837f4be16d468c;
    stim[45] = 95'h4324411734cf9967047ace74;
    stim[46] = 95'h4b875d74884792139f454479;
    stim[47] = 95'h75c38ddc33206b2070a2962a;
    stim[48] = 95'h731c8799c664cf2f832c556a;
    stim[49] = 95'h4f6a3b95c77a9c444f244b05;
    stim[50] = 95'h5f8c785d9b55f205ffd2e3e4;
    stim[51] = 95'h30cb8860482c33694f969056;
    stim[52] = 95'h13e565b2f053f824abd9c47a;
    stim[53] = 95'h57bcf49f366f904df56acb41;
    stim[54] = 95'h79ced2e940f4a6cfa4aefca1;
    stim[55] = 95'h28516adbb419c1fbfe17354f;
    stim[56] = 95'h14a30eca040248140343a307;
    stim[57] = 95'h587049fe9584942f9afb52e9;
    stim[58] = 95'h34c831a44e7f01f184275cb2;
    stim[59] = 95'h6217448b8ae7c9f96423f221;
    stim[60] = 95'h0c9e25612fd845bc1fd6e165;
    stim[61] = 95'h66360781ab5c7cc70d5a2edd;
    stim[62] = 95'h03ef3d17525c38e59fd764e6;
    stim[63] = 95'h02aad4f9a848e38446e9619d;
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
      expv[0] = 32'h4d390ef9;
      expv[1] = 32'h84796fc4;
      expv[2] = 32'ha4b87eef;
      expv[3] = 32'h5ce44737;
      expv[4] = 32'h2cc1381a;
      expv[5] = 32'hdf1e1c12;
      expv[6] = 32'h1f9a07dc;
      expv[7] = 32'hb2f521ff;
      expv[8] = 32'h3c1f6e97;
      expv[9] = 32'h8a9c1f64;
      expv[10] = 32'h9f5815f1;
      expv[11] = 32'hea058eb9;
      expv[12] = 32'h239610c2;
      expv[13] = 32'h45717e35;
      expv[14] = 32'hdaf3437c;
      expv[15] = 32'h09c2b69f;
      expv[16] = 32'he55550a1;
      expv[17] = 32'h5af7c371;
      expv[18] = 32'h4fded44c;
      expv[19] = 32'h080676c6;
      expv[20] = 32'h0997351c;
      expv[21] = 32'hc2e6c6db;
      expv[22] = 32'h1c9e1278;
      expv[23] = 32'h5a5c5f9d;
      expv[24] = 32'h113fda0e;
      expv[25] = 32'h9e86a8b1;
      expv[26] = 32'h4efa38bf;
      expv[27] = 32'hf98c2529;
      expv[28] = 32'hed32a53d;
      expv[29] = 32'h70534e77;
      expv[30] = 32'ha7ffbbfc;
      expv[31] = 32'hf92ac939;
      expv[32] = 32'h9e8c1935;
      expv[33] = 32'h9e7ff002;
      expv[34] = 32'h3532d34e;
      expv[35] = 32'h21cb7df1;
      expv[36] = 32'h6707b179;
      expv[37] = 32'h1ccc8244;
      expv[38] = 32'hc64201a6;
      expv[39] = 32'hc9422d6b;
      expv[40] = 32'h4c42657c;
      expv[41] = 32'hfbb89483;
      expv[42] = 32'h25685a4a;
      expv[43] = 32'hbd2470a2;
      expv[44] = 32'h0a097e31;
      expv[45] = 32'hefe7b4fc;
      expv[46] = 32'ha79ddf10;
      expv[47] = 32'h51c7f1f9;
      expv[48] = 32'h7302ad92;
      expv[49] = 32'h2dc9afb4;
      expv[50] = 32'hf5c4d4c7;
      expv[51] = 32'hf1ef7793;
      expv[52] = 32'h0872bbae;
      expv[53] = 32'h1c5909da;
      expv[54] = 32'h7586f371;
      expv[55] = 32'hb8d659af;
      expv[56] = 32'h314aadbc;
      expv[57] = 32'hdbe9bc5c;
      expv[58] = 32'h068e672b;
      expv[59] = 32'hd9fe1d0a;
      expv[60] = 32'h78ecd63a;
      expv[61] = 32'h23250891;
      expv[62] = 32'hac96ebf9;
      expv[63] = 32'h55e770fc;
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
