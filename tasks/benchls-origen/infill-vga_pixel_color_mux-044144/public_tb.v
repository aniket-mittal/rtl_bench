// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_044144 dut (
    .clock(clk),
    .reset(in_vec[15:15]),
    .video_on(in_vec[14:14]),
    .world_pixel(in_vec[13:12]),
    .icon(in_vec[11:10]),
    .icon2(in_vec[9:8]),
    .icon4(in_vec[7:6]),
    .icon5(in_vec[5:4]),
    .icon6(in_vec[3:2]),
    .icon7(in_vec[1:0]),
    .red(out_vec[11:8]),
    .green(out_vec[7:4]),
    .blue(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hfc5f;
    stim[1] = 16'h9868;
    stim[2] = 16'h772e;
    stim[3] = 16'h18db;
    stim[4] = 16'h1ca0;
    stim[5] = 16'h0907;
    stim[6] = 16'h7bf1;
    stim[7] = 16'h6df8;
    stim[8] = 16'h240b;
    stim[9] = 16'h6f9f;
    stim[10] = 16'h182c;
    stim[11] = 16'h29a0;
    stim[12] = 16'h4d35;
    stim[13] = 16'h3007;
    stim[14] = 16'h090e;
    stim[15] = 16'h573f;
    stim[16] = 16'h4d7e;
    stim[17] = 16'h4c0f;
    stim[18] = 16'hbc58;
    stim[19] = 16'h44de;
    stim[20] = 16'h1d4d;
    stim[21] = 16'h5e71;
    stim[22] = 16'h461d;
    stim[23] = 16'h13ea;
    stim[24] = 16'h6d52;
    stim[25] = 16'h5085;
    stim[26] = 16'h0035;
    stim[27] = 16'h6ea3;
    stim[28] = 16'h776e;
    stim[29] = 16'h4749;
    stim[30] = 16'h452b;
    stim[31] = 16'h2610;
    stim[32] = 16'h4a13;
    stim[33] = 16'h6c65;
    stim[34] = 16'h7d93;
    stim[35] = 16'h7702;
    stim[36] = 16'h5164;
    stim[37] = 16'h08d7;
    stim[38] = 16'h79e6;
    stim[39] = 16'h5f5b;
    stim[40] = 16'h029f;
    stim[41] = 16'h04b9;
    stim[42] = 16'h5e90;
    stim[43] = 16'h4bfb;
    stim[44] = 16'h45bd;
    stim[45] = 16'h4cc5;
    stim[46] = 16'h7f3e;
    stim[47] = 16'h1cff;
    stim[48] = 16'h1454;
    stim[49] = 16'h36da;
    stim[50] = 16'h11f8;
    stim[51] = 16'h3d1e;
    stim[52] = 16'h0dfe;
    stim[53] = 16'h21a0;
    stim[54] = 16'h09ab;
    stim[55] = 16'h28b1;
    stim[56] = 16'h2dc0;
    stim[57] = 16'h4f89;
    stim[58] = 16'h64d3;
    stim[59] = 16'h4d13;
    stim[60] = 16'h4a21;
    stim[61] = 16'h6b6c;
    stim[62] = 16'h78ce;
    stim[63] = 16'h57e0;
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
      expv[1] = 12'hfff;
      expv[2] = 12'h000;
      expv[3] = 12'hfff;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'hfff;
      expv[8] = 12'hfff;
      expv[9] = 12'h000;
      expv[10] = 12'hfff;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'hfff;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'hfff;
      expv[17] = 12'hfff;
      expv[18] = 12'hfff;
      expv[19] = 12'h000;
      expv[20] = 12'hfff;
      expv[21] = 12'h000;
      expv[22] = 12'hfff;
      expv[23] = 12'hfff;
      expv[24] = 12'h000;
      expv[25] = 12'hfff;
      expv[26] = 12'hfff;
      expv[27] = 12'h000;
      expv[28] = 12'hfff;
      expv[29] = 12'hfff;
      expv[30] = 12'hfff;
      expv[31] = 12'hfff;
      expv[32] = 12'h000;
      expv[33] = 12'hfff;
      expv[34] = 12'hfff;
      expv[35] = 12'hfff;
      expv[36] = 12'hfff;
      expv[37] = 12'hfff;
      expv[38] = 12'h000;
      expv[39] = 12'hfff;
      expv[40] = 12'hfff;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'hfff;
      expv[44] = 12'hfff;
      expv[45] = 12'hfff;
      expv[46] = 12'hfff;
      expv[47] = 12'hfff;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'hfff;
      expv[59] = 12'hfff;
      expv[60] = 12'hfff;
      expv[61] = 12'hfff;
      expv[62] = 12'hfff;
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
