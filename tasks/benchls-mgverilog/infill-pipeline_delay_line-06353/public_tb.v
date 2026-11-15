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

  mg_06353 dut (
    .clk(clk),
    .in_data(in_vec[7:0]),
    .out_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h3b;
    stim[1] = 8'h96;
    stim[2] = 8'h3c;
    stim[3] = 8'hb7;
    stim[4] = 8'h61;
    stim[5] = 8'hd4;
    stim[6] = 8'hf9;
    stim[7] = 8'h1b;
    stim[8] = 8'h11;
    stim[9] = 8'h62;
    stim[10] = 8'h0a;
    stim[11] = 8'h42;
    stim[12] = 8'hb8;
    stim[13] = 8'h81;
    stim[14] = 8'h15;
    stim[15] = 8'h11;
    stim[16] = 8'hc6;
    stim[17] = 8'h2b;
    stim[18] = 8'hb3;
    stim[19] = 8'h8b;
    stim[20] = 8'hc2;
    stim[21] = 8'h20;
    stim[22] = 8'h82;
    stim[23] = 8'h43;
    stim[24] = 8'h81;
    stim[25] = 8'h2f;
    stim[26] = 8'h95;
    stim[27] = 8'hed;
    stim[28] = 8'h32;
    stim[29] = 8'hed;
    stim[30] = 8'hbb;
    stim[31] = 8'hff;
    stim[32] = 8'h1c;
    stim[33] = 8'hfe;
    stim[34] = 8'h24;
    stim[35] = 8'h02;
    stim[36] = 8'h60;
    stim[37] = 8'h88;
    stim[38] = 8'h7a;
    stim[39] = 8'hdb;
    stim[40] = 8'hba;
    stim[41] = 8'h99;
    stim[42] = 8'he0;
    stim[43] = 8'hab;
    stim[44] = 8'h9e;
    stim[45] = 8'heb;
    stim[46] = 8'h2d;
    stim[47] = 8'h16;
    stim[48] = 8'h4a;
    stim[49] = 8'h72;
    stim[50] = 8'h62;
    stim[51] = 8'he6;
    stim[52] = 8'hff;
    stim[53] = 8'he0;
    stim[54] = 8'h58;
    stim[55] = 8'h75;
    stim[56] = 8'hd7;
    stim[57] = 8'hd8;
    stim[58] = 8'h16;
    stim[59] = 8'h58;
    stim[60] = 8'h1b;
    stim[61] = 8'h63;
    stim[62] = 8'h5e;
    stim[63] = 8'h61;
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
      expv[1] = 8'h3b;
      expv[2] = 8'h96;
      expv[3] = 8'h3c;
      expv[4] = 8'hb7;
      expv[5] = 8'h61;
      expv[6] = 8'hd4;
      expv[7] = 8'hf9;
      expv[8] = 8'h1b;
      expv[9] = 8'h11;
      expv[10] = 8'h62;
      expv[11] = 8'h0a;
      expv[12] = 8'h42;
      expv[13] = 8'hb8;
      expv[14] = 8'h81;
      expv[15] = 8'h15;
      expv[16] = 8'h11;
      expv[17] = 8'hc6;
      expv[18] = 8'h2b;
      expv[19] = 8'hb3;
      expv[20] = 8'h8b;
      expv[21] = 8'hc2;
      expv[22] = 8'h20;
      expv[23] = 8'h82;
      expv[24] = 8'h43;
      expv[25] = 8'h81;
      expv[26] = 8'h2f;
      expv[27] = 8'h95;
      expv[28] = 8'hed;
      expv[29] = 8'h32;
      expv[30] = 8'hed;
      expv[31] = 8'hbb;
      expv[32] = 8'hff;
      expv[33] = 8'h1c;
      expv[34] = 8'hfe;
      expv[35] = 8'h24;
      expv[36] = 8'h02;
      expv[37] = 8'h60;
      expv[38] = 8'h88;
      expv[39] = 8'h7a;
      expv[40] = 8'hdb;
      expv[41] = 8'hba;
      expv[42] = 8'h99;
      expv[43] = 8'he0;
      expv[44] = 8'hab;
      expv[45] = 8'h9e;
      expv[46] = 8'heb;
      expv[47] = 8'h2d;
      expv[48] = 8'h16;
      expv[49] = 8'h4a;
      expv[50] = 8'h72;
      expv[51] = 8'h62;
      expv[52] = 8'he6;
      expv[53] = 8'hff;
      expv[54] = 8'he0;
      expv[55] = 8'h58;
      expv[56] = 8'h75;
      expv[57] = 8'hd7;
      expv[58] = 8'hd8;
      expv[59] = 8'h16;
      expv[60] = 8'h58;
      expv[61] = 8'h1b;
      expv[62] = 8'h63;
      expv[63] = 8'h5e;
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
