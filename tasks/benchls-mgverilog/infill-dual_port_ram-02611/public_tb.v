// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02611 dut (
    .clk(clk),
    .d(in_vec[26:19]),
    .write_address(in_vec[18:11]),
    .read_address(in_vec[10:3]),
    .we(in_vec[2:2]),
    .rde(in_vec[1:1]),
    .clk_ena(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h37f2323;
    stim[1] = 27'h0a1af60;
    stim[2] = 27'h3699e13;
    stim[3] = 27'h1215bbc;
    stim[4] = 27'h55b918e;
    stim[5] = 27'h435a836;
    stim[6] = 27'h5bc7cc5;
    stim[7] = 27'h5f29090;
    stim[8] = 27'h01f92c3;
    stim[9] = 27'h05b1b80;
    stim[10] = 27'h38f8724;
    stim[11] = 27'h29ba37d;
    stim[12] = 27'h6c30517;
    stim[13] = 27'h102b00e;
    stim[14] = 27'h0a98f4e;
    stim[15] = 27'h5dd51ac;
    stim[16] = 27'h1011705;
    stim[17] = 27'h6d759ea;
    stim[18] = 27'h7b61fc9;
    stim[19] = 27'h37ea869;
    stim[20] = 27'h0da9ffc;
    stim[21] = 27'h102fd05;
    stim[22] = 27'h203d3ed;
    stim[23] = 27'h77b56db;
    stim[24] = 27'h590f239;
    stim[25] = 27'h56a0095;
    stim[26] = 27'h5befa5e;
    stim[27] = 27'h01f9255;
    stim[28] = 27'h1f73d4e;
    stim[29] = 27'h73bc4ae;
    stim[30] = 27'h3be67bf;
    stim[31] = 27'h7002416;
    stim[32] = 27'h235c726;
    stim[33] = 27'h1a959db;
    stim[34] = 27'h33c094f;
    stim[35] = 27'h01ecb29;
    stim[36] = 27'h34c9e57;
    stim[37] = 27'h608aaa7;
    stim[38] = 27'h3ad1b26;
    stim[39] = 27'h12182c2;
    stim[40] = 27'h185388d;
    stim[41] = 27'h654417a;
    stim[42] = 27'h683bd76;
    stim[43] = 27'h173ffe6;
    stim[44] = 27'h3ad94bc;
    stim[45] = 27'h323ac62;
    stim[46] = 27'h044bc2c;
    stim[47] = 27'h697e2f5;
    stim[48] = 27'h09120ad;
    stim[49] = 27'h632f40b;
    stim[50] = 27'h12de8cc;
    stim[51] = 27'h6e1fbe6;
    stim[52] = 27'h0f6e61b;
    stim[53] = 27'h657bdf7;
    stim[54] = 27'h073fe59;
    stim[55] = 27'h1fd7388;
    stim[56] = 27'h09f96ca;
    stim[57] = 27'h1d4c61b;
    stim[58] = 27'h6477e43;
    stim[59] = 27'h5386442;
    stim[60] = 27'h2fe38a4;
    stim[61] = 27'h397cd67;
    stim[62] = 27'h15ff277;
    stim[63] = 27'h72d8b82;
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
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hxx;
      expv[50] = 8'h67;
      expv[51] = 8'h67;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
