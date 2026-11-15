// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_080862 dut (
    .clk(clk),
    .rst_n(in_vec[25:25]),
    .ram_write_req(in_vec[24:24]),
    .ram_write_addr(in_vec[23:16]),
    .ram_write_data(in_vec[15:8]),
    .ram_read_addr(in_vec[7:0]),
    .ram_read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h0fc595e;
    stim[1] = 26'h02feda2;
    stim[2] = 26'h2f791dd;
    stim[3] = 26'h32b0685;
    stim[4] = 26'h35a1606;
    stim[5] = 26'h326d4e1;
    stim[6] = 26'h38b04e5;
    stim[7] = 26'h26230c0;
    stim[8] = 26'h3fde186;
    stim[9] = 26'h2b880ef;
    stim[10] = 26'h29936b8;
    stim[11] = 26'h3065887;
    stim[12] = 26'h3b60653;
    stim[13] = 26'h3acfbc2;
    stim[14] = 26'h2d7d06a;
    stim[15] = 26'h2c9cb7f;
    stim[16] = 26'h2edb69a;
    stim[17] = 26'h28db802;
    stim[18] = 26'h226eaef;
    stim[19] = 26'h32ed548;
    stim[20] = 26'h30952c2;
    stim[21] = 26'h2eda339;
    stim[22] = 26'h3bdc408;
    stim[23] = 26'h2ba02c0;
    stim[24] = 26'h27f8e12;
    stim[25] = 26'h3c4a83b;
    stim[26] = 26'h3cca3b0;
    stim[27] = 26'h28dfd19;
    stim[28] = 26'h2643506;
    stim[29] = 26'h3c7c7f7;
    stim[30] = 26'h3bfcf0d;
    stim[31] = 26'h21f6af7;
    stim[32] = 26'h38e1bff;
    stim[33] = 26'h2d765b5;
    stim[34] = 26'h236f4cb;
    stim[35] = 26'h3342046;
    stim[36] = 26'h3ed8f60;
    stim[37] = 26'h346e33e;
    stim[38] = 26'h2168768;
    stim[39] = 26'h2993cfe;
    stim[40] = 26'h2aeb4a2;
    stim[41] = 26'h37e8c16;
    stim[42] = 26'h3eeeb22;
    stim[43] = 26'h379dd52;
    stim[44] = 26'h2ae205e;
    stim[45] = 26'h3e5eef5;
    stim[46] = 26'h2394dc1;
    stim[47] = 26'h2451ea9;
    stim[48] = 26'h30d1a52;
    stim[49] = 26'h3cc84e8;
    stim[50] = 26'h2b51fa6;
    stim[51] = 26'h2539c77;
    stim[52] = 26'h397acd3;
    stim[53] = 26'h31f19f3;
    stim[54] = 26'h2dddaef;
    stim[55] = 26'h3320a19;
    stim[56] = 26'h2ab9de0;
    stim[57] = 26'h21dbe71;
    stim[58] = 26'h3be9910;
    stim[59] = 26'h3ae5506;
    stim[60] = 26'h292184d;
    stim[61] = 26'h37d7dbb;
    stim[62] = 26'h324420e;
    stim[63] = 26'h32e0859;
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
      expv[28] = 8'h58;
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
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'hxx;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'h58;
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
