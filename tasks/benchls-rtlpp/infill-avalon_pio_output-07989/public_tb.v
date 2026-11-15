// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07989 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h182936a601;
    stim[1] = 37'h01c58da29c;
    stim[2] = 37'h0656d05f2b;
    stim[3] = 37'h1a05a4560a;
    stim[4] = 37'h0a6af94db5;
    stim[5] = 37'h02b4480304;
    stim[6] = 37'h12b18a8671;
    stim[7] = 37'h1ef151d807;
    stim[8] = 37'h139d7f668c;
    stim[9] = 37'h071f94980d;
    stim[10] = 37'h1b60a5f8bb;
    stim[11] = 37'h0f7b1e250b;
    stim[12] = 37'h0be10b6e1f;
    stim[13] = 37'h0406ef679f;
    stim[14] = 37'h0667ce4859;
    stim[15] = 37'h1bd9535a59;
    stim[16] = 37'h12184abd97;
    stim[17] = 37'h17994476c3;
    stim[18] = 37'h1f862a838c;
    stim[19] = 37'h1eb709d2b4;
    stim[20] = 37'h1f198e5353;
    stim[21] = 37'h1ad1e5352e;
    stim[22] = 37'h0fecdcd17d;
    stim[23] = 37'h07974768b0;
    stim[24] = 37'h16c89acf59;
    stim[25] = 37'h06030e4b4b;
    stim[26] = 37'h1b655fe1b4;
    stim[27] = 37'h1e721794e0;
    stim[28] = 37'h17d13db81b;
    stim[29] = 37'h1a83595582;
    stim[30] = 37'h0f2a8be952;
    stim[31] = 37'h0b79c2e8fc;
    stim[32] = 37'h0374fe31c5;
    stim[33] = 37'h0afd3d84b2;
    stim[34] = 37'h0a09b437c5;
    stim[35] = 37'h172456c637;
    stim[36] = 37'h1126ce75b7;
    stim[37] = 37'h134bdf44db;
    stim[38] = 37'h1f35ebc7b0;
    stim[39] = 37'h16b36189fc;
    stim[40] = 37'h0ebece7494;
    stim[41] = 37'h065f8ac85f;
    stim[42] = 37'h16cbeee5bc;
    stim[43] = 37'h16225365fc;
    stim[44] = 37'h1f012e49af;
    stim[45] = 37'h1b478fc82b;
    stim[46] = 37'h1ed281c8d0;
    stim[47] = 37'h127657b3be;
    stim[48] = 37'h137c253538;
    stim[49] = 37'h0aa2b4793c;
    stim[50] = 37'h1f9e096fe0;
    stim[51] = 37'h03b51dbfe2;
    stim[52] = 37'h06db7bda69;
    stim[53] = 37'h162dd1f754;
    stim[54] = 37'h02bd606616;
    stim[55] = 37'h1ace64dcd0;
    stim[56] = 37'h0f1a4b3c19;
    stim[57] = 37'h16ae43bc24;
    stim[58] = 37'h1374e92d58;
    stim[59] = 37'h13fc8df824;
    stim[60] = 37'h026a710678;
    stim[61] = 37'h072560a14a;
    stim[62] = 37'h122ea69590;
    stim[63] = 37'h0b33be81d6;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h2b00000000;
      expv[4] = 40'h2b00000000;
      expv[5] = 40'h2b0000002b;
      expv[6] = 40'h2b00000000;
      expv[7] = 40'h2b00000000;
      expv[8] = 40'h2b00000000;
      expv[9] = 40'h2b0000002b;
      expv[10] = 40'h2b00000000;
      expv[11] = 40'h2b00000000;
      expv[12] = 40'h2b00000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h5900000000;
      expv[16] = 40'h5900000000;
      expv[17] = 40'h5900000000;
      expv[18] = 40'h5900000000;
      expv[19] = 40'h5900000000;
      expv[20] = 40'h5900000000;
      expv[21] = 40'h5900000000;
      expv[22] = 40'h5900000000;
      expv[23] = 40'h5900000059;
      expv[24] = 40'h5900000000;
      expv[25] = 40'h5900000059;
      expv[26] = 40'h4b00000000;
      expv[27] = 40'h4b00000000;
      expv[28] = 40'h4b00000000;
      expv[29] = 40'h4b00000000;
      expv[30] = 40'h4b00000000;
      expv[31] = 40'h4b00000000;
      expv[32] = 40'h4b0000004b;
      expv[33] = 40'h4b00000000;
      expv[34] = 40'h4b00000000;
      expv[35] = 40'h4b00000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h5f00000000;
      expv[43] = 40'h5f00000000;
      expv[44] = 40'h5f00000000;
      expv[45] = 40'h5f00000000;
      expv[46] = 40'h5f00000000;
      expv[47] = 40'h5f00000000;
      expv[48] = 40'h5f00000000;
      expv[49] = 40'h5f00000000;
      expv[50] = 40'h5f00000000;
      expv[51] = 40'h5f0000005f;
      expv[52] = 40'h5f0000005f;
      expv[53] = 40'h6900000000;
      expv[54] = 40'h6900000069;
      expv[55] = 40'h6900000000;
      expv[56] = 40'h6900000000;
      expv[57] = 40'h6900000000;
      expv[58] = 40'h6900000000;
      expv[59] = 40'h6900000000;
      expv[60] = 40'h6900000069;
      expv[61] = 40'h6900000069;
      expv[62] = 40'h6900000000;
      expv[63] = 40'h6900000000;
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
