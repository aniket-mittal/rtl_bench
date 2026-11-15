// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043175 dut (
    .i_Clock(clk),
    .i_Reset(in_vec[73:73]),
    .i_Start(in_vec[72:72]),
    .i_LED1_R(in_vec[71:64]),
    .i_LED1_G(in_vec[63:56]),
    .i_LED1_B(in_vec[55:48]),
    .i_LED2_R(in_vec[47:40]),
    .i_LED2_G(in_vec[39:32]),
    .i_LED2_B(in_vec[31:24]),
    .i_LED3_R(in_vec[23:16]),
    .i_LED3_G(in_vec[15:8]),
    .i_LED3_B(in_vec[7:0]),
    .o_Led(out_vec[1:1]),
    .o_Ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h28ed804b192b6e922b5;
    stim[1] = 74'h2e8eb5a1a020455d1af;
    stim[2] = 74'h15b09c641d90472122c;
    stim[3] = 74'h038f280f0b7a7eb1224;
    stim[4] = 74'h132fde0dc371a80710b;
    stim[5] = 74'h085026cfaa7fee9f730;
    stim[6] = 74'h1541c89619939654bea;
    stim[7] = 74'h04a9dd06cb9fe12ec45;
    stim[8] = 74'h20a428d5a7ce7cfd65d;
    stim[9] = 74'h096f270b62cbaa36d7d;
    stim[10] = 74'h189feb2d38949c610bd;
    stim[11] = 74'h0dfe302e66061ff156b;
    stim[12] = 74'h1c562e079750e5b72ff;
    stim[13] = 74'h1069578c85bef701d23;
    stim[14] = 74'h0e63c57f767a89c4754;
    stim[15] = 74'h184549d4f742dfdb7dd;
    stim[16] = 74'h0878d9a304577297115;
    stim[17] = 74'h186fdec60948feeb0f7;
    stim[18] = 74'h05d11e291d54ef7c70a;
    stim[19] = 74'h04aebf53b410de631cb;
    stim[20] = 74'h0f07a961318d0dbdffd;
    stim[21] = 74'h0461e422c1dfdb8bd63;
    stim[22] = 74'h1ca0e9e20cdeac87e31;
    stim[23] = 74'h05fe7221b89fb9b990e;
    stim[24] = 74'h1e3e3b6027925a07216;
    stim[25] = 74'h07db7f050a25f75a94a;
    stim[26] = 74'h0b62176afd4accddadc;
    stim[27] = 74'h0771a8a5f7e1b84e035;
    stim[28] = 74'h1f260ef03217c7cabb5;
    stim[29] = 74'h11b45d1afc79cadec30;
    stim[30] = 74'h19f17625cc15a2797a6;
    stim[31] = 74'h1486fe0ad18f6e1b3d3;
    stim[32] = 74'h01ac8a39ef70ed9f1ec;
    stim[33] = 74'h08dbba06b7eb10de7ff;
    stim[34] = 74'h0bc0761109ac867b7e1;
    stim[35] = 74'h0605f336cc6d19a5c5c;
    stim[36] = 74'h157e6bfc8776872e3ad;
    stim[37] = 74'h1b7ae978f78ee1e9ee9;
    stim[38] = 74'h1f58117f168e73890ae;
    stim[39] = 74'h062edc89ba1b601421c;
    stim[40] = 74'h013d9cdab5926f2b037;
    stim[41] = 74'h07283f9d16d72a82260;
    stim[42] = 74'h1febfc15ac65f6b0730;
    stim[43] = 74'h174178553289127fb98;
    stim[44] = 74'h06ca25df3bcab017800;
    stim[45] = 74'h08044874506b474ceeb;
    stim[46] = 74'h1f5f5c37ef617a0ff84;
    stim[47] = 74'h078f61cd036b0d9b51b;
    stim[48] = 74'h007b148dc578f037e64;
    stim[49] = 74'h045dbd2e7b2cde91952;
    stim[50] = 74'h1e8cb2db26585dee45c;
    stim[51] = 74'h0c71c510a7f9f2f3b3e;
    stim[52] = 74'h04757a9de4ec1321647;
    stim[53] = 74'h047b9e68eaed0e58d4d;
    stim[54] = 74'h1f3cdff3039e525b28c;
    stim[55] = 74'h08d9d6e5c4e928be90f;
    stim[56] = 74'h00b205060c9d66e2674;
    stim[57] = 74'h0fd9714288c836d8069;
    stim[58] = 74'h1d9468fc4cb95d9f101;
    stim[59] = 74'h1529cb6058e8afe2dd3;
    stim[60] = 74'h07bb431cdf49ef0b5b6;
    stim[61] = 74'h0f5a0112ac0f4325b32;
    stim[62] = 74'h16e8916f93fbecf1c8b;
    stim[63] = 74'h0c0c8200221579148c6;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
