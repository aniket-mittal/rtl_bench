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

  gf_mult_by_bb dut (
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
    stim[0] = 8'hac;
    stim[1] = 8'h42;
    stim[2] = 8'hde;
    stim[3] = 8'h15;
    stim[4] = 8'h2f;
    stim[5] = 8'hb8;
    stim[6] = 8'h00;
    stim[7] = 8'h0e;
    stim[8] = 8'heb;
    stim[9] = 8'hbc;
    stim[10] = 8'h8a;
    stim[11] = 8'h80;
    stim[12] = 8'h2b;
    stim[13] = 8'hab;
    stim[14] = 8'hec;
    stim[15] = 8'heb;
    stim[16] = 8'h72;
    stim[17] = 8'h62;
    stim[18] = 8'h91;
    stim[19] = 8'h74;
    stim[20] = 8'he2;
    stim[21] = 8'h2b;
    stim[22] = 8'h1a;
    stim[23] = 8'h63;
    stim[24] = 8'h17;
    stim[25] = 8'hc0;
    stim[26] = 8'h01;
    stim[27] = 8'h84;
    stim[28] = 8'h2c;
    stim[29] = 8'he2;
    stim[30] = 8'hb9;
    stim[31] = 8'h0c;
    stim[32] = 8'h70;
    stim[33] = 8'hbc;
    stim[34] = 8'h34;
    stim[35] = 8'hed;
    stim[36] = 8'h6f;
    stim[37] = 8'hce;
    stim[38] = 8'h07;
    stim[39] = 8'hfa;
    stim[40] = 8'h9a;
    stim[41] = 8'h71;
    stim[42] = 8'h5f;
    stim[43] = 8'hb2;
    stim[44] = 8'h53;
    stim[45] = 8'h42;
    stim[46] = 8'h68;
    stim[47] = 8'h7f;
    stim[48] = 8'h45;
    stim[49] = 8'ha3;
    stim[50] = 8'hcc;
    stim[51] = 8'h50;
    stim[52] = 8'h34;
    stim[53] = 8'h36;
    stim[54] = 8'h84;
    stim[55] = 8'hd1;
    stim[56] = 8'hc2;
    stim[57] = 8'he1;
    stim[58] = 8'hf1;
    stim[59] = 8'h08;
    stim[60] = 8'h43;
    stim[61] = 8'hdf;
    stim[62] = 8'hf0;
    stim[63] = 8'hbb;
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
      expv[0] = 8'h46;
      expv[1] = 8'h8a;
      expv[2] = 8'h4d;
      expv[3] = 8'h12;
      expv[4] = 8'h49;
      expv[5] = 8'hef;
      expv[6] = 8'h00;
      expv[7] = 8'h0c;
      expv[8] = 8'ha1;
      expv[9] = 8'h39;
      expv[10] = 8'h05;
      expv[11] = 8'hdf;
      expv[12] = 8'h9f;
      expv[13] = 8'h40;
      expv[14] = 8'ha7;
      expv[15] = 8'ha1;
      expv[16] = 8'h0b;
      expv[17] = 8'h74;
      expv[18] = 8'h1b;
      expv[19] = 8'hb6;
      expv[20] = 8'hab;
      expv[21] = 8'h9f;
      expv[22] = 8'ha5;
      expv[23] = 8'hcf;
      expv[24] = 8'h79;
      expv[25] = 8'h3e;
      expv[26] = 8'hbb;
      expv[27] = 8'h09;
      expv[28] = 8'h99;
      expv[29] = 8'hab;
      expv[30] = 8'h54;
      expv[31] = 8'h67;
      expv[32] = 8'h60;
      expv[33] = 8'h39;
      expv[34] = 8'h57;
      expv[35] = 8'h1c;
      expv[36] = 8'ha8;
      expv[37] = 8'h32;
      expv[38] = 8'h06;
      expv[39] = 8'h65;
      expv[40] = 8'h7a;
      expv[41] = 8'hdb;
      expv[42] = 8'h29;
      expv[43] = 8'h35;
      expv[44] = 8'h4e;
      expv[45] = 8'h8a;
      expv[46] = 8'hae;
      expv[47] = 8'hd7;
      expv[48] = 8'h8c;
      expv[49] = 8'hf1;
      expv[50] = 8'h59;
      expv[51] = 8'h9e;
      expv[52] = 8'h57;
      expv[53] = 8'h3c;
      expv[54] = 8'h09;
      expv[55] = 8'hfa;
      expv[56] = 8'h55;
      expv[57] = 8'h7b;
      expv[58] = 8'h04;
      expv[59] = 8'hb1;
      expv[60] = 8'h31;
      expv[61] = 8'hf6;
      expv[62] = 8'hbf;
      expv[63] = 8'h3f;
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
