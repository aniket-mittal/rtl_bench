// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116372 dut (
    .clock(clk),
    .A(in_vec[7:7]),
    .keys(in_vec[6:3]),
    .inputState(in_vec[2:0]),
    .mem6x6(out_vec[7:2]),
    .level(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'haf;
    stim[1] = 8'h39;
    stim[2] = 8'h59;
    stim[3] = 8'h57;
    stim[4] = 8'h9d;
    stim[5] = 8'h5e;
    stim[6] = 8'hc3;
    stim[7] = 8'h3c;
    stim[8] = 8'h24;
    stim[9] = 8'h3e;
    stim[10] = 8'h4b;
    stim[11] = 8'h2b;
    stim[12] = 8'h4e;
    stim[13] = 8'hc2;
    stim[14] = 8'h11;
    stim[15] = 8'h5d;
    stim[16] = 8'h32;
    stim[17] = 8'h8c;
    stim[18] = 8'h92;
    stim[19] = 8'h44;
    stim[20] = 8'h6c;
    stim[21] = 8'hf3;
    stim[22] = 8'hfb;
    stim[23] = 8'h22;
    stim[24] = 8'h0d;
    stim[25] = 8'h70;
    stim[26] = 8'h7c;
    stim[27] = 8'hf7;
    stim[28] = 8'h74;
    stim[29] = 8'h89;
    stim[30] = 8'h56;
    stim[31] = 8'h51;
    stim[32] = 8'h47;
    stim[33] = 8'h70;
    stim[34] = 8'h25;
    stim[35] = 8'h48;
    stim[36] = 8'h7a;
    stim[37] = 8'hbf;
    stim[38] = 8'ha4;
    stim[39] = 8'h68;
    stim[40] = 8'h22;
    stim[41] = 8'hd1;
    stim[42] = 8'hbf;
    stim[43] = 8'h05;
    stim[44] = 8'hb1;
    stim[45] = 8'h1f;
    stim[46] = 8'h0a;
    stim[47] = 8'h6b;
    stim[48] = 8'hbd;
    stim[49] = 8'h52;
    stim[50] = 8'he9;
    stim[51] = 8'h2b;
    stim[52] = 8'ha6;
    stim[53] = 8'hbb;
    stim[54] = 8'h2e;
    stim[55] = 8'h12;
    stim[56] = 8'h0d;
    stim[57] = 8'h86;
    stim[58] = 8'hcf;
    stim[59] = 8'hb6;
    stim[60] = 8'h42;
    stim[61] = 8'h24;
    stim[62] = 8'h04;
    stim[63] = 8'hd3;
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
      expv[1] = 8'h01;
      expv[2] = 8'h01;
      expv[3] = 8'h01;
      expv[4] = 8'h01;
      expv[5] = 8'h01;
      expv[6] = 8'h01;
      expv[7] = 8'h01;
      expv[8] = 8'h01;
      expv[9] = 8'h01;
      expv[10] = 8'h01;
      expv[11] = 8'h01;
      expv[12] = 8'h01;
      expv[13] = 8'h01;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h01;
      expv[17] = 8'hxx;
      expv[18] = 8'h01;
      expv[19] = 8'hxx;
      expv[20] = 8'h01;
      expv[21] = 8'h01;
      expv[22] = 8'h01;
      expv[23] = 8'h01;
      expv[24] = 8'hxx;
      expv[25] = 8'h01;
      expv[26] = 8'h01;
      expv[27] = 8'h01;
      expv[28] = 8'h01;
      expv[29] = 8'h01;
      expv[30] = 8'h01;
      expv[31] = 8'h01;
      expv[32] = 8'h01;
      expv[33] = 8'h01;
      expv[34] = 8'h01;
      expv[35] = 8'h01;
      expv[36] = 8'h01;
      expv[37] = 8'hxx;
      expv[38] = 8'h01;
      expv[39] = 8'h01;
      expv[40] = 8'h01;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'h01;
      expv[44] = 8'h01;
      expv[45] = 8'h01;
      expv[46] = 8'h01;
      expv[47] = 8'hxx;
      expv[48] = 8'h01;
      expv[49] = 8'h01;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'h01;
      expv[53] = 8'h01;
      expv[54] = 8'h01;
      expv[55] = 8'h01;
      expv[56] = 8'hxx;
      expv[57] = 8'h01;
      expv[58] = 8'h01;
      expv[59] = 8'h01;
      expv[60] = 8'h01;
      expv[61] = 8'hxx;
      expv[62] = 8'h01;
      expv[63] = 8'h01;
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
