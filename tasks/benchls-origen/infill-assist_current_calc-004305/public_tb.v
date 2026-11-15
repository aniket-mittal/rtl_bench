// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004305 dut (
    .clk(clk),
    .avg_torque(in_vec[31:20]),
    .cadence_vec(in_vec[19:15]),
    .incline(in_vec[14:2]),
    .setting(in_vec[1:0]),
    .target_curr(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hdf41339f;
    stim[1] = 32'h8f5d446f;
    stim[2] = 32'h26e49272;
    stim[3] = 32'h2a907f87;
    stim[4] = 32'ha2360bb8;
    stim[5] = 32'h54bcfb15;
    stim[6] = 32'h7c7fc82f;
    stim[7] = 32'hdd7de9f0;
    stim[8] = 32'hbb1b2435;
    stim[9] = 32'h9ecef215;
    stim[10] = 32'h2dbcfd57;
    stim[11] = 32'hc0e2d6e2;
    stim[12] = 32'hd9419501;
    stim[13] = 32'hc9277e18;
    stim[14] = 32'h34a89c87;
    stim[15] = 32'ha22145eb;
    stim[16] = 32'h4d3ebde4;
    stim[17] = 32'hb9e7b186;
    stim[18] = 32'hf0ce28e1;
    stim[19] = 32'ha5487ce9;
    stim[20] = 32'hef23c73a;
    stim[21] = 32'hd29dedf9;
    stim[22] = 32'hf557c619;
    stim[23] = 32'hc804ff70;
    stim[24] = 32'hde12c446;
    stim[25] = 32'h2567a67c;
    stim[26] = 32'h674beead;
    stim[27] = 32'h23c11d7a;
    stim[28] = 32'h806ffd62;
    stim[29] = 32'hb553438e;
    stim[30] = 32'h72e6382f;
    stim[31] = 32'hb5dcfd99;
    stim[32] = 32'h0aac51c0;
    stim[33] = 32'h41d42558;
    stim[34] = 32'hdc434527;
    stim[35] = 32'hc11c259b;
    stim[36] = 32'h3dba5e09;
    stim[37] = 32'h5adcf2f4;
    stim[38] = 32'h53568142;
    stim[39] = 32'h678fb9d1;
    stim[40] = 32'ha54fc604;
    stim[41] = 32'h46340f84;
    stim[42] = 32'hf359ca92;
    stim[43] = 32'hd43ffabd;
    stim[44] = 32'h0d0455d5;
    stim[45] = 32'h92d5c723;
    stim[46] = 32'h430c2995;
    stim[47] = 32'h747e6677;
    stim[48] = 32'hdcfd78fa;
    stim[49] = 32'hdb7154f8;
    stim[50] = 32'hd2d2bca7;
    stim[51] = 32'h5fcf7e86;
    stim[52] = 32'hb305fcd9;
    stim[53] = 32'h7dbff1f3;
    stim[54] = 32'h7dda34ed;
    stim[55] = 32'h1e5a277f;
    stim[56] = 32'h590e1122;
    stim[57] = 32'h6540c123;
    stim[58] = 32'hdd212691;
    stim[59] = 32'h43204a2a;
    stim[60] = 32'h04326557;
    stim[61] = 32'h7c6c1dec;
    stim[62] = 32'hc1cf40ee;
    stim[63] = 32'h543b108e;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h1a4;
      expv[5] = 12'h4a0;
      expv[6] = 12'ha20;
      expv[7] = 12'h583;
      expv[8] = 12'h000;
      expv[9] = 12'h477;
      expv[10] = 12'hfff;
      expv[11] = 12'h000;
      expv[12] = 12'h35e;
      expv[13] = 12'h353;
      expv[14] = 12'hd22;
      expv[15] = 12'ha8f;
      expv[16] = 12'h781;
      expv[17] = 12'h000;
      expv[18] = 12'h5a9;
      expv[19] = 12'hd6b;
      expv[20] = 12'h000;
      expv[21] = 12'haf2;
      expv[22] = 12'hfff;
      expv[23] = 12'hfff;
      expv[24] = 12'hfff;
      expv[25] = 12'hfff;
      expv[26] = 12'hfff;
      expv[27] = 12'h000;
      expv[28] = 12'h541;
      expv[29] = 12'h000;
      expv[30] = 12'h4eb;
      expv[31] = 12'hfff;
      expv[32] = 12'h38d;
      expv[33] = 12'h9c5;
      expv[34] = 12'h0ab;
      expv[35] = 12'h13c;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h4a0;
      expv[39] = 12'habc;
      expv[40] = 12'hfff;
      expv[41] = 12'h000;
      expv[42] = 12'ha7b;
      expv[43] = 12'h909;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h056;
      expv[47] = 12'hfff;
      expv[48] = 12'hd68;
      expv[49] = 12'ha69;
      expv[50] = 12'hfff;
      expv[51] = 12'hfff;
      expv[52] = 12'hfff;
      expv[53] = 12'h000;
      expv[54] = 12'hfff;
      expv[55] = 12'hfff;
      expv[56] = 12'hfff;
      expv[57] = 12'h354;
      expv[58] = 12'h326;
      expv[59] = 12'hada;
      expv[60] = 12'hfff;
      expv[61] = 12'h469;
      expv[62] = 12'h000;
      expv[63] = 12'hfff;
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
