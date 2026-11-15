// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204021 dut (
    .clk(clk),
    .enable(in_vec[18:18]),
    .memstartp(in_vec[17:8]),
    .qp(in_vec[7:0]),
    .STOP(out_vec[15:15]),
    .read_addressp(out_vec[14:5]),
    .re(out_vec[4:4]),
    .RESULT(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h536e9;
    stim[1] = 19'h6e7ee;
    stim[2] = 19'h422c4;
    stim[3] = 19'h14978;
    stim[4] = 19'h1b7e9;
    stim[5] = 19'h19841;
    stim[6] = 19'h328c8;
    stim[7] = 19'h07228;
    stim[8] = 19'h2dd12;
    stim[9] = 19'h39c3c;
    stim[10] = 19'h38256;
    stim[11] = 19'h6f82f;
    stim[12] = 19'h49644;
    stim[13] = 19'h7aaaf;
    stim[14] = 19'h107c7;
    stim[15] = 19'h6e387;
    stim[16] = 19'h5f62a;
    stim[17] = 19'h3ecbe;
    stim[18] = 19'h7cf1c;
    stim[19] = 19'h358de;
    stim[20] = 19'h7232d;
    stim[21] = 19'h0fd40;
    stim[22] = 19'h04b98;
    stim[23] = 19'h0d91a;
    stim[24] = 19'h0ae6f;
    stim[25] = 19'h29918;
    stim[26] = 19'h4b9cb;
    stim[27] = 19'h4acc0;
    stim[28] = 19'h43413;
    stim[29] = 19'h453ed;
    stim[30] = 19'h5c409;
    stim[31] = 19'h7ed3d;
    stim[32] = 19'h6b1d2;
    stim[33] = 19'h01642;
    stim[34] = 19'h47617;
    stim[35] = 19'h020a4;
    stim[36] = 19'h6f41b;
    stim[37] = 19'h5b3e0;
    stim[38] = 19'h6fb83;
    stim[39] = 19'h492eb;
    stim[40] = 19'h15fb3;
    stim[41] = 19'h552c1;
    stim[42] = 19'h4231a;
    stim[43] = 19'h6e6cc;
    stim[44] = 19'h3f083;
    stim[45] = 19'h2e434;
    stim[46] = 19'h6d411;
    stim[47] = 19'h3a66f;
    stim[48] = 19'h696bc;
    stim[49] = 19'h7785d;
    stim[50] = 19'h6222c;
    stim[51] = 19'h094cd;
    stim[52] = 19'h2a81f;
    stim[53] = 19'h3b81c;
    stim[54] = 19'h33035;
    stim[55] = 19'h704d6;
    stim[56] = 19'h04747;
    stim[57] = 19'h4bf4a;
    stim[58] = 19'h25584;
    stim[59] = 19'h0b894;
    stim[60] = 19'h746a1;
    stim[61] = 19'h2aebe;
    stim[62] = 19'h03e41;
    stim[63] = 19'h344a0;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'h5f3x;
      expv[13] = 16'h131x;
      expv[14] = 16'h75b1;
      expv[15] = 16'h75a1;
      expv[16] = 16'h5c91;
      expv[17] = 16'h3f11;
      expv[18] = 16'h3f01;
      expv[19] = 16'h7a11;
      expv[20] = 16'h7a01;
      expv[21] = 16'h6491;
      expv[22] = 16'h6481;
      expv[23] = 16'h6481;
      expv[24] = 16'h6481;
      expv[25] = 16'h6481;
      expv[26] = 16'h6481;
      expv[27] = 16'h1751;
      expv[28] = 16'h15d1;
      expv[29] = 16'h06f1;
      expv[30] = 16'h0af2;
      expv[31] = 16'h3930;
      expv[32] = 16'h7e70;
      expv[33] = 16'h5710;
      expv[34] = 16'h5700;
      expv[35] = 16'h0ef0;
      expv[36] = 16'h0ee0;
      expv[37] = 16'h5eb0;
      expv[38] = 16'h36b0;
      expv[39] = 16'h5fd1;
      expv[40] = 16'h12d2;
      expv[41] = 16'h12c2;
      expv[42] = 16'h2a72;
      expv[43] = 16'h04b2;
      expv[44] = 16'h5d31;
      expv[45] = 16'h5d21;
      expv[46] = 16'h5d21;
      expv[47] = 16'h5ab1;
      expv[48] = 16'h5aa1;
      expv[49] = 16'h52f1;
      expv[50] = 16'h6f51;
      expv[51] = 16'h44b1;
      expv[52] = 16'h44a1;
      expv[53] = 16'h44a1;
      expv[54] = 16'h44a1;
      expv[55] = 16'h44a1;
      expv[56] = 16'h60b1;
      expv[57] = 16'h60a1;
      expv[58] = 16'h1811;
      expv[59] = 16'h1801;
      expv[60] = 16'h1801;
      expv[61] = 16'h68f1;
      expv[62] = 16'h68e1;
      expv[63] = 16'h68e1;
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
