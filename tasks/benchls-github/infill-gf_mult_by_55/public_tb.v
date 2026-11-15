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

  gf_mult_by_55 dut (
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
    stim[0] = 8'hc1;
    stim[1] = 8'ha4;
    stim[2] = 8'h29;
    stim[3] = 8'hb5;
    stim[4] = 8'hf7;
    stim[5] = 8'he9;
    stim[6] = 8'h40;
    stim[7] = 8'h2d;
    stim[8] = 8'h0e;
    stim[9] = 8'hff;
    stim[10] = 8'h94;
    stim[11] = 8'h02;
    stim[12] = 8'hbd;
    stim[13] = 8'haa;
    stim[14] = 8'h85;
    stim[15] = 8'hee;
    stim[16] = 8'he4;
    stim[17] = 8'hd8;
    stim[18] = 8'he1;
    stim[19] = 8'h87;
    stim[20] = 8'h3e;
    stim[21] = 8'h1f;
    stim[22] = 8'h0a;
    stim[23] = 8'hf6;
    stim[24] = 8'h85;
    stim[25] = 8'h65;
    stim[26] = 8'hd6;
    stim[27] = 8'h11;
    stim[28] = 8'hed;
    stim[29] = 8'h59;
    stim[30] = 8'h75;
    stim[31] = 8'h74;
    stim[32] = 8'h05;
    stim[33] = 8'hf3;
    stim[34] = 8'h5e;
    stim[35] = 8'h71;
    stim[36] = 8'h63;
    stim[37] = 8'h95;
    stim[38] = 8'h05;
    stim[39] = 8'hbe;
    stim[40] = 8'hb2;
    stim[41] = 8'h68;
    stim[42] = 8'h90;
    stim[43] = 8'h42;
    stim[44] = 8'h6c;
    stim[45] = 8'h4e;
    stim[46] = 8'h46;
    stim[47] = 8'hd5;
    stim[48] = 8'h6c;
    stim[49] = 8'hcb;
    stim[50] = 8'h52;
    stim[51] = 8'hc3;
    stim[52] = 8'ha0;
    stim[53] = 8'hb9;
    stim[54] = 8'hb1;
    stim[55] = 8'h00;
    stim[56] = 8'h24;
    stim[57] = 8'h17;
    stim[58] = 8'h0c;
    stim[59] = 8'hae;
    stim[60] = 8'h89;
    stim[61] = 8'hd5;
    stim[62] = 8'h98;
    stim[63] = 8'h94;
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
      expv[1] = 8'hee;
      expv[2] = 8'hb5;
      expv[3] = 8'h82;
      expv[4] = 8'hcc;
      expv[5] = 8'h84;
      expv[6] = 8'he4;
      expv[7] = 8'hfc;
      expv[8] = 8'h71;
      expv[9] = 8'h5e;
      expv[10] = 8'ha5;
      expv[11] = 8'haa;
      expv[12] = 8'h10;
      expv[13] = 8'h9f;
      expv[14] = 8'hc9;
      expv[15] = 8'h32;
      expv[16] = 8'h0a;
      expv[17] = 8'h9a;
      expv[18] = 8'h16;
      expv[19] = 8'h63;
      expv[20] = 8'h3a;
      expv[21] = 8'h1d;
      expv[22] = 8'h38;
      expv[23] = 8'h99;
      expv[24] = 8'hc9;
      expv[25] = 8'h8a;
      expv[26] = 8'heb;
      expv[27] = 8'h6c;
      expv[28] = 8'hcd;
      expv[29] = 8'h1a;
      expv[30] = 8'hb3;
      expv[31] = 8'he6;
      expv[32] = 8'h1c;
      expv[33] = 8'h85;
      expv[34] = 8'hac;
      expv[35] = 8'hfa;
      expv[36] = 8'h69;
      expv[37] = 8'hf0;
      expv[38] = 8'h1c;
      expv[39] = 8'hef;
      expv[40] = 8'h34;
      expv[41] = 8'h04;
      expv[42] = 8'hec;
      expv[43] = 8'h4e;
      expv[44] = 8'h4d;
      expv[45] = 8'h95;
      expv[46] = 8'h07;
      expv[47] = 8'h14;
      expv[48] = 8'h4d;
      expv[49] = 8'h5c;
      expv[50] = 8'h77;
      expv[51] = 8'hce;
      expv[52] = 8'ha7;
      expv[53] = 8'h59;
      expv[54] = 8'hcb;
      expv[55] = 8'h00;
      expv[56] = 8'h3b;
      expv[57] = 8'h8f;
      expv[58] = 8'hdb;
      expv[59] = 8'hd6;
      expv[60] = 8'h12;
      expv[61] = 8'h14;
      expv[62] = 8'h7e;
      expv[63] = 8'ha5;
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
