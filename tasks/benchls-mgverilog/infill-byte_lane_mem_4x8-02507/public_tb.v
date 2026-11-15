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

  mg_02507 dut (
    .clk(clk),
    .addr(in_vec[13:12]),
    .wdata(in_vec[11:4]),
    .wen(in_vec[3:0]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h173d;
    stim[1] = 14'h093e;
    stim[2] = 14'h04f8;
    stim[3] = 14'h1837;
    stim[4] = 14'h10a8;
    stim[5] = 14'h11f6;
    stim[6] = 14'h0764;
    stim[7] = 14'h1eca;
    stim[8] = 14'h0949;
    stim[9] = 14'h10d4;
    stim[10] = 14'h2647;
    stim[11] = 14'h1360;
    stim[12] = 14'h0957;
    stim[13] = 14'h104c;
    stim[14] = 14'h328a;
    stim[15] = 14'h32da;
    stim[16] = 14'h300f;
    stim[17] = 14'h3eb5;
    stim[18] = 14'h16e7;
    stim[19] = 14'h2a76;
    stim[20] = 14'h0ddb;
    stim[21] = 14'h14b1;
    stim[22] = 14'h24e3;
    stim[23] = 14'h0efd;
    stim[24] = 14'h0c88;
    stim[25] = 14'h06f4;
    stim[26] = 14'h14a3;
    stim[27] = 14'h2e7e;
    stim[28] = 14'h3192;
    stim[29] = 14'h30a9;
    stim[30] = 14'h1c0e;
    stim[31] = 14'h2246;
    stim[32] = 14'h39eb;
    stim[33] = 14'h1375;
    stim[34] = 14'h3b72;
    stim[35] = 14'h2e6d;
    stim[36] = 14'h0caf;
    stim[37] = 14'h072b;
    stim[38] = 14'h0daa;
    stim[39] = 14'h0f3d;
    stim[40] = 14'h243a;
    stim[41] = 14'h2e49;
    stim[42] = 14'h2b7e;
    stim[43] = 14'h2077;
    stim[44] = 14'h1389;
    stim[45] = 14'h1de4;
    stim[46] = 14'h23aa;
    stim[47] = 14'h0c17;
    stim[48] = 14'h2351;
    stim[49] = 14'h3d6d;
    stim[50] = 14'h02ae;
    stim[51] = 14'h3057;
    stim[52] = 14'h1835;
    stim[53] = 14'h3a3b;
    stim[54] = 14'h3daf;
    stim[55] = 14'h1574;
    stim[56] = 14'h2dab;
    stim[57] = 14'h07d2;
    stim[58] = 14'h1b91;
    stim[59] = 14'h3d16;
    stim[60] = 14'h0bbf;
    stim[61] = 14'h371e;
    stim[62] = 14'h26f2;
    stim[63] = 14'h132e;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'h9x;
      expv[4] = 8'h7x;
      expv[5] = 8'h43;
      expv[6] = 8'h03;
      expv[7] = 8'h5x;
      expv[8] = 8'h1f;
      expv[9] = 8'h7x;
      expv[10] = 8'hdf;
      expv[11] = 8'hxx;
      expv[12] = 8'hcf;
      expv[13] = 8'hb0;
      expv[14] = 8'hcf;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'h00;
      expv[19] = 8'h0f;
      expv[20] = 8'hx4;
      expv[21] = 8'h95;
      expv[22] = 8'h2e;
      expv[23] = 8'hx4;
      expv[24] = 8'hdd;
      expv[25] = 8'hef;
      expv[26] = 8'hef;
      expv[27] = 8'h2f;
      expv[28] = 8'hxe;
      expv[29] = 8'h23;
      expv[30] = 8'h2b;
      expv[31] = 8'h2a;
      expv[32] = 8'he6;
      expv[33] = 8'h2a;
      expv[34] = 8'hc2;
      expv[35] = 8'hae;
      expv[36] = 8'he6;
      expv[37] = 8'hef;
      expv[38] = 8'hca;
      expv[39] = 8'h42;
      expv[40] = 8'hca;
      expv[41] = 8'he6;
      expv[42] = 8'h62;
      expv[43] = 8'he0;
      expv[44] = 8'hb4;
      expv[45] = 8'hf3;
      expv[46] = 8'h30;
      expv[47] = 8'h87;
      expv[48] = 8'hfb;
      expv[49] = 8'h0b;
      expv[50] = 8'ha6;
      expv[51] = 8'hc1;
      expv[52] = 8'hd6;
      expv[53] = 8'h10;
      expv[54] = 8'hc5;
      expv[55] = 8'h83;
      expv[56] = 8'h03;
      expv[57] = 8'h09;
      expv[58] = 8'h29;
      expv[59] = 8'h13;
      expv[60] = 8'hda;
      expv[61] = 8'h2d;
      expv[62] = 8'hd2;
      expv[63] = 8'hca;
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
