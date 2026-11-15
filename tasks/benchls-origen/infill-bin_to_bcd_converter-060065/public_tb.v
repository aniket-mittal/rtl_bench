// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060065 dut (
    .clk_50M(clk),
    .rst(in_vec[35:35]),
    .bin(in_vec[34:7]),
    .duty_bin(in_vec[6:0]),
    .number(out_vec[39:8]),
    .duty_number(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'heb4ef3cb9;
    stim[1] = 36'hebd58e74b;
    stim[2] = 36'h46ff8c1c1;
    stim[3] = 36'h580e393f4;
    stim[4] = 36'h48e391075;
    stim[5] = 36'h7830a4a71;
    stim[6] = 36'h6157e3347;
    stim[7] = 36'h9c6dab1d7;
    stim[8] = 36'h229bba8d0;
    stim[9] = 36'h4e9bc515f;
    stim[10] = 36'h1416a2ffb;
    stim[11] = 36'h78b262439;
    stim[12] = 36'h54fc11eda;
    stim[13] = 36'h1acb59a19;
    stim[14] = 36'h29f4d86e2;
    stim[15] = 36'h016cdfefb;
    stim[16] = 36'h35f02d841;
    stim[17] = 36'h70c7d8bbd;
    stim[18] = 36'h551c88990;
    stim[19] = 36'h7bd9c68e5;
    stim[20] = 36'h0c805ad1d;
    stim[21] = 36'h384ead3d1;
    stim[22] = 36'h673efeffe;
    stim[23] = 36'h414a2a10f;
    stim[24] = 36'h2ea9e6e28;
    stim[25] = 36'h7ba8c7513;
    stim[26] = 36'h75bc632ce;
    stim[27] = 36'h0f99f5698;
    stim[28] = 36'h7be003946;
    stim[29] = 36'h417583cbc;
    stim[30] = 36'h2114b34ca;
    stim[31] = 36'h07b347350;
    stim[32] = 36'h56cc2391b;
    stim[33] = 36'h7be9d9372;
    stim[34] = 36'h1da60a17b;
    stim[35] = 36'h3fa930002;
    stim[36] = 36'h46229b4ed;
    stim[37] = 36'h77cd8abd8;
    stim[38] = 36'h435e8b583;
    stim[39] = 36'h04165b2db;
    stim[40] = 36'h337118def;
    stim[41] = 36'h5bb0f3db9;
    stim[42] = 36'h58f0eb44c;
    stim[43] = 36'h7881740f6;
    stim[44] = 36'h29703ecb4;
    stim[45] = 36'h7516bd036;
    stim[46] = 36'h7e444bcfe;
    stim[47] = 36'h127e6607e;
    stim[48] = 36'h004f5ce76;
    stim[49] = 36'h3193bee8b;
    stim[50] = 36'h6a56f150e;
    stim[51] = 36'h7ef4c66cc;
    stim[52] = 36'h517f5d5c9;
    stim[53] = 36'h3ac1627a2;
    stim[54] = 36'h6bced56c7;
    stim[55] = 36'h75f2fc97b;
    stim[56] = 36'h0d719e2f5;
    stim[57] = 36'h538a5e8d0;
    stim[58] = 36'h10c23e470;
    stim[59] = 36'h59e0e7513;
    stim[60] = 36'h2f8faa9d0;
    stim[61] = 36'h780587853;
    stim[62] = 36'h36659cb80;
    stim[63] = 36'h187bf62d7;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
