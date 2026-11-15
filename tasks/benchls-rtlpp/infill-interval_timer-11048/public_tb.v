// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11048 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h0db43b;
    stim[1] = 22'h14b27e;
    stim[2] = 22'h0ff953;
    stim[3] = 22'h279504;
    stim[4] = 22'h079c05;
    stim[5] = 22'h3b5dbf;
    stim[6] = 22'h0b6c0c;
    stim[7] = 22'h0619aa;
    stim[8] = 22'h063498;
    stim[9] = 22'h11ef84;
    stim[10] = 22'h3aede7;
    stim[11] = 22'h33b525;
    stim[12] = 22'h26283e;
    stim[13] = 22'h03e50d;
    stim[14] = 22'h07dbd1;
    stim[15] = 22'h039058;
    stim[16] = 22'h227739;
    stim[17] = 22'h06a98d;
    stim[18] = 22'h3a2f6e;
    stim[19] = 22'h1ee8dd;
    stim[20] = 22'h17341d;
    stim[21] = 22'h02a7ca;
    stim[22] = 22'h1a3569;
    stim[23] = 22'h1ebe60;
    stim[24] = 22'h2f358d;
    stim[25] = 22'h0a4588;
    stim[26] = 22'h0fceb2;
    stim[27] = 22'h3f7074;
    stim[28] = 22'h323f41;
    stim[29] = 22'h366778;
    stim[30] = 22'h26cbe1;
    stim[31] = 22'h27ab8c;
    stim[32] = 22'h2b3223;
    stim[33] = 22'h2320ff;
    stim[34] = 22'h3f8b82;
    stim[35] = 22'h1ed3b2;
    stim[36] = 22'h3f3338;
    stim[37] = 22'h1fe771;
    stim[38] = 22'h131f79;
    stim[39] = 22'h1e4204;
    stim[40] = 22'h17b0e7;
    stim[41] = 22'h3753fd;
    stim[42] = 22'h3624f2;
    stim[43] = 22'h3b2dfb;
    stim[44] = 22'h2ec20e;
    stim[45] = 22'h1e9a52;
    stim[46] = 22'h3e6457;
    stim[47] = 22'h2bab8e;
    stim[48] = 22'h1aa5a2;
    stim[49] = 22'h03580d;
    stim[50] = 22'h22af29;
    stim[51] = 22'h231bc2;
    stim[52] = 22'h12937a;
    stim[53] = 22'h061af7;
    stim[54] = 22'h34be0f;
    stim[55] = 22'h1f97e0;
    stim[56] = 22'h323423;
    stim[57] = 22'h076b3c;
    stim[58] = 22'h320ecf;
    stim[59] = 22'h0391e2;
    stim[60] = 22'h2b191b;
    stim[61] = 22'h2659ac;
    stim[62] = 22'h3a553c;
    stim[63] = 22'h22c9fc;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0869f;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00001;
      expv[21] = 17'h0869f;
      expv[22] = 17'h00000;
      expv[23] = 17'h0e8dd;
      expv[24] = 17'h0e8dd;
      expv[25] = 17'h00001;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h0869f;
      expv[32] = 17'h0869f;
      expv[33] = 17'h0be60;
      expv[34] = 17'h0869f;
      expv[35] = 17'h00000;
      expv[36] = 17'h0be60;
      expv[37] = 17'h00000;
      expv[38] = 17'h0d3b2;
      expv[39] = 17'h0869f;
      expv[40] = 17'h0d3b2;
      expv[41] = 17'h0869f;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h0be60;
      expv[46] = 17'h04204;
      expv[47] = 17'h00000;
      expv[48] = 17'h04204;
      expv[49] = 17'h09a52;
      expv[50] = 17'h00000;
      expv[51] = 17'h0869f;
      expv[52] = 17'h0869f;
      expv[53] = 17'h0869f;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00001;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
