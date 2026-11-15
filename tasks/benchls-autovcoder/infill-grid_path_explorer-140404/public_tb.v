// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_140404 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .start_x(in_vec[31:24]),
    .start_y(in_vec[23:16]),
    .end_x(in_vec[15:8]),
    .end_y(in_vec[7:0]),
    .current_x(out_vec[16:9]),
    .current_y(out_vec[8:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h17f8f7415;
    stim[1] = 33'h15c9678b8;
    stim[2] = 33'h0c28eb3d4;
    stim[3] = 33'h0737fb84f;
    stim[4] = 33'h040e1590b;
    stim[5] = 33'h03fe0f867;
    stim[6] = 33'h00c5ece42;
    stim[7] = 33'h04c383b3d;
    stim[8] = 33'h02073d56c;
    stim[9] = 33'h00ab62898;
    stim[10] = 33'h07e08b6e5;
    stim[11] = 33'h02b6f3477;
    stim[12] = 33'h092d67a0a;
    stim[13] = 33'h07074f3b4;
    stim[14] = 33'h040505ed5;
    stim[15] = 33'h0044bdc3f;
    stim[16] = 33'h0cdb147d1;
    stim[17] = 33'h0c75a8b80;
    stim[18] = 33'h0c2d76650;
    stim[19] = 33'h01aaf827a;
    stim[20] = 33'h03dffdff8;
    stim[21] = 33'h08f65a7bf;
    stim[22] = 33'h090380faf;
    stim[23] = 33'h1e9ac01e3;
    stim[24] = 33'h0058c8f10;
    stim[25] = 33'h0eea83958;
    stim[26] = 33'h09b2c8718;
    stim[27] = 33'h0db78de1b;
    stim[28] = 33'h0851fb5bf;
    stim[29] = 33'h069f9dd68;
    stim[30] = 33'h0060861c7;
    stim[31] = 33'h0062af268;
    stim[32] = 33'h0e5557953;
    stim[33] = 33'h02f2b75e3;
    stim[34] = 33'h07e143e62;
    stim[35] = 33'h06e2e4681;
    stim[36] = 33'h042da9781;
    stim[37] = 33'h056042917;
    stim[38] = 33'h08bc47190;
    stim[39] = 33'h027b68763;
    stim[40] = 33'h0b732b823;
    stim[41] = 33'h0c5cc95f9;
    stim[42] = 33'h05354f774;
    stim[43] = 33'h04c00978e;
    stim[44] = 33'h04913fde1;
    stim[45] = 33'h0f4f27e1f;
    stim[46] = 33'h0cb65ab28;
    stim[47] = 33'h0f21e3021;
    stim[48] = 33'h0741e9089;
    stim[49] = 33'h0ab7c6013;
    stim[50] = 33'h0e0ea97ed;
    stim[51] = 33'h062e76d42;
    stim[52] = 33'h02dba37de;
    stim[53] = 33'h02f4afa36;
    stim[54] = 33'h0f9a23bfe;
    stim[55] = 33'h085fff9e1;
    stim[56] = 33'h06865e337;
    stim[57] = 33'h05ac952e2;
    stim[58] = 33'h08fc0173d;
    stim[59] = 33'h0226643ee;
    stim[60] = 33'h07c313788;
    stim[61] = 33'h087ab8b70;
    stim[62] = 33'h01bec2236;
    stim[63] = 33'h08347f350;
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
      expv[0] = 17'h0ff1e;
      expv[1] = 17'h0ff1e;
      expv[2] = 17'h0b92c;
      expv[3] = 17'h0b92c;
      expv[4] = 17'h0bb2a;
      expv[5] = 17'h0b928;
      expv[6] = 17'h0bb26;
      expv[7] = 17'h0bd24;
      expv[8] = 17'h0bb22;
      expv[9] = 17'h0bd20;
      expv[10] = 17'h0bb22;
      expv[11] = 17'h0bd24;
      expv[12] = 17'h0bb22;
      expv[13] = 17'h0bd20;
      expv[14] = 17'h0bf22;
      expv[15] = 17'h0bd24;
      expv[16] = 17'h0bf22;
      expv[17] = 17'h0bd24;
      expv[18] = 17'h0bf22;
      expv[19] = 17'h0c120;
      expv[20] = 17'h0c31e;
      expv[21] = 17'h0c520;
      expv[22] = 17'h0c722;
      expv[23] = 17'h1d358;
      expv[24] = 17'h1d358;
      expv[25] = 17'h1d358;
      expv[26] = 17'h1d156;
      expv[27] = 17'h1cf54;
      expv[28] = 17'h1cd52;
      expv[29] = 17'h1cb54;
      expv[30] = 17'h1c952;
      expv[31] = 17'h1c754;
      expv[32] = 17'h1c952;
      expv[33] = 17'h1c750;
      expv[34] = 17'h1c552;
      expv[35] = 17'h1c350;
      expv[36] = 17'h1c14e;
      expv[37] = 17'h1bf4c;
      expv[38] = 17'h1bd4a;
      expv[39] = 17'h1bb48;
      expv[40] = 17'h1b946;
      expv[41] = 17'h1b744;
      expv[42] = 17'h1b546;
      expv[43] = 17'h1b744;
      expv[44] = 17'h1b542;
      expv[45] = 17'h1b744;
      expv[46] = 17'h1b542;
      expv[47] = 17'h1b340;
      expv[48] = 17'h1b13e;
      expv[49] = 17'h1af3c;
      expv[50] = 17'h1ad3a;
      expv[51] = 17'h1ab3c;
      expv[52] = 17'h1a93a;
      expv[53] = 17'h1a73c;
      expv[54] = 17'h1a93a;
      expv[55] = 17'h1a73c;
      expv[56] = 17'h1a93e;
      expv[57] = 17'h1ab3c;
      expv[58] = 17'h1a93e;
      expv[59] = 17'h1a73c;
      expv[60] = 17'h1a53e;
      expv[61] = 17'h1a33c;
      expv[62] = 17'h1a13a;
      expv[63] = 17'h19f38;
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
