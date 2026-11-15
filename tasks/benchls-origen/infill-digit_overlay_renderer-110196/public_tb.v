// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_110196 dut (
    .clk(clk),
    .resetN(in_vec[34:34]),
    .pixelX(in_vec[33:23]),
    .pixelY(in_vec[22:12]),
    .digit1(in_vec[11:8]),
    .digit2(in_vec[7:4]),
    .digit3(in_vec[3:0]),
    .offsetX(out_vec[26:16]),
    .offsetY(out_vec[15:5]),
    .drawingRequest(out_vec[4:4]),
    .current_digit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3b6841d09;
    stim[1] = 35'h12a9af0d0;
    stim[2] = 35'h79edf55ea;
    stim[3] = 35'h5cc431e4e;
    stim[4] = 35'h482ab7072;
    stim[5] = 35'h5c87aa909;
    stim[6] = 35'h532eb670f;
    stim[7] = 35'h68783073f;
    stim[8] = 35'h4ceb97455;
    stim[9] = 35'h5f8ebd70c;
    stim[10] = 35'h73844f2b6;
    stim[11] = 35'h5112b8617;
    stim[12] = 35'h43789ee34;
    stim[13] = 35'h401d1ded4;
    stim[14] = 35'h5b850990b;
    stim[15] = 35'h589902165;
    stim[16] = 35'h5ef682b2b;
    stim[17] = 35'h72ac2ae55;
    stim[18] = 35'h6df02d029;
    stim[19] = 35'h48dbed5eb;
    stim[20] = 35'h41e898657;
    stim[21] = 35'h6b1e81311;
    stim[22] = 35'h535526bf8;
    stim[23] = 35'h57c16da9a;
    stim[24] = 35'h755ff9d51;
    stim[25] = 35'h45fd0415d;
    stim[26] = 35'h4a0c6902d;
    stim[27] = 35'h63a4354c8;
    stim[28] = 35'h5957bd3cb;
    stim[29] = 35'h631d4c39f;
    stim[30] = 35'h678ffffe3;
    stim[31] = 35'h56a64982c;
    stim[32] = 35'h737a11420;
    stim[33] = 35'h4b2b672d2;
    stim[34] = 35'h5423feedf;
    stim[35] = 35'h6d091cce2;
    stim[36] = 35'h30458b1de;
    stim[37] = 35'h484c327fb;
    stim[38] = 35'h680b606e8;
    stim[39] = 35'h590f132a0;
    stim[40] = 35'h6de24bd2a;
    stim[41] = 35'h5a053f96e;
    stim[42] = 35'h6fbc8aa3d;
    stim[43] = 35'h75ea50738;
    stim[44] = 35'h51d75c4df;
    stim[45] = 35'h70b0e76f2;
    stim[46] = 35'h6fcddc5d7;
    stim[47] = 35'h4a42bd66f;
    stim[48] = 35'h7b2a66356;
    stim[49] = 35'h58e67dd60;
    stim[50] = 35'h4799c3075;
    stim[51] = 35'h1c3907e1b;
    stim[52] = 35'h730a37ac6;
    stim[53] = 35'h7d6a868b1;
    stim[54] = 35'h465599dfd;
    stim[55] = 35'h764ab4247;
    stim[56] = 35'h41c424f0e;
    stim[57] = 35'h6bcb88a43;
    stim[58] = 35'h5f0c6e8bb;
    stim[59] = 35'h764010429;
    stim[60] = 35'h645615eb7;
    stim[61] = 35'h5ccb2164a;
    stim[62] = 35'h776bcf2c8;
    stim[63] = 35'h44fab2190;
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
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000000;
      expv[5] = 27'h0000000;
      expv[6] = 27'h0000000;
      expv[7] = 27'h0000000;
      expv[8] = 27'h0000000;
      expv[9] = 27'h0000000;
      expv[10] = 27'h0000000;
      expv[11] = 27'h0000000;
      expv[12] = 27'h0000000;
      expv[13] = 27'h0000000;
      expv[14] = 27'h0000000;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000000;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000000;
      expv[20] = 27'h0000000;
      expv[21] = 27'h0000000;
      expv[22] = 27'h0000000;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000000;
      expv[25] = 27'h0000000;
      expv[26] = 27'h0000000;
      expv[27] = 27'h0000000;
      expv[28] = 27'h0000000;
      expv[29] = 27'h0000000;
      expv[30] = 27'h0000000;
      expv[31] = 27'h0000000;
      expv[32] = 27'h0000000;
      expv[33] = 27'h0000000;
      expv[34] = 27'h0000000;
      expv[35] = 27'h0000000;
      expv[36] = 27'h0000000;
      expv[37] = 27'h0000000;
      expv[38] = 27'h0000000;
      expv[39] = 27'h0000000;
      expv[40] = 27'h0000000;
      expv[41] = 27'h0000000;
      expv[42] = 27'h0000000;
      expv[43] = 27'h0000000;
      expv[44] = 27'h0000000;
      expv[45] = 27'h0000000;
      expv[46] = 27'h0000000;
      expv[47] = 27'h0000000;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000000;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000000;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000000;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000000;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000000;
      expv[62] = 27'h0000000;
      expv[63] = 27'h0000000;
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
