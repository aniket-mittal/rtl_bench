// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07252 dut (
    .clk(clk),
    .rst(in_vec[21:21]),
    .if_pc(in_vec[20:15]),
    .id_pc(in_vec[14:9]),
    .update_BP(in_vec[8:8]),
    .pred_right(in_vec[7:7]),
    .taken(in_vec[6:6]),
    .BHR_in(in_vec[5:2]),
    .delayed_PHT(in_vec[1:0]),
    .pred_out(out_vec[6:6]),
    .BHR_rd(out_vec[5:2]),
    .PHT_out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h35b09f;
    stim[1] = 22'h201d35;
    stim[2] = 22'h196aef;
    stim[3] = 22'h1a1c9e;
    stim[4] = 22'h03793a;
    stim[5] = 22'h1bfb8e;
    stim[6] = 22'h1e528d;
    stim[7] = 22'h059699;
    stim[8] = 22'h03296b;
    stim[9] = 22'h012823;
    stim[10] = 22'h1af6b1;
    stim[11] = 22'h10ab82;
    stim[12] = 22'h1e1e77;
    stim[13] = 22'h0bf434;
    stim[14] = 22'h1fdcb4;
    stim[15] = 22'h17c115;
    stim[16] = 22'h0428e2;
    stim[17] = 22'h1734b1;
    stim[18] = 22'h01b419;
    stim[19] = 22'h00e58c;
    stim[20] = 22'h1fa965;
    stim[21] = 22'h1b1a1d;
    stim[22] = 22'h1bb1d6;
    stim[23] = 22'h1d637f;
    stim[24] = 22'h09da53;
    stim[25] = 22'h191539;
    stim[26] = 22'h3ab6ab;
    stim[27] = 22'h0600ec;
    stim[28] = 22'h0928c1;
    stim[29] = 22'h0e3e13;
    stim[30] = 22'h08705e;
    stim[31] = 22'h0519a8;
    stim[32] = 22'h05fb17;
    stim[33] = 22'h04439c;
    stim[34] = 22'h0d8372;
    stim[35] = 22'h156ab3;
    stim[36] = 22'h0f4983;
    stim[37] = 22'h021e66;
    stim[38] = 22'h088539;
    stim[39] = 22'h19b29e;
    stim[40] = 22'h0d306b;
    stim[41] = 22'h1b95ba;
    stim[42] = 22'h0dd2b5;
    stim[43] = 22'h0151d0;
    stim[44] = 22'h08a101;
    stim[45] = 22'h121935;
    stim[46] = 22'h1131b8;
    stim[47] = 22'h09b878;
    stim[48] = 22'h15f974;
    stim[49] = 22'h1ac656;
    stim[50] = 22'h1ec3bc;
    stim[51] = 22'h1ba762;
    stim[52] = 22'h068c32;
    stim[53] = 22'h0fc507;
    stim[54] = 22'h171ba5;
    stim[55] = 22'h021367;
    stim[56] = 22'h007e05;
    stim[57] = 22'h147044;
    stim[58] = 22'h1d848a;
    stim[59] = 22'h1b2c3a;
    stim[60] = 22'h198bc2;
    stim[61] = 22'h199ed8;
    stim[62] = 22'h1dd2c9;
    stim[63] = 22'h04dc98;
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
      expv[0] = 7'hxx;
      expv[1] = 7'hxx;
      expv[2] = 7'hxx;
      expv[3] = 7'hxx;
      expv[4] = 7'hxx;
      expv[5] = 7'hxx;
      expv[6] = 7'hxx;
      expv[7] = 7'hxx;
      expv[8] = 7'hxx;
      expv[9] = 7'hxx;
      expv[10] = 7'hxx;
      expv[11] = 7'hxx;
      expv[12] = 7'hxx;
      expv[13] = 7'hxx;
      expv[14] = 7'hxx;
      expv[15] = 7'hxx;
      expv[16] = 7'hxx;
      expv[17] = 7'hxx;
      expv[18] = 7'hxx;
      expv[19] = 7'hxx;
      expv[20] = 7'hxx;
      expv[21] = 7'hxx;
      expv[22] = 7'hxx;
      expv[23] = 7'hxx;
      expv[24] = 7'hxx;
      expv[25] = 7'h3d;
      expv[26] = 7'hxx;
      expv[27] = 7'h34;
      expv[28] = 7'hxx;
      expv[29] = 7'hxx;
      expv[30] = 7'hxx;
      expv[31] = 7'hxx;
      expv[32] = 7'hxx;
      expv[33] = 7'hxx;
      expv[34] = 7'hxx;
      expv[35] = 7'hxx;
      expv[36] = 7'hxx;
      expv[37] = 7'hxx;
      expv[38] = 7'h3d;
      expv[39] = 7'hxx;
      expv[40] = 7'hxx;
      expv[41] = 7'hxx;
      expv[42] = 7'hxx;
      expv[43] = 7'hxx;
      expv[44] = 7'h3d;
      expv[45] = 7'hxx;
      expv[46] = 7'hxx;
      expv[47] = 7'hxx;
      expv[48] = 7'hxx;
      expv[49] = 7'hxx;
      expv[50] = 7'h34;
      expv[51] = 7'hxx;
      expv[52] = 7'h34;
      expv[53] = 7'hxx;
      expv[54] = 7'hxx;
      expv[55] = 7'hxx;
      expv[56] = 7'hxx;
      expv[57] = 7'hxx;
      expv[58] = 7'hxx;
      expv[59] = 7'hxx;
      expv[60] = 7'hxx;
      expv[61] = 7'hxx;
      expv[62] = 7'hxx;
      expv[63] = 7'hxx;
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
