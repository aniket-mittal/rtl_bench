// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04469 dut (
    .clk(clk),
    .reset_n(in_vec[16:16]),
    .units(in_vec[15:12]),
    .tens(in_vec[11:8]),
    .hundreds(in_vec[7:4]),
    .thousands(in_vec[3:0]),
    .digit_select(out_vec[7:5]),
    .data(out_vec[4:1]),
    .decimal_point(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h09a9d;
    stim[1] = 17'h01778;
    stim[2] = 17'h189a4;
    stim[3] = 17'h18e5f;
    stim[4] = 17'h1bf7c;
    stim[5] = 17'h1a491;
    stim[6] = 17'h11aab;
    stim[7] = 17'h1c0d4;
    stim[8] = 17'h17fe8;
    stim[9] = 17'h1a225;
    stim[10] = 17'h1f935;
    stim[11] = 17'h1303b;
    stim[12] = 17'h1cb73;
    stim[13] = 17'h196b9;
    stim[14] = 17'h1691f;
    stim[15] = 17'h1e970;
    stim[16] = 17'h11ade;
    stim[17] = 17'h1b20d;
    stim[18] = 17'h1233c;
    stim[19] = 17'h126f1;
    stim[20] = 17'h19542;
    stim[21] = 17'h1a264;
    stim[22] = 17'h1fc22;
    stim[23] = 17'h17b71;
    stim[24] = 17'h1079f;
    stim[25] = 17'h1071a;
    stim[26] = 17'h17702;
    stim[27] = 17'h18309;
    stim[28] = 17'h1215d;
    stim[29] = 17'h1984f;
    stim[30] = 17'h13c99;
    stim[31] = 17'h1f9ae;
    stim[32] = 17'h1b056;
    stim[33] = 17'h161f6;
    stim[34] = 17'h1af67;
    stim[35] = 17'h13777;
    stim[36] = 17'h106ef;
    stim[37] = 17'h128b8;
    stim[38] = 17'h18e3b;
    stim[39] = 17'h10de3;
    stim[40] = 17'h1a26a;
    stim[41] = 17'h13957;
    stim[42] = 17'h167ce;
    stim[43] = 17'h1636a;
    stim[44] = 17'h1be1f;
    stim[45] = 17'h12d1c;
    stim[46] = 17'h198f5;
    stim[47] = 17'h1fa03;
    stim[48] = 17'h1db6b;
    stim[49] = 17'h1305a;
    stim[50] = 17'h1c3c6;
    stim[51] = 17'h1960c;
    stim[52] = 17'h101d3;
    stim[53] = 17'h18a14;
    stim[54] = 17'h1c910;
    stim[55] = 17'h1ff1e;
    stim[56] = 17'h1e1fd;
    stim[57] = 17'h186e6;
    stim[58] = 17'h1267c;
    stim[59] = 17'h124af;
    stim[60] = 17'h1b4ea;
    stim[61] = 17'h1b1d9;
    stim[62] = 17'h12091;
    stim[63] = 17'h12de3;
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
      expv[0] = 8'h13;
      expv[1] = 8'h03;
      expv[2] = 8'h11;
      expv[3] = 8'h3d;
      expv[4] = 8'h6f;
      expv[5] = 8'h82;
      expv[6] = 8'h03;
      expv[7] = 8'h21;
      expv[8] = 8'h7d;
      expv[9] = 8'h8a;
      expv[10] = 8'h1f;
      expv[11] = 8'h21;
      expv[12] = 8'h6f;
      expv[13] = 8'h92;
      expv[14] = 8'h0d;
      expv[15] = 8'h33;
      expv[16] = 8'h7b;
      expv[17] = 8'h9a;
      expv[18] = 8'h05;
      expv[19] = 8'h2d;
      expv[20] = 8'h69;
      expv[21] = 8'h88;
      expv[22] = 8'h1f;
      expv[23] = 8'h37;
      expv[24] = 8'h73;
      expv[25] = 8'h94;
      expv[26] = 8'h0f;
      expv[27] = 8'h27;
      expv[28] = 8'h6b;
      expv[29] = 8'h9e;
      expv[30] = 8'h07;
      expv[31] = 8'h33;
      expv[32] = 8'h6b;
      expv[33] = 8'h8c;
      expv[34] = 8'h15;
      expv[35] = 8'h2f;
      expv[36] = 8'h7d;
      expv[37] = 8'h90;
      expv[38] = 8'h11;
      expv[39] = 8'h3b;
      expv[40] = 8'h6d;
      expv[41] = 8'h8e;
      expv[42] = 8'h0d;
      expv[43] = 8'h27;
      expv[44] = 8'h63;
      expv[45] = 8'h98;
      expv[46] = 8'h13;
      expv[47] = 8'h35;
      expv[48] = 8'h6d;
      expv[49] = 8'h94;
      expv[50] = 8'h19;
      expv[51] = 8'h2d;
      expv[52] = 8'h7b;
      expv[53] = 8'h88;
      expv[54] = 8'h19;
      expv[55] = 8'h3f;
      expv[56] = 8'h7f;
      expv[57] = 8'h8c;
      expv[58] = 8'h05;
      expv[59] = 8'h29;
      expv[60] = 8'h7d;
      expv[61] = 8'h92;
      expv[62] = 8'h05;
      expv[63] = 8'h3b;
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
