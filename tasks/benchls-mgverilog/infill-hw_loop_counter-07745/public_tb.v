// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07745 dut (
    .clk(clk),
    .rst(in_vec[38:38]),
    .inst_in(in_vec[37:18]),
    .i_fetch(in_vec[17:17]),
    .a_src(in_vec[16:11]),
    .pc_in(in_vec[10:0]),
    .pc_out(out_vec[16:6]),
    .branch(out_vec[5:5]),
    .skip(out_vec[4:4]),
    .lcount(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h750d875fcd;
    stim[1] = 39'h5b29776bf7;
    stim[2] = 39'h39c6e94a2d;
    stim[3] = 39'h1e0d0ba2c3;
    stim[4] = 39'h300949afe1;
    stim[5] = 39'h37084c28a4;
    stim[6] = 39'h2247187e85;
    stim[7] = 39'h3b2249ee1d;
    stim[8] = 39'h3badf1a7c0;
    stim[9] = 39'h2800447038;
    stim[10] = 39'h1ab11b76c9;
    stim[11] = 39'h097ea1fafd;
    stim[12] = 39'h175b8125e5;
    stim[13] = 39'h0adbd39ea7;
    stim[14] = 39'h3c06de801d;
    stim[15] = 39'h0a4f321e8c;
    stim[16] = 39'h3cdde0f002;
    stim[17] = 39'h1743062a3a;
    stim[18] = 39'h1a857bef03;
    stim[19] = 39'h2c5fbd551c;
    stim[20] = 39'h3f8c3c2890;
    stim[21] = 39'h3908928a9f;
    stim[22] = 39'h38acc3c935;
    stim[23] = 39'h131d2545ec;
    stim[24] = 39'h25074135ab;
    stim[25] = 39'h324e9d082c;
    stim[26] = 39'h12ceff9f7d;
    stim[27] = 39'h1bf01322c8;
    stim[28] = 39'h08324589a5;
    stim[29] = 39'h04d92ffa39;
    stim[30] = 39'h4a1f3285f8;
    stim[31] = 39'h3f08fe62dc;
    stim[32] = 39'h383a412712;
    stim[33] = 39'h283113ad69;
    stim[34] = 39'h3d3059501f;
    stim[35] = 39'h350363d7ab;
    stim[36] = 39'h014433e5aa;
    stim[37] = 39'h2c6b39b9f2;
    stim[38] = 39'h102818feb7;
    stim[39] = 39'h1a41afc7b9;
    stim[40] = 39'h20364620fc;
    stim[41] = 39'h6c51f60485;
    stim[42] = 39'h21615e4d54;
    stim[43] = 39'h269ba6ad22;
    stim[44] = 39'h09dcc2cb2b;
    stim[45] = 39'h003da213e9;
    stim[46] = 39'h3a921d8fb7;
    stim[47] = 39'h16b64754c5;
    stim[48] = 39'h1fac64d107;
    stim[49] = 39'h10c9ac0a02;
    stim[50] = 39'h13878acabf;
    stim[51] = 39'h13188a68a7;
    stim[52] = 39'h11059689b5;
    stim[53] = 39'h082969773a;
    stim[54] = 39'h26ff9c5eb2;
    stim[55] = 39'h2a0719929c;
    stim[56] = 39'h185e012a45;
    stim[57] = 39'h17a82771a8;
    stim[58] = 39'h2de85517c8;
    stim[59] = 39'h0f7c4d110e;
    stim[60] = 39'h1b5a04e369;
    stim[61] = 39'h3e1893e0b7;
    stim[62] = 39'h2cf35c3ebd;
    stim[63] = 39'h0952fe3340;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h16a8f;
      expv[38] = 17'h16a8f;
      expv[39] = 17'h16a8f;
      expv[40] = 17'h16a8f;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0fa41;
      expv[47] = 17'h0fa41;
      expv[48] = 17'h0fa41;
      expv[49] = 17'h0fa41;
      expv[50] = 17'h0fa41;
      expv[51] = 17'h0fa41;
      expv[52] = 17'h0fa41;
      expv[53] = 17'h0fa41;
      expv[54] = 17'h0fa41;
      expv[55] = 17'h0fa41;
      expv[56] = 17'h0fa41;
      expv[57] = 17'h0fa41;
      expv[58] = 17'h0fa41;
      expv[59] = 17'h0fa41;
      expv[60] = 17'h0fa41;
      expv[61] = 17'h0fa41;
      expv[62] = 17'h0fa41;
      expv[63] = 17'h0fa41;
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
