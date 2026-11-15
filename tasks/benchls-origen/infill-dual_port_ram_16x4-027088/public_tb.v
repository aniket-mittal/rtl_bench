// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027088 dut (
    .clk_a(clk),
    .clk_b(in_vec[14:14]),
    .reset(in_vec[13:13]),
    .addr_a(in_vec[12:9]),
    .addr_b(in_vec[8:5]),
    .din_a(in_vec[4:1]),
    .we_n_a(in_vec[0:0]),
    .dout_a(out_vec[7:4]),
    .dout_b(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h71a0;
    stim[1] = 15'h3228;
    stim[2] = 15'h0a03;
    stim[3] = 15'h075b;
    stim[4] = 15'h4f21;
    stim[5] = 15'h44f9;
    stim[6] = 15'h4db2;
    stim[7] = 15'h4b2c;
    stim[8] = 15'h508a;
    stim[9] = 15'h4aac;
    stim[10] = 15'h58d3;
    stim[11] = 15'h5c1f;
    stim[12] = 15'h0ef5;
    stim[13] = 15'h1759;
    stim[14] = 15'h5caf;
    stim[15] = 15'h02d9;
    stim[16] = 15'h1eb9;
    stim[17] = 15'h5be2;
    stim[18] = 15'h5908;
    stim[19] = 15'h4218;
    stim[20] = 15'h5cad;
    stim[21] = 15'h1d38;
    stim[22] = 15'h48a3;
    stim[23] = 15'h4bbc;
    stim[24] = 15'h0d21;
    stim[25] = 15'h4845;
    stim[26] = 15'h49af;
    stim[27] = 15'h5903;
    stim[28] = 15'h0c51;
    stim[29] = 15'h13f5;
    stim[30] = 15'h4b5e;
    stim[31] = 15'h099e;
    stim[32] = 15'h5d43;
    stim[33] = 15'h4294;
    stim[34] = 15'h5b5f;
    stim[35] = 15'h4369;
    stim[36] = 15'h528b;
    stim[37] = 15'h51c7;
    stim[38] = 15'h101e;
    stim[39] = 15'h04aa;
    stim[40] = 15'h50c6;
    stim[41] = 15'h47e6;
    stim[42] = 15'h41f4;
    stim[43] = 15'h49af;
    stim[44] = 15'h4e57;
    stim[45] = 15'h4c7d;
    stim[46] = 15'h47f2;
    stim[47] = 15'h1b95;
    stim[48] = 15'h4907;
    stim[49] = 15'h184d;
    stim[50] = 15'h4928;
    stim[51] = 15'h1369;
    stim[52] = 15'h5cba;
    stim[53] = 15'h5360;
    stim[54] = 15'h0a0f;
    stim[55] = 15'h1085;
    stim[56] = 15'h13d1;
    stim[57] = 15'h0f26;
    stim[58] = 15'h1a0e;
    stim[59] = 15'h03a6;
    stim[60] = 15'h184f;
    stim[61] = 15'h52aa;
    stim[62] = 15'h5efb;
    stim[63] = 15'h1c05;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hx0;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'h6x;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hx6;
      expv[15] = 8'hx6;
      expv[16] = 8'hx6;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hx6;
      expv[23] = 8'hx6;
      expv[24] = 8'h66;
      expv[25] = 8'h9x;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'h4x;
      expv[29] = 8'h9x;
      expv[30] = 8'hxx;
      expv[31] = 8'hex;
      expv[32] = 8'hxx;
      expv[33] = 8'hcx;
      expv[34] = 8'hcx;
      expv[35] = 8'h1x;
      expv[36] = 8'hax;
      expv[37] = 8'hxx;
      expv[38] = 8'h5x;
      expv[39] = 8'h5x;
      expv[40] = 8'hx9;
      expv[41] = 8'hf9;
      expv[42] = 8'hx9;
      expv[43] = 8'hx9;
      expv[44] = 8'hf9;
      expv[45] = 8'hx9;
      expv[46] = 8'h99;
      expv[47] = 8'h39;
      expv[48] = 8'h13;
      expv[49] = 8'hf3;
      expv[50] = 8'h4x;
      expv[51] = 8'hfx;
      expv[52] = 8'hxf;
      expv[53] = 8'hcf;
      expv[54] = 8'hxf;
      expv[55] = 8'hff;
      expv[56] = 8'h3f;
      expv[57] = 8'h0f;
      expv[58] = 8'hxf;
      expv[59] = 8'h1f;
      expv[60] = 8'haf;
      expv[61] = 8'h4f;
      expv[62] = 8'h0f;
      expv[63] = 8'hxf;
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
