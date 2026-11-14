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
    .anyedge(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hdc;
    stim[1] = 8'hc4;
    stim[2] = 8'hfc;
    stim[3] = 8'hbf;
    stim[4] = 8'h23;
    stim[5] = 8'h3e;
    stim[6] = 8'h2a;
    stim[7] = 8'ha2;
    stim[8] = 8'ha0;
    stim[9] = 8'h6b;
    stim[10] = 8'h8c;
    stim[11] = 8'h7c;
    stim[12] = 8'hd3;
    stim[13] = 8'h49;
    stim[14] = 8'ha1;
    stim[15] = 8'h5a;
    stim[16] = 8'h66;
    stim[17] = 8'h58;
    stim[18] = 8'h71;
    stim[19] = 8'ha1;
    stim[20] = 8'h12;
    stim[21] = 8'h27;
    stim[22] = 8'h1d;
    stim[23] = 8'he5;
    stim[24] = 8'hf1;
    stim[25] = 8'h21;
    stim[26] = 8'hef;
    stim[27] = 8'hd1;
    stim[28] = 8'h78;
    stim[29] = 8'h0a;
    stim[30] = 8'hc7;
    stim[31] = 8'hca;
    stim[32] = 8'h7f;
    stim[33] = 8'h9d;
    stim[34] = 8'h45;
    stim[35] = 8'h2f;
    stim[36] = 8'ha6;
    stim[37] = 8'had;
    stim[38] = 8'hc3;
    stim[39] = 8'h26;
    stim[40] = 8'hb1;
    stim[41] = 8'h7f;
    stim[42] = 8'hfa;
    stim[43] = 8'h96;
    stim[44] = 8'h15;
    stim[45] = 8'h78;
    stim[46] = 8'h12;
    stim[47] = 8'h4a;
    stim[48] = 8'h83;
    stim[49] = 8'h05;
    stim[50] = 8'h88;
    stim[51] = 8'hdb;
    stim[52] = 8'h83;
    stim[53] = 8'hc9;
    stim[54] = 8'hdf;
    stim[55] = 8'h7a;
    stim[56] = 8'h8b;
    stim[57] = 8'h54;
    stim[58] = 8'h31;
    stim[59] = 8'haa;
    stim[60] = 8'hc1;
    stim[61] = 8'h86;
    stim[62] = 8'h2f;
    stim[63] = 8'hc4;
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
      expv[2] = 8'h18;
      expv[3] = 8'h38;
      expv[4] = 8'h43;
      expv[5] = 8'h9c;
      expv[6] = 8'h1d;
      expv[7] = 8'h14;
      expv[8] = 8'h88;
      expv[9] = 8'h02;
      expv[10] = 8'hcb;
      expv[11] = 8'he7;
      expv[12] = 8'hf0;
      expv[13] = 8'haf;
      expv[14] = 8'h9a;
      expv[15] = 8'he8;
      expv[16] = 8'hfb;
      expv[17] = 8'h3c;
      expv[18] = 8'h3e;
      expv[19] = 8'h29;
      expv[20] = 8'hd0;
      expv[21] = 8'hb3;
      expv[22] = 8'h35;
      expv[23] = 8'h3a;
      expv[24] = 8'hf8;
      expv[25] = 8'h14;
      expv[26] = 8'hd0;
      expv[27] = 8'hce;
      expv[28] = 8'h3e;
      expv[29] = 8'ha9;
      expv[30] = 8'h72;
      expv[31] = 8'hcd;
      expv[32] = 8'h0d;
      expv[33] = 8'hb5;
      expv[34] = 8'he2;
      expv[35] = 8'hd8;
      expv[36] = 8'h6a;
      expv[37] = 8'h89;
      expv[38] = 8'h0b;
      expv[39] = 8'h6e;
      expv[40] = 8'he5;
      expv[41] = 8'h97;
      expv[42] = 8'hce;
      expv[43] = 8'h85;
      expv[44] = 8'h6c;
      expv[45] = 8'h83;
      expv[46] = 8'h6d;
      expv[47] = 8'h6a;
      expv[48] = 8'h58;
      expv[49] = 8'hc9;
      expv[50] = 8'h86;
      expv[51] = 8'h8d;
      expv[52] = 8'h53;
      expv[53] = 8'h58;
      expv[54] = 8'h4a;
      expv[55] = 8'h16;
      expv[56] = 8'ha5;
      expv[57] = 8'hf1;
      expv[58] = 8'hdf;
      expv[59] = 8'h65;
      expv[60] = 8'h9b;
      expv[61] = 8'h6b;
      expv[62] = 8'h47;
      expv[63] = 8'ha9;
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
