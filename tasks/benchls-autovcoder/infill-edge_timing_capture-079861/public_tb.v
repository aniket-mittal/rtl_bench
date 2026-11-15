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

  autovcoder_079861 dut (
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
    stim[0] = 18'h34526;
    stim[1] = 18'h33cd5;
    stim[2] = 18'h0c661;
    stim[3] = 18'h36906;
    stim[4] = 18'h330f6;
    stim[5] = 18'h0abc7;
    stim[6] = 18'h24e5c;
    stim[7] = 18'h354d4;
    stim[8] = 18'h0417e;
    stim[9] = 18'h10df8;
    stim[10] = 18'h14e8a;
    stim[11] = 18'h15b77;
    stim[12] = 18'h2924b;
    stim[13] = 18'h109e8;
    stim[14] = 18'h2446f;
    stim[15] = 18'h1779b;
    stim[16] = 18'h2b199;
    stim[17] = 18'h11080;
    stim[18] = 18'h02b08;
    stim[19] = 18'h27c5d;
    stim[20] = 18'h25b1a;
    stim[21] = 18'h0f6bf;
    stim[22] = 18'h371db;
    stim[23] = 18'h1b555;
    stim[24] = 18'h20a74;
    stim[25] = 18'h22d8b;
    stim[26] = 18'h06fb5;
    stim[27] = 18'h205e7;
    stim[28] = 18'h0eedc;
    stim[29] = 18'h25429;
    stim[30] = 18'h0050c;
    stim[31] = 18'h29d52;
    stim[32] = 18'h0987f;
    stim[33] = 18'h3e3b2;
    stim[34] = 18'h104ac;
    stim[35] = 18'h117c8;
    stim[36] = 18'h1a650;
    stim[37] = 18'h3d841;
    stim[38] = 18'h24626;
    stim[39] = 18'h04714;
    stim[40] = 18'h31e1d;
    stim[41] = 18'h08ad8;
    stim[42] = 18'h19257;
    stim[43] = 18'h0cdfd;
    stim[44] = 18'h182d5;
    stim[45] = 18'h02f98;
    stim[46] = 18'h36057;
    stim[47] = 18'h24116;
    stim[48] = 18'h11fe8;
    stim[49] = 18'h01fdd;
    stim[50] = 18'h3f8aa;
    stim[51] = 18'h219cb;
    stim[52] = 18'h23fb4;
    stim[53] = 18'h14bfe;
    stim[54] = 18'h3d7a8;
    stim[55] = 18'h068e6;
    stim[56] = 18'h2b222;
    stim[57] = 18'h2f5a4;
    stim[58] = 18'h1a339;
    stim[59] = 18'h1f694;
    stim[60] = 18'h3a863;
    stim[61] = 18'h10bd4;
    stim[62] = 18'h24bd3;
    stim[63] = 18'h2b0ff;
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
      expv[12] = 28'hxxxxxxx;
      expv[13] = 28'hxxxxxxx;
      expv[14] = 28'hxxxxxxx;
      expv[15] = 28'hxxxxxxx;
      expv[16] = 28'hxxxxxxx;
      expv[17] = 28'hxxxxxxx;
      expv[18] = 28'hxxxxxxx;
      expv[19] = 28'hxxxxxxx;
      expv[20] = 28'hxxxxxxx;
      expv[21] = 28'hxxxxxxx;
      expv[22] = 28'hxxxxxxx;
      expv[23] = 28'hxxxxxxx;
      expv[24] = 28'hxxxxxxx;
      expv[25] = 28'hxxxxxxx;
      expv[26] = 28'hxxxxxxx;
      expv[27] = 28'hxxxxxxx;
      expv[28] = 28'hxxxxxxx;
      expv[29] = 28'hxxxxxxx;
      expv[30] = 28'hxxxxxxx;
      expv[31] = 28'hxxxxxxx;
      expv[32] = 28'hxxxxxxx;
      expv[33] = 28'hxxxxxxx;
      expv[34] = 28'hxxxxxxx;
      expv[35] = 28'hxxxxxxx;
      expv[36] = 28'hxxxxxxx;
      expv[37] = 28'hxxxxxxx;
      expv[38] = 28'hxxxxxxx;
      expv[39] = 28'hxxxxxxx;
      expv[40] = 28'hxxxxxxx;
      expv[41] = 28'hxxxxxxx;
      expv[42] = 28'hxxxxxxx;
      expv[43] = 28'hxxxxxxx;
      expv[44] = 28'h8xxxxx5;
      expv[45] = 28'hxxxxxxx;
      expv[46] = 28'hxxxxxxx;
      expv[47] = 28'hxxxxxxx;
      expv[48] = 28'h6xxxxxf;
      expv[49] = 28'hxxxxxxx;
      expv[50] = 28'hxxxxxxx;
      expv[51] = 28'hxxxxxxx;
      expv[52] = 28'hxxxxxxx;
      expv[53] = 28'hxxxxxxx;
      expv[54] = 28'hxxxxxxx;
      expv[55] = 28'h8xxxxx5;
      expv[56] = 28'hxxxxxxx;
      expv[57] = 28'hxxxxxxx;
      expv[58] = 28'hxxxxxxx;
      expv[59] = 28'h6xxxxxf;
      expv[60] = 28'hxxxxxxx;
      expv[61] = 28'hexxxxx7;
      expv[62] = 28'hxxxxxxx;
      expv[63] = 28'hxxxxxxx;
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
