// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01321 dut (
    .clk(clk),
    .ptop(in_vec[39:30]),
    .pbot(in_vec[29:20]),
    .x(in_vec[19:10]),
    .y(in_vec[9:0]),
    .scan(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h9978351870;
    stim[1] = 40'h0141747a71;
    stim[2] = 40'hf2492fbf5c;
    stim[3] = 40'h65d6bb5c49;
    stim[4] = 40'hb6a561712a;
    stim[5] = 40'h74225bdedf;
    stim[6] = 40'h007f3f8465;
    stim[7] = 40'h6a1e623578;
    stim[8] = 40'h0ce94f41a1;
    stim[9] = 40'h741fb8ee3b;
    stim[10] = 40'head14ff6b0;
    stim[11] = 40'hdcd915db48;
    stim[12] = 40'hd84a9dcf11;
    stim[13] = 40'hf86b940c5a;
    stim[14] = 40'h6ab9c5d67c;
    stim[15] = 40'h249d523318;
    stim[16] = 40'ha32bc002d9;
    stim[17] = 40'hccfb39a560;
    stim[18] = 40'hf1bac14eb8;
    stim[19] = 40'had1dbecd22;
    stim[20] = 40'hc98a35cf00;
    stim[21] = 40'ha4ef76d8a1;
    stim[22] = 40'hcc96733156;
    stim[23] = 40'h9ff79373b0;
    stim[24] = 40'h0a3d2945bb;
    stim[25] = 40'hd726e973b0;
    stim[26] = 40'hf97ecad07b;
    stim[27] = 40'h904db57071;
    stim[28] = 40'hb118fde5ef;
    stim[29] = 40'h92735fc2a4;
    stim[30] = 40'h272595c3d5;
    stim[31] = 40'h9b1a2ab04b;
    stim[32] = 40'h3cf23495bb;
    stim[33] = 40'h114525d112;
    stim[34] = 40'h6bcb4cf88b;
    stim[35] = 40'h1d4806e304;
    stim[36] = 40'h2022cd6e23;
    stim[37] = 40'hf321cb8fc3;
    stim[38] = 40'h9754b6da98;
    stim[39] = 40'hc460c1eee9;
    stim[40] = 40'hc0b9029d89;
    stim[41] = 40'hbf52ede6de;
    stim[42] = 40'h4041e8ea6e;
    stim[43] = 40'h0dba1c901f;
    stim[44] = 40'h607b0fcb90;
    stim[45] = 40'h0c03c662db;
    stim[46] = 40'hdaa5969feb;
    stim[47] = 40'hd470e34b7b;
    stim[48] = 40'hbb11ad5dc6;
    stim[49] = 40'h14aa328661;
    stim[50] = 40'h30fc10e80f;
    stim[51] = 40'haa23b59b75;
    stim[52] = 40'hfefab58ce9;
    stim[53] = 40'h1c3629f2d2;
    stim[54] = 40'h2c4123c7a7;
    stim[55] = 40'hf35dcf71d2;
    stim[56] = 40'he66f6adbda;
    stim[57] = 40'hf01a2d6617;
    stim[58] = 40'h16cf74c068;
    stim[59] = 40'h146666f127;
    stim[60] = 40'hde5570b25e;
    stim[61] = 40'h0e0bbe5ab2;
    stim[62] = 40'h7d9674ec42;
    stim[63] = 40'h4090bce1ed;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
