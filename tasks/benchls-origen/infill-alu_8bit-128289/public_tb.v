// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128289 dut (
    .a(in_vec[18:11]),
    .b(in_vec[10:3]),
    .op(in_vec[2:0]),
    .result(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h77c63;
    stim[1] = 19'h04ac5;
    stim[2] = 19'h4ade9;
    stim[3] = 19'h576b5;
    stim[4] = 19'h52002;
    stim[5] = 19'h27564;
    stim[6] = 19'h44780;
    stim[7] = 19'h05fc1;
    stim[8] = 19'h5bf93;
    stim[9] = 19'h2aeb7;
    stim[10] = 19'h779f0;
    stim[11] = 19'h50718;
    stim[12] = 19'h7226f;
    stim[13] = 19'h1e296;
    stim[14] = 19'h3df69;
    stim[15] = 19'h61635;
    stim[16] = 19'h6beb5;
    stim[17] = 19'h2891b;
    stim[18] = 19'h4d533;
    stim[19] = 19'h5f31a;
    stim[20] = 19'h04e55;
    stim[21] = 19'h76a58;
    stim[22] = 19'h5dcb9;
    stim[23] = 19'h49424;
    stim[24] = 19'h3fe8a;
    stim[25] = 19'h7a264;
    stim[26] = 19'h6f4e7;
    stim[27] = 19'h5b66f;
    stim[28] = 19'h49215;
    stim[29] = 19'h141c8;
    stim[30] = 19'h4006a;
    stim[31] = 19'h5abc9;
    stim[32] = 19'h4e42f;
    stim[33] = 19'h03d7e;
    stim[34] = 19'h5462d;
    stim[35] = 19'h6220c;
    stim[36] = 19'h08e6a;
    stim[37] = 19'h2b7f1;
    stim[38] = 19'h12e5a;
    stim[39] = 19'h337ca;
    stim[40] = 19'h389c8;
    stim[41] = 19'h02d0c;
    stim[42] = 19'h36d0e;
    stim[43] = 19'h57ba3;
    stim[44] = 19'h28827;
    stim[45] = 19'h14648;
    stim[46] = 19'h2eb05;
    stim[47] = 19'h0c2ae;
    stim[48] = 19'h15a04;
    stim[49] = 19'h3ed38;
    stim[50] = 19'h3a17c;
    stim[51] = 19'h0018a;
    stim[52] = 19'h5174e;
    stim[53] = 19'h15eaa;
    stim[54] = 19'h367e2;
    stim[55] = 19'h1681b;
    stim[56] = 19'h0a8d8;
    stim[57] = 19'h721b2;
    stim[58] = 19'h0992c;
    stim[59] = 19'h2fdce;
    stim[60] = 19'h7eb4c;
    stim[61] = 19'h12b4e;
    stim[62] = 19'h7d9c9;
    stim[63] = 19'h29394;
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
      expv[0] = 8'h01;
      expv[1] = 8'h00;
      expv[2] = 8'hd8;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h78;
      expv[7] = 8'h13;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h2d;
      expv[11] = 8'h83;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h8e;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h02;
      expv[18] = 8'h00;
      expv[19] = 8'h7a;
      expv[20] = 8'h00;
      expv[21] = 8'h38;
      expv[22] = 8'h24;
      expv[23] = 8'h00;
      expv[24] = 8'haf;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h61;
      expv[30] = 8'h80;
      expv[31] = 8'h3c;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h9d;
      expv[37] = 8'h58;
      expv[38] = 8'h57;
      expv[39] = 8'h36;
      expv[40] = 8'haa;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h01;
      expv[44] = 8'h00;
      expv[45] = 8'hf1;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h24;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'hc7;
      expv[54] = 8'h50;
      expv[55] = 8'h0f;
      expv[56] = 8'h30;
      expv[57] = 8'h18;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'hc2;
      expv[63] = 8'h00;
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
