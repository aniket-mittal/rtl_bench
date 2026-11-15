// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00359 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h68cbabfdd09;
    stim[1] = 43'h6963c698deb;
    stim[2] = 43'h243c53b609f;
    stim[3] = 43'h4c1f5908da5;
    stim[4] = 43'h29205679a65;
    stim[5] = 43'h3717b2a9c4e;
    stim[6] = 43'h511e0b915f9;
    stim[7] = 43'h6e3b04820fe;
    stim[8] = 43'h01196d140c1;
    stim[9] = 43'h1e91948152c;
    stim[10] = 43'h518ea7585c4;
    stim[11] = 43'h69b8b1a6efd;
    stim[12] = 43'h3da45c8b03f;
    stim[13] = 43'h493ff502501;
    stim[14] = 43'h0c33acfaebb;
    stim[15] = 43'h358ce98792a;
    stim[16] = 43'h57a292fcc44;
    stim[17] = 43'h0db4d85ba98;
    stim[18] = 43'h0cb28dcedb1;
    stim[19] = 43'h10a66f65123;
    stim[20] = 43'h13a8883dad7;
    stim[21] = 43'h7220c290035;
    stim[22] = 43'h2193fe4b370;
    stim[23] = 43'h001e11cb53d;
    stim[24] = 43'h11aae646ed9;
    stim[25] = 43'h4e1a45bcda5;
    stim[26] = 43'h20a5c8a0a73;
    stim[27] = 43'h4135bd1d572;
    stim[28] = 43'h1209d04c488;
    stim[29] = 43'h278b11248af;
    stim[30] = 43'h7723eef8a85;
    stim[31] = 43'h31de85f3abf;
    stim[32] = 43'h29ac070f20e;
    stim[33] = 43'h6aa4fa41370;
    stim[34] = 43'h2fbc08090c4;
    stim[35] = 43'h060f6b11117;
    stim[36] = 43'h1f084c48381;
    stim[37] = 43'h7b802c6c67d;
    stim[38] = 43'h351b0c4943a;
    stim[39] = 43'h59bccfb84ee;
    stim[40] = 43'h27832d1a49c;
    stim[41] = 43'h09b4bad8560;
    stim[42] = 43'h121b67e52fd;
    stim[43] = 43'h3d3eae87c80;
    stim[44] = 43'h2fbbc89cb42;
    stim[45] = 43'h15213e241c8;
    stim[46] = 43'h44913539b4b;
    stim[47] = 43'h0704feeb9b9;
    stim[48] = 43'h7386a0d4e2a;
    stim[49] = 43'h68a589e25c5;
    stim[50] = 43'h0b2937e2438;
    stim[51] = 43'h7ca56f7b507;
    stim[52] = 43'h0788f1ffdd3;
    stim[53] = 43'h343c002261b;
    stim[54] = 43'h2ebf2c62b96;
    stim[55] = 43'h121ff176e3c;
    stim[56] = 43'h05a3ca9bedc;
    stim[57] = 43'h4090813b588;
    stim[58] = 43'h6ab8171dc81;
    stim[59] = 43'h7c34092529f;
    stim[60] = 43'h65bb24b3922;
    stim[61] = 43'h6709f2d9746;
    stim[62] = 43'h00aa338a3c6;
    stim[63] = 43'h3f11bb3055f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hc53b609f;
      expv[4] = 32'h63a1fd45;
      expv[5] = 32'h63a1fd45;
      expv[6] = 32'h710e34af;
      expv[7] = 32'he0b915f9;
      expv[8] = 32'hb04820fe;
      expv[9] = 32'hd189a09b;
      expv[10] = 32'h1948152c;
      expv[11] = 32'h1948152c;
      expv[12] = 32'h8b1a6efd;
      expv[13] = 32'h44f1b977;
      expv[14] = 32'h1dc4a6d5;
      expv[15] = 32'h95e58c3b;
      expv[16] = 32'hbd4d5945;
      expv[17] = 32'hbd4d5945;
      expv[18] = 32'h08caa58e;
      expv[19] = 32'h8bf77331;
      expv[20] = 32'hdbec3570;
      expv[21] = 32'h4a075c17;
      expv[22] = 32'h9a345424;
      expv[23] = 32'he86e9a15;
      expv[24] = 32'he11cb53d;
      expv[25] = 32'he11cb53d;
      expv[26] = 32'h48bd90ff;
      expv[27] = 32'h48bd90ff;
      expv[28] = 32'h9f590f47;
      expv[29] = 32'h24d31a4b;
      expv[30] = 32'h24d31a4b;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h75d48f4e;
      expv[35] = 32'h25a01d1e;
      expv[36] = 32'h6f23d6e9;
      expv[37] = 32'h6f23d6e9;
      expv[38] = 32'h6f23d6e9;
      expv[39] = 32'hb0c4943a;
      expv[40] = 32'hccfb84ee;
      expv[41] = 32'h237f4daa;
      expv[42] = 32'h4bad8560;
      expv[43] = 32'hf31a2477;
      expv[44] = 32'heae87c80;
      expv[45] = 32'hcd61bf0e;
      expv[46] = 32'h4d200a70;
      expv[47] = 32'h92e8e5a2;
      expv[48] = 32'h92e8e5a2;
      expv[49] = 32'h92e8e5a2;
      expv[50] = 32'h92e8e5a2;
      expv[51] = 32'hd120f6be;
      expv[52] = 32'h633b78bc;
      expv[53] = 32'h31ef5588;
      expv[54] = 32'hc002261b;
      expv[55] = 32'hd501a5e6;
      expv[56] = 32'h4ea1ef06;
      expv[57] = 32'h4ea1ef06;
      expv[58] = 32'h82ac1f3c;
      expv[59] = 32'h8171dc81;
      expv[60] = 32'h1a4f5e73;
      expv[61] = 32'h8375691f;
      expv[62] = 32'h67e78087;
      expv[63] = 32'h67e78087;
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
