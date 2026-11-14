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

  TopModule dut (
    .clk(clk),
    .in(in_vec[7:0]),
    .pedge(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hcc;
    stim[1] = 8'h85;
    stim[2] = 8'h1a;
    stim[3] = 8'h7a;
    stim[4] = 8'h5a;
    stim[5] = 8'he3;
    stim[6] = 8'h32;
    stim[7] = 8'h34;
    stim[8] = 8'h6b;
    stim[9] = 8'h8a;
    stim[10] = 8'h92;
    stim[11] = 8'h0f;
    stim[12] = 8'he3;
    stim[13] = 8'h3c;
    stim[14] = 8'hdb;
    stim[15] = 8'haa;
    stim[16] = 8'hed;
    stim[17] = 8'h1b;
    stim[18] = 8'hfd;
    stim[19] = 8'hd1;
    stim[20] = 8'haa;
    stim[21] = 8'h75;
    stim[22] = 8'h09;
    stim[23] = 8'h3c;
    stim[24] = 8'ha3;
    stim[25] = 8'h7f;
    stim[26] = 8'h5b;
    stim[27] = 8'h59;
    stim[28] = 8'h30;
    stim[29] = 8'h76;
    stim[30] = 8'h4e;
    stim[31] = 8'hb7;
    stim[32] = 8'h81;
    stim[33] = 8'hce;
    stim[34] = 8'hab;
    stim[35] = 8'ha2;
    stim[36] = 8'h69;
    stim[37] = 8'h98;
    stim[38] = 8'hb8;
    stim[39] = 8'h00;
    stim[40] = 8'h3c;
    stim[41] = 8'h83;
    stim[42] = 8'h99;
    stim[43] = 8'h53;
    stim[44] = 8'ha2;
    stim[45] = 8'h71;
    stim[46] = 8'h6a;
    stim[47] = 8'h35;
    stim[48] = 8'h77;
    stim[49] = 8'h42;
    stim[50] = 8'h03;
    stim[51] = 8'hfc;
    stim[52] = 8'h60;
    stim[53] = 8'h73;
    stim[54] = 8'h92;
    stim[55] = 8'h40;
    stim[56] = 8'ha2;
    stim[57] = 8'hb8;
    stim[58] = 8'h72;
    stim[59] = 8'h29;
    stim[60] = 8'hac;
    stim[61] = 8'hb5;
    stim[62] = 8'h46;
    stim[63] = 8'h0c;
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
      expv[2] = 8'h01;
      expv[3] = 8'h1a;
      expv[4] = 8'h60;
      expv[5] = 8'h00;
      expv[6] = 8'ha1;
      expv[7] = 8'h10;
      expv[8] = 8'h04;
      expv[9] = 8'h4b;
      expv[10] = 8'h80;
      expv[11] = 8'h10;
      expv[12] = 8'h0d;
      expv[13] = 8'he0;
      expv[14] = 8'h1c;
      expv[15] = 8'hc3;
      expv[16] = 8'h20;
      expv[17] = 8'h45;
      expv[18] = 8'h12;
      expv[19] = 8'he4;
      expv[20] = 8'h00;
      expv[21] = 8'h2a;
      expv[22] = 8'h55;
      expv[23] = 8'h08;
      expv[24] = 8'h34;
      expv[25] = 8'h83;
      expv[26] = 8'h5c;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h20;
      expv[30] = 8'h46;
      expv[31] = 8'h08;
      expv[32] = 8'hb1;
      expv[33] = 8'h00;
      expv[34] = 8'h4e;
      expv[35] = 8'h21;
      expv[36] = 8'h00;
      expv[37] = 8'h49;
      expv[38] = 8'h90;
      expv[39] = 8'h20;
      expv[40] = 8'h00;
      expv[41] = 8'h3c;
      expv[42] = 8'h83;
      expv[43] = 8'h18;
      expv[44] = 8'h42;
      expv[45] = 8'ha0;
      expv[46] = 8'h51;
      expv[47] = 8'h0a;
      expv[48] = 8'h15;
      expv[49] = 8'h42;
      expv[50] = 8'h00;
      expv[51] = 8'h01;
      expv[52] = 8'hfc;
      expv[53] = 8'h00;
      expv[54] = 8'h13;
      expv[55] = 8'h80;
      expv[56] = 8'h40;
      expv[57] = 8'ha2;
      expv[58] = 8'h18;
      expv[59] = 8'h42;
      expv[60] = 8'h09;
      expv[61] = 8'h84;
      expv[62] = 8'h11;
      expv[63] = 8'h42;
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
