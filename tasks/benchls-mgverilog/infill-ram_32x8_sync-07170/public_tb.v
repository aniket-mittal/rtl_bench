// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07170 dut (
    .sysclock(clk),
    .address(in_vec[13:9]),
    .datain(in_vec[8:1]),
    .write_enable(in_vec[0:0]),
    .dataout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h272e;
    stim[1] = 14'h26f5;
    stim[2] = 14'h387e;
    stim[3] = 14'h04c9;
    stim[4] = 14'h0b6a;
    stim[5] = 14'h0146;
    stim[6] = 14'h0f03;
    stim[7] = 14'h2165;
    stim[8] = 14'h2b96;
    stim[9] = 14'h16b5;
    stim[10] = 14'h08d2;
    stim[11] = 14'h2d92;
    stim[12] = 14'h16c6;
    stim[13] = 14'h2d88;
    stim[14] = 14'h13d3;
    stim[15] = 14'h1577;
    stim[16] = 14'h2862;
    stim[17] = 14'h1757;
    stim[18] = 14'h2115;
    stim[19] = 14'h0d36;
    stim[20] = 14'h12e5;
    stim[21] = 14'h12ab;
    stim[22] = 14'h3a07;
    stim[23] = 14'h23ab;
    stim[24] = 14'h2097;
    stim[25] = 14'h0bc2;
    stim[26] = 14'h1c57;
    stim[27] = 14'h2973;
    stim[28] = 14'h0423;
    stim[29] = 14'h2cbc;
    stim[30] = 14'h10fd;
    stim[31] = 14'h10b5;
    stim[32] = 14'h3dfd;
    stim[33] = 14'h03ee;
    stim[34] = 14'h0478;
    stim[35] = 14'h33b2;
    stim[36] = 14'h2c6f;
    stim[37] = 14'h1cb9;
    stim[38] = 14'h0abb;
    stim[39] = 14'h17c1;
    stim[40] = 14'h2d60;
    stim[41] = 14'h0fb7;
    stim[42] = 14'h2bc7;
    stim[43] = 14'h1a5f;
    stim[44] = 14'h2333;
    stim[45] = 14'h3c5e;
    stim[46] = 14'h0da7;
    stim[47] = 14'h1dad;
    stim[48] = 14'h150e;
    stim[49] = 14'h27bf;
    stim[50] = 14'h36c0;
    stim[51] = 14'h0873;
    stim[52] = 14'h0376;
    stim[53] = 14'h3b82;
    stim[54] = 14'h2c35;
    stim[55] = 14'h05a1;
    stim[56] = 14'h308a;
    stim[57] = 14'h0cdb;
    stim[58] = 14'h2fbe;
    stim[59] = 14'h3828;
    stim[60] = 14'h0d90;
    stim[61] = 14'h1744;
    stim[62] = 14'h3be3;
    stim[63] = 14'h3172;
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
      expv[0] = 8'h00;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'h5a;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'h11;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'h37;
      expv[42] = 8'h37;
      expv[43] = 8'h37;
      expv[44] = 8'h37;
      expv[45] = 8'h37;
      expv[46] = 8'hfe;
      expv[47] = 8'hfe;
      expv[48] = 8'hfe;
      expv[49] = 8'hbb;
      expv[50] = 8'hbb;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'h03;
      expv[55] = 8'h03;
      expv[56] = 8'h03;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'h6d;
      expv[62] = 8'he0;
      expv[63] = 8'he0;
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
