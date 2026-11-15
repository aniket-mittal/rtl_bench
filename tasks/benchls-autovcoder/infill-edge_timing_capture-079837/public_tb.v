// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079837 dut (
    .clk(clk),
    .run_polarity(in_vec[17:17]),
    .run_end(in_vec[16:16]),
    .select0(in_vec[15:15]),
    .select1(in_vec[14:14]),
    .tap(in_vec[13:7]),
    .run(in_vec[6:0]),
    .fall_lead(out_vec[27:21]),
    .fall_trail(out_vec[20:14]),
    .rise_lead(out_vec[13:7]),
    .rise_trail(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h29b6c;
    stim[1] = 18'h1edd7;
    stim[2] = 18'h0e5d4;
    stim[3] = 18'h2a202;
    stim[4] = 18'h14a85;
    stim[5] = 18'h27fa4;
    stim[6] = 18'h29bca;
    stim[7] = 18'h18209;
    stim[8] = 18'h1dbf3;
    stim[9] = 18'h3f941;
    stim[10] = 18'h39adc;
    stim[11] = 18'h1000a;
    stim[12] = 18'h04906;
    stim[13] = 18'h36acf;
    stim[14] = 18'h1897b;
    stim[15] = 18'h164cf;
    stim[16] = 18'h0a110;
    stim[17] = 18'h3dfb6;
    stim[18] = 18'h1fd61;
    stim[19] = 18'h34cf0;
    stim[20] = 18'h242bf;
    stim[21] = 18'h25d31;
    stim[22] = 18'h070de;
    stim[23] = 18'h33356;
    stim[24] = 18'h2ea70;
    stim[25] = 18'h1a03b;
    stim[26] = 18'h14b6e;
    stim[27] = 18'h016f2;
    stim[28] = 18'h1c53f;
    stim[29] = 18'h00a6e;
    stim[30] = 18'h2baca;
    stim[31] = 18'h0b4e2;
    stim[32] = 18'h1aaf2;
    stim[33] = 18'h2b87f;
    stim[34] = 18'h2ec9f;
    stim[35] = 18'h20acf;
    stim[36] = 18'h1f32c;
    stim[37] = 18'h3d9bc;
    stim[38] = 18'h2258d;
    stim[39] = 18'h0213e;
    stim[40] = 18'h08e11;
    stim[41] = 18'h1eed8;
    stim[42] = 18'h13259;
    stim[43] = 18'h27501;
    stim[44] = 18'h3187e;
    stim[45] = 18'h03f86;
    stim[46] = 18'h2776a;
    stim[47] = 18'h3ddca;
    stim[48] = 18'h2ccef;
    stim[49] = 18'h118d2;
    stim[50] = 18'h06929;
    stim[51] = 18'h35124;
    stim[52] = 18'h30cae;
    stim[53] = 18'h09ace;
    stim[54] = 18'h2d6db;
    stim[55] = 18'h2d161;
    stim[56] = 18'h1be10;
    stim[57] = 18'h308a2;
    stim[58] = 18'h34cb5;
    stim[59] = 18'h0737e;
    stim[60] = 18'h354e5;
    stim[61] = 18'h0cd80;
    stim[62] = 18'h3c6c4;
    stim[63] = 18'h3466e;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'hxxxxxxx;
      expv[2] = 28'hxxxxxxx;
      expv[3] = 28'hxxxxxxx;
      expv[4] = 28'hxxxxxxx;
      expv[5] = 28'hxxxxxxx;
      expv[6] = 28'hxxxxxxx;
      expv[7] = 28'hxxxxxxx;
      expv[8] = 28'hxxxxxxx;
      expv[9] = 28'hxxxxxxx;
      expv[10] = 28'hxxxxxxx;
      expv[11] = 28'hxxxxxxx;
      expv[12] = 28'hxx12dxx;
      expv[13] = 28'hxxxxxxx;
      expv[14] = 28'hxxxxxxx;
      expv[15] = 28'hxxxxxxx;
      expv[16] = 28'hxxxxxxx;
      expv[17] = 28'hxxxxxxx;
      expv[18] = 28'hxxxxxxx;
      expv[19] = 28'hxxd1bxx;
      expv[20] = 28'hexxxxx1;
      expv[21] = 28'hxxxxxxx;
      expv[22] = 28'hxxxxxxx;
      expv[23] = 28'hxx12dxx;
      expv[24] = 28'hxxxxxxx;
      expv[25] = 28'hxxxxxxx;
      expv[26] = 28'hxxxxxxx;
      expv[27] = 28'hxxxxxxx;
      expv[28] = 28'h7xxxxx9;
      expv[29] = 28'hxx67dxx;
      expv[30] = 28'hxxd1bxx;
      expv[31] = 28'hexxxxx1;
      expv[32] = 28'hxxxxxxx;
      expv[33] = 28'hxxxxxxx;
      expv[34] = 28'hxx12dxx;
      expv[35] = 28'hxxxxxxx;
      expv[36] = 28'hxxxxxxx;
      expv[37] = 28'hxxxxxxx;
      expv[38] = 28'hxxxxxxx;
      expv[39] = 28'h7eec509;
      expv[40] = 28'hxx67dxx;
      expv[41] = 28'hxxd1bxx;
      expv[42] = 28'hexxxxx1;
      expv[43] = 28'hxxxxxxx;
      expv[44] = 28'hxxxxxxx;
      expv[45] = 28'hxx12dxx;
      expv[46] = 28'hxxxxxxx;
      expv[47] = 28'hxxeb3xx;
      expv[48] = 28'h6xxxxx7;
      expv[49] = 28'hxxxxxxx;
      expv[50] = 28'h7eec509;
      expv[51] = 28'hxx67dxx;
      expv[52] = 28'hxx16exx;
      expv[53] = 28'hexxxxx1;
      expv[54] = 28'hxxxxxxx;
      expv[55] = 28'hxxxxxxx;
      expv[56] = 28'hxx12dxx;
      expv[57] = 28'hxxxxxxx;
      expv[58] = 28'h76eb361;
      expv[59] = 28'h6xxxxx7;
      expv[60] = 28'hxxxxxxx;
      expv[61] = 28'h7eec509;
      expv[62] = 28'hxx67dxx;
      expv[63] = 28'hxx16exx;
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
