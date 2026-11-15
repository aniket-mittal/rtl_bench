// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01914 dut (
    .clk(clk),
    .Data_in(in_vec[34:3]),
    .write_to_stack(in_vec[2:2]),
    .read_from_stack(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .Data_out(out_vec[36:5]),
    .stack_full(out_vec[4:4]),
    .stack_almost_full(out_vec[3:3]),
    .stack_half_full(out_vec[2:2]),
    .stack_almost_empty(out_vec[1:1]),
    .stack_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h429aac0f3;
    stim[1] = 35'h577a732fd;
    stim[2] = 35'h3a8d2f0ee;
    stim[3] = 35'h5e23dfcd4;
    stim[4] = 35'h14c9a845e;
    stim[5] = 35'h0f44bf5aa;
    stim[6] = 35'h1460a1662;
    stim[7] = 35'h1890a9fc2;
    stim[8] = 35'h2b50669ba;
    stim[9] = 35'h5ab1828a6;
    stim[10] = 35'h58a22d1d6;
    stim[11] = 35'h098c39b00;
    stim[12] = 35'h2311a9dc4;
    stim[13] = 35'h63d5f59d6;
    stim[14] = 35'h2c87304a8;
    stim[15] = 35'h18d9e43fe;
    stim[16] = 35'h436379bda;
    stim[17] = 35'h7efc03c6e;
    stim[18] = 35'h775119f68;
    stim[19] = 35'h2f388f46a;
    stim[20] = 35'h715abff6c;
    stim[21] = 35'h60d1eafba;
    stim[22] = 35'h2283a547c;
    stim[23] = 35'h18d819ee8;
    stim[24] = 35'h5a54175ae;
    stim[25] = 35'h196699c6c;
    stim[26] = 35'h5c8575430;
    stim[27] = 35'h59e6058f2;
    stim[28] = 35'h5f9238994;
    stim[29] = 35'h4d46936e0;
    stim[30] = 35'h2e9010df6;
    stim[31] = 35'h04b9badd4;
    stim[32] = 35'h530c13edc;
    stim[33] = 35'h7a127be38;
    stim[34] = 35'h56ea32dd4;
    stim[35] = 35'h087c6009e;
    stim[36] = 35'h26df4598c;
    stim[37] = 35'h5a561bdae;
    stim[38] = 35'h13f10b792;
    stim[39] = 35'h79e58bc3a;
    stim[40] = 35'h0b56c4f24;
    stim[41] = 35'h74d5c9a18;
    stim[42] = 35'h165efe1ca;
    stim[43] = 35'h757157f66;
    stim[44] = 35'h21f595296;
    stim[45] = 35'h482f24874;
    stim[46] = 35'h0de8986c6;
    stim[47] = 35'h27a570b2e;
    stim[48] = 35'h4b3621218;
    stim[49] = 35'h77c53d464;
    stim[50] = 35'h3615f7c56;
    stim[51] = 35'h0655b4ebc;
    stim[52] = 35'h581e0c6f4;
    stim[53] = 35'h39d6928ea;
    stim[54] = 35'h4e5c41ac6;
    stim[55] = 35'h061215210;
    stim[56] = 35'h0d791b366;
    stim[57] = 35'h5734d6054;
    stim[58] = 35'h3bd58fd82;
    stim[59] = 35'h2373b5b20;
    stim[60] = 35'h6219d757c;
    stim[61] = 35'h2eda637ee;
    stim[62] = 35'h5d1c6e5ee;
    stim[63] = 35'h34e654568;
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
      expv[0] = 37'h0000000001;
      expv[1] = 37'h0000000001;
      expv[2] = 37'h0000000001;
      expv[3] = 37'h0000000000;
      expv[4] = 37'h0000000002;
      expv[5] = 37'h0ea34bc3a2;
      expv[6] = 37'h1788f7f340;
      expv[7] = 37'h05326a1161;
      expv[8] = 37'h05326a1161;
      expv[9] = 37'h05326a1161;
      expv[10] = 37'h05326a1160;
      expv[11] = 37'h16ac60a280;
      expv[12] = 37'h16ac60a280;
      expv[13] = 37'h16ac60a282;
      expv[14] = 37'h16288b4742;
      expv[15] = 37'h16288b4742;
      expv[16] = 37'h08c46a7702;
      expv[17] = 37'h18f57d6740;
      expv[18] = 37'h0636790fe0;
      expv[19] = 37'h0636790fe0;
      expv[20] = 37'h1fbf00f1a1;
      expv[21] = 37'h1fbf00f1a0;
      expv[22] = 37'h1c56affda1;
      expv[23] = 37'h1c56affda0;
      expv[24] = 37'h1c56affda0;
      expv[25] = 37'h08a0e951e0;
      expv[26] = 37'h08a0e951e2;
      expv[27] = 37'h08a0e951e2;
      expv[28] = 37'h169505d6a0;
      expv[29] = 37'h169505d6a2;
      expv[30] = 37'h169505d6a2;
      expv[31] = 37'h0659a671a2;
      expv[32] = 37'h0659a671a0;
      expv[33] = 37'h0659a671a4;
      expv[34] = 37'h0659a671a4;
      expv[35] = 37'h0659a671a0;
      expv[36] = 37'h17e48e2640;
      expv[37] = 37'h17e48e2648;
      expv[38] = 37'h0ba40437c8;
      expv[39] = 37'h012e6eb740;
      expv[40] = 37'h14c304fb64;
      expv[41] = 37'h14c304fb60;
      expv[42] = 37'h14c304fb60;
      expv[43] = 37'h15ba8cb744;
      expv[44] = 37'h021f180264;
      expv[45] = 37'h09b7d16624;
      expv[46] = 37'h09b7d16620;
      expv[47] = 37'h169586f6a0;
      expv[48] = 37'h02d5b13c80;
      expv[49] = 37'h02d5b13c80;
      expv[50] = 37'h02d5b13c88;
      expv[51] = 37'h1d5c55fd88;
      expv[52] = 37'h1d5c55fd80;
      expv[53] = 37'h1d5c55fd90;
      expv[54] = 37'h087d654a40;
      expv[55] = 37'h120bc921c0;
      expv[56] = 37'h120bc921c0;
      expv[57] = 37'h037a261b00;
      expv[58] = 37'h037a261b10;
      expv[59] = 37'h09e95c2ca0;
      expv[60] = 37'h09e95c2ca0;
      expv[61] = 37'h09e95c2cb0;
      expv[62] = 37'h1df14f5180;
      expv[63] = 37'h0d857df140;
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
