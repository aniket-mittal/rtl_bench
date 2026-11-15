// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03753 dut (
    .sys_clk(clk),
    .alu_rst(in_vec[65:65]),
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .valid_i(in_vec[0:0]),
    .r(out_vec[32:1]),
    .valid_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2706308879b51d1a9;
    stim[1] = 66'h28aaee4454621dd86;
    stim[2] = 66'h1992d2b9b9ae2c2ff;
    stim[3] = 66'h0e0145261f28b98e8;
    stim[4] = 66'h1bcad1a5d2b330a8f;
    stim[5] = 66'h08799480076f7ec7e;
    stim[6] = 66'h1d0af55ed6f19a874;
    stim[7] = 66'h154280aa131329dfb;
    stim[8] = 66'h1e1b9bd2567ad8a85;
    stim[9] = 66'h0f13c0ca3564acf04;
    stim[10] = 66'h1b2fe527cb321ad0c;
    stim[11] = 66'h17ca0e7f30996adeb;
    stim[12] = 66'h058417075be9aaadd;
    stim[13] = 66'h0fbfdd99147f204e4;
    stim[14] = 66'h09e48ca0044f5e67f;
    stim[15] = 66'h347679ff05f622c1c;
    stim[16] = 66'h16462083aa621e087;
    stim[17] = 66'h1e3798ec7960dfb98;
    stim[18] = 66'h115cc15362f0844ec;
    stim[19] = 66'h1a80468dc1ac513cd;
    stim[20] = 66'h1e84a324c474145bf;
    stim[21] = 66'h18c536bd6b683bbdc;
    stim[22] = 66'h0a1d72588f1e2cacd;
    stim[23] = 66'h0b7e643be6b376557;
    stim[24] = 66'h07a54d5db26f40cac;
    stim[25] = 66'h08f9a299117038e03;
    stim[26] = 66'h0ee2e671b86ae7291;
    stim[27] = 66'h042adaf6cf50b110c;
    stim[28] = 66'h03f718f3c3c56365b;
    stim[29] = 66'h088163f40ce8f6264;
    stim[30] = 66'h17999bdaa9232c8b0;
    stim[31] = 66'h18dd17dca356a0b5e;
    stim[32] = 66'h0feba153b56673029;
    stim[33] = 66'h09b14e02b1f4289d9;
    stim[34] = 66'h053ff8494cc7cf2e2;
    stim[35] = 66'h150cce151058e0daa;
    stim[36] = 66'h0beb9889a111ad2d4;
    stim[37] = 66'h13bb094b53578c86c;
    stim[38] = 66'h18bc9547f09c6b729;
    stim[39] = 66'h191b23a5ba51cba5e;
    stim[40] = 66'h09fa8798246b4d614;
    stim[41] = 66'h0965ebe6abb91069c;
    stim[42] = 66'h04c148d9e60e84c0d;
    stim[43] = 66'h034ed4ee7fad3cac8;
    stim[44] = 66'h0852af6ca76a7b301;
    stim[45] = 66'h1ce5bbf55211e9cc1;
    stim[46] = 66'h2690e94aefb8c9dd2;
    stim[47] = 66'h1a0dc0d165e3d67c7;
    stim[48] = 66'h101ee96667c676863;
    stim[49] = 66'h157a1134013a878ea;
    stim[50] = 66'h093c189bed78a83f1;
    stim[51] = 66'h19a6bb9697ad20839;
    stim[52] = 66'h1e44449a40d8755e1;
    stim[53] = 66'h05a3a4594d3edd758;
    stim[54] = 66'h05dc828fb65d2c317;
    stim[55] = 66'h04de825b6aed1077c;
    stim[56] = 66'h01b8fff103f4ba604;
    stim[57] = 66'h01a4024387765b4c7;
    stim[58] = 66'h00eb6665fe6b02874;
    stim[59] = 66'h0d134193b0b645d7d;
    stim[60] = 66'h190f9242618b23dda;
    stim[61] = 66'h133e70df2bf582f96;
    stim[62] = 66'h049db346608c173c8;
    stim[63] = 66'h14c746f676edb43db;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'h18cd480fa;
      expv[5] = 33'h151e7e48c;
      expv[6] = 33'h0b51bf8bf;
      expv[7] = 33'h153ab0024;
      expv[8] = 33'h069015427;
      expv[9] = 33'h07f92d346;
      expv[10] = 33'h0c0da9122;
      expv[11] = 33'h006629363;
      expv[12] = 33'h0ca72987d;
      expv[13] = 33'h1c89867da;
      expv[14] = 33'h1e720ba08;
      expv[15] = 33'h0074b2589;
      expv[16] = 33'h19801d250;
      expv[17] = 33'h1c4efed7a;
      expv[18] = 33'h064424dac;
      expv[19] = 33'h127f18920;
      expv[20] = 33'h18b90e1c9;
      expv[21] = 33'h0fa8e2e14;
      expv[22] = 33'h1c5daf1bc;
      expv[23] = 33'h143cce1b1;
      expv[24] = 33'h1b09e6305;
      expv[25] = 33'h1c4010a8a;
      expv[26] = 33'h014bc44f3;
      expv[27] = 33'h0a427be63;
      expv[28] = 33'h1224ce146;
      expv[29] = 33'h1279fdb93;
      expv[30] = 33'h1f5fc7881;
      expv[31] = 33'h0b8c04292;
      expv[32] = 33'h0fcee03d1;
      expv[33] = 33'h0d7b21784;
      expv[34] = 33'h18ceb05ea;
      expv[35] = 33'h144492844;
      expv[36] = 33'h1d6362377;
      expv[37] = 33'h13b5cd70b;
      expv[38] = 33'h0a17c970c;
      expv[39] = 33'h0d7664f70;
      expv[40] = 33'h050e7cc18;
      expv[41] = 33'h0f23e5688;
      expv[42] = 33'h016962985;
      expv[43] = 33'h0b7e2f4d8;
      expv[44] = 33'h0676a28f4;
      expv[45] = 33'h0d312b8a8;
      expv[46] = 33'h02e07c00f;
      expv[47] = 33'h1b0c2b6d6;
      expv[48] = 33'h07ceeced2;
      expv[49] = 33'h0708554ac;
      expv[50] = 33'h0e5a334cc;
      expv[51] = 33'h180271e97;
      expv[52] = 33'h1ff5b2f49;
      expv[53] = 33'h1ec59c670;
      expv[54] = 33'h0ec5a62d7;
      expv[55] = 33'h0964b1197;
      expv[56] = 33'h172efb941;
      expv[57] = 33'h0af2f202c;
      expv[58] = 33'h1449fdb1b;
      expv[59] = 33'h07dbb5d62;
      expv[60] = 33'h0dc031916;
      expv[61] = 33'h012bf5493;
      expv[62] = 33'h176720902;
      expv[63] = 33'h15dace397;
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
