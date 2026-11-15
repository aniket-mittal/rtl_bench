// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09198 dut (
    .clk(clk),
    .bcd_in(in_vec[19:4]),
    .decimal_points(in_vec[3:0]),
    .a_to_g(out_vec[11:5]),
    .decimal_point(out_vec[4:4]),
    .anode(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9a578;
    stim[1] = 20'h8aea2;
    stim[2] = 20'h58413;
    stim[3] = 20'h60805;
    stim[4] = 20'hcdae6;
    stim[5] = 20'hb60b8;
    stim[6] = 20'hadf32;
    stim[7] = 20'hf5ffe;
    stim[8] = 20'h01747;
    stim[9] = 20'haff3c;
    stim[10] = 20'h8fb1d;
    stim[11] = 20'h2d71a;
    stim[12] = 20'h01b8c;
    stim[13] = 20'ha94c1;
    stim[14] = 20'h0ae3a;
    stim[15] = 20'h45c77;
    stim[16] = 20'hc5875;
    stim[17] = 20'h1a027;
    stim[18] = 20'hdf4bf;
    stim[19] = 20'h52861;
    stim[20] = 20'hc24b8;
    stim[21] = 20'h8d91f;
    stim[22] = 20'h09c62;
    stim[23] = 20'hb4295;
    stim[24] = 20'h015ba;
    stim[25] = 20'he6f55;
    stim[26] = 20'ha012a;
    stim[27] = 20'h39427;
    stim[28] = 20'h6d9b3;
    stim[29] = 20'hbf000;
    stim[30] = 20'h98b45;
    stim[31] = 20'h1c499;
    stim[32] = 20'h62f91;
    stim[33] = 20'hf14b2;
    stim[34] = 20'hab0c9;
    stim[35] = 20'h307d7;
    stim[36] = 20'h39f44;
    stim[37] = 20'he2c4a;
    stim[38] = 20'h0605f;
    stim[39] = 20'hb8d77;
    stim[40] = 20'h6dac0;
    stim[41] = 20'h119c8;
    stim[42] = 20'h5dda9;
    stim[43] = 20'h0882a;
    stim[44] = 20'hedb53;
    stim[45] = 20'h63579;
    stim[46] = 20'hda6dc;
    stim[47] = 20'h5559e;
    stim[48] = 20'h44e7f;
    stim[49] = 20'h586cf;
    stim[50] = 20'hf613b;
    stim[51] = 20'h32315;
    stim[52] = 20'h42ff0;
    stim[53] = 20'hd8b36;
    stim[54] = 20'h89853;
    stim[55] = 20'hd8551;
    stim[56] = 20'hd9d27;
    stim[57] = 20'h393d1;
    stim[58] = 20'hafd17;
    stim[59] = 20'h72245;
    stim[60] = 20'h78573;
    stim[61] = 20'h436e3;
    stim[62] = 20'h81c34;
    stim[63] = 20'h4c949;
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
      expv[1] = 12'h0xf;
      expv[2] = 12'h0xf;
      expv[3] = 12'h0xf;
      expv[4] = 12'h0xf;
      expv[5] = 12'h0xf;
      expv[6] = 12'h0xf;
      expv[7] = 12'h0xf;
      expv[8] = 12'h0xf;
      expv[9] = 12'h0xf;
      expv[10] = 12'h0xf;
      expv[11] = 12'h0xf;
      expv[12] = 12'h0xf;
      expv[13] = 12'h0xf;
      expv[14] = 12'h0xf;
      expv[15] = 12'h0xf;
      expv[16] = 12'h0xf;
      expv[17] = 12'h0xf;
      expv[18] = 12'h0xf;
      expv[19] = 12'h0xf;
      expv[20] = 12'h0xf;
      expv[21] = 12'h0xf;
      expv[22] = 12'h0xf;
      expv[23] = 12'h0xf;
      expv[24] = 12'h0xf;
      expv[25] = 12'h0xf;
      expv[26] = 12'h0xf;
      expv[27] = 12'h0xf;
      expv[28] = 12'h0xf;
      expv[29] = 12'h0xf;
      expv[30] = 12'h0xf;
      expv[31] = 12'h0xf;
      expv[32] = 12'h0xf;
      expv[33] = 12'h0xf;
      expv[34] = 12'h0xf;
      expv[35] = 12'h0xf;
      expv[36] = 12'h0xf;
      expv[37] = 12'h0xf;
      expv[38] = 12'h0xf;
      expv[39] = 12'h0xf;
      expv[40] = 12'h0xf;
      expv[41] = 12'h0xf;
      expv[42] = 12'h0xf;
      expv[43] = 12'h0xf;
      expv[44] = 12'h0xf;
      expv[45] = 12'h0xf;
      expv[46] = 12'h0xf;
      expv[47] = 12'h0xf;
      expv[48] = 12'h0xf;
      expv[49] = 12'h0xf;
      expv[50] = 12'h0xf;
      expv[51] = 12'h0xf;
      expv[52] = 12'h0xf;
      expv[53] = 12'h0xf;
      expv[54] = 12'h0xf;
      expv[55] = 12'h0xf;
      expv[56] = 12'h0xf;
      expv[57] = 12'h0xf;
      expv[58] = 12'h0xf;
      expv[59] = 12'h0xf;
      expv[60] = 12'h0xf;
      expv[61] = 12'h0xf;
      expv[62] = 12'h0xf;
      expv[63] = 12'h0xf;
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
