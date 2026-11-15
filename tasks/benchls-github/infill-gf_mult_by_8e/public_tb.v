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

  gf_mult_by_8e dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc8;
    stim[1] = 8'hbb;
    stim[2] = 8'hf0;
    stim[3] = 8'h4c;
    stim[4] = 8'h3b;
    stim[5] = 8'h2c;
    stim[6] = 8'h6f;
    stim[7] = 8'h6c;
    stim[8] = 8'h12;
    stim[9] = 8'he2;
    stim[10] = 8'h23;
    stim[11] = 8'he4;
    stim[12] = 8'he5;
    stim[13] = 8'h48;
    stim[14] = 8'h70;
    stim[15] = 8'hd7;
    stim[16] = 8'hf6;
    stim[17] = 8'h72;
    stim[18] = 8'h58;
    stim[19] = 8'h4b;
    stim[20] = 8'hb9;
    stim[21] = 8'hec;
    stim[22] = 8'h35;
    stim[23] = 8'h27;
    stim[24] = 8'h37;
    stim[25] = 8'h86;
    stim[26] = 8'h47;
    stim[27] = 8'he5;
    stim[28] = 8'hdf;
    stim[29] = 8'h45;
    stim[30] = 8'h31;
    stim[31] = 8'h65;
    stim[32] = 8'hcc;
    stim[33] = 8'h93;
    stim[34] = 8'hd0;
    stim[35] = 8'hb3;
    stim[36] = 8'h3e;
    stim[37] = 8'h16;
    stim[38] = 8'h08;
    stim[39] = 8'h9d;
    stim[40] = 8'h2e;
    stim[41] = 8'haf;
    stim[42] = 8'h42;
    stim[43] = 8'he5;
    stim[44] = 8'h06;
    stim[45] = 8'hd0;
    stim[46] = 8'ha8;
    stim[47] = 8'h43;
    stim[48] = 8'hb5;
    stim[49] = 8'h5f;
    stim[50] = 8'h73;
    stim[51] = 8'hee;
    stim[52] = 8'h2a;
    stim[53] = 8'hf0;
    stim[54] = 8'h7c;
    stim[55] = 8'h42;
    stim[56] = 8'hce;
    stim[57] = 8'hff;
    stim[58] = 8'hc9;
    stim[59] = 8'hf6;
    stim[60] = 8'he7;
    stim[61] = 8'h97;
    stim[62] = 8'hd3;
    stim[63] = 8'hb6;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h64;
      expv[1] = 8'hd3;
      expv[2] = 8'h78;
      expv[3] = 8'h26;
      expv[4] = 8'h93;
      expv[5] = 8'h16;
      expv[6] = 8'hb9;
      expv[7] = 8'h36;
      expv[8] = 8'h09;
      expv[9] = 8'h71;
      expv[10] = 8'h9f;
      expv[11] = 8'h72;
      expv[12] = 8'hfc;
      expv[13] = 8'h24;
      expv[14] = 8'h38;
      expv[15] = 8'he5;
      expv[16] = 8'h7b;
      expv[17] = 8'h39;
      expv[18] = 8'h2c;
      expv[19] = 8'hab;
      expv[20] = 8'hd2;
      expv[21] = 8'h76;
      expv[22] = 8'h94;
      expv[23] = 8'h9d;
      expv[24] = 8'h95;
      expv[25] = 8'h43;
      expv[26] = 8'had;
      expv[27] = 8'hfc;
      expv[28] = 8'he1;
      expv[29] = 8'hac;
      expv[30] = 8'h96;
      expv[31] = 8'hbc;
      expv[32] = 8'h66;
      expv[33] = 8'hc7;
      expv[34] = 8'h68;
      expv[35] = 8'hd7;
      expv[36] = 8'h1f;
      expv[37] = 8'h0b;
      expv[38] = 8'h04;
      expv[39] = 8'hc0;
      expv[40] = 8'h17;
      expv[41] = 8'hd9;
      expv[42] = 8'h21;
      expv[43] = 8'hfc;
      expv[44] = 8'h03;
      expv[45] = 8'h68;
      expv[46] = 8'h54;
      expv[47] = 8'haf;
      expv[48] = 8'hd4;
      expv[49] = 8'ha1;
      expv[50] = 8'hb7;
      expv[51] = 8'h77;
      expv[52] = 8'h15;
      expv[53] = 8'h78;
      expv[54] = 8'h3e;
      expv[55] = 8'h21;
      expv[56] = 8'h67;
      expv[57] = 8'hf1;
      expv[58] = 8'hea;
      expv[59] = 8'h7b;
      expv[60] = 8'hfd;
      expv[61] = 8'hc5;
      expv[62] = 8'he7;
      expv[63] = 8'h5b;
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
